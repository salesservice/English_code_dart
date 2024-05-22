// ignore_for_file: unnecessary_null_comparison

import 'dart:io';

import 'package:drop_down_list/drop_down_list.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_isell_new/core/classes/statusrequest.dart';
import 'package:flutter_isell_new/core/constants/sellx_colors.dart';
import 'package:flutter_isell_new/core/constants/sellx_route_names.dart';
import 'package:flutter_isell_new/core/functions/handling_data.dart';
import 'package:flutter_isell_new/core/services/services.dart';
import 'package:flutter_isell_new/data/items_data/cars_data.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class AddBilAnnonseController extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;
  GlobalKey<FormState> gkBilerannonse = GlobalKey<FormState>();
  MyServices myServices = Get.find();
  CarsItemsData carsItemsData = CarsItemsData(Get.find());

  final RxInt currentIndex = 0.obs;
  final RxInt totalImages = 0.obs;

  void updateCounter() {
    currentIndex.value = pageController.page?.round() ?? 0;
    totalImages.value = imagenames.length;
    update();
  }

  final PageController pageController = PageController();

  List<File?> imagenames = [];

  chooseImages() async {
    imagenames = await imageUploadGallery();
    updateCounter();
    update();
  }

  final RxInt totalpris = 0.obs;
  void updateTotalPrice() {
    double prisValue = double.tryParse(pris?.text ?? '') ?? 0.0;
    double omregnetavgiftValue =
        double.tryParse(omregnetavgift?.text ?? '') ?? 0.0;
    totalpris.value = (prisValue + omregnetavgiftValue).round();

    update();
  }

  String formatTotalPrice(int totalPrice) {
    final NumberFormat numberFormat = NumberFormat("#,###", "en_US");
    return numberFormat.format(totalPrice);
  }

  void updateUI() {
    update();
  }

  Future<List<File?>> imageUploadGallery() async {
    try {
      final pickedFiles = await ImagePicker().pickMultiImage(
        imageQuality: 80,
      );
      if (pickedFiles != null && pickedFiles.isNotEmpty) {
        return pickedFiles.map((pickedFile) => File(pickedFile.path)).toList();
      } else {
        return [];
      }
    } catch (e) {
      print("Error picking images from gallery: $e");
      return [];
    }
  }

  String? annonsetype;
  String? biltype;
  var tilstandbil = "".obs;
  var carstari = "".obs;
  var cardrivstoffet = "".obs;
  var cartrimmetor = "".obs;
  var gircassecar = "".obs;
  var hjuledrift = "".obs;
  var karosseri = "".obs;
  var avgiftklassen = "".obs;
  var erdetfeilibil = "".obs;
  var erdetreparasjonibil = "".obs;
  var typegarantibil = "".obs;
  var fritakfraomreg = "".obs;
  var hargjeld = "".obs;
  var dataValue = "Til salgs".obs;
  var biltistandrapport = "".obs;
  var bilgaranti = "".obs;
  var sengtypen = "".obs;
  var bilvedlikeholdsprogram = "".obs;
  var bobilgarantitype = "".obs;

  bool clicked = false;

  RxList<String> trimmet = ["Ja", "Nei"].obs;
  void onChangedCallback(value) {
    cartrimmetor.value = value as String;
    cartrimmet!.text = value;
    gkBilerannonse.currentState?.validate();
    update();
  }

  RxList<String> feilibil = ["Ja", "Nei"].obs;
  void onChangedCarfeil(value) {
    erdetfeilibil.value = value as String;
    carfeil!.text = value;
    gkBilerannonse.currentState?.validate();
    update();
  }

  RxList<String> reparasjonibil = ["Ja", "Nei"].obs;
  void onChangedCarreparasjon(value) {
    erdetreparasjonibil.value = value as String;
    carreparasjon!.text = value;
    gkBilerannonse.currentState?.validate();
    update();
  }

  RxList<String> fritak = ["Ja", "Nei"].obs;
  void onChangedCaromregFritak(value) {
    fritakfraomreg.value = value as String;
    fritakfracaromreg!.text = value;
    gkBilerannonse.currentState?.validate();
    update();
  }

  RxList<String> gjeld = ["Ja", "Nei"].obs;
  void onChangedCarGjeld(value) {
    hargjeld.value = value as String;
    cargjeld!.text = value;
    gkBilerannonse.currentState?.validate();
    update();
  }

  RxList<String> bilenstari = ["Norge", "Utlandet"].obs;
  void onChangedCarStari(value) {
    carstari.value = value as String;
    carstar!.text = value;
    gkBilerannonse.currentState?.validate();
    update();
  }

  //  List<String> bilenstari = [
  //     "Norge",
  //     "Utlandet",
  //   ];

  TextEditingController? name;
  TextEditingController? overskrift;
  TextEditingController? pris;
  TextEditingController? merke;
  TextEditingController? land;
  TextEditingController? postnummer;
  TextEditingController? cartilstand;
  TextEditingController? sellxbeskrivelse;
  TextEditingController? poststed;
  TextEditingController? gateadresse;
  TextEditingController? telefonnummer;
  TextEditingController? salgleie;
  TextEditingController? itemaktiv;
  TextEditingController? carregnummer;
  TextEditingController? carchassis;
  TextEditingController? carmodellar;
  TextEditingController? carmerke;
  TextEditingController? carmodell;
  TextEditingController? carstar;
  TextEditingController? cardrivstoff;
  TextEditingController? carsylindervolum;
  TextEditingController? careffekt;
  TextEditingController? cartrimmet;
  TextEditingController? whytrimmet;
  TextEditingController? carco2utslipp;
  TextEditingController? carbattericp;
  TextEditingController? carrekkevidde;
  TextEditingController? cargirkasse;
  TextEditingController? cargirbetegnelse;
  TextEditingController? carhjuledrift;
  TextEditingController? carhjuledriftbetegnese;
  TextEditingController? karosseritype;
  TextEditingController? avgiftklasse;
  TextEditingController? antallseter;
  TextEditingController? antalldor;
  TextEditingController? bagasjeromvolum;
  TextEditingController? egenvektkg;
  TextEditingController? makstilhengervekt;
  TextEditingController? carfarge;
  TextEditingController? fargebeskrivelse;
  TextEditingController? interiorfarge;
  TextEditingController? carutstyr;
  TextEditingController? carkilometer;
  TextEditingController? carfeil;
  TextEditingController? hvafeil;
  TextEditingController? carreparasjon;
  TextEditingController? hvareparasjon;
  TextEditingController? forstegangsreg;
  TextEditingController? antalleiere;
  TextEditingController? sistecareu;
  TextEditingController? nesteeufrist;
  TextEditingController? garantitype;
  TextEditingController? linkvideo;
  TextEditingController? carbeskrivelse;
  TextEditingController? fritakfracaromreg;
  TextEditingController? omregnetavgift;
  TextEditingController? cargjeld;
  TextEditingController? hvagjeld;
  TextEditingController? itemselger;
  TextEditingController? startleiecar;
  TextEditingController? manedsbelopcar;
  TextEditingController? gjenvarendekjoredistanse;
  TextEditingController? debitorskiftegebyrikr;
  TextEditingController? avtalensutlopsdato;
  TextEditingController? antallmonedertilavtalenutloper;
  TextEditingController? leieselskap;
  TextEditingController? stedforlevering;
  TextEditingController? cartype;
  TextEditingController? biltotalvekt;
  TextEditingController? biltotallengde;
  TextEditingController? bilinnvendiglengde;
  TextEditingController? bilbredde;
  TextEditingController? harbilentilstandsrapport;
  TextEditingController? harbilengaranti;
  TextEditingController? sengtype;
  TextEditingController? carvedlikeholdsprogram;
  TextEditingController? bilsoveplasser;
  TextEditingController? kontaktperson;

  AddBilAnnonseController() {
    annonsetype = "Selge";
    biltype = "Personbil";
  }

  VelgAnnonseType(String type) {
    annonsetype = type;

    if (type == "Selge") {
      dataValue.value = "Til salgs";
    } else if (type == "Kjøpe") {
      dataValue.value = "Ønskes kjøpt";
    } else if (type == "Leie ut") {
      dataValue.value = "Til leie";
    } else if (type == "Gi bort") {
      dataValue.value = "Gis bort";
    }
    if (dataValue.value == "Gis bort") {
      salgleie!.text = "Gis Bort";
    } else if (dataValue.value == "Til salgs") {
      salgleie!.text = "Til salgs";
    } else if (dataValue.value == "Til leie") {
      salgleie!.text = "Til leie";
    } else if (dataValue.value == "Ønskes kjøpt") {
      salgleie!.text = "Ønskes kjøpt";
    }
    update();
  }

  VelgBilType(String type) {
    biltype = type;

    if (type == "Personbil") {
      dataValue.value = "Personbil";
    } else if (type == "Campingvogn") {
      dataValue.value = "Campingvogn";
    } else if (type == "Bobil") {
      dataValue.value = "Bobil";
    }

    if (dataValue.value == "Personbil") {
      cartype!.text = "Personbil";
    } else if (dataValue.value == "Campingvogn") {
      cartype!.text = "Campingvogn";
    } else if (dataValue.value == "Bobil") {
      cartype!.text = "Bobil";
    }
    update();
  }

  initialData() {
    name = TextEditingController();
    overskrift = TextEditingController();
    pris = TextEditingController();
    merke = TextEditingController();
    land = TextEditingController();
    postnummer = TextEditingController();
    poststed = TextEditingController();
    gateadresse = TextEditingController();
    telefonnummer = TextEditingController();
    sellxbeskrivelse = TextEditingController();
    cartilstand = TextEditingController();
    salgleie = TextEditingController();
    itemaktiv = TextEditingController();
    carregnummer = TextEditingController();
    carchassis = TextEditingController();
    carmodellar = TextEditingController();
    carmerke = TextEditingController();
    carmodell = TextEditingController();
    carstar = TextEditingController();
    cardrivstoff = TextEditingController();
    carsylindervolum = TextEditingController();
    careffekt = TextEditingController();
    cartrimmet = TextEditingController();
    whytrimmet = TextEditingController();
    carco2utslipp = TextEditingController();
    carbattericp = TextEditingController();
    carrekkevidde = TextEditingController();
    cargirkasse = TextEditingController();
    cargirbetegnelse = TextEditingController();
    carhjuledrift = TextEditingController();
    carhjuledriftbetegnese = TextEditingController();
    karosseritype = TextEditingController();
    avgiftklasse = TextEditingController();
    antallseter = TextEditingController();
    antalldor = TextEditingController();
    bagasjeromvolum = TextEditingController();
    egenvektkg = TextEditingController();
    makstilhengervekt = TextEditingController();
    carfarge = TextEditingController();
    fargebeskrivelse = TextEditingController();
    interiorfarge = TextEditingController();
    carutstyr = TextEditingController();
    carkilometer = TextEditingController();
    carfeil = TextEditingController();
    hvafeil = TextEditingController();
    carreparasjon = TextEditingController();
    hvareparasjon = TextEditingController();
    forstegangsreg = TextEditingController();
    antalleiere = TextEditingController();
    sistecareu = TextEditingController();
    nesteeufrist = TextEditingController();
    garantitype = TextEditingController();
    linkvideo = TextEditingController();
    carbeskrivelse = TextEditingController();
    fritakfracaromreg = TextEditingController();
    omregnetavgift = TextEditingController();
    cargjeld = TextEditingController();
    hvagjeld = TextEditingController();
    itemselger = TextEditingController();
    startleiecar = TextEditingController();
    manedsbelopcar = TextEditingController();
    gjenvarendekjoredistanse = TextEditingController();
    debitorskiftegebyrikr = TextEditingController();
    avtalensutlopsdato = TextEditingController();
    antallmonedertilavtalenutloper = TextEditingController();
    leieselskap = TextEditingController();
    stedforlevering = TextEditingController();
    cartype = TextEditingController();
    biltotalvekt = TextEditingController();
    biltotallengde = TextEditingController();
    bilinnvendiglengde = TextEditingController();
    bilbredde = TextEditingController();
    harbilentilstandsrapport = TextEditingController();
    harbilengaranti = TextEditingController();
    sengtype = TextEditingController();
    carvedlikeholdsprogram = TextEditingController();
    bilsoveplasser = TextEditingController();
    kontaktperson = TextEditingController();
    // imagename = TextEditingController();
  }

  @override
  void onInit() {
    initialData();

    super.onInit();
  }

  addBilerAnnonseData() async {
    var formdata = gkBilerannonse.currentState;
    if (formdata!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await carsItemsData.addData(
        myServices.sharedPreferences.getInt("id")!,
        3,
        "1",
        overskrift!.text,
        name!.text,
        pris!.text,
        merke!.text,
        cartilstand!.text,
        sellxbeskrivelse!.text,
        land!.text,
        postnummer!.text,
        poststed!.text,
        gateadresse!.text,
        telefonnummer!.text,
        salgleie!.text,
        carregnummer!.text,
        carchassis!.text,
        carmodellar!.text,
        carmerke!.text,
        carmodell!.text,
        carstar!.text,
        cardrivstoff!.text,
        carsylindervolum!.text,
        careffekt!.text,
        cartrimmet!.text,
        whytrimmet!.text,
        carco2utslipp!.text,
        carbattericp!.text,
        carrekkevidde!.text,
        cargirkasse!.text,
        cargirbetegnelse!.text,
        carhjuledrift!.text,
        carhjuledriftbetegnese!.text,
        karosseritype!.text,
        avgiftklasse!.text,
        antallseter!.text,
        antalldor!.text,
        bagasjeromvolum!.text,
        egenvektkg!.text,
        makstilhengervekt!.text,
        carfarge!.text,
        fargebeskrivelse!.text,
        interiorfarge!.text,
        carutstyr!.text,
        carkilometer!.text,
        carfeil!.text,
        hvafeil!.text,
        carreparasjon!.text,
        hvareparasjon!.text,
        forstegangsreg!.text,
        antalleiere!.text,
        sistecareu!.text,
        nesteeufrist!.text,
        garantitype!.text,
        linkvideo!.text,
        carbeskrivelse!.text,
        fritakfracaromreg!.text,
        omregnetavgift!.text,
        cargjeld!.text,
        hvagjeld!.text,
        itemselger!.text,
        startleiecar!.text,
        manedsbelopcar!.text,
        gjenvarendekjoredistanse!.text,
        debitorskiftegebyrikr!.text,
        avtalensutlopsdato!.text,
        antallmonedertilavtalenutloper!.text,
        leieselskap!.text,
        stedforlevering!.text,
        cartype!.text,
        biltotalvekt!.text,
        biltotallengde!.text,
        bilinnvendiglengde!.text,
        bilbredde!.text,
        harbilentilstandsrapport!.text,
        harbilengaranti!.text,
        sengtype!.text,
        carvedlikeholdsprogram!.text,
        bilsoveplasser!.text,
        kontaktperson!.text,
        imagenames,
      );
      statusRequest = handlingData(response);
      if (StatusRequest.suksess == statusRequest) {
        if (response['status'] == "success") {
          Get.offAllNamed(AppRouter.homepage);
          Get.rawSnackbar(
              backgroundColor: Myisellcolors.appbar,
              titleText: Text("Obs!",
                  style: GoogleFonts.roboto(
                      fontSize: 17, color: Myisellcolors.hvit)),
              messageText: Text(
                  "En ny annonse ble lagt til under dine annonser",
                  style: GoogleFonts.roboto(
                      fontSize: 17, color: Myisellcolors.hvit70)));
        } else {
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    }
  }

  List<SelectedListItem> carutstyrene = [
    SelectedListItem(name: "ABS-bremser"),
    SelectedListItem(name: "Airbag foran"),
    SelectedListItem(name: "Alarm"),
    SelectedListItem(name: "Gjenfinningssystem"),
    SelectedListItem(name: "Isofix"),
    SelectedListItem(name: "Sentrallås"),
    SelectedListItem(name: "Sideairbag"),
    SelectedListItem(name: "Startsperre"),
    SelectedListItem(name: "Air Condition"),
    SelectedListItem(name: "Bagasjeromstrekk"),
    SelectedListItem(name: "Cruisekontroll"),
    SelectedListItem(name: "Cruisekontroll Adaptiv"),
    SelectedListItem(name: "Elektrisk sete med memory"),
    SelectedListItem(name: "Elektrisk sete uten memory"),
    SelectedListItem(name: "Klimaanlegg"),
    SelectedListItem(name: "Kupevarmer"),
    SelectedListItem(name: "Luftfjæring"),
    SelectedListItem(name: "Midtarmlene"),
    SelectedListItem(name: "Motorvarmer"),
    SelectedListItem(name: "Nivåregulering"),
    SelectedListItem(name: "Nøkkelløs start"),
    SelectedListItem(name: "Oppvarmede seter"),
    SelectedListItem(name: "Antiskrens"),
    SelectedListItem(name: "Antispinn"),
    SelectedListItem(name: "Diesel-partikkelfilter"),
    SelectedListItem(name: "Diff.sperre"),
    SelectedListItem(name: "Kjørecomputer"),
    SelectedListItem(name: "Servostyring"),
    SelectedListItem(name: "AUX-inngang"),
    SelectedListItem(name: "Bluetooth"),
    SelectedListItem(name: "CD-spiller"),
    SelectedListItem(name: "Handsfree opplegg"),
    SelectedListItem(name: "Head up display"),
    SelectedListItem(name: "Kassettspiller"),
    SelectedListItem(name: "Multifunksjonsratt"),
    SelectedListItem(name: "Navigasjonssystem"),
    SelectedListItem(name: "Original telefon"),
    SelectedListItem(name: "Radio DAB+"),
    SelectedListItem(name: "Radio FM"),
    SelectedListItem(name: "TV-skjerm i baksetet"),
    SelectedListItem(name: "Elektriske speil"),
    SelectedListItem(name: "Helårsdekk"),
    SelectedListItem(name: "Hengerfeste, avtagbart/svingbart"),
    SelectedListItem(name: "Hengerfeste, fast krok"),
    SelectedListItem(name: "Laserlys"),
    SelectedListItem(name: "Lasteholdere/skistativ"),
    SelectedListItem(name: "LED-lys"),
    SelectedListItem(name: "Lettmet, felg sommer"),
    SelectedListItem(name: "Lettmet, felg vinter"),
    SelectedListItem(name: "Metallic lakk"),
    SelectedListItem(name: "Sommerhjul"),
    SelectedListItem(name: "Takrails"),
    SelectedListItem(name: "Vinterhjul"),
    SelectedListItem(name: "Xenonlys"),
    SelectedListItem(name: "Elektriske vinduer"),
    SelectedListItem(name: "Mørke ruter bak"),
    SelectedListItem(name: "Seter i delskinn"),
    SelectedListItem(name: "Seter i helskinn"),
    SelectedListItem(name: "Soltak/glasstak"),
    SelectedListItem(name: "Sportsseter"),
    SelectedListItem(name: "Fjernlysassistent"),
    SelectedListItem(name: "Lyssensor"),
    SelectedListItem(name: "Parkeringsensor bak"),
    SelectedListItem(name: "Parkeringsensor foran"),
    SelectedListItem(name: "Regnsensor"),
    SelectedListItem(name: "Ryggekamera"),
    SelectedListItem(name: "Andre"),
  ];

  void showDropdownBilutstyr(context) {
    DropDownState(
      DropDown(
        searchHintText: "Søk",
        bottomSheetTitle: Container(
          padding: const EdgeInsets.only(top: 15, bottom: 5),
          child: Text(
            "Utstyr",
            style: GoogleFonts.roboto(
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
            ),
          ),
        ),
        clearButtonChild: Text(
          'Nullstill',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.red),
        ),
        submitButtonChild: Text(
          'Ferdig',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.green),
        ),
        data: carutstyrene,
        selectedItems: (List<dynamic> selectedList) {
          List<String> list = [];
          for (var item in selectedList) {
            if (item is SelectedListItem) {
              list.add(item.name);
            }
          }
          carutstyr!.text = list.join(", ");
          update();
        },
        enableMultipleSelection: true,
      ),
    ).showModal(context);
    update();
  }

  List<SelectedListItem> bobilutstyrene = [
    SelectedListItem(name: "Lettmetallfelger"),
    SelectedListItem(name: "Vinterhjul"),
    SelectedListItem(name: "Støtteben"),
    SelectedListItem(name: "Markise"),
    SelectedListItem(name: "Hengerfeste"),
    SelectedListItem(name: "Sykkelstativ"),
    SelectedListItem(name: "Takgrind/Stige"),
    SelectedListItem(name: "ABS-bremser"),
    SelectedListItem(name: "Gassalarm"),
    SelectedListItem(name: "Bilalarm"),
    SelectedListItem(name: "Airbag fører"),
    SelectedListItem(name: "Airbag passasjer"),
    SelectedListItem(name: "Antiskrens"),
    SelectedListItem(name: "Antispinn"),
    SelectedListItem(name: "Dieselpartikkelfilter"),
    SelectedListItem(name: "Sentrallås"),
    SelectedListItem(name: "Luftfjæring"),
    SelectedListItem(name: "Klimaanlegg bildel"),
    SelectedListItem(name: "Klimaanlegg bodel"),
    SelectedListItem(name: "Elvarme"),
    SelectedListItem(name: "Luftvarme"),
    SelectedListItem(name: "Gulvvarme"),
    SelectedListItem(name: "Vannbåren varme"),
    SelectedListItem(name: "Tilleggsvarme (f.eks Vebasto)"),
    SelectedListItem(name: "Varmtvann"),
    SelectedListItem(name: "Frostfri vanntank"),
    SelectedListItem(name: "Frostfri spillevanntank"),
    SelectedListItem(name: "Fast toalett"),
    SelectedListItem(name: "Myggdør"),
    SelectedListItem(name: "Gassuttak"),
    SelectedListItem(name: "Kjøleskap"),
    SelectedListItem(name: "Mikrobølgeovn"),
    SelectedListItem(name: "Stekeovn"),
    SelectedListItem(name: "Elektriske speil"),
    SelectedListItem(name: "Elektriske vinduer"),
    SelectedListItem(name: "Skinninteriør"),
    SelectedListItem(name: "Løse tepper"),
    SelectedListItem(name: "Røykfri"),
    SelectedListItem(name: "Cruisekontroll"),
    SelectedListItem(name: "Ryggekamera"),
    SelectedListItem(name: "Kjørecomputer"),
    SelectedListItem(name: "Navigasjonssytem"),
    SelectedListItem(name: "Radio/CD"),
    SelectedListItem(name: "TV-antenne"),
    SelectedListItem(name: "Manuell parabol"),
    SelectedListItem(name: "Automatisk parabol"),
    SelectedListItem(name: "TV"),
    SelectedListItem(name: "DVD"),
  ];

  void showDropdownBobilutstyr(context) {
    DropDownState(
      DropDown(
        searchHintText: "Søk",
        bottomSheetTitle: Container(
          padding: const EdgeInsets.only(top: 15, bottom: 5),
          child: Text(
            "Utstyr",
            style: GoogleFonts.roboto(
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
            ),
          ),
        ),
        clearButtonChild: Text(
          'Nullstill',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.red),
        ),
        submitButtonChild: Text(
          'Ferdig',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.green),
        ),
        data: bobilutstyrene,
        selectedItems: (List<dynamic> selectedList) {
          List<String> list = [];
          for (var item in selectedList) {
            if (item is SelectedListItem) {
              list.add(item.name);
            }
          }
          carutstyr!.text = list.join(", ");
          update();
        },
        enableMultipleSelection: true,
      ),
    ).showModal(context);
    update();
  }

  List<SelectedListItem> campingvognutstyrene = [
    SelectedListItem(name: "Alu. Felger"),
    SelectedListItem(name: "Cruisekontroll"),
    SelectedListItem(name: "Dyrefri"),
    SelectedListItem(name: "Fast Toalett"),
    SelectedListItem(name: "Fortelt, sommer"),
    SelectedListItem(name: "Fortelt, vinter"),
    SelectedListItem(name: "Fryseboks"),
    SelectedListItem(name: "Gassuttak"),
    SelectedListItem(name: "Gulvvarme"),
    SelectedListItem(name: "Køleskap"),
    SelectedListItem(name: "Mikrobølgeovn"),
    SelectedListItem(name: "Redio/ cd"),
    SelectedListItem(name: "Radio/ kass"),
    SelectedListItem(name: "Ryggekamera"),
    SelectedListItem(name: "Røykefri"),
    SelectedListItem(name: "Sentralvarme"),
    SelectedListItem(name: "Sommerhjul"),
    SelectedListItem(name: "Midtarmlene"),
    SelectedListItem(name: "Stekeovn"),
    SelectedListItem(name: "Sykkelstativ"),
    SelectedListItem(name: "Takgrind/Stige"),
    SelectedListItem(name: "TV-Antenne"),
    SelectedListItem(name: "Vannbåren varme"),
    SelectedListItem(name: "Varmtvann"),
    SelectedListItem(name: "Vinterhjul"),
    SelectedListItem(name: "Andre"),
  ];

  void showDropdownCampingvognutstyr(context) {
    DropDownState(
      DropDown(
        searchHintText: "Søk",
        bottomSheetTitle: Container(
          padding: const EdgeInsets.only(top: 15, bottom: 5),
          child: Text(
            "Utstyr",
            style: GoogleFonts.roboto(
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
            ),
          ),
        ),
        clearButtonChild: Text(
          'Nullstill',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.red),
        ),
        submitButtonChild: Text(
          'Ferdig',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.green),
        ),
        data: campingvognutstyrene,
        selectedItems: (List<dynamic> selectedList) {
          List<String> list = [];
          for (var item in selectedList) {
            if (item is SelectedListItem) {
              list.add(item.name);
            }
          }
          carutstyr!.text = list.join(", ");
          update();
        },
        enableMultipleSelection: true,
      ),
    ).showModal(context);
    update();
  }

//response['status'] == "success"
  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }

  List<SelectedListItem> bobilermerke = [
    SelectedListItem(name: "Adria"),
    SelectedListItem(name: "Ahorn"),
    SelectedListItem(name: "Airstream"),
    SelectedListItem(name: "Atlas"),
    SelectedListItem(name: "Autostar"),
    SelectedListItem(name: "Basoglu"),
    SelectedListItem(name: "Bavaria"),
    SelectedListItem(name: "Bela"),
    SelectedListItem(name: "Benimar"),
    SelectedListItem(name: "Bjølseth"),
    SelectedListItem(name: "Bravia"),
    SelectedListItem(name: "Bürstner"),
    SelectedListItem(name: "CI"),
    SelectedListItem(name: "CS"),
    SelectedListItem(name: "Cabby"),
    SelectedListItem(name: "Camp_Let"),
    SelectedListItem(name: "Carado"),
    SelectedListItem(name: "Caravelair"),
    SelectedListItem(name: "Carbon Tear"),
    SelectedListItem(name: "Carthago"),
    SelectedListItem(name: "Cavalier"),
    SelectedListItem(name: "Challenger"),
    SelectedListItem(name: "Chausson"),
    SelectedListItem(name: "Chevrolet"),
    SelectedListItem(name: "Clever"),
    SelectedListItem(name: "Combi-Camp"),
    SelectedListItem(name: "Concorde"),
    SelectedListItem(name: "Crawler"),
    SelectedListItem(name: "DAF"),
    SelectedListItem(name: "Decamp"),
    SelectedListItem(name: "Dethleffs"),
    SelectedListItem(name: "Derubis"),
    SelectedListItem(name: "Dream"),
    SelectedListItem(name: "Dreamer"),
    SelectedListItem(name: "Eifelland"),
    SelectedListItem(name: "Elnagh"),
    SelectedListItem(name: "Esterel"),
    SelectedListItem(name: "Eura Mobil"),
    SelectedListItem(name: "FR-Mobil"),
    SelectedListItem(name: "Fast fortelt"),
    SelectedListItem(name: "Fendt"),
    SelectedListItem(name: "Fiat"),
    SelectedListItem(name: "Flair"),
    SelectedListItem(name: "Fleetwood"),
    SelectedListItem(name: "Fleurette"),
    SelectedListItem(name: "Ford"),
    SelectedListItem(name: "Frankia"),
    SelectedListItem(name: "GG"),
    SelectedListItem(name: "Gigant"),
    SelectedListItem(name: "Giottiline"),
    SelectedListItem(name: "Globe-Traveller"),
    SelectedListItem(name: "Globecar"),
    SelectedListItem(name: "Glucksmobil"),
    SelectedListItem(name: "Grau"),
    SelectedListItem(name: "Gulfstream"),
    SelectedListItem(name: "Hero Camper"),
    SelectedListItem(name: "Hino"),
    SelectedListItem(name: "Hobby"),
    SelectedListItem(name: "Holiday Rambler"),
    SelectedListItem(name: "Home-car"),
    SelectedListItem(name: "Husvogner"),
    SelectedListItem(name: "Hymer"),
    SelectedListItem(name: "Ilusion"),
    SelectedListItem(name: "Itineo"),
    SelectedListItem(name: "KABE"),
    SelectedListItem(name: "Karmann"),
    SelectedListItem(name: "Kentucky Camp"),
    SelectedListItem(name: "Kip"),
    SelectedListItem(name: "Knaus"),
    SelectedListItem(name: "Kulba"),
    SelectedListItem(name: "LMC"),
    SelectedListItem(name: "LMC/Münsterland"),
    SelectedListItem(name: "La Strada"),
    SelectedListItem(name: "Laika"),
    SelectedListItem(name: "Le Voyageur"),
    SelectedListItem(name: "Lifestyle Camper"),
    SelectedListItem(name: "Malibu"),
    SelectedListItem(name: "Mclouis"),
    SelectedListItem(name: "Mege Mobile"),
    SelectedListItem(name: "Mercedes-Benz"),
    SelectedListItem(name: "Miller"),
    SelectedListItem(name: "Mink"),
    SelectedListItem(name: "Mirage"),
    SelectedListItem(name: "Mobil Traveller"),
    SelectedListItem(name: "Mobilvetta"),
    SelectedListItem(name: "Monaco"),
    SelectedListItem(name: "Morelo"),
    SelectedListItem(name: "Muflon"),
    SelectedListItem(name: "Neo Traveller"),
    SelectedListItem(name: "Niesmann-Bischoff"),
    SelectedListItem(name: "Nissan"),
    SelectedListItem(name: "Nordic"),
    SelectedListItem(name: "Norgeshengern"),
    SelectedListItem(name: "Orangecamp"),
    SelectedListItem(name: "P.L.A"),
    SelectedListItem(name: "Peugeot"),
    SelectedListItem(name: "Phoenix"),
    SelectedListItem(name: "Pilote"),
    SelectedListItem(name: "Polar"),
    SelectedListItem(name: "Poletta"),
    SelectedListItem(name: "Pøssl"),
    SelectedListItem(name: "RMB"),
    SelectedListItem(name: "Raidhoo Campers"),
    SelectedListItem(name: "Rapido"),
    SelectedListItem(name: "Respo"),
    SelectedListItem(name: "Rimor"),
    SelectedListItem(name: "Riviera"),
    SelectedListItem(name: "Roadcar"),
    SelectedListItem(name: "Rockwood"),
    SelectedListItem(name: "Roller Team"),
    SelectedListItem(name: "Savsjø"),
    SelectedListItem(name: "Scania"),
    SelectedListItem(name: "Sharky"),
    SelectedListItem(name: "SMV"),
    SelectedListItem(name: "Solifer"),
    SelectedListItem(name: "Sprite"),
    SelectedListItem(name: "Sterckeman"),
    SelectedListItem(name: "Sun Living"),
    SelectedListItem(name: "Sunlight"),
    SelectedListItem(name: "Swift"),
    SelectedListItem(name: "T.E. Caravan"),
    SelectedListItem(name: "Tabbert"),
    SelectedListItem(name: "Tec"),
    SelectedListItem(name: "Tourne"),
    SelectedListItem(name: "Triple E"),
    SelectedListItem(name: "Troll"),
    SelectedListItem(name: "VANTourer"),
    SelectedListItem(name: "Volkswagen"),
    SelectedListItem(name: "WINGAMM"),
    SelectedListItem(name: "Weinsberg"),
    SelectedListItem(name: "Weippert"),
    SelectedListItem(name: "Westfalia"),
    SelectedListItem(name: "Wilk"),
    SelectedListItem(name: "Willerby"),
    SelectedListItem(name: "Winnebago"),
    SelectedListItem(name: "Andre"),
  ];
  void showDropdownBoBilemerke(context) {
    DropDownState(
      DropDown(
        searchHintText: "Søk i merker",
        bottomSheetTitle: Container(
          padding: const EdgeInsets.only(top: 15, bottom: 5),
          child: Text(
            "Velg merke",
            style: GoogleFonts.roboto(
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
            ),
          ),
        ),
        // dropDownBackgroundColor: Myisellcolors.home,
        clearButtonChild: Text(
          'Nullstill',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.red),
        ),
        submitButtonChild: Text(
          'Ferdig',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.green),
        ),
        data: bobilermerke,
        selectedItems: (List<dynamic> selectedLista) {
          List<String> list = [];
          for (var item in selectedLista) {
            if (item is SelectedListItem) {
              list.add(item.name);
            }
          }
          carmerke!.text = list.join(", ");
          gkBilerannonse.currentState?.validate();
          update();
        },
        enableMultipleSelection: false,
      ),
    ).showModal(context);
    update();
  }

/////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////

  List<SelectedListItem> bilermerke = [
    SelectedListItem(name: "Abarth"),
    SelectedListItem(name: "ACE"),
    SelectedListItem(name: "Addax"),
    SelectedListItem(name: "Alfa Romeo"),
    SelectedListItem(name: "Alpina"),
    SelectedListItem(name: "Alpine"),
    SelectedListItem(name: "AMC"),
    SelectedListItem(name: "Ariel"),
    SelectedListItem(name: "Aston Martin"),
    SelectedListItem(name: "Audi"),
    SelectedListItem(name: "Austin"),
    SelectedListItem(name: "BMW"),
    SelectedListItem(name: "Bentley"),
    SelectedListItem(name: "Buddy"),
    SelectedListItem(name: "Buick"),
    SelectedListItem(name: "Bugatti"),
    SelectedListItem(name: "BYD"),
    SelectedListItem(name: "Cadillac"),
    SelectedListItem(name: "Chevrolet"),
    SelectedListItem(name: "Chrysler"),
    SelectedListItem(name: "Citroen"),
    SelectedListItem(name: "City-Spirit"),
    SelectedListItem(name: "Cupra"),
    SelectedListItem(name: "DAF"),
    SelectedListItem(name: "DS"),
    SelectedListItem(name: "Dacia"),
    SelectedListItem(name: "Daewoo"),
    SelectedListItem(name: "Daihatsu"),
    SelectedListItem(name: "Datsun"),
    SelectedListItem(name: "De Tomaso"),
    SelectedListItem(name: "DeLorean"),
    SelectedListItem(name: "Dodge"),
    SelectedListItem(name: "Ferrari"),
    SelectedListItem(name: "Fiat"),
    SelectedListItem(name: "Fisker"),
    SelectedListItem(name: "Ford"),
    SelectedListItem(name: "GMC"),
    SelectedListItem(name: "Goupil"),
    SelectedListItem(name: "HiPhi"),
    SelectedListItem(name: "Honda"),
    SelectedListItem(name: "Hongqi"),
    SelectedListItem(name: "Hummer"),
    SelectedListItem(name: "Hyundai"),
    SelectedListItem(name: "Infiniti"),
    SelectedListItem(name: "Isuzu"),
    SelectedListItem(name: "Iveco"),
    SelectedListItem(name: "JAC"),
    SelectedListItem(name: "Jaguar"),
    SelectedListItem(name: "Jeep"),
    SelectedListItem(name: "Jensen"),
    SelectedListItem(name: "Kewet"),
    SelectedListItem(name: "Kia"),
    SelectedListItem(name: "Koenigsegg"),
    SelectedListItem(name: "Lada"),
    SelectedListItem(name: "Lamborghini"),
    SelectedListItem(name: "Lancia"),
    SelectedListItem(name: "Lucid"),
    SelectedListItem(name: "Land Rover"),
    SelectedListItem(name: "Lexus"),
    SelectedListItem(name: "Lincoln"),
    SelectedListItem(name: "Lotus"),
    SelectedListItem(name: "MAN"),
    SelectedListItem(name: "Mia Electric"),
    SelectedListItem(name: "MG"),
    SelectedListItem(name: "MINI"),
    SelectedListItem(name: "Maserati"),
    SelectedListItem(name: "Matra"),
    SelectedListItem(name: "Maxus"),
    SelectedListItem(name: "Maybach"),
    SelectedListItem(name: "Mazda"),
    SelectedListItem(name: "McLaren"),
    SelectedListItem(name: "Mercedes-Benz"),
    SelectedListItem(name: "Mercury"),
    SelectedListItem(name: "Mitsubishi"),
    SelectedListItem(name: "Morgan"),
    SelectedListItem(name: "Morris"),
    SelectedListItem(name: "NIO"),
    SelectedListItem(name: "Nissan"),
    SelectedListItem(name: "NOSMOKE"),
    SelectedListItem(name: "Oldsmobile"),
    SelectedListItem(name: "Opel"),
    SelectedListItem(name: "Packard"),
    SelectedListItem(name: "Panther"),
    SelectedListItem(name: "Peugeot"),
    SelectedListItem(name: "Piaggio"),
    SelectedListItem(name: "Plymouth"),
    SelectedListItem(name: "Polestar"),
    SelectedListItem(name: "Pontiac"),
    SelectedListItem(name: "Porsche"),
    SelectedListItem(name: "Radical"),
    SelectedListItem(name: "RAM"),
    SelectedListItem(name: "Renault"),
    SelectedListItem(name: "Reva"),
    SelectedListItem(name: "Rolls Royce"),
    SelectedListItem(name: "Rover"),
    SelectedListItem(name: "Saab"),
    SelectedListItem(name: "Santana"),
    SelectedListItem(name: "Scion"),
    SelectedListItem(name: "Seat"),
    SelectedListItem(name: "Seres"),
    SelectedListItem(name: "Skoda"),
    SelectedListItem(name: "Smart"),
    SelectedListItem(name: "Ssangyong"),
    SelectedListItem(name: "Subaru"),
    SelectedListItem(name: "Suzuki"),
    SelectedListItem(name: "TVR"),
    SelectedListItem(name: "Tazzari"),
    SelectedListItem(name: "Tesla"),
    SelectedListItem(name: "Think"),
    SelectedListItem(name: "Toyota"),
    SelectedListItem(name: "Triumph"),
    SelectedListItem(name: "Volkswagen"),
    SelectedListItem(name: "Volvo"),
    SelectedListItem(name: "VOYAH"),
    SelectedListItem(name: "Wiesmann"),
    SelectedListItem(name: "XPeng"),
    SelectedListItem(name: "ZD"),
    SelectedListItem(name: "Andre"),
  ];

  void showDropdownBilemerke(context) {
    DropDownState(
      DropDown(
        searchHintText: "Søk i bilmerker",
        bottomSheetTitle: Container(
          padding: const EdgeInsets.only(top: 15, bottom: 5),
          child: Text(
            "Velg bilmerke",
            style: GoogleFonts.roboto(
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
            ),
          ),
        ),
        // dropDownBackgroundColor: Myisellcolors.home,
        clearButtonChild: Text(
          'Nullstill',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.red),
        ),
        submitButtonChild: Text(
          'Ferdig',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.green),
        ),
        data: bilermerke,
        selectedItems: (List<dynamic> selectedLista) {
          List<String> list = [];
          for (var item in selectedLista) {
            if (item is SelectedListItem) {
              list.add(item.name);
            }
          }
          carmerke!.text = list.join(", ");
          gkBilerannonse.currentState?.validate();
          update();
        },
        enableMultipleSelection: false,
      ),
    ).showModal(context);
    update();
  }
//////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////

  List<SelectedListItem> abarth = [
    SelectedListItem(name: "124 Spider"),
    SelectedListItem(name: "500"),
    SelectedListItem(name: "595"),
    SelectedListItem(name: "695"),
  ];

  void showDropdownAbarth(context) {
    DropDownState(
      DropDown(
        searchHintText: "Søk i ${carmerke!.text} modeller",
        bottomSheetTitle: Container(
          padding: const EdgeInsets.only(top: 15, bottom: 5),
          child: Text(
            "Abrath modell",
            style: GoogleFonts.roboto(
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
            ),
          ),
        ),
        clearButtonChild: Text(
          'Nullstill',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.red),
        ),
        submitButtonChild: Text(
          'Ferdig',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.green),
        ),
        data: abarth,
        selectedItems: (List<dynamic> selectedLista) {
          List<String> list = [];
          for (var item in selectedLista) {
            if (item is SelectedListItem) {
              list.add(item.name);
            }
          }
          carmodell!.text = list.join(", ");
          gkBilerannonse.currentState?.validate();
          update();
        },
        enableMultipleSelection: false,
      ),
    ).showModal(context);
    update();
  }

  //////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////

  List<SelectedListItem> ace = [
    SelectedListItem(name: "Andre"),
  ];

  void showDropdownACE(context) {
    DropDownState(
      DropDown(
        searchHintText: "Søk i ${carmerke!.text} modeller",
        bottomSheetTitle: Text(
          "ACE modell",
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        dropDownBackgroundColor: Myisellcolors.hvit,
        clearButtonChild: Text(
          'Nullstill',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.red),
        ),
        submitButtonChild: Text(
          'Ferdig',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.green),
        ),
        data: ace,
        selectedItems: (List<dynamic> selectedLista) {
          List<String> list = [];
          for (var item in selectedLista) {
            if (item is SelectedListItem) {
              list.add(item.name);
            }
          }
          carmodell!.text = list.join(", ");
          gkBilerannonse.currentState?.validate();
          update();

          update();
        },
        enableMultipleSelection: false,
      ),
    ).showModal(context);
    update();
  }
//////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////

  List<SelectedListItem> addax = [
    SelectedListItem(name: "MT"),
    SelectedListItem(name: "MTN"),
  ];

  void showDropdownAddax(context) {
    DropDownState(
      DropDown(
        searchHintText: "Søk i ${carmerke!.text} modeller",
        bottomSheetTitle: Text(
          "Addax modell",
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        dropDownBackgroundColor: Myisellcolors.hvit,
        clearButtonChild: Text(
          'Nullstill',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.red),
        ),
        submitButtonChild: Text(
          'Ferdig',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.green),
        ),
        data: addax,
        selectedItems: (List<dynamic> selectedLista) {
          List<String> list = [];
          for (var item in selectedLista) {
            if (item is SelectedListItem) {
              list.add(item.name);
            }
          }
          carmodell!.text = list.join(", ");
          gkBilerannonse.currentState?.validate();
          update();

          update();
        },
        enableMultipleSelection: false,
      ),
    ).showModal(context);
    update();
  }
//////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////

  List<SelectedListItem> alfaromeo = [
    SelectedListItem(name: "145"),
    SelectedListItem(name: "147"),
    SelectedListItem(name: "155"),
    SelectedListItem(name: "156"),
    SelectedListItem(name: "159"),
    SelectedListItem(name: "164"),
    SelectedListItem(name: "166"),
    SelectedListItem(name: "33"),
    SelectedListItem(name: "4C"),
    SelectedListItem(name: "75"),
    SelectedListItem(name: "90"),
    SelectedListItem(name: "Alfasud"),
    SelectedListItem(name: "Alfetta"),
    SelectedListItem(name: "Brera"),
    SelectedListItem(name: "GT"),
    SelectedListItem(name: "GTV"),
    SelectedListItem(name: "Giulia Quadrifoglio"),
    SelectedListItem(name: "Giulietta"),
    SelectedListItem(name: "Giulietta (gml. type)"),
    SelectedListItem(name: "MiTo"),
    SelectedListItem(name: "Spider"),
    SelectedListItem(name: "Sprint"),
    SelectedListItem(name: "Stelvio"),
    SelectedListItem(name: "Stelvio Quadrifoglio"),
    SelectedListItem(name: "Tonale"),
    SelectedListItem(name: "Andre"),
  ];

  void showDropdownAlfaRomeo(context) {
    DropDownState(
      DropDown(
        searchHintText: "Søk i ${carmerke!.text} modeller",
        bottomSheetTitle: Text(
          "Alfa Romeo modell",
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        dropDownBackgroundColor: Myisellcolors.hvit,
        clearButtonChild: Text(
          'Nullstill',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.red),
        ),
        submitButtonChild: Text(
          'Ferdig',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.green),
        ),
        data: alfaromeo,
        selectedItems: (List<dynamic> selectedLista) {
          List<String> list = [];
          for (var item in selectedLista) {
            if (item is SelectedListItem) {
              list.add(item.name);
            }
          }
          carmodell!.text = list.join(", ");
          gkBilerannonse.currentState?.validate();
          update();
        },
        enableMultipleSelection: false,
      ),
    ).showModal(context);
    update();
  }
//////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////

  List<SelectedListItem> alpina = [
    SelectedListItem(name: "A110"),
    SelectedListItem(name: "B10"),
    SelectedListItem(name: "B12"),
    SelectedListItem(name: "B3"),
    SelectedListItem(name: "B4"),
    SelectedListItem(name: "B5"),
    SelectedListItem(name: "B6"),
    SelectedListItem(name: "B7"),
    SelectedListItem(name: "B8"),
    SelectedListItem(name: "D10"),
    SelectedListItem(name: "D3"),
    SelectedListItem(name: "D4"),
    SelectedListItem(name: "D5"),
    SelectedListItem(name: "Roadster S"),
    SelectedListItem(name: "XD3"),
  ];

  void showDropdownAlpina(context) {
    DropDownState(
      DropDown(
        searchHintText: "Søk i ${carmerke!.text} modeller",
        bottomSheetTitle: Text(
          "Alpina modell",
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        dropDownBackgroundColor: Myisellcolors.hvit,
        clearButtonChild: Text(
          'Nullstill',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.red),
        ),
        submitButtonChild: Text(
          'Ferdig',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.green),
        ),
        data: alpina,
        selectedItems: (List<dynamic> selectedLista) {
          List<String> list = [];
          for (var item in selectedLista) {
            if (item is SelectedListItem) {
              list.add(item.name);
            }
          }
          carmodell!.text = list.join(", ");
          gkBilerannonse.currentState?.validate();
          update();
        },
        enableMultipleSelection: false,
      ),
    ).showModal(context);
    update();
  }
//////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////

  List<SelectedListItem> alpine = [
    SelectedListItem(name: "A110"),
  ];

  void showDropdownAlpine(context) {
    DropDownState(
      DropDown(
        searchHintText: "Søk i ${carmerke!.text} modeller",
        bottomSheetTitle: Text(
          "Alpine modell",
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        dropDownBackgroundColor: Myisellcolors.hvit,
        clearButtonChild: Text(
          'Nullstill',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.red),
        ),
        submitButtonChild: Text(
          'Ferdig',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.green),
        ),
        data: alpine,
        selectedItems: (List<dynamic> selectedLista) {
          List<String> list = [];
          for (var item in selectedLista) {
            if (item is SelectedListItem) {
              list.add(item.name);
            }
          }
          carmodell!.text = list.join(", ");
          gkBilerannonse.currentState?.validate();
          update();
        },
        enableMultipleSelection: false,
      ),
    ).showModal(context);
    update();
  }

//////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////
  List<SelectedListItem> amc = [
    SelectedListItem(name: "Andre"),
  ];

  void showDropdownAMC(context) {
    DropDownState(
      DropDown(
        searchHintText: "Søk i ${carmerke!.text} modeller",
        bottomSheetTitle: Text(
          "AMC modell",
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        dropDownBackgroundColor: Myisellcolors.hvit,
        clearButtonChild: Text(
          'Nullstill',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.red),
        ),
        submitButtonChild: Text(
          'Ferdig',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.green),
        ),
        data: amc,
        selectedItems: (List<dynamic> selectedLista) {
          List<String> list = [];
          for (var item in selectedLista) {
            if (item is SelectedListItem) {
              list.add(item.name);
            }
          }
          carmodell!.text = list.join(", ");
          gkBilerannonse.currentState?.validate();
          update();
        },
        enableMultipleSelection: false,
      ),
    ).showModal(context);
    update();
  }
//////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////

  List<SelectedListItem> ariel = [
    SelectedListItem(name: "Atom"),
  ];

  void showDropdownAriel(context) {
    DropDownState(
      DropDown(
        searchHintText: "Søk i ${carmerke!.text} modeller",
        bottomSheetTitle: Text(
          "Ariel modell",
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        dropDownBackgroundColor: Myisellcolors.hvit,
        clearButtonChild: Text(
          'Nullstill',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.red),
        ),
        submitButtonChild: Text(
          'Ferdig',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.green),
        ),
        data: ariel,
        selectedItems: (List<dynamic> selectedLista) {
          List<String> list = [];
          for (var item in selectedLista) {
            if (item is SelectedListItem) {
              list.add(item.name);
            }
          }
          carmodell!.text = list.join(", ");
          gkBilerannonse.currentState?.validate();
          update();
        },
        enableMultipleSelection: false,
      ),
    ).showModal(context);
    update();
  }
//////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////

  List<SelectedListItem> astonmatrin = [
    SelectedListItem(name: "Cygnet"),
    SelectedListItem(name: "DB7"),
    SelectedListItem(name: "DB9"),
    SelectedListItem(name: "DB11"),
    SelectedListItem(name: "DB11 Volante"),
    SelectedListItem(name: "DBS Superleggera"),
    SelectedListItem(name: "DBX"),
    SelectedListItem(name: "Rapide"),
    SelectedListItem(name: "V12 Vantage"),
    SelectedListItem(name: "V8 vantage"),
    SelectedListItem(name: "Vanquish"),
    SelectedListItem(name: "Virage"),
    SelectedListItem(name: "Andre"),
  ];

  void showDropdownAstonMatrin(context) {
    DropDownState(
      DropDown(
        searchHintText: "Søk i ${carmerke!.text} modeller",
        bottomSheetTitle: Text(
          "Aston Matrtin modell",
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        dropDownBackgroundColor: Myisellcolors.hvit,
        clearButtonChild: Text(
          'Nullstill',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.red),
        ),
        submitButtonChild: Text(
          'Ferdig',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.green),
        ),
        data: astonmatrin,
        selectedItems: (List<dynamic> selectedLista) {
          List<String> list = [];
          for (var item in selectedLista) {
            if (item is SelectedListItem) {
              list.add(item.name);
            }
          }
          carmodell!.text = list.join(", ");
          gkBilerannonse.currentState?.validate();
          update();
        },
        enableMultipleSelection: false,
      ),
    ).showModal(context);
    update();
  }
//////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////

  List<SelectedListItem> audi = [
    SelectedListItem(name: "A1"),
    SelectedListItem(name: "A2"),
    SelectedListItem(name: "A3"),
    SelectedListItem(name: "A4"),
    SelectedListItem(name: "A4 allroad"),
    SelectedListItem(name: "A5"),
    SelectedListItem(name: "A6"),
    SelectedListItem(name: "A6 allroad"),
    SelectedListItem(name: "A7"),
    SelectedListItem(name: "A8"),
    SelectedListItem(name: "Q2"),
    SelectedListItem(name: "Q3"),
    SelectedListItem(name: "Q4 e-tron"),
    SelectedListItem(name: "Q5"),
    SelectedListItem(name: "Q7"),
    SelectedListItem(name: "Q8"),
    SelectedListItem(name: "Q8 e-tron"),
    SelectedListItem(name: "R8"),
    SelectedListItem(name: "RS2"),
    SelectedListItem(name: "RS3"),
    SelectedListItem(name: "RS4"),
    SelectedListItem(name: "RS5"),
    SelectedListItem(name: "RS6"),
    SelectedListItem(name: "RS7"),
    SelectedListItem(name: "RSQ3"),
    SelectedListItem(name: "RSQ8"),
    SelectedListItem(name: "S1"),
    SelectedListItem(name: "S2"),
    SelectedListItem(name: "S3"),
    SelectedListItem(name: "S4"),
    SelectedListItem(name: "S5"),
    SelectedListItem(name: "S6"),
    SelectedListItem(name: "S7"),
    SelectedListItem(name: "S8"),
    SelectedListItem(name: "SQ5"),
    SelectedListItem(name: "SQ7"),
    SelectedListItem(name: "SQ8"),
    SelectedListItem(name: "TT"),
    SelectedListItem(name: "V8"),
    SelectedListItem(name: "e-tron"),
    SelectedListItem(name: "e-tron GT RS"),
    SelectedListItem(name: "e-tron GT"),
    SelectedListItem(name: "e-tron Sportback"),
    SelectedListItem(name: "50"),
    SelectedListItem(name: "60"),
    SelectedListItem(name: "80"),
    SelectedListItem(name: "90"),
    SelectedListItem(name: "100"),
    SelectedListItem(name: "200"),
    SelectedListItem(name: "Andre"),
  ];

  void showDropdownAudi(context) {
    DropDownState(
      DropDown(
        searchHintText: "Søk i ${carmerke!.text} modeller",
        bottomSheetTitle: Text(
          "Aston Audi modell",
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        dropDownBackgroundColor: Myisellcolors.hvit,
        clearButtonChild: Text(
          'Nullstill',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.red),
        ),
        submitButtonChild: Text(
          'Ferdig',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.green),
        ),
        data: audi,
        selectedItems: (List<dynamic> selectedLista) {
          List<String> list = [];
          for (var item in selectedLista) {
            if (item is SelectedListItem) {
              list.add(item.name);
            }
          }
          carmodell!.text = list.join(", ");
          gkBilerannonse.currentState?.validate();
          update();
        },
        enableMultipleSelection: false,
      ),
    ).showModal(context);
    update();
  }
//////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////

  List<SelectedListItem> austin = [
    SelectedListItem(name: "Healey 100 6"),
    SelectedListItem(name: "Healey 3000"),
    SelectedListItem(name: "Princess"),
    SelectedListItem(name: "Andre"),
  ];

  void showDropdownAustin(context) {
    DropDownState(
      DropDown(
        searchHintText: "Søk i ${carmerke!.text} modeller",
        bottomSheetTitle: Text(
          "Aston Austin modell",
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        dropDownBackgroundColor: Myisellcolors.hvit,
        clearButtonChild: Text(
          'Nullstill',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.red),
        ),
        submitButtonChild: Text(
          'Ferdig',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.green),
        ),
        data: austin,
        selectedItems: (List<dynamic> selectedLista) {
          List<String> list = [];
          for (var item in selectedLista) {
            if (item is SelectedListItem) {
              list.add(item.name);
            }
          }
          carmodell!.text = list.join(", ");
          gkBilerannonse.currentState?.validate();
          update();
        },
        enableMultipleSelection: false,
      ),
    ).showModal(context);
    update();
  }
//////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////

  List<SelectedListItem> bmw = [
    SelectedListItem(name: "1-serie"),
    SelectedListItem(name: "1M"),
    SelectedListItem(name: "2-serie"),
    SelectedListItem(name: "3-serie"),
    SelectedListItem(name: "4-serie"),
    SelectedListItem(name: "5-serie"),
    SelectedListItem(name: "6-serie"),
    SelectedListItem(name: "7-serie"),
    SelectedListItem(name: "8-serie"),
    SelectedListItem(name: "3-serie GT"),
    SelectedListItem(name: "5-serie GT"),
    SelectedListItem(name: "M2"),
    SelectedListItem(name: "M3"),
    SelectedListItem(name: "M4"),
    SelectedListItem(name: "M5"),
    SelectedListItem(name: "M6"),
    SelectedListItem(name: "X1"),
    SelectedListItem(name: "X2"),
    SelectedListItem(name: "X3"),
    SelectedListItem(name: "X3 M"),
    SelectedListItem(name: "X4"),
    SelectedListItem(name: "X4 M"),
    SelectedListItem(name: "X5"),
    SelectedListItem(name: "X5 M"),
    SelectedListItem(name: "X6"),
    SelectedListItem(name: "X6 M"),
    SelectedListItem(name: "X7"),
    SelectedListItem(name: "XM"),
    SelectedListItem(name: "M8"),
    SelectedListItem(name: "Z1"),
    SelectedListItem(name: "Z3"),
    SelectedListItem(name: "Z4"),
    SelectedListItem(name: "Z8"),
    SelectedListItem(name: "i3"),
    SelectedListItem(name: "i4"),
    SelectedListItem(name: "i4 M50"),
    SelectedListItem(name: "i5"),
    SelectedListItem(name: "i5 M60"),
    SelectedListItem(name: "i7"),
    SelectedListItem(name: "i8"),
    SelectedListItem(name: "iX1"),
    SelectedListItem(name: "iX3"),
    SelectedListItem(name: "iX40"),
    SelectedListItem(name: "iX M60"),
    SelectedListItem(name: "iX xDrive 40"),
    SelectedListItem(name: "iX xDrive 40"),
    SelectedListItem(name: "iX xDrive M60"),
    SelectedListItem(name: "1500"),
    SelectedListItem(name: "1600"),
    SelectedListItem(name: "1602"),
    SelectedListItem(name: "1800"),
    SelectedListItem(name: "2000"),
    SelectedListItem(name: "2002"),
    SelectedListItem(name: "2500"),
    SelectedListItem(name: "2800"),
    SelectedListItem(name: "Andre"),
  ];

  void showDropdownBMW(context) {
    DropDownState(
      DropDown(
        searchHintText: "Søk i ${carmerke!.text} modeller",
        bottomSheetTitle: Text(
          "BMW modell",
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        dropDownBackgroundColor: Myisellcolors.hvit,
        clearButtonChild: Text(
          'Nullstill',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.red),
        ),
        submitButtonChild: Text(
          'Ferdig',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.green),
        ),
        data: bmw,
        selectedItems: (List<dynamic> selectedLista) {
          List<String> list = [];
          for (var item in selectedLista) {
            if (item is SelectedListItem) {
              list.add(item.name);
            }
          }
          carmodell!.text = list.join(", ");
          gkBilerannonse.currentState?.validate();
          update();
        },
        enableMultipleSelection: false,
      ),
    ).showModal(context);
    update();
  }
//////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////

  List<SelectedListItem> bentley = [
    SelectedListItem(name: "Arnage"),
    SelectedListItem(name: "Bentayga"),
    SelectedListItem(name: "Continental GT"),
    SelectedListItem(name: "Continental GTC"),
    SelectedListItem(name: "Flying Spur"),
    SelectedListItem(name: "Mulsanne"),
    SelectedListItem(name: "Andre"),
  ];

  void showDropdownBentley(context) {
    DropDownState(
      DropDown(
        searchHintText: "Søk i ${carmerke!.text} modeller",
        bottomSheetTitle: Text(
          "Bentley modell",
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        dropDownBackgroundColor: Myisellcolors.hvit,
        clearButtonChild: Text(
          'Nullstill',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.red),
        ),
        submitButtonChild: Text(
          'Ferdig',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.green),
        ),
        data: bentley,
        selectedItems: (List<dynamic> selectedLista) {
          List<String> list = [];
          for (var item in selectedLista) {
            if (item is SelectedListItem) {
              list.add(item.name);
            }
          }
          carmodell!.text = list.join(", ");
          gkBilerannonse.currentState?.validate();
          update();
        },
        enableMultipleSelection: false,
      ),
    ).showModal(context);
    update();
  }
//////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////

  List<SelectedListItem> buddy = [
    SelectedListItem(name: "Basic"),
    SelectedListItem(name: "Citi-Jet 6"),
    SelectedListItem(name: "Classic Basis"),
    SelectedListItem(name: "Classic Cab"),
    SelectedListItem(name: "Classic Pluss"),
    SelectedListItem(name: "Pluss"),
    SelectedListItem(name: "Premium"),
  ];

  void showDropdownBuddy(context) {
    DropDownState(
      DropDown(
        searchHintText: "Søk i ${carmerke!.text} modeller",
        bottomSheetTitle: Text(
          "Buddy modell",
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        dropDownBackgroundColor: Myisellcolors.hvit,
        clearButtonChild: Text(
          'Nullstill',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.red),
        ),
        submitButtonChild: Text(
          'Ferdig',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.green),
        ),
        data: buddy,
        selectedItems: (List<dynamic> selectedLista) {
          List<String> list = [];
          for (var item in selectedLista) {
            if (item is SelectedListItem) {
              list.add(item.name);
            }
          }
          carmodell!.text = list.join(", ");
          gkBilerannonse.currentState?.validate();
          update();
        },
        enableMultipleSelection: false,
      ),
    ).showModal(context);
    update();
  }
//////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////

  List<SelectedListItem> buick = [
    SelectedListItem(name: "Centurion"),
    SelectedListItem(name: "Century"),
    SelectedListItem(name: "Le Sabre"),
    SelectedListItem(name: "Park Avenue"),
    SelectedListItem(name: "Regal"),
    SelectedListItem(name: "Skylark"),
    SelectedListItem(name: "Andre"),
  ];

  void showDropdownBuick(context) {
    DropDownState(
      DropDown(
        searchHintText: "Søk i ${carmerke!.text} modeller",
        bottomSheetTitle: Text(
          "Buick modell",
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        dropDownBackgroundColor: Myisellcolors.hvit,
        clearButtonChild: Text(
          'Nullstill',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.red),
        ),
        submitButtonChild: Text(
          'Ferdig',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.green),
        ),
        data: buick,
        selectedItems: (List<dynamic> selectedLista) {
          List<String> list = [];
          for (var item in selectedLista) {
            if (item is SelectedListItem) {
              list.add(item.name);
            }
          }
          carmodell!.text = list.join(", ");
          gkBilerannonse.currentState?.validate();
          update();
        },
        enableMultipleSelection: false,
      ),
    ).showModal(context);
    update();
  }

//////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////
  List<SelectedListItem> bugatti = [
    SelectedListItem(name: "Chiron"),
  ];

  void showDropdownBugatti(context) {
    DropDownState(
      DropDown(
        searchHintText: "Søk i ${carmerke!.text} modeller",
        bottomSheetTitle: Text(
          "Bugatti modell",
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        dropDownBackgroundColor: Myisellcolors.hvit,
        clearButtonChild: Text(
          'Nullstill',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.red),
        ),
        submitButtonChild: Text(
          'Ferdig',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.green),
        ),
        data: bugatti,
        selectedItems: (List<dynamic> selectedLista) {
          List<String> list = [];
          for (var item in selectedLista) {
            if (item is SelectedListItem) {
              list.add(item.name);
            }
          }
          carmodell!.text = list.join(", ");
          gkBilerannonse.currentState?.validate();
          update();
        },
        enableMultipleSelection: false,
      ),
    ).showModal(context);
    update();
  }
//////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////

  List<SelectedListItem> byd = [
    SelectedListItem(name: "Atto3"),
    SelectedListItem(name: "Han"),
    SelectedListItem(name: "T3"),
    SelectedListItem(name: "Tang"),
    SelectedListItem(name: "Andre"),
  ];

  void showDropdownByd(context) {
    DropDownState(
      DropDown(
        searchHintText: "Søk i ${carmerke!.text} modeller",
        bottomSheetTitle: Text(
          "BYD modell",
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        dropDownBackgroundColor: Myisellcolors.hvit,
        clearButtonChild: Text(
          'Nullstill',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.red),
        ),
        submitButtonChild: Text(
          'Ferdig',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.green),
        ),
        data: byd,
        selectedItems: (List<dynamic> selectedLista) {
          List<String> list = [];
          for (var item in selectedLista) {
            if (item is SelectedListItem) {
              list.add(item.name);
            }
          }
          carmodell!.text = list.join(", ");
          gkBilerannonse.currentState?.validate();
          update();
        },
        enableMultipleSelection: false,
      ),
    ).showModal(context);
    update();
  }
//////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////

  List<SelectedListItem> cadillac = [
    SelectedListItem(name: "ATS"),
    SelectedListItem(name: "BLS"),
    SelectedListItem(name: "CTS"),
    SelectedListItem(name: "Deville"),
    SelectedListItem(name: "Eldorado"),
    SelectedListItem(name: "Elr"),
    SelectedListItem(name: "Escalade"),
    SelectedListItem(name: "Fleetwood"),
    SelectedListItem(name: "SRX"),
    SelectedListItem(name: "Seville"),
    SelectedListItem(name: "XLR"),
    SelectedListItem(name: "Andre"),
  ];

  void showDropdownCadillac(context) {
    DropDownState(
      DropDown(
        searchHintText: "Søk i ${carmerke!.text} modeller",
        bottomSheetTitle: Text(
          "Cadillac modell",
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        dropDownBackgroundColor: Myisellcolors.hvit,
        clearButtonChild: Text(
          'Nullstill',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.red),
        ),
        submitButtonChild: Text(
          'Ferdig',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.green),
        ),
        data: cadillac,
        selectedItems: (List<dynamic> selectedLista) {
          List<String> list = [];
          for (var item in selectedLista) {
            if (item is SelectedListItem) {
              list.add(item.name);
            }
          }
          carmodell!.text = list.join(", ");
          gkBilerannonse.currentState?.validate();
          update();
        },
        enableMultipleSelection: false,
      ),
    ).showModal(context);
    update();
  }
//////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////

  List<SelectedListItem> chevrolet = [
    SelectedListItem(name: "Alero"),
    SelectedListItem(name: "Astro"),
    SelectedListItem(name: "Avalanche"),
    SelectedListItem(name: "Aveo"),
    SelectedListItem(name: "Beauville"),
    SelectedListItem(name: "Bel Air"),
    SelectedListItem(name: "Beretta"),
    SelectedListItem(name: "Big Dooley"),
    SelectedListItem(name: "Blazer"),
    SelectedListItem(name: "Bolt"),
    SelectedListItem(name: "C-10"),
    SelectedListItem(name: "Camaro"),
    SelectedListItem(name: "Caprice"),
    SelectedListItem(name: "Captiva"),
    SelectedListItem(name: "Cargovan"),
    SelectedListItem(name: "Chevelle"),
    SelectedListItem(name: "Cheyenne"),
    SelectedListItem(name: "Colorado"),
    SelectedListItem(name: "Corsica"),
    SelectedListItem(name: "Corvair"),
    SelectedListItem(name: "Corvette"),
    SelectedListItem(name: "Crew Cab"),
    SelectedListItem(name: "Cruze"),
    SelectedListItem(name: "El Camino"),
    SelectedListItem(name: "Epica"),
    SelectedListItem(name: "Express"),
    SelectedListItem(name: "Extended Cab"),
    SelectedListItem(name: "Impala"),
    SelectedListItem(name: "Kalos"),
    SelectedListItem(name: "Korea"),
    SelectedListItem(name: "Lacetti"),
    SelectedListItem(name: "Lumina"),
    SelectedListItem(name: "Malibu"),
    SelectedListItem(name: "Master"),
    SelectedListItem(name: "Matiz"),
    SelectedListItem(name: "Monte Carlo"),
    SelectedListItem(name: "Nubira"),
    SelectedListItem(name: "Orlando"),
    SelectedListItem(name: "Regular Cab"),
    SelectedListItem(name: "S-10"),
    SelectedListItem(name: "Silverado"),
    SelectedListItem(name: "Spark"),
    SelectedListItem(name: "Sport Van"),
    SelectedListItem(name: "Starcraft"),
    SelectedListItem(name: "Suburban"),
    SelectedListItem(name: "Tahoe"),
    SelectedListItem(name: "Trailblazer"),
    SelectedListItem(name: "Trans Sport"),
    SelectedListItem(name: "Trax"),
    SelectedListItem(name: "Van"),
    SelectedListItem(name: "Volt"),
    SelectedListItem(name: "Andre"),
  ];

  void showDropdownChevrolet(context) {
    DropDownState(
      DropDown(
        searchHintText: "Søk i ${carmerke!.text} modeller",
        bottomSheetTitle: Text(
          "Chevrolet modell",
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        dropDownBackgroundColor: Myisellcolors.hvit,
        clearButtonChild: Text(
          'Nullstill',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.red),
        ),
        submitButtonChild: Text(
          'Ferdig',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.green),
        ),
        data: chevrolet,
        selectedItems: (List<dynamic> selectedLista) {
          List<String> list = [];
          for (var item in selectedLista) {
            if (item is SelectedListItem) {
              list.add(item.name);
            }
          }
          carmodell!.text = list.join(", ");
          gkBilerannonse.currentState?.validate();
          update();
        },
        enableMultipleSelection: false,
      ),
    ).showModal(context);
    update();
  }
//////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////

  List<SelectedListItem> chrysler = [
    SelectedListItem(name: "300 M"),
    SelectedListItem(name: "300C"),
    SelectedListItem(name: "Crossfire"),
    SelectedListItem(name: "Grand Voyager"),
    SelectedListItem(name: "Le Baron"),
    SelectedListItem(name: "Neon"),
    SelectedListItem(name: "New Yorker"),
    SelectedListItem(name: "PT Cruiser"),
    SelectedListItem(name: "Pacifica"),
    SelectedListItem(name: "Plymouth Premier"),
    SelectedListItem(name: "Plymouth Volare"),
    SelectedListItem(name: "Prowler"),
    SelectedListItem(name: "Sebring"),
    SelectedListItem(name: "Stratus"),
    SelectedListItem(name: "Vision"),
    SelectedListItem(name: "Voyager"),
    SelectedListItem(name: "Andre"),
  ];

  void showDropdownChrysler(context) {
    DropDownState(
      DropDown(
        searchHintText: "Søk i ${carmerke!.text} modeller",
        bottomSheetTitle: Text(
          "Chrysler modell",
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        dropDownBackgroundColor: Myisellcolors.hvit,
        clearButtonChild: Text(
          'Nullstill',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.red),
        ),
        submitButtonChild: Text(
          'Ferdig',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.green),
        ),
        data: chrysler,
        selectedItems: (List<dynamic> selectedLista) {
          List<String> list = [];
          for (var item in selectedLista) {
            if (item is SelectedListItem) {
              list.add(item.name);
            }
          }
          carmodell!.text = list.join(", ");
          gkBilerannonse.currentState?.validate();
          update();
        },
        enableMultipleSelection: false,
      ),
    ).showModal(context);
    update();
  }
//////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////

  List<SelectedListItem> citroen = [
    SelectedListItem(name: "2CV"),
    SelectedListItem(name: "AX"),
    SelectedListItem(name: "BX"),
    SelectedListItem(name: "Berlingo"),
    SelectedListItem(name: "Berlingo Electrique"),
    SelectedListItem(name: "C-Crosser"),
    SelectedListItem(name: "C-Zero"),
    SelectedListItem(name: "C1"),
    SelectedListItem(name: "C2"),
    SelectedListItem(name: "C3"),
    SelectedListItem(name: "C3 Aircross"),
    SelectedListItem(name: "C3 Picasso"),
    SelectedListItem(name: "C4"),
    SelectedListItem(name: "C4 Aircross"),
    SelectedListItem(name: "C4 Cactus"),
    SelectedListItem(name: "C4 Picasso"),
    SelectedListItem(name: "C5"),
    SelectedListItem(name: "C5 Aircross"),
    SelectedListItem(name: "C5 X"),
    SelectedListItem(name: "C6"),
    SelectedListItem(name: "C8"),
    SelectedListItem(name: "CX"),
    SelectedListItem(name: "DS3"),
    SelectedListItem(name: "DS4"),
    SelectedListItem(name: "DS5"),
    SelectedListItem(name: "E-C4"),
    SelectedListItem(name: "E-C4 X"),
    SelectedListItem(name: "E-Mehari"),
    SelectedListItem(name: "Evasion"),
    SelectedListItem(name: "GSA"),
    SelectedListItem(name: "Grand C4 Picasso"),
    SelectedListItem(name: "Grand C4 Spacetourer"),
    SelectedListItem(name: "Jumper"),
    SelectedListItem(name: "Jumpy"),
    SelectedListItem(name: "Nemo"),
    SelectedListItem(name: "SAXO Electrique"),
    SelectedListItem(name: "Saxo"),
    SelectedListItem(name: "Space Tourer"),
    SelectedListItem(name: "Visa"),
    SelectedListItem(name: "XM"),
    SelectedListItem(name: "Xantia"),
    SelectedListItem(name: "Xsara"),
    SelectedListItem(name: "Xsara Picasso"),
    SelectedListItem(name: "ZX"),
    SelectedListItem(name: "Andre"),
  ];

  void showDropdownCitroen(context) {
    DropDownState(
      DropDown(
        searchHintText: "Søk i ${carmerke!.text} modeller",
        bottomSheetTitle: Text(
          "Citroen modell",
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        dropDownBackgroundColor: Myisellcolors.hvit,
        clearButtonChild: Text(
          'Nullstill',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.red),
        ),
        submitButtonChild: Text(
          'Ferdig',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.green),
        ),
        data: citroen,
        selectedItems: (List<dynamic> selectedLista) {
          List<String> list = [];
          for (var item in selectedLista) {
            if (item is SelectedListItem) {
              list.add(item.name);
            }
          }
          carmodell!.text = list.join(", ");
          gkBilerannonse.currentState?.validate();
          update();
        },
        enableMultipleSelection: false,
      ),
    ).showModal(context);
    update();
  }
//////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////

  List<SelectedListItem> cupra = [
    SelectedListItem(name: "Formentor"),
    SelectedListItem(name: "Formentor e-HYBRID"),
    SelectedListItem(name: "Leon e-Racer"),
    SelectedListItem(name: "Born"),
  ];

  void showDropdownCupra(context) {
    DropDownState(
      DropDown(
        searchHintText: "Søk i ${carmerke!.text} modeller",
        bottomSheetTitle: Text(
          "Cupra modell",
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        dropDownBackgroundColor: Myisellcolors.hvit,
        clearButtonChild: Text(
          'Nullstill',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.red),
        ),
        submitButtonChild: Text(
          'Ferdig',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.green),
        ),
        data: cupra,
        selectedItems: (List<dynamic> selectedLista) {
          List<String> list = [];
          for (var item in selectedLista) {
            if (item is SelectedListItem) {
              list.add(item.name);
            }
          }
          carmodell!.text = list.join(", ");
          gkBilerannonse.currentState?.validate();
          update();
        },
        enableMultipleSelection: false,
      ),
    ).showModal(context);
    update();
  }
//////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////

  List<SelectedListItem> daf = [
    SelectedListItem(name: "Andre"),
  ];

  void showDropdownDAF(context) {
    DropDownState(
      DropDown(
        searchHintText: "Søk i ${carmerke!.text} modeller",
        bottomSheetTitle: Text(
          "DAF modell",
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        dropDownBackgroundColor: Myisellcolors.hvit,
        clearButtonChild: Text(
          'Nullstill',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.red),
        ),
        submitButtonChild: Text(
          'Ferdig',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.green),
        ),
        data: daf,
        selectedItems: (List<dynamic> selectedLista) {
          List<String> list = [];
          for (var item in selectedLista) {
            if (item is SelectedListItem) {
              list.add(item.name);
            }
          }
          carmodell!.text = list.join(", ");
          gkBilerannonse.currentState?.validate();
          update();
        },
        enableMultipleSelection: false,
      ),
    ).showModal(context);
    update();
  }
//////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////

  List<SelectedListItem> ds = [
    SelectedListItem(name: "DS 3"),
    SelectedListItem(name: "3 Crossback"),
    SelectedListItem(name: "DS 4"),
    SelectedListItem(name: "DS 5"),
    SelectedListItem(name: "DS 7 Crossback"),
    SelectedListItem(name: "DS 9"),
  ];

  void showDropdownDS(context) {
    DropDownState(
      DropDown(
        searchHintText: "Søk i ${carmerke!.text} modeller",
        bottomSheetTitle: Text(
          "DS modell",
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        dropDownBackgroundColor: Myisellcolors.hvit,
        clearButtonChild: Text(
          'Nullstill',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.red),
        ),
        submitButtonChild: Text(
          'Ferdig',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.green),
        ),
        data: ds,
        selectedItems: (List<dynamic> selectedLista) {
          List<String> list = [];
          for (var item in selectedLista) {
            if (item is SelectedListItem) {
              list.add(item.name);
            }
          }
          carmodell!.text = list.join(", ");
          gkBilerannonse.currentState?.validate();
          update();
        },
        enableMultipleSelection: false,
      ),
    ).showModal(context);
    update();
  }
//////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////

  List<SelectedListItem> dacia = [
    SelectedListItem(name: "Duster"),
    SelectedListItem(name: "Logan"),
    SelectedListItem(name: "Dokker"),
    SelectedListItem(name: "Andre"),
  ];

  void showDropdownDacia(context) {
    DropDownState(
      DropDown(
        searchHintText: "Søk i ${carmerke!.text} modeller",
        bottomSheetTitle: Text(
          "Dacia modell",
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        dropDownBackgroundColor: Myisellcolors.hvit,
        clearButtonChild: Text(
          'Nullstill',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.red),
        ),
        submitButtonChild: Text(
          'Ferdig',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.green),
        ),
        data: dacia,
        selectedItems: (List<dynamic> selectedLista) {
          List<String> list = [];
          for (var item in selectedLista) {
            if (item is SelectedListItem) {
              list.add(item.name);
            }
          }
          carmodell!.text = list.join(", ");
          gkBilerannonse.currentState?.validate();
          update();
        },
        enableMultipleSelection: false,
      ),
    ).showModal(context);
    update();
  }
//////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////

  List<SelectedListItem> daewoo = [
    SelectedListItem(name: "Espero"),
    SelectedListItem(name: "Kalos"),
    SelectedListItem(name: "Koranda"),
    SelectedListItem(name: "Lacetti"),
    SelectedListItem(name: "Lanos"),
    SelectedListItem(name: "Leganza"),
    SelectedListItem(name: "Matiz"),
    SelectedListItem(name: "Musso"),
    SelectedListItem(name: "Nexia"),
    SelectedListItem(name: "Nubira"),
    SelectedListItem(name: "Tacuma"),
    SelectedListItem(name: "Andre"),
  ];

  void showDropdownDaewoo(context) {
    DropDownState(
      DropDown(
        searchHintText: "Søk i ${carmerke!.text} modeller",
        bottomSheetTitle: Text(
          "Daewoo modell",
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        dropDownBackgroundColor: Myisellcolors.hvit,
        clearButtonChild: Text(
          'Nullstill',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.red),
        ),
        submitButtonChild: Text(
          'Ferdig',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.green),
        ),
        data: daewoo,
        selectedItems: (List<dynamic> selectedLista) {
          List<String> list = [];
          for (var item in selectedLista) {
            if (item is SelectedListItem) {
              list.add(item.name);
            }
          }
          carmodell!.text = list.join(", ");
          gkBilerannonse.currentState?.validate();
          update();
        },
        enableMultipleSelection: false,
      ),
    ).showModal(context);
    update();
  }
//////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////

  List<SelectedListItem> daihatsu = [
    SelectedListItem(name: "Applause"),
    SelectedListItem(name: "Charade"),
    SelectedListItem(name: "Copen"),
    SelectedListItem(name: "Cuore"),
    SelectedListItem(name: "Gran Move"),
    SelectedListItem(name: "Rocky"),
    SelectedListItem(name: "Sirion"),
    SelectedListItem(name: "Terios"),
    SelectedListItem(name: "YRV"),
    SelectedListItem(name: "Andre"),
  ];

  void showDropdownDaihatsu(context) {
    DropDownState(
      DropDown(
        searchHintText: "Søk i ${carmerke!.text} modeller",
        bottomSheetTitle: Text(
          "Daihatsu modell",
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        dropDownBackgroundColor: Myisellcolors.hvit,
        clearButtonChild: Text(
          'Nullstill',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.red),
        ),
        submitButtonChild: Text(
          'Ferdig',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.green),
        ),
        data: daihatsu,
        selectedItems: (List<dynamic> selectedLista) {
          List<String> list = [];
          for (var item in selectedLista) {
            if (item is SelectedListItem) {
              list.add(item.name);
            }
          }
          carmodell!.text = list.join(", ");
          gkBilerannonse.currentState?.validate();
          update();
        },
        enableMultipleSelection: false,
      ),
    ).showModal(context);
    update();
  }
//////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////

  List<SelectedListItem> datsun = [
    SelectedListItem(name: "Datsun"),
  ];

  void showDropdownDatsun(context) {
    DropDownState(
      DropDown(
        searchHintText: "Søk i ${carmerke!.text} modeller",
        bottomSheetTitle: Text(
          "Datsun modell",
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        dropDownBackgroundColor: Myisellcolors.hvit,
        clearButtonChild: Text(
          'Nullstill',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.red),
        ),
        submitButtonChild: Text(
          'Ferdig',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.green),
        ),
        data: datsun,
        selectedItems: (List<dynamic> selectedLista) {
          List<String> list = [];
          for (var item in selectedLista) {
            if (item is SelectedListItem) {
              list.add(item.name);
            }
          }
          carmodell!.text = list.join(", ");
          gkBilerannonse.currentState?.validate();
          update();
        },
        enableMultipleSelection: false,
      ),
    ).showModal(context);
    update();
  }
//////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////

  List<SelectedListItem> detomaso = [
    SelectedListItem(name: "Pantera"),
    SelectedListItem(name: "Andre"),
  ];

  void showDropdownDetomaso(context) {
    DropDownState(
      DropDown(
        searchHintText: "Søk i ${carmerke!.text} modeller",
        bottomSheetTitle: Text(
          "De Tomaso modell",
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        dropDownBackgroundColor: Myisellcolors.hvit,
        clearButtonChild: Text(
          'Nullstill',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.red),
        ),
        submitButtonChild: Text(
          'Ferdig',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.green),
        ),
        data: detomaso,
        selectedItems: (List<dynamic> selectedLista) {
          List<String> list = [];
          for (var item in selectedLista) {
            if (item is SelectedListItem) {
              list.add(item.name);
            }
          }
          carmodell!.text = list.join(", ");
          gkBilerannonse.currentState?.validate();
          update();
        },
        enableMultipleSelection: false,
      ),
    ).showModal(context);
    update();
  }
//////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////

  List<SelectedListItem> delorean = [
    SelectedListItem(name: "DMC-12"),
    SelectedListItem(name: "Andre"),
  ];

  void showDropdownDelorean(context) {
    DropDownState(
      DropDown(
        searchHintText: "Søk i ${carmerke!.text} modeller",
        bottomSheetTitle: Text(
          "DeLorean modell",
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        dropDownBackgroundColor: Myisellcolors.hvit,
        clearButtonChild: Text(
          'Nullstill',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.red),
        ),
        submitButtonChild: Text(
          'Ferdig',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.green),
        ),
        data: delorean,
        selectedItems: (List<dynamic> selectedLista) {
          List<String> list = [];
          for (var item in selectedLista) {
            if (item is SelectedListItem) {
              list.add(item.name);
            }
          }
          carmodell!.text = list.join(", ");
          gkBilerannonse.currentState?.validate();
          update();
        },
        enableMultipleSelection: false,
      ),
    ).showModal(context);
    update();
  }
//////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////

  List<SelectedListItem> dodge = [
    SelectedListItem(name: "Avenger"),
    SelectedListItem(name: "Caliber"),
    SelectedListItem(name: "Challenger"),
    SelectedListItem(name: "Charger"),
    SelectedListItem(name: "Dakota"),
    SelectedListItem(name: "Durango"),
    SelectedListItem(name: "Grand Caravan"),
    SelectedListItem(name: "Journey"),
    SelectedListItem(name: "Le Baron"),
    SelectedListItem(name: "Magnum"),
    SelectedListItem(name: "Nitro"),
    SelectedListItem(name: "RAM"),
    SelectedListItem(name: "RAM STR-10"),
    SelectedListItem(name: "Viper"),
    SelectedListItem(name: "Andre"),
  ];

  void showDropdownDodge(context) {
    DropDownState(
      DropDown(
        searchHintText: "Søk i ${carmerke!.text} modeller",
        bottomSheetTitle: Text(
          "Dodge modell",
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        dropDownBackgroundColor: Myisellcolors.hvit,
        clearButtonChild: Text(
          'Nullstill',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.red),
        ),
        submitButtonChild: Text(
          'Ferdig',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.green),
        ),
        data: dodge,
        selectedItems: (List<dynamic> selectedLista) {
          List<String> list = [];
          for (var item in selectedLista) {
            if (item is SelectedListItem) {
              list.add(item.name);
            }
          }
          carmodell!.text = list.join(", ");
          gkBilerannonse.currentState?.validate();
          update();
        },
        enableMultipleSelection: false,
      ),
    ).showModal(context);
    update();
  }
//////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////

  List<SelectedListItem> ferrari = [
    SelectedListItem(name: "296"),
    SelectedListItem(name: "308"),
    SelectedListItem(name: "328"),
    SelectedListItem(name: "348"),
    SelectedListItem(name: "355"),
    SelectedListItem(name: "360"),
    SelectedListItem(name: "365"),
    SelectedListItem(name: "412"),
    SelectedListItem(name: "430"),
    SelectedListItem(name: "456"),
    SelectedListItem(name: "458 Italia"),
    SelectedListItem(name: "458 Spider"),
    SelectedListItem(name: "488 GTB"),
    SelectedListItem(name: "488 Spider"),
    SelectedListItem(name: "488 Pista"),
    SelectedListItem(name: "512"),
    SelectedListItem(name: "550 Maranello"),
    SelectedListItem(name: "575 Maranello"),
    SelectedListItem(name: "599"),
    SelectedListItem(name: "612"),
    SelectedListItem(name: "812 GTS"),
    SelectedListItem(name: "812 Superfast"),
    SelectedListItem(name: "California"),
    SelectedListItem(name: "Dino"),
    SelectedListItem(name: "F8 Spider"),
    SelectedListItem(name: "F8 Tributo"),
    SelectedListItem(name: "F 40"),
    SelectedListItem(name: "F12 Berlinetta"),
    SelectedListItem(name: "FF"),
    SelectedListItem(name: "GTC4Lusso"),
    SelectedListItem(name: "Mondial"),
    SelectedListItem(name: "Portofino"),
    SelectedListItem(name: "Roma"),
    SelectedListItem(name: "SF90 Spider"),
    SelectedListItem(name: "SF90 Stradale"),
    SelectedListItem(name: "Testarossa"),
    SelectedListItem(name: "Andre"),
  ];

  void showDropdownFerrari(context) {
    DropDownState(
      DropDown(
        searchHintText: "Søk i ${carmerke!.text} modeller",
        bottomSheetTitle: Text(
          "Ferrari modell",
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        dropDownBackgroundColor: Myisellcolors.hvit,
        clearButtonChild: Text(
          'Nullstill',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.red),
        ),
        submitButtonChild: Text(
          'Ferdig',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.green),
        ),
        data: ferrari,
        selectedItems: (List<dynamic> selectedLista) {
          List<String> list = [];
          for (var item in selectedLista) {
            if (item is SelectedListItem) {
              list.add(item.name);
            }
          }
          carmodell!.text = list.join(", ");
          gkBilerannonse.currentState?.validate();
          update();
        },
        enableMultipleSelection: false,
      ),
    ).showModal(context);
    update();
  }
//////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////

  List<SelectedListItem> fiat = [
    SelectedListItem(name: "124 Spider"),
    SelectedListItem(name: "500"),
    SelectedListItem(name: "500L"),
    SelectedListItem(name: "500X"),
    SelectedListItem(name: "Barchetta"),
    SelectedListItem(name: "Bertone"),
    SelectedListItem(name: "Brava"),
    SelectedListItem(name: "Bravo"),
    SelectedListItem(name: "Coupe"),
    SelectedListItem(name: "Croma"),
    SelectedListItem(name: "Doblo"),
    SelectedListItem(name: "Ducato"),
    SelectedListItem(name: "Freemont"),
    SelectedListItem(name: "Fullback"),
    SelectedListItem(name: "Grande Punto"),
    SelectedListItem(name: "Marea"),
    SelectedListItem(name: "Multipla"),
    SelectedListItem(name: "Panda"),
    SelectedListItem(name: "Punto"),
    SelectedListItem(name: "Punto Evo"),
    SelectedListItem(name: "Regata"),
    SelectedListItem(name: "Ritmo"),
    SelectedListItem(name: "Scudo"),
    SelectedListItem(name: "Sedici"),
    SelectedListItem(name: "Stilo"),
    SelectedListItem(name: "Starda"),
    SelectedListItem(name: "Talento"),
    SelectedListItem(name: "Tipo"),
    SelectedListItem(name: "Ulysse"),
    SelectedListItem(name: "Uno"),
    SelectedListItem(name: "X 1/9"),
    SelectedListItem(name: "Andre"),
  ];

  void showDropdownFiat(context) {
    DropDownState(
      DropDown(
        searchHintText: "Søk i ${carmerke!.text} modeller",
        bottomSheetTitle: Text(
          "Fiat modell",
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        dropDownBackgroundColor: Myisellcolors.hvit,
        clearButtonChild: Text(
          'Nullstill',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.red),
        ),
        submitButtonChild: Text(
          'Ferdig',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.green),
        ),
        data: fiat,
        selectedItems: (List<dynamic> selectedLista) {
          List<String> list = [];
          for (var item in selectedLista) {
            if (item is SelectedListItem) {
              list.add(item.name);
            }
          }
          carmodell!.text = list.join(", ");
          gkBilerannonse.currentState?.validate();
          update();
        },
        enableMultipleSelection: false,
      ),
    ).showModal(context);
    update();
  }
//////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////

  List<SelectedListItem> fisker = [
    SelectedListItem(name: "Karma"),
    SelectedListItem(name: "Karma S"),
    SelectedListItem(name: "Ocean"),
    SelectedListItem(name: "Andre"),
  ];

  void showDropdownFisker(context) {
    DropDownState(
      DropDown(
        searchHintText: "Søk i ${carmerke!.text} modeller",
        bottomSheetTitle: Text(
          "Fisker modell",
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        dropDownBackgroundColor: Myisellcolors.hvit,
        clearButtonChild: Text(
          'Nullstill',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.red),
        ),
        submitButtonChild: Text(
          'Ferdig',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.green),
        ),
        data: fisker,
        selectedItems: (List<dynamic> selectedLista) {
          List<String> list = [];
          for (var item in selectedLista) {
            if (item is SelectedListItem) {
              list.add(item.name);
            }
          }
          carmodell!.text = list.join(", ");
          gkBilerannonse.currentState?.validate();
          update();
        },
        enableMultipleSelection: false,
      ),
    ).showModal(context);
    update();
  }
//////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////

  List<SelectedListItem> ford = [
    SelectedListItem(name: "Aerostar"),
    SelectedListItem(name: "B-MAX"),
    SelectedListItem(name: "Bronco"),
    SelectedListItem(name: "C-Max"),
    SelectedListItem(name: "Cougar"),
    SelectedListItem(name: "Courier"),
    SelectedListItem(name: "Custom Line"),
    SelectedListItem(name: "Econoline"),
    SelectedListItem(name: "Ecosport"),
    SelectedListItem(name: "Edge"),
    SelectedListItem(name: "Escort"),
    SelectedListItem(name: "Excursion"),
    SelectedListItem(name: "Expedition"),
    SelectedListItem(name: "Explorer"),
    SelectedListItem(name: "Extended Cab"),
    SelectedListItem(name: "F-serie"),
    SelectedListItem(name: "Fiesta"),
    SelectedListItem(name: "Focus"),
    SelectedListItem(name: "Focus CC"),
    SelectedListItem(name: "Fusion"),
    SelectedListItem(name: "Galaxy"),
    SelectedListItem(name: "Granada"),
    SelectedListItem(name: "Grand C-MAX"),
    SelectedListItem(name: "Grand Tourneo Connect"),
    SelectedListItem(name: "Ka"),
    SelectedListItem(name: "Ka+"),
    SelectedListItem(name: "Kuga"),
    SelectedListItem(name: "Maverick"),
    SelectedListItem(name: "Mondeo"),
    SelectedListItem(name: "Mustang"),
    SelectedListItem(name: "Mustang Mach-E"),
    SelectedListItem(name: "Orion"),
    SelectedListItem(name: "Probe"),
    SelectedListItem(name: "Puma"),
    SelectedListItem(name: "Ranger"),
    SelectedListItem(name: "S-MAX"),
    SelectedListItem(name: "SVT Lightning"),
    SelectedListItem(name: "Scorpio"),
    SelectedListItem(name: "Sirra"),
    SelectedListItem(name: "Sportka"),
    SelectedListItem(name: "StreetKa"),
    SelectedListItem(name: "Taunus"),
    SelectedListItem(name: "Taurus"),
    SelectedListItem(name: "Thunderbird"),
    SelectedListItem(name: "Tourneo Connect"),
    SelectedListItem(name: "Tourneo Courier"),
    SelectedListItem(name: "Tourneo Custom"),
    SelectedListItem(name: "Transit"),
    SelectedListItem(name: "Transit Connect"),
    SelectedListItem(name: "Transit Courier"),
    SelectedListItem(name: "Transit Custom"),
    SelectedListItem(name: "Van"),
    SelectedListItem(name: "Windstar"),
    SelectedListItem(name: "Andre"),
  ];

  void showDropdownFord(context) {
    DropDownState(
      DropDown(
        searchHintText: "Søk i ${carmerke!.text} modeller",
        bottomSheetTitle: Text(
          "Ford modell",
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        dropDownBackgroundColor: Myisellcolors.hvit,
        clearButtonChild: Text(
          'Nullstill',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.red),
        ),
        submitButtonChild: Text(
          'Ferdig',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.green),
        ),
        data: ford,
        selectedItems: (List<dynamic> selectedLista) {
          List<String> list = [];
          for (var item in selectedLista) {
            if (item is SelectedListItem) {
              list.add(item.name);
            }
          }
          carmodell!.text = list.join(", ");
          gkBilerannonse.currentState?.validate();
          update();
        },
        enableMultipleSelection: false,
      ),
    ).showModal(context);
    update();
  }
//////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////

  List<SelectedListItem> gmc = [
    SelectedListItem(name: "Crew Cab"),
    SelectedListItem(name: "Envoy"),
    SelectedListItem(name: "Extended Cab"),
    SelectedListItem(name: "Sierra"),
    SelectedListItem(name: "Silverado"),
    SelectedListItem(name: "Syclone"),
    SelectedListItem(name: "Yukon"),
    SelectedListItem(name: "Andre"),
  ];

  void showDropdownGMC(context) {
    DropDownState(
      DropDown(
        searchHintText: "Søk i ${carmerke!.text} modeller",
        bottomSheetTitle: Text(
          "GMC modell",
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        dropDownBackgroundColor: Myisellcolors.hvit,
        clearButtonChild: Text(
          'Nullstill',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.red),
        ),
        submitButtonChild: Text(
          'Ferdig',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.green),
        ),
        data: gmc,
        selectedItems: (List<dynamic> selectedLista) {
          List<String> list = [];
          for (var item in selectedLista) {
            if (item is SelectedListItem) {
              list.add(item.name);
            }
          }
          carmodell!.text = list.join(", ");
          gkBilerannonse.currentState?.validate();
          update();
        },
        enableMultipleSelection: false,
      ),
    ).showModal(context);
    update();
  }
//////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////

  List<SelectedListItem> goupil = [
    SelectedListItem(name: "G2"),
    SelectedListItem(name: "G4"),
    SelectedListItem(name: "G5"),
    SelectedListItem(name: "G6"),
    SelectedListItem(name: "Andre"),
  ];

  void showDropdownGoupil(context) {
    DropDownState(
      DropDown(
        searchHintText: "Søk i ${carmerke!.text} modeller",
        bottomSheetTitle: Text(
          "Goupil modell",
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        dropDownBackgroundColor: Myisellcolors.hvit,
        clearButtonChild: Text(
          'Nullstill',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.red),
        ),
        submitButtonChild: Text(
          'Ferdig',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.green),
        ),
        data: goupil,
        selectedItems: (List<dynamic> selectedLista) {
          List<String> list = [];
          for (var item in selectedLista) {
            if (item is SelectedListItem) {
              list.add(item.name);
            }
          }
          carmodell!.text = list.join(", ");
          gkBilerannonse.currentState?.validate();
          update();
        },
        enableMultipleSelection: false,
      ),
    ).showModal(context);
    update();
  }
//////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////

  List<SelectedListItem> hiphi = [
    SelectedListItem(name: "X"),
    SelectedListItem(name: "Z"),
    SelectedListItem(name: "Y"),
    SelectedListItem(name: "Andre"),
  ];

  void showDropdownHiPhi(context) {
    DropDownState(
      DropDown(
        searchHintText: "Søk i ${carmerke!.text} modeller",
        bottomSheetTitle: Text(
          "HiPhi modell",
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        dropDownBackgroundColor: Myisellcolors.hvit,
        clearButtonChild: Text(
          'Nullstill',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.red),
        ),
        submitButtonChild: Text(
          'Ferdig',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.green),
        ),
        data: hiphi,
        selectedItems: (List<dynamic> selectedLista) {
          List<String> list = [];
          for (var item in selectedLista) {
            if (item is SelectedListItem) {
              list.add(item.name);
            }
          }
          carmodell!.text = list.join(", ");
          gkBilerannonse.currentState?.validate();
          update();
        },
        enableMultipleSelection: false,
      ),
    ).showModal(context);
    update();
  }
//////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////

  List<SelectedListItem> honda = [
    SelectedListItem(name: "Accord"),
    SelectedListItem(name: "CR-V"),
    SelectedListItem(name: "CR-Z"),
    SelectedListItem(name: "CRX"),
    SelectedListItem(name: "Civic"),
    SelectedListItem(name: "e"),
    SelectedListItem(name: "e:Ny1"),
    SelectedListItem(name: "Element"),
    SelectedListItem(name: "FR-V"),
    SelectedListItem(name: "HR-V"),
    SelectedListItem(name: "Insight"),
    SelectedListItem(name: "Integra"),
    SelectedListItem(name: "Jazz"),
    SelectedListItem(name: "Legend"),
    SelectedListItem(name: "Nsx"),
    SelectedListItem(name: "Odyssey"),
    SelectedListItem(name: "Prelude"),
    SelectedListItem(name: "Quintet"),
    SelectedListItem(name: "Ridgeline"),
    SelectedListItem(name: "S2000"),
    SelectedListItem(name: "Shuttle"),
    SelectedListItem(name: "Stream"),
    SelectedListItem(name: "Andre"),
  ];

  void showDropdownHonda(context) {
    DropDownState(
      DropDown(
        searchHintText: "Søk i ${carmerke!.text} modeller",
        bottomSheetTitle: Text(
          "Honda modell",
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        dropDownBackgroundColor: Myisellcolors.hvit,
        clearButtonChild: Text(
          'Nullstill',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.red),
        ),
        submitButtonChild: Text(
          'Ferdig',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.green),
        ),
        data: honda,
        selectedItems: (List<dynamic> selectedLista) {
          List<String> list = [];
          for (var item in selectedLista) {
            if (item is SelectedListItem) {
              list.add(item.name);
            }
          }
          carmodell!.text = list.join(", ");
          gkBilerannonse.currentState?.validate();
          update();
        },
        enableMultipleSelection: false,
      ),
    ).showModal(context);
    update();
  }
//////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////

  List<SelectedListItem> hongqi = [
    SelectedListItem(name: "E-HS9"),
  ];

  void showDropdownHongqi(context) {
    DropDownState(
      DropDown(
        searchHintText: "Søk i ${carmerke!.text} modeller",
        bottomSheetTitle: Text(
          "Hongqi modell",
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        dropDownBackgroundColor: Myisellcolors.hvit,
        clearButtonChild: Text(
          'Nullstill',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.red),
        ),
        submitButtonChild: Text(
          'Ferdig',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.green),
        ),
        data: hongqi,
        selectedItems: (List<dynamic> selectedLista) {
          List<String> list = [];
          for (var item in selectedLista) {
            if (item is SelectedListItem) {
              list.add(item.name);
            }
          }
          carmodell!.text = list.join(", ");
          gkBilerannonse.currentState?.validate();
          update();
        },
        enableMultipleSelection: false,
      ),
    ).showModal(context);
    update();
  }
//////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////

  List<SelectedListItem> hummer = [
    SelectedListItem(name: "H1"),
    SelectedListItem(name: "H2"),
    SelectedListItem(name: "H3"),
    SelectedListItem(name: "HX"),
    SelectedListItem(name: "Andre"),
  ];

  void showDropdownHummer(context) {
    DropDownState(
      DropDown(
        searchHintText: "Søk i ${carmerke!.text} modeller",
        bottomSheetTitle: Text(
          "Hummer modell",
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        dropDownBackgroundColor: Myisellcolors.hvit,
        clearButtonChild: Text(
          'Nullstill',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.red),
        ),
        submitButtonChild: Text(
          'Ferdig',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.green),
        ),
        data: hummer,
        selectedItems: (List<dynamic> selectedLista) {
          List<String> list = [];
          for (var item in selectedLista) {
            if (item is SelectedListItem) {
              list.add(item.name);
            }
          }
          carmodell!.text = list.join(", ");
          gkBilerannonse.currentState?.validate();
          update();
        },
        enableMultipleSelection: false,
      ),
    ).showModal(context);
    update();
  }
//////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////

  List<SelectedListItem> hyundai = [
    SelectedListItem(name: "Accent"),
    SelectedListItem(name: "Atos"),
    SelectedListItem(name: "Coupe"),
    SelectedListItem(name: "Elantra"),
    SelectedListItem(name: "Galloper"),
    SelectedListItem(name: "Getz"),
    SelectedListItem(name: "Grand Santa Fe"),
    SelectedListItem(name: "H-1"),
    SelectedListItem(name: "H-100"),
    SelectedListItem(name: "IONIQ"),
    SelectedListItem(name: "Ioniq 5"),
    SelectedListItem(name: "Ioniq 6"),
    SelectedListItem(name: "Kona"),
    SelectedListItem(name: "Matrix"),
    SelectedListItem(name: "Nexo"),
    SelectedListItem(name: "Pony"),
    SelectedListItem(name: "Santa Fe"),
    SelectedListItem(name: "Sonata"),
    SelectedListItem(name: "Terracan"),
    SelectedListItem(name: "Trajet"),
    SelectedListItem(name: "Tucson"),
    SelectedListItem(name: "Veloster"),
    SelectedListItem(name: "X35"),
    SelectedListItem(name: "XG"),
    SelectedListItem(name: "i10"),
    SelectedListItem(name: "i20"),
    SelectedListItem(name: "i30"),
    SelectedListItem(name: "i40"),
    SelectedListItem(name: "ix20"),
    SelectedListItem(name: "ix35"),
    SelectedListItem(name: "ix55"),
    SelectedListItem(name: "Andre"),
  ];

  void showDropdownHyundai(context) {
    DropDownState(
      DropDown(
        searchHintText: "Søk i ${carmerke!.text} modeller",
        bottomSheetTitle: Text(
          "Hyundai modell",
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        dropDownBackgroundColor: Myisellcolors.hvit,
        clearButtonChild: Text(
          'Nullstill',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.red),
        ),
        submitButtonChild: Text(
          'Ferdig',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.green),
        ),
        data: hyundai,
        selectedItems: (List<dynamic> selectedLista) {
          List<String> list = [];
          for (var item in selectedLista) {
            if (item is SelectedListItem) {
              list.add(item.name);
            }
          }
          carmodell!.text = list.join(", ");
          gkBilerannonse.currentState?.validate();
          update();
        },
        enableMultipleSelection: false,
      ),
    ).showModal(context);
    update();
  }
//////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////

  List<SelectedListItem> infiniti = [
    SelectedListItem(name: "FX30D"),
    SelectedListItem(name: "FX35"),
    SelectedListItem(name: "FX37"),
    SelectedListItem(name: "FX45"),
    SelectedListItem(name: "FX50"),
    SelectedListItem(name: "G35"),
    SelectedListItem(name: "G37"),
    SelectedListItem(name: "M35"),
    SelectedListItem(name: "M45"),
    SelectedListItem(name: "Q30"),
    SelectedListItem(name: "Q50 Hybrid"),
    SelectedListItem(name: "QX56"),
    SelectedListItem(name: "Andre"),
  ];

  void showDropdownInfiniti(context) {
    DropDownState(
      DropDown(
        searchHintText: "Søk i ${carmerke!.text} modeller",
        bottomSheetTitle: Text(
          "Infiniti modell",
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        dropDownBackgroundColor: Myisellcolors.hvit,
        clearButtonChild: Text(
          'Nullstill',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.red),
        ),
        submitButtonChild: Text(
          'Ferdig',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.green),
        ),
        data: infiniti,
        selectedItems: (List<dynamic> selectedLista) {
          List<String> list = [];
          for (var item in selectedLista) {
            if (item is SelectedListItem) {
              list.add(item.name);
            }
          }
          carmodell!.text = list.join(", ");
          gkBilerannonse.currentState?.validate();
          update();
        },
        enableMultipleSelection: false,
      ),
    ).showModal(context);
    update();
  }
//////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////

  List<SelectedListItem> isuzu = [
    SelectedListItem(name: "D-max"),
    SelectedListItem(name: "Trooper"),
    SelectedListItem(name: "Andre"),
  ];

  void showDropdownIsuzu(context) {
    DropDownState(
      DropDown(
        searchHintText: "Søk i ${carmerke!.text} modeller",
        bottomSheetTitle: Text(
          "Isuzu modell",
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        dropDownBackgroundColor: Myisellcolors.hvit,
        clearButtonChild: Text(
          'Nullstill',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.red),
        ),
        submitButtonChild: Text(
          'Ferdig',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.green),
        ),
        data: isuzu,
        selectedItems: (List<dynamic> selectedLista) {
          List<String> list = [];
          for (var item in selectedLista) {
            if (item is SelectedListItem) {
              list.add(item.name);
            }
          }
          carmodell!.text = list.join(", ");
          gkBilerannonse.currentState?.validate();
          update();
        },
        enableMultipleSelection: false,
      ),
    ).showModal(context);
    update();
  }
//////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////

  List<SelectedListItem> iveco = [
    SelectedListItem(name: "3510"),
    SelectedListItem(name: "Daily"),
    SelectedListItem(name: "Andre"),
  ];

  void showDropdownIveco(context) {
    DropDownState(
      DropDown(
        searchHintText: "Søk i ${carmerke!.text} modeller",
        bottomSheetTitle: Text(
          "Iveco modell",
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        dropDownBackgroundColor: Myisellcolors.hvit,
        clearButtonChild: Text(
          'Nullstill',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.red),
        ),
        submitButtonChild: Text(
          'Ferdig',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.green),
        ),
        data: iveco,
        selectedItems: (List<dynamic> selectedLista) {
          List<String> list = [];
          for (var item in selectedLista) {
            if (item is SelectedListItem) {
              list.add(item.name);
            }
          }
          carmodell!.text = list.join(", ");
          gkBilerannonse.currentState?.validate();
          update();
        },
        enableMultipleSelection: false,
      ),
    ).showModal(context);
    update();
  }
//////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////

  List<SelectedListItem> jac = [
    SelectedListItem(name: "e-JS4"),
    SelectedListItem(name: "Andre"),
  ];

  void showDropdownJAC(context) {
    DropDownState(
      DropDown(
        searchHintText: "Søk i ${carmerke!.text} modeller",
        bottomSheetTitle: Text(
          "JAC modell",
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        dropDownBackgroundColor: Myisellcolors.hvit,
        clearButtonChild: Text(
          'Nullstill',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.red),
        ),
        submitButtonChild: Text(
          'Ferdig',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.green),
        ),
        data: jac,
        selectedItems: (List<dynamic> selectedLista) {
          List<String> list = [];
          for (var item in selectedLista) {
            if (item is SelectedListItem) {
              list.add(item.name);
            }
          }
          carmodell!.text = list.join(", ");
          gkBilerannonse.currentState?.validate();
          update();
        },
        enableMultipleSelection: false,
      ),
    ).showModal(context);
    update();
  }

//////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////
  List<SelectedListItem> jaguar = [
    SelectedListItem(name: "E-PACE"),
    SelectedListItem(name: "E-TYPE"),
    SelectedListItem(name: "F-PACE"),
    SelectedListItem(name: "F-TYPE"),
    SelectedListItem(name: "I-PACE"),
    SelectedListItem(name: "S-TYPE"),
    SelectedListItem(name: "X-TYPE"),
    SelectedListItem(name: "XE"),
    SelectedListItem(name: "XF"),
    SelectedListItem(name: "XJ"),
    SelectedListItem(name: "XJR"),
    SelectedListItem(name: "XJS"),
    SelectedListItem(name: "XK"),
    SelectedListItem(name: "Andre"),
  ];

  void showDropdownJaguar(context) {
    DropDownState(
      DropDown(
        searchHintText: "Søk i ${carmerke!.text} modeller",
        bottomSheetTitle: Text(
          "Jaguar modell",
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        dropDownBackgroundColor: Myisellcolors.hvit,
        clearButtonChild: Text(
          'Nullstill',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.red),
        ),
        submitButtonChild: Text(
          'Ferdig',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.green),
        ),
        data: jaguar,
        selectedItems: (List<dynamic> selectedLista) {
          List<String> list = [];
          for (var item in selectedLista) {
            if (item is SelectedListItem) {
              list.add(item.name);
            }
          }
          carmodell!.text = list.join(", ");
          gkBilerannonse.currentState?.validate();
          update();
        },
        enableMultipleSelection: false,
      ),
    ).showModal(context);
    update();
  }
//////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////

  List<SelectedListItem> jeep = [
    SelectedListItem(name: "Avenger"),
    SelectedListItem(name: "Cherokee"),
    SelectedListItem(name: "Comanche"),
    SelectedListItem(name: "Commander"),
    SelectedListItem(name: "Compass"),
    SelectedListItem(name: "Grand Cherokee"),
    SelectedListItem(name: "J 20"),
    SelectedListItem(name: "Patriot"),
    SelectedListItem(name: "Renegade"),
    SelectedListItem(name: "Wrangler"),
    SelectedListItem(name: "Gladiator"),
    SelectedListItem(name: "Andre"),
  ];

  void showDropdownJeep(context) {
    DropDownState(
      DropDown(
        searchHintText: "Søk i ${carmerke!.text} modeller",
        bottomSheetTitle: Text(
          "Jeep modell",
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        dropDownBackgroundColor: Myisellcolors.hvit,
        clearButtonChild: Text(
          'Nullstill',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.red),
        ),
        submitButtonChild: Text(
          'Ferdig',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.green),
        ),
        data: jeep,
        selectedItems: (List<dynamic> selectedLista) {
          List<String> list = [];
          for (var item in selectedLista) {
            if (item is SelectedListItem) {
              list.add(item.name);
            }
          }
          carmodell!.text = list.join(", ");
          gkBilerannonse.currentState?.validate();
          update();
        },
        enableMultipleSelection: false,
      ),
    ).showModal(context);
    update();
  }
//////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////

  List<SelectedListItem> jensen = [
    SelectedListItem(name: "Interceptor"),
    SelectedListItem(name: "Andre"),
  ];

  void showDropdownJensen(context) {
    DropDownState(
      DropDown(
        searchHintText: "Søk i ${carmerke!.text} modeller",
        bottomSheetTitle: Text(
          "Jensen modell",
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        dropDownBackgroundColor: Myisellcolors.hvit,
        clearButtonChild: Text(
          'Nullstill',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.red),
        ),
        submitButtonChild: Text(
          'Ferdig',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.green),
        ),
        data: jensen,
        selectedItems: (List<dynamic> selectedLista) {
          List<String> list = [];
          for (var item in selectedLista) {
            if (item is SelectedListItem) {
              list.add(item.name);
            }
          }
          carmodell!.text = list.join(", ");
          gkBilerannonse.currentState?.validate();
          update();
        },
        enableMultipleSelection: false,
      ),
    ).showModal(context);
    update();
  }
//////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////

  List<SelectedListItem> kewet = [
    SelectedListItem(name: "Buddy"),
    SelectedListItem(name: "City-Jet 5"),
    SelectedListItem(name: "El-Jet"),
    SelectedListItem(name: "Andre"),
  ];

  void showDropdownKewet(context) {
    DropDownState(
      DropDown(
        searchHintText: "Søk i ${carmerke!.text} modeller",
        bottomSheetTitle: Text(
          "Kewet modell",
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        dropDownBackgroundColor: Myisellcolors.hvit,
        clearButtonChild: Text(
          'Nullstill',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.red),
        ),
        submitButtonChild: Text(
          'Ferdig',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.green),
        ),
        data: kewet,
        selectedItems: (List<dynamic> selectedLista) {
          List<String> list = [];
          for (var item in selectedLista) {
            if (item is SelectedListItem) {
              list.add(item.name);
            }
          }
          carmodell!.text = list.join(", ");
          gkBilerannonse.currentState?.validate();
          update();
        },
        enableMultipleSelection: false,
      ),
    ).showModal(context);
    update();
  }
//////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////

  List<SelectedListItem> kia = [
    SelectedListItem(name: "Besta"),
    SelectedListItem(name: "Carens"),
    SelectedListItem(name: "Carnival"),
    SelectedListItem(name: "Cee'd"),
    SelectedListItem(name: "Cerato"),
    SelectedListItem(name: "Clarus"),
    SelectedListItem(name: "Credos"),
    SelectedListItem(name: "E-Niro"),
    SelectedListItem(name: "EV6"),
    SelectedListItem(name: "Magentis"),
    SelectedListItem(name: "Niro"),
    SelectedListItem(name: "Optima"),
    SelectedListItem(name: "Picanto"),
    SelectedListItem(name: "Pregio"),
    SelectedListItem(name: "Pride"),
    SelectedListItem(name: "ProCeed"),
    SelectedListItem(name: "Rio"),
    SelectedListItem(name: "Sephia"),
    SelectedListItem(name: "Shuma"),
    SelectedListItem(name: "Sorento"),
    SelectedListItem(name: "Soul"),
    SelectedListItem(name: "Sportage"),
    SelectedListItem(name: "Stinger"),
    SelectedListItem(name: "Stonic"),
    SelectedListItem(name: "Venga"),
    SelectedListItem(name: "XCeed"),
    SelectedListItem(name: "Andre"),
  ];

  void showDropdownKia(context) {
    DropDownState(
      DropDown(
        searchHintText: "Søk i ${carmerke!.text} modeller",
        bottomSheetTitle: Text(
          "Kia modell",
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        dropDownBackgroundColor: Myisellcolors.hvit,
        clearButtonChild: Text(
          'Nullstill',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.red),
        ),
        submitButtonChild: Text(
          'Ferdig',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.green),
        ),
        data: kia,
        selectedItems: (List<dynamic> selectedLista) {
          List<String> list = [];
          for (var item in selectedLista) {
            if (item is SelectedListItem) {
              list.add(item.name);
            }
          }
          carmodell!.text = list.join(", ");
          gkBilerannonse.currentState?.validate();
          update();
        },
        enableMultipleSelection: false,
      ),
    ).showModal(context);
    update();
  }
//////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////

  List<SelectedListItem> koenigsegg = [
    SelectedListItem(name: "CCR"),
    SelectedListItem(name: "Andre"),
  ];

  void showDropdownKoenigsegg(context) {
    DropDownState(
      DropDown(
        searchHintText: "Søk i ${carmerke!.text} modeller",
        bottomSheetTitle: Text(
          "Koenigsegg modell",
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        dropDownBackgroundColor: Myisellcolors.hvit,
        clearButtonChild: Text(
          'Nullstill',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.red),
        ),
        submitButtonChild: Text(
          'Ferdig',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.green),
        ),
        data: koenigsegg,
        selectedItems: (List<dynamic> selectedLista) {
          List<String> list = [];
          for (var item in selectedLista) {
            if (item is SelectedListItem) {
              list.add(item.name);
            }
          }
          carmodell!.text = list.join(", ");
          gkBilerannonse.currentState?.validate();
          update();
        },
        enableMultipleSelection: false,
      ),
    ).showModal(context);
    update();
  }
//////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////

  List<SelectedListItem> lada = [
    SelectedListItem(name: "1200"),
    SelectedListItem(name: "1300"),
    SelectedListItem(name: "1500"),
    SelectedListItem(name: "1600"),
    SelectedListItem(name: "Niva"),
    SelectedListItem(name: "Samara"),
    SelectedListItem(name: "Andre"),
  ];

  void showDropdownLada(context) {
    DropDownState(
      DropDown(
        searchHintText: "Søk i ${carmerke!.text} modeller",
        bottomSheetTitle: Text(
          "Lada modell",
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        dropDownBackgroundColor: Myisellcolors.hvit,
        clearButtonChild: Text(
          'Nullstill',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.red),
        ),
        submitButtonChild: Text(
          'Ferdig',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.green),
        ),
        data: lada,
        selectedItems: (List<dynamic> selectedLista) {
          List<String> list = [];
          for (var item in selectedLista) {
            if (item is SelectedListItem) {
              list.add(item.name);
            }
          }
          carmodell!.text = list.join(", ");
          gkBilerannonse.currentState?.validate();
          update();
        },
        enableMultipleSelection: false,
      ),
    ).showModal(context);
    update();
  }
//////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////

  List<SelectedListItem> lamborghini = [
    SelectedListItem(name: "Aventador"),
    SelectedListItem(name: "Countach"),
    SelectedListItem(name: "Diablo"),
    SelectedListItem(name: "Gallardo"),
    SelectedListItem(name: "Huracan"),
    SelectedListItem(name: "Huracan Spyder"),
    SelectedListItem(name: "LM"),
    SelectedListItem(name: "Murcielago"),
    SelectedListItem(name: "Urus"),
    SelectedListItem(name: "Andre"),
  ];

  void showDropdownLamborghini(context) {
    DropDownState(
      DropDown(
        searchHintText: "Søk i ${carmerke!.text} modeller",
        bottomSheetTitle: Text(
          "Lamborghini modell",
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        dropDownBackgroundColor: Myisellcolors.hvit,
        clearButtonChild: Text(
          'Nullstill',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.red),
        ),
        submitButtonChild: Text(
          'Ferdig',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.green),
        ),
        data: lamborghini,
        selectedItems: (List<dynamic> selectedLista) {
          List<String> list = [];
          for (var item in selectedLista) {
            if (item is SelectedListItem) {
              list.add(item.name);
            }
          }
          carmodell!.text = list.join(", ");
          gkBilerannonse.currentState?.validate();
          update();
        },
        enableMultipleSelection: false,
      ),
    ).showModal(context);
    update();
  }
//////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////

  List<SelectedListItem> lancia = [
    SelectedListItem(name: "A112"),
    SelectedListItem(name: "Delta"),
    SelectedListItem(name: "Kappa"),
    SelectedListItem(name: "Lybra"),
    SelectedListItem(name: "Musa"),
    SelectedListItem(name: "Phedra"),
    SelectedListItem(name: "Prisma"),
    SelectedListItem(name: "Thema"),
    SelectedListItem(name: "Thesis"),
    SelectedListItem(name: "Y10"),
    SelectedListItem(name: "Ypsilon"),
    SelectedListItem(name: "Andre"),
  ];

  void showDropdownLancia(context) {
    DropDownState(
      DropDown(
        searchHintText: "Søk i ${carmerke!.text} modeller",
        bottomSheetTitle: Text(
          "Lancia modell",
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        dropDownBackgroundColor: Myisellcolors.hvit,
        clearButtonChild: Text(
          'Nullstill',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.red),
        ),
        submitButtonChild: Text(
          'Ferdig',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.green),
        ),
        data: lancia,
        selectedItems: (List<dynamic> selectedLista) {
          List<String> list = [];
          for (var item in selectedLista) {
            if (item is SelectedListItem) {
              list.add(item.name);
            }
          }
          carmodell!.text = list.join(", ");
          gkBilerannonse.currentState?.validate();
          update();
        },
        enableMultipleSelection: false,
      ),
    ).showModal(context);
    update();
  }
//////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////

  List<SelectedListItem> lucid = [
    SelectedListItem(name: "Air"),
    SelectedListItem(name: "Andre"),
  ];

  void showDropdownLucid(context) {
    DropDownState(
      DropDown(
        searchHintText: "Søk i ${carmerke!.text} modeller",
        bottomSheetTitle: Text(
          "Lucid modell",
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        dropDownBackgroundColor: Myisellcolors.hvit,
        clearButtonChild: Text(
          'Nullstill',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.red),
        ),
        submitButtonChild: Text(
          'Ferdig',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.green),
        ),
        data: lucid,
        selectedItems: (List<dynamic> selectedLista) {
          List<String> list = [];
          for (var item in selectedLista) {
            if (item is SelectedListItem) {
              list.add(item.name);
            }
          }
          carmodell!.text = list.join(", ");
          gkBilerannonse.currentState?.validate();
          update();
        },
        enableMultipleSelection: false,
      ),
    ).showModal(context);
    update();
  }
//////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////

  List<SelectedListItem> landrover = [
    SelectedListItem(name: "Defender"),
    SelectedListItem(name: "Discovery"),
    SelectedListItem(name: "Discovery Sport"),
    SelectedListItem(name: "Freelander"),
    SelectedListItem(name: "Range Rover"),
    SelectedListItem(name: "Range Rover Evoaue"),
    SelectedListItem(name: "Range Rover Sport"),
    SelectedListItem(name: "Range Rover Velar"),
    SelectedListItem(name: "Andre"),
  ];

  void showDropdownLandrover(context) {
    DropDownState(
      DropDown(
        searchHintText: "Søk i ${carmerke!.text} modeller",
        bottomSheetTitle: Text(
          "Land Rover modell",
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        dropDownBackgroundColor: Myisellcolors.hvit,
        clearButtonChild: Text(
          'Nullstill',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.red),
        ),
        submitButtonChild: Text(
          'Ferdig',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.green),
        ),
        data: landrover,
        selectedItems: (List<dynamic> selectedLista) {
          List<String> list = [];
          for (var item in selectedLista) {
            if (item is SelectedListItem) {
              list.add(item.name);
            }
          }
          carmodell!.text = list.join(", ");
          gkBilerannonse.currentState?.validate();
          update();
        },
        enableMultipleSelection: false,
      ),
    ).showModal(context);
    update();
  }
//////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////

  List<SelectedListItem> lexus = [
    SelectedListItem(name: "CT200h"),
    SelectedListItem(name: "ES"),
    SelectedListItem(name: "GS"),
    SelectedListItem(name: "IS"),
    SelectedListItem(name: "LC"),
    SelectedListItem(name: "LS"),
    SelectedListItem(name: "NX 300h"),
    SelectedListItem(name: "NX 450h"),
    SelectedListItem(name: "RC"),
    SelectedListItem(name: "RC300h"),
    SelectedListItem(name: "RZ"),
    SelectedListItem(name: "RX300"),
    SelectedListItem(name: "RX400h"),
    SelectedListItem(name: "RX450h"),
    SelectedListItem(name: "SC"),
    SelectedListItem(name: "UX"),
    SelectedListItem(name: "RX500h"),
    SelectedListItem(name: "Andre"),
  ];

  void showDropdownLexus(context) {
    DropDownState(
      DropDown(
        searchHintText: "Søk i ${carmerke!.text} modeller",
        bottomSheetTitle: Text(
          "Lexus modell",
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        dropDownBackgroundColor: Myisellcolors.hvit,
        clearButtonChild: Text(
          'Nullstill',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.red),
        ),
        submitButtonChild: Text(
          'Ferdig',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.green),
        ),
        data: lexus,
        selectedItems: (List<dynamic> selectedLista) {
          List<String> list = [];
          for (var item in selectedLista) {
            if (item is SelectedListItem) {
              list.add(item.name);
            }
          }
          carmodell!.text = list.join(", ");
          gkBilerannonse.currentState?.validate();
          update();
        },
        enableMultipleSelection: false,
      ),
    ).showModal(context);
    update();
  }
//////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////

  List<SelectedListItem> lincoln = [
    SelectedListItem(name: "Navigator"),
    SelectedListItem(name: "Town Car"),
    SelectedListItem(name: "Andre"),
  ];

  void showDropdownLincoln(context) {
    DropDownState(
      DropDown(
        searchHintText: "Søk i ${carmerke!.text} modeller",
        bottomSheetTitle: Text(
          "Lincoln modell",
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        dropDownBackgroundColor: Myisellcolors.hvit,
        clearButtonChild: Text(
          'Nullstill',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.red),
        ),
        submitButtonChild: Text(
          'Ferdig',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.green),
        ),
        data: lincoln,
        selectedItems: (List<dynamic> selectedLista) {
          List<String> list = [];
          for (var item in selectedLista) {
            if (item is SelectedListItem) {
              list.add(item.name);
            }
          }
          carmodell!.text = list.join(", ");
          gkBilerannonse.currentState?.validate();
          update();
        },
        enableMultipleSelection: false,
      ),
    ).showModal(context);
    update();
  }
//////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////

  List<SelectedListItem> lotus = [
    SelectedListItem(name: "Elise"),
    SelectedListItem(name: "Europa S"),
    SelectedListItem(name: "Eletre"),
    SelectedListItem(name: "Evora"),
    SelectedListItem(name: "Exige"),
    SelectedListItem(name: "Seven"),
    SelectedListItem(name: "Andre"),
  ];

  void showDropdownLotus(context) {
    DropDownState(
      DropDown(
        searchHintText: "Søk i ${carmerke!.text} modeller",
        bottomSheetTitle: Text(
          "Lotus modell",
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        dropDownBackgroundColor: Myisellcolors.hvit,
        clearButtonChild: Text(
          'Nullstill',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.red),
        ),
        submitButtonChild: Text(
          'Ferdig',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.green),
        ),
        data: lotus,
        selectedItems: (List<dynamic> selectedLista) {
          List<String> list = [];
          for (var item in selectedLista) {
            if (item is SelectedListItem) {
              list.add(item.name);
            }
          }
          carmodell!.text = list.join(", ");
          gkBilerannonse.currentState?.validate();
          update();
        },
        enableMultipleSelection: false,
      ),
    ).showModal(context);
    update();
  }
//////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////

  List<SelectedListItem> man = [
    SelectedListItem(name: "TGE"),
    SelectedListItem(name: "eTGE"),
    SelectedListItem(name: "Andre"),
  ];

  void showDropdownMAN(context) {
    DropDownState(
      DropDown(
        searchHintText: "Søk i ${carmerke!.text} modeller",
        bottomSheetTitle: Text(
          "MAN modell",
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        dropDownBackgroundColor: Myisellcolors.hvit,
        clearButtonChild: Text(
          'Nullstill',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.red),
        ),
        submitButtonChild: Text(
          'Ferdig',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.green),
        ),
        data: man,
        selectedItems: (List<dynamic> selectedLista) {
          List<String> list = [];
          for (var item in selectedLista) {
            if (item is SelectedListItem) {
              list.add(item.name);
            }
          }
          carmodell!.text = list.join(", ");
          gkBilerannonse.currentState?.validate();
          update();
        },
        enableMultipleSelection: false,
      ),
    ).showModal(context);
    update();
  }
//////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////

  List<SelectedListItem> miaelectric = [
    SelectedListItem(name: "mia"),
    SelectedListItem(name: "mia L"),
    SelectedListItem(name: "mia U"),
  ];

  void showDropdownMiaelectric(context) {
    DropDownState(
      DropDown(
        searchHintText: "Søk i ${carmerke!.text} modeller",
        bottomSheetTitle: Text(
          "Mia Electric modell",
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        dropDownBackgroundColor: Myisellcolors.hvit,
        clearButtonChild: Text(
          'Nullstill',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.red),
        ),
        submitButtonChild: Text(
          'Ferdig',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.green),
        ),
        data: miaelectric,
        selectedItems: (List<dynamic> selectedLista) {
          List<String> list = [];
          for (var item in selectedLista) {
            if (item is SelectedListItem) {
              list.add(item.name);
            }
          }
          carmodell!.text = list.join(", ");
          gkBilerannonse.currentState?.validate();
          update();
        },
        enableMultipleSelection: false,
      ),
    ).showModal(context);
    update();
  }
//////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////

  List<SelectedListItem> mg = [
    SelectedListItem(name: "MG4"),
    SelectedListItem(name: "MG5"),
    SelectedListItem(name: "MG-F"),
    SelectedListItem(name: "EHS"),
    SelectedListItem(name: "MGB"),
    SelectedListItem(name: "Marvel R"),
    SelectedListItem(name: "TF"),
    SelectedListItem(name: "ZS"),
    SelectedListItem(name: "ZS EV"),
    SelectedListItem(name: "mia"),
    SelectedListItem(name: "ZT"),
    SelectedListItem(name: "Andre"),
  ];

  void showDropdownMG(context) {
    DropDownState(
      DropDown(
        searchHintText: "Søk i ${carmerke!.text} modeller",
        bottomSheetTitle: Text(
          "MG modell",
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        dropDownBackgroundColor: Myisellcolors.hvit,
        clearButtonChild: Text(
          'Nullstill',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.red),
        ),
        submitButtonChild: Text(
          'Ferdig',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.green),
        ),
        data: mg,
        selectedItems: (List<dynamic> selectedLista) {
          List<String> list = [];
          for (var item in selectedLista) {
            if (item is SelectedListItem) {
              list.add(item.name);
            }
          }
          carmodell!.text = list.join(", ");
          gkBilerannonse.currentState?.validate();
          update();
        },
        enableMultipleSelection: false,
      ),
    ).showModal(context);
    update();
  }
//////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////

  List<SelectedListItem> mini = [
    SelectedListItem(name: "Cabrio"),
    SelectedListItem(name: "Clubman"),
    SelectedListItem(name: "Cooper"),
    SelectedListItem(name: "Cooper S"),
    SelectedListItem(name: "Cooper SE"),
    SelectedListItem(name: "Countryman"),
    SelectedListItem(name: "Coupe"),
    SelectedListItem(name: "One"),
    SelectedListItem(name: "Paceman"),
    SelectedListItem(name: "Roadster"),
    SelectedListItem(name: "Andre"),
  ];

  void showDropdownMINI(context) {
    DropDownState(
      DropDown(
        searchHintText: "Søk i ${carmerke!.text} modeller",
        bottomSheetTitle: Text(
          "MINI modell",
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        dropDownBackgroundColor: Myisellcolors.hvit,
        clearButtonChild: Text(
          'Nullstill',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.red),
        ),
        submitButtonChild: Text(
          'Ferdig',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.green),
        ),
        data: mini,
        selectedItems: (List<dynamic> selectedLista) {
          List<String> list = [];
          for (var item in selectedLista) {
            if (item is SelectedListItem) {
              list.add(item.name);
            }
          }
          carmodell!.text = list.join(", ");
          gkBilerannonse.currentState?.validate();
          update();
        },
        enableMultipleSelection: false,
      ),
    ).showModal(context);
    update();
  }
//////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////

  List<SelectedListItem> maserati = [
    SelectedListItem(name: "222"),
    SelectedListItem(name: "3200"),
    SelectedListItem(name: "3500"),
    SelectedListItem(name: "Biturbo"),
    SelectedListItem(name: "Coupe"),
    SelectedListItem(name: "Ghibli"),
    SelectedListItem(name: "Gran Turismo"),
    SelectedListItem(name: "Indy"),
    SelectedListItem(name: "Levante"),
    SelectedListItem(name: "MC20"),
    SelectedListItem(name: "Mistral"),
    SelectedListItem(name: "Quattroporte"),
    SelectedListItem(name: "Quattroporte Evoluzzione"),
    SelectedListItem(name: "Spyder"),
    SelectedListItem(name: "GranCabrio"),
    SelectedListItem(name: "Grecale"),
    SelectedListItem(name: "Andre"),
  ];

  void showDropdownMaserati(context) {
    DropDownState(
      DropDown(
        searchHintText: "Søk i ${carmerke!.text} modeller",
        bottomSheetTitle: Text(
          "Maserati modell",
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        dropDownBackgroundColor: Myisellcolors.hvit,
        clearButtonChild: Text(
          'Nullstill',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.red),
        ),
        submitButtonChild: Text(
          'Ferdig',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.green),
        ),
        data: maserati,
        selectedItems: (List<dynamic> selectedLista) {
          List<String> list = [];
          for (var item in selectedLista) {
            if (item is SelectedListItem) {
              list.add(item.name);
            }
          }
          carmodell!.text = list.join(", ");
          gkBilerannonse.currentState?.validate();
          update();
        },
        enableMultipleSelection: false,
      ),
    ).showModal(context);
    update();
  }
//////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////

  List<SelectedListItem> matra = [
    SelectedListItem(name: "Bagheera"),
    SelectedListItem(name: "Murena"),
    SelectedListItem(name: "Andre"),
  ];

  void showDropdownMatra(context) {
    DropDownState(
      DropDown(
        searchHintText: "Søk i ${carmerke!.text} modeller",
        bottomSheetTitle: Text(
          "Matra modell",
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        dropDownBackgroundColor: Myisellcolors.hvit,
        clearButtonChild: Text(
          'Nullstill',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.red),
        ),
        submitButtonChild: Text(
          'Ferdig',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.green),
        ),
        data: matra,
        selectedItems: (List<dynamic> selectedLista) {
          List<String> list = [];
          for (var item in selectedLista) {
            if (item is SelectedListItem) {
              list.add(item.name);
            }
          }
          carmodell!.text = list.join(", ");
          gkBilerannonse.currentState?.validate();
          update();
        },
        enableMultipleSelection: false,
      ),
    ).showModal(context);
    update();
  }
//////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////

  List<SelectedListItem> maxus = [
    SelectedListItem(name: "ev80"),
    SelectedListItem(name: "e-Deliver 3"),
    SelectedListItem(name: "e-Deliver 9"),
    SelectedListItem(name: "Euniq MPV"),
    SelectedListItem(name: "Euniq 5"),
    SelectedListItem(name: "Euniq 6"),
    SelectedListItem(name: "T90 EV"),
    SelectedListItem(name: "MIFA 9"),
    SelectedListItem(name: "Andre"),
  ];

  void showDropdownMaxus(context) {
    DropDownState(
      DropDown(
        searchHintText: "Søk i ${carmerke!.text} modeller",
        bottomSheetTitle: Text(
          "Maxus modell",
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        dropDownBackgroundColor: Myisellcolors.hvit,
        clearButtonChild: Text(
          'Nullstill',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.red),
        ),
        submitButtonChild: Text(
          'Ferdig',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.green),
        ),
        data: maxus,
        selectedItems: (List<dynamic> selectedLista) {
          List<String> list = [];
          for (var item in selectedLista) {
            if (item is SelectedListItem) {
              list.add(item.name);
            }
          }
          carmodell!.text = list.join(", ");
          gkBilerannonse.currentState?.validate();
          update();
        },
        enableMultipleSelection: false,
      ),
    ).showModal(context);
    update();
  }
//////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////

  List<SelectedListItem> maybach = [
    SelectedListItem(name: "57"),
  ];

  void showDropdownMaybach(context) {
    DropDownState(
      DropDown(
        searchHintText: "Søk i ${carmerke!.text} modeller",
        bottomSheetTitle: Text(
          "Maybach modell",
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        dropDownBackgroundColor: Myisellcolors.hvit,
        clearButtonChild: Text(
          'Nullstill',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.red),
        ),
        submitButtonChild: Text(
          'Ferdig',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.green),
        ),
        data: maybach,
        selectedItems: (List<dynamic> selectedLista) {
          List<String> list = [];
          for (var item in selectedLista) {
            if (item is SelectedListItem) {
              list.add(item.name);
            }
          }
          carmodell!.text = list.join(", ");
          gkBilerannonse.currentState?.validate();
          update();
        },
        enableMultipleSelection: false,
      ),
    ).showModal(context);
    update();
  }
//////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////

  List<SelectedListItem> mazda = [
    SelectedListItem(name: "121"),
    SelectedListItem(name: "2"),
    SelectedListItem(name: "3"),
    SelectedListItem(name: "323"),
    SelectedListItem(name: "5"),
    SelectedListItem(name: "6"),
    SelectedListItem(name: "626"),
    SelectedListItem(name: "929"),
    SelectedListItem(name: "B 2500 Freestyle Cab"),
    SelectedListItem(name: "B2000"),
    SelectedListItem(name: "B2200"),
    SelectedListItem(name: "B2600"),
    SelectedListItem(name: "BT-50"),
    SelectedListItem(name: "CX-3"),
    SelectedListItem(name: "CX-5"),
    SelectedListItem(name: "CX-7"),
    SelectedListItem(name: "CX-30"),
    SelectedListItem(name: "CX-60"),
    SelectedListItem(name: "Demio"),
    SelectedListItem(name: "E2000"),
    SelectedListItem(name: "MPV"),
    SelectedListItem(name: "MX-3"),
    SelectedListItem(name: "MX-30"),
    SelectedListItem(name: "MX-5"),
    SelectedListItem(name: "Premacy"),
    SelectedListItem(name: "RX-2"),
    SelectedListItem(name: "RX-7"),
    SelectedListItem(name: "RX-8"),
    SelectedListItem(name: "Tribute"),
    SelectedListItem(name: "Xedos"),
    SelectedListItem(name: "Andre"),
  ];

  void showDropdownMazda(context) {
    DropDownState(
      DropDown(
        searchHintText: "Søk i ${carmerke!.text} modeller",
        bottomSheetTitle: Text(
          "Mazda modell",
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        dropDownBackgroundColor: Myisellcolors.hvit,
        clearButtonChild: Text(
          'Nullstill',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.red),
        ),
        submitButtonChild: Text(
          'Ferdig',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.green),
        ),
        data: mazda,
        selectedItems: (List<dynamic> selectedLista) {
          List<String> list = [];
          for (var item in selectedLista) {
            if (item is SelectedListItem) {
              list.add(item.name);
            }
          }
          carmodell!.text = list.join(", ");
          gkBilerannonse.currentState?.validate();
          update();
        },
        enableMultipleSelection: false,
      ),
    ).showModal(context);
    update();
  }
//////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////

  List<SelectedListItem> mclaren = [
    SelectedListItem(name: "12C"),
    SelectedListItem(name: "570GT"),
    SelectedListItem(name: "570S"),
    SelectedListItem(name: "675LT"),
    SelectedListItem(name: "720S"),
    SelectedListItem(name: "765LT"),
    SelectedListItem(name: "Artura"),
    SelectedListItem(name: "Andre"),
  ];

  void showDropdownMcLaren(context) {
    DropDownState(
      DropDown(
        searchHintText: "Søk i ${carmerke!.text} modeller",
        bottomSheetTitle: Text(
          "McLaren modell",
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        dropDownBackgroundColor: Myisellcolors.hvit,
        clearButtonChild: Text(
          'Nullstill',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.red),
        ),
        submitButtonChild: Text(
          'Ferdig',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.green),
        ),
        data: mclaren,
        selectedItems: (List<dynamic> selectedLista) {
          List<String> list = [];
          for (var item in selectedLista) {
            if (item is SelectedListItem) {
              list.add(item.name);
            }
          }
          carmodell!.text = list.join(", ");
          gkBilerannonse.currentState?.validate();
          update();
        },
        enableMultipleSelection: false,
      ),
    ).showModal(context);
    update();
  }
//////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////

  List<SelectedListItem> mercedesbenz = [
    SelectedListItem(name: "190"),
    SelectedListItem(name: "A-klasse"),
    SelectedListItem(name: "AMG GT"),
    SelectedListItem(name: "AMG GT C"),
    SelectedListItem(name: "AMG GT R"),
    SelectedListItem(name: "AMG GT S"),
    SelectedListItem(name: "B-Klasse"),
    SelectedListItem(name: "C-Klasse"),
    SelectedListItem(name: "C-Klasse All-Terrain"),
    SelectedListItem(name: "CL"),
    SelectedListItem(name: "CLA"),
    SelectedListItem(name: "CLC"),
    SelectedListItem(name: "CLK"),
    SelectedListItem(name: "CLS"),
    SelectedListItem(name: "Citan"),
    SelectedListItem(name: "eCitan"),
    SelectedListItem(name: "E-Klasse"),
    SelectedListItem(name: "E-Klasse All-Terrain"),
    SelectedListItem(name: "EQC"),
    SelectedListItem(name: "EQS"),
    SelectedListItem(name: "EQB"),
    SelectedListItem(name: "EQE"),
    SelectedListItem(name: "EQE SUV"),
    SelectedListItem(name: "EQV"),
    SelectedListItem(name: "EQA"),
    SelectedListItem(name: "EQS SUV"),
    SelectedListItem(name: "GL"),
    SelectedListItem(name: "GLA"),
    SelectedListItem(name: "GLB"),
    SelectedListItem(name: "GLC"),
    SelectedListItem(name: "GLE"),
    SelectedListItem(name: "GLK"),
    SelectedListItem(name: "GLS"),
    SelectedListItem(name: "Geländewagen"),
    SelectedListItem(name: "M-Klasse"),
    SelectedListItem(name: "R-Klasse"),
    SelectedListItem(name: "S-Klasse"),
    SelectedListItem(name: "SL"),
    SelectedListItem(name: "SLC"),
    SelectedListItem(name: "SLK"),
    SelectedListItem(name: "SLR"),
    SelectedListItem(name: "SLS"),
    SelectedListItem(name: "Sprinter"),
    SelectedListItem(name: "V-Klasse"),
    SelectedListItem(name: "Vaneo"),
    SelectedListItem(name: "Viano"),
    SelectedListItem(name: "Vito"),
    SelectedListItem(name: "X-Klasse"),
    SelectedListItem(name: "Andre"),
  ];

  void showDropdownMercedesBenz(context) {
    DropDownState(
      DropDown(
        searchHintText: "Søk i ${carmerke!.text} modeller",
        bottomSheetTitle: Text(
          "Mercedes-Benz modell",
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        dropDownBackgroundColor: Myisellcolors.hvit,
        clearButtonChild: Text(
          'Nullstill',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.red),
        ),
        submitButtonChild: Text(
          'Ferdig',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.green),
        ),
        data: mercedesbenz,
        selectedItems: (List<dynamic> selectedLista) {
          List<String> list = [];
          for (var item in selectedLista) {
            if (item is SelectedListItem) {
              list.add(item.name);
            }
          }
          carmodell!.text = list.join(", ");
          gkBilerannonse.currentState?.validate();
          update();
        },
        enableMultipleSelection: false,
      ),
    ).showModal(context);
    update();
  }
//////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////

  List<SelectedListItem> mercury = [
    SelectedListItem(name: "Andre"),
  ];

  void showDropdownMercury(context) {
    DropDownState(
      DropDown(
        searchHintText: "Søk i ${carmerke!.text} modeller",
        bottomSheetTitle: Text(
          "Mercury modell",
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        dropDownBackgroundColor: Myisellcolors.hvit,
        clearButtonChild: Text(
          'Nullstill',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.red),
        ),
        submitButtonChild: Text(
          'Ferdig',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.green),
        ),
        data: mercury,
        selectedItems: (List<dynamic> selectedLista) {
          List<String> list = [];
          for (var item in selectedLista) {
            if (item is SelectedListItem) {
              list.add(item.name);
            }
          }
          carmodell!.text = list.join(", ");
          gkBilerannonse.currentState?.validate();
          update();
        },
        enableMultipleSelection: false,
      ),
    ).showModal(context);
    update();
  }
//////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////

  List<SelectedListItem> mitsubishi = [
    SelectedListItem(name: "3000 gt"),
    SelectedListItem(name: "ASX"),
    SelectedListItem(name: "Carisma"),
    SelectedListItem(name: "Colt"),
    SelectedListItem(name: "Eclipse"),
    SelectedListItem(name: "Eclipse Cross"),
    SelectedListItem(name: "Galant"),
    SelectedListItem(name: "Grandis"),
    SelectedListItem(name: "L200"),
    SelectedListItem(name: "L300"),
    SelectedListItem(name: "L400"),
    SelectedListItem(name: "Lancer"),
    SelectedListItem(name: "Outlander"),
    SelectedListItem(name: "Pajero"),
    SelectedListItem(name: "Pajero Pinin"),
    SelectedListItem(name: "Pajero Sport"),
    SelectedListItem(name: "Sapporo"),
    SelectedListItem(name: "Sigma"),
    SelectedListItem(name: "Space Gear"),
    SelectedListItem(name: "Space Runner"),
    SelectedListItem(name: "Space Star"),
    SelectedListItem(name: "Space Star l"),
    SelectedListItem(name: "Space Wagon"),
    SelectedListItem(name: "i-Miev"),
    SelectedListItem(name: "Andre"),
  ];

  void showDropdownMitsubishi(context) {
    DropDownState(
      DropDown(
        searchHintText: "Søk i ${carmerke!.text} modeller",
        bottomSheetTitle: Text(
          "Mitsubishi modell",
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        dropDownBackgroundColor: Myisellcolors.hvit,
        clearButtonChild: Text(
          'Nullstill',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.red),
        ),
        submitButtonChild: Text(
          'Ferdig',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.green),
        ),
        data: mitsubishi,
        selectedItems: (List<dynamic> selectedLista) {
          List<String> list = [];
          for (var item in selectedLista) {
            if (item is SelectedListItem) {
              list.add(item.name);
            }
          }
          carmodell!.text = list.join(", ");
          gkBilerannonse.currentState?.validate();
          update();
        },
        enableMultipleSelection: false,
      ),
    ).showModal(context);
    update();
  }
//////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////

  List<SelectedListItem> morgan = [
    SelectedListItem(name: "3-wheeler"),
    SelectedListItem(name: "4/4"),
    SelectedListItem(name: "Aero 8"),
    SelectedListItem(name: "Plus 4"),
    SelectedListItem(name: "Plus 8"),
    SelectedListItem(name: "Roadster"),
    SelectedListItem(name: "Andre"),
  ];

  void showDropdownMorgan(context) {
    DropDownState(
      DropDown(
        searchHintText: "Søk i ${carmerke!.text} modeller",
        bottomSheetTitle: Text(
          "Morgan modell",
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        dropDownBackgroundColor: Myisellcolors.hvit,
        clearButtonChild: Text(
          'Nullstill',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.red),
        ),
        submitButtonChild: Text(
          'Ferdig',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.green),
        ),
        data: morgan,
        selectedItems: (List<dynamic> selectedLista) {
          List<String> list = [];
          for (var item in selectedLista) {
            if (item is SelectedListItem) {
              list.add(item.name);
            }
          }
          carmodell!.text = list.join(", ");
          gkBilerannonse.currentState?.validate();
          update();
        },
        enableMultipleSelection: false,
      ),
    ).showModal(context);
    update();
  }
//////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////

  List<SelectedListItem> morris = [
    SelectedListItem(name: "Mini"),
    SelectedListItem(name: "Andre"),
  ];

  void showDropdownMorris(context) {
    DropDownState(
      DropDown(
        searchHintText: "Søk i ${carmerke!.text} modeller",
        bottomSheetTitle: Text(
          "Morris modell",
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        dropDownBackgroundColor: Myisellcolors.hvit,
        clearButtonChild: Text(
          'Nullstill',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.red),
        ),
        submitButtonChild: Text(
          'Ferdig',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.green),
        ),
        data: morris,
        selectedItems: (List<dynamic> selectedLista) {
          List<String> list = [];
          for (var item in selectedLista) {
            if (item is SelectedListItem) {
              list.add(item.name);
            }
          }
          carmodell!.text = list.join(", ");
          gkBilerannonse.currentState?.validate();
          update();
        },
        enableMultipleSelection: false,
      ),
    ).showModal(context);
    update();
  }
//////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////

  List<SelectedListItem> nio = [
    SelectedListItem(name: "ES8"),
    SelectedListItem(name: "EL7"),
    SelectedListItem(name: "ET7"),
    SelectedListItem(name: "ET5"),
  ];

  void showDropdownNIO(context) {
    DropDownState(
      DropDown(
        searchHintText: "Søk i ${carmerke!.text} modeller",
        bottomSheetTitle: Text(
          "NIO modell",
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        dropDownBackgroundColor: Myisellcolors.hvit,
        clearButtonChild: Text(
          'Nullstill',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.red),
        ),
        submitButtonChild: Text(
          'Ferdig',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.green),
        ),
        data: nio,
        selectedItems: (List<dynamic> selectedLista) {
          List<String> list = [];
          for (var item in selectedLista) {
            if (item is SelectedListItem) {
              list.add(item.name);
            }
          }
          carmodell!.text = list.join(", ");
          gkBilerannonse.currentState?.validate();
          update();
        },
        enableMultipleSelection: false,
      ),
    ).showModal(context);
    update();
  }
//////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////

  List<SelectedListItem> nissan = [
    SelectedListItem(name: "100 NX"),
    SelectedListItem(name: "200 SX"),
    SelectedListItem(name: "300 ZX"),
    SelectedListItem(name: "370z"),
    SelectedListItem(name: "Almera"),
    SelectedListItem(name: "Ariya"),
    SelectedListItem(name: "Bluebird"),
    SelectedListItem(name: "Cherry"),
    SelectedListItem(name: "Cube"),
    SelectedListItem(name: "GT-R"),
    SelectedListItem(name: "Interstar"),
    SelectedListItem(name: "Juke"),
    SelectedListItem(name: "King Cab"),
    SelectedListItem(name: "King Van"),
    SelectedListItem(name: "Kubistar"),
    SelectedListItem(name: "Laurel"),
    SelectedListItem(name: "Leaf"),
    SelectedListItem(name: "Maxima"),
    SelectedListItem(name: "Micra"),
    SelectedListItem(name: "Murano"),
    SelectedListItem(name: "NP300"),
    SelectedListItem(name: "NV200"),
    SelectedListItem(name: "NV250"),
    SelectedListItem(name: "NV300"),
    SelectedListItem(name: "NV400"),
    SelectedListItem(name: "Navara"),
    SelectedListItem(name: "Note"),
    SelectedListItem(name: "Pathfinder"),
    SelectedListItem(name: "Patrol"),
    SelectedListItem(name: "Pixo"),
    SelectedListItem(name: "Prairie"),
    SelectedListItem(name: "Primastar"),
    SelectedListItem(name: "Primera"),
    SelectedListItem(name: "Pulsar"),
    SelectedListItem(name: "Qashqai"),
    SelectedListItem(name: "Qashqai +2"),
    SelectedListItem(name: "Serena"),
    SelectedListItem(name: "Skyline"),
    SelectedListItem(name: "Stanza"),
    SelectedListItem(name: "Sunny"),
    SelectedListItem(name: "Terrano"),
    SelectedListItem(name: "Tino"),
    SelectedListItem(name: "Townstar"),
    SelectedListItem(name: "X-Trail"),
    SelectedListItem(name: "e-NV200"),
    SelectedListItem(name: "Andre"),
  ];

  void showDropdownNissan(context) {
    DropDownState(
      DropDown(
        searchHintText: "Søk i ${carmerke!.text} modeller",
        bottomSheetTitle: Text(
          "Nissan modell",
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        dropDownBackgroundColor: Myisellcolors.hvit,
        clearButtonChild: Text(
          'Nullstill',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.red),
        ),
        submitButtonChild: Text(
          'Ferdig',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.green),
        ),
        data: nissan,
        selectedItems: (List<dynamic> selectedLista) {
          List<String> list = [];
          for (var item in selectedLista) {
            if (item is SelectedListItem) {
              list.add(item.name);
            }
          }
          carmodell!.text = list.join(", ");
          gkBilerannonse.currentState?.validate();
          update();
        },
        enableMultipleSelection: false,
      ),
    ).showModal(context);
    update();
  }
//////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////

  List<SelectedListItem> nosmoke = [
    SelectedListItem(name: "Original"),
    SelectedListItem(name: "Truckï"),
    SelectedListItem(name: "Andre"),
  ];

  void showDropdownNOSMOKE(context) {
    DropDownState(
      DropDown(
        searchHintText: "Søk i ${carmerke!.text} modeller",
        bottomSheetTitle: Text(
          "NOSMOKE modell",
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        dropDownBackgroundColor: Myisellcolors.hvit,
        clearButtonChild: Text(
          'Nullstill',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.red),
        ),
        submitButtonChild: Text(
          'Ferdig',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.green),
        ),
        data: nosmoke,
        selectedItems: (List<dynamic> selectedLista) {
          List<String> list = [];
          for (var item in selectedLista) {
            if (item is SelectedListItem) {
              list.add(item.name);
            }
          }
          carmodell!.text = list.join(", ");
          gkBilerannonse.currentState?.validate();
          update();
        },
        enableMultipleSelection: false,
      ),
    ).showModal(context);
    update();
  }
//////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////

  List<SelectedListItem> oldsmobile = [
    SelectedListItem(name: "Custom"),
    SelectedListItem(name: "Cutlass"),
    SelectedListItem(name: "Delta"),
    SelectedListItem(name: "Omega"),
    SelectedListItem(name: "Andre")
  ];

  void showDropdownOldsmobile(context) {
    DropDownState(
      DropDown(
        searchHintText: "Søk i ${carmerke!.text} modeller",
        bottomSheetTitle: Text(
          "Oldsmobile modell",
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        dropDownBackgroundColor: Myisellcolors.hvit,
        clearButtonChild: Text(
          'Nullstill',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.red),
        ),
        submitButtonChild: Text(
          'Ferdig',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.green),
        ),
        data: oldsmobile,
        selectedItems: (List<dynamic> selectedLista) {
          List<String> list = [];
          for (var item in selectedLista) {
            if (item is SelectedListItem) {
              list.add(item.name);
            }
          }
          carmodell!.text = list.join(", ");
          gkBilerannonse.currentState?.validate();
          update();
        },
        enableMultipleSelection: false,
      ),
    ).showModal(context);
    update();
  }
//////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////

  List<SelectedListItem> opel = [
    SelectedListItem(name: "ADAM"),
    SelectedListItem(name: "Agila"),
    SelectedListItem(name: "Ampera"),
    SelectedListItem(name: "Antara"),
    SelectedListItem(name: "Ascona"),
    SelectedListItem(name: "Astra"),
    SelectedListItem(name: "Calibra"),
    SelectedListItem(name: "Campo"),
    SelectedListItem(name: "Combo"),
    SelectedListItem(name: "Commodore"),
    SelectedListItem(name: "Corsa"),
    SelectedListItem(name: "Crossland X"),
    SelectedListItem(name: "Frontera"),
    SelectedListItem(name: "GT"),
    SelectedListItem(name: "Grandland"),
    SelectedListItem(name: "Grandland X"),
    SelectedListItem(name: "Insignia"),
    SelectedListItem(name: "Insignia Country Tourer"),
    SelectedListItem(name: "Kadett"),
    SelectedListItem(name: "Kapitan"),
    SelectedListItem(name: "Manta"),
    SelectedListItem(name: "Meriva"),
    SelectedListItem(name: "Mokka"),
    SelectedListItem(name: "Monterey"),
    SelectedListItem(name: "Monza"),
    SelectedListItem(name: "Movano"),
    SelectedListItem(name: "Omega"),
    SelectedListItem(name: "Rekord"),
    SelectedListItem(name: "Senator"),
    SelectedListItem(name: "Signum"),
    SelectedListItem(name: "Sintra"),
    SelectedListItem(name: "Speedster"),
    SelectedListItem(name: "Tigra"),
    SelectedListItem(name: "Vectra"),
    SelectedListItem(name: "Vivaro"),
    SelectedListItem(name: "Zafira"),
    SelectedListItem(name: "Zafira Tourer"),
    SelectedListItem(name: "Andre"),
  ];

  void showDropdownOpel(context) {
    DropDownState(
      DropDown(
        searchHintText: "Søk i ${carmerke!.text} modeller",
        bottomSheetTitle: Text(
          "Opel modell",
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        dropDownBackgroundColor: Myisellcolors.hvit,
        clearButtonChild: Text(
          'Nullstill',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.red),
        ),
        submitButtonChild: Text(
          'Ferdig',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.green),
        ),
        data: opel,
        selectedItems: (List<dynamic> selectedLista) {
          List<String> list = [];
          for (var item in selectedLista) {
            if (item is SelectedListItem) {
              list.add(item.name);
            }
          }
          carmodell!.text = list.join(", ");
          gkBilerannonse.currentState?.validate();
          update();
        },
        enableMultipleSelection: false,
      ),
    ).showModal(context);
    update();
  }
//////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////

  List<SelectedListItem> packard = [
    SelectedListItem(name: "Clipper"),
    SelectedListItem(name: "Andre"),
  ];

  void showDropdownPackard(context) {
    DropDownState(
      DropDown(
        searchHintText: "Søk i ${carmerke!.text} modeller",
        bottomSheetTitle: Text(
          "Packard modell",
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        dropDownBackgroundColor: Myisellcolors.hvit,
        clearButtonChild: Text(
          'Nullstill',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.red),
        ),
        submitButtonChild: Text(
          'Ferdig',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.green),
        ),
        data: packard,
        selectedItems: (List<dynamic> selectedLista) {
          List<String> list = [];
          for (var item in selectedLista) {
            if (item is SelectedListItem) {
              list.add(item.name);
            }
          }
          carmodell!.text = list.join(", ");
          gkBilerannonse.currentState?.validate();
          update();
        },
        enableMultipleSelection: false,
      ),
    ).showModal(context);
    update();
  }
//////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////

  List<SelectedListItem> panther = [
    SelectedListItem(name: "J72"),
    SelectedListItem(name: "Kallista"),
    SelectedListItem(name: "Lima"),
    SelectedListItem(name: "Andre"),
  ];

  void showDropdownPanther(context) {
    DropDownState(
      DropDown(
        searchHintText: "Søk i ${carmerke!.text} modeller",
        bottomSheetTitle: Text(
          "Panther modell",
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        dropDownBackgroundColor: Myisellcolors.hvit,
        clearButtonChild: Text(
          'Nullstill',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.red),
        ),
        submitButtonChild: Text(
          'Ferdig',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.green),
        ),
        data: panther,
        selectedItems: (List<dynamic> selectedLista) {
          List<String> list = [];
          for (var item in selectedLista) {
            if (item is SelectedListItem) {
              list.add(item.name);
            }
          }
          carmodell!.text = list.join(", ");
          gkBilerannonse.currentState?.validate();
          update();
        },
        enableMultipleSelection: false,
      ),
    ).showModal(context);
    update();
  }
//////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////

  List<SelectedListItem> peugeot = [
    SelectedListItem(name: "1007"),
    SelectedListItem(name: "106"),
    SelectedListItem(name: "106 Electric"),
    SelectedListItem(name: "107"),
    SelectedListItem(name: "108"),
    SelectedListItem(name: "2008"),
    SelectedListItem(name: "205"),
    SelectedListItem(name: "206"),
    SelectedListItem(name: "206 CC"),
    SelectedListItem(name: "206 SW"),
    SelectedListItem(name: "207"),
    SelectedListItem(name: "207 CC"),
    SelectedListItem(name: "207 SW"),
    SelectedListItem(name: "208"),
    SelectedListItem(name: "3008"),
    SelectedListItem(name: "305"),
    SelectedListItem(name: "306"),
    SelectedListItem(name: "307"),
    SelectedListItem(name: "307 CC"),
    SelectedListItem(name: "307 SW"),
    SelectedListItem(name: "308"),
    SelectedListItem(name: "308 SW"),
    SelectedListItem(name: "309"),
    SelectedListItem(name: "4007"),
    SelectedListItem(name: "4008"),
    SelectedListItem(name: "405"),
    SelectedListItem(name: "406"),
    SelectedListItem(name: "407"),
    SelectedListItem(name: "408"),
    SelectedListItem(name: "5008"),
    SelectedListItem(name: "505"),
    SelectedListItem(name: "508"),
    SelectedListItem(name: "605"),
    SelectedListItem(name: "607"),
    SelectedListItem(name: "806"),
    SelectedListItem(name: "807"),
    SelectedListItem(name: "Bipper"),
    SelectedListItem(name: "Boxer"),
    SelectedListItem(name: "Export"),
    SelectedListItem(name: "e-Export"),
    SelectedListItem(name: "Partner"),
    SelectedListItem(name: "Partner Electric"),
    SelectedListItem(name: "RCZ"),
    SelectedListItem(name: "Rifter"),
    SelectedListItem(name: "Traveller"),
    SelectedListItem(name: "iOn"),
    SelectedListItem(name: "Andre"),
  ];

  void showDropdownPeugeot(context) {
    DropDownState(
      DropDown(
        searchHintText: "Søk i ${carmerke!.text} modeller",
        bottomSheetTitle: Text(
          "Peugeot modell",
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        dropDownBackgroundColor: Myisellcolors.hvit,
        clearButtonChild: Text(
          'Nullstill',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.red),
        ),
        submitButtonChild: Text(
          'Ferdig',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.green),
        ),
        data: peugeot,
        selectedItems: (List<dynamic> selectedLista) {
          List<String> list = [];
          for (var item in selectedLista) {
            if (item is SelectedListItem) {
              list.add(item.name);
            }
          }
          carmodell!.text = list.join(", ");
          gkBilerannonse.currentState?.validate();
          update();
        },
        enableMultipleSelection: false,
      ),
    ).showModal(context);
    update();
  }
//////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////

  List<SelectedListItem> piaggio = [
    SelectedListItem(name: "Porter"),
    SelectedListItem(name: "Porter Maxxi"),
  ];

  void showDropdownPiaggio(context) {
    DropDownState(
      DropDown(
        searchHintText: "Søk i ${carmerke!.text} modeller",
        bottomSheetTitle: Text(
          "Piaggio modell",
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        dropDownBackgroundColor: Myisellcolors.hvit,
        clearButtonChild: Text(
          'Nullstill',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.red),
        ),
        submitButtonChild: Text(
          'Ferdig',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.green),
        ),
        data: piaggio,
        selectedItems: (List<dynamic> selectedLista) {
          List<String> list = [];
          for (var item in selectedLista) {
            if (item is SelectedListItem) {
              list.add(item.name);
            }
          }
          carmodell!.text = list.join(", ");
          gkBilerannonse.currentState?.validate();
          update();
        },
        enableMultipleSelection: false,
      ),
    ).showModal(context);
    update();
  }
//////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////

  List<SelectedListItem> plymouth = [
    SelectedListItem(name: "Grand Voyager"),
    SelectedListItem(name: "Roadrunner"),
    SelectedListItem(name: "Voyager"),
    SelectedListItem(name: "Andre"),
  ];

  void showDropdownPlymouth(context) {
    DropDownState(
      DropDown(
        searchHintText: "Søk i ${carmerke!.text} modeller",
        bottomSheetTitle: Text(
          "Plymouth modell",
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        dropDownBackgroundColor: Myisellcolors.hvit,
        clearButtonChild: Text(
          'Nullstill',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.red),
        ),
        submitButtonChild: Text(
          'Ferdig',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.green),
        ),
        data: plymouth,
        selectedItems: (List<dynamic> selectedLista) {
          List<String> list = [];
          for (var item in selectedLista) {
            if (item is SelectedListItem) {
              list.add(item.name);
            }
          }
          carmodell!.text = list.join(", ");
          gkBilerannonse.currentState?.validate();
          update();
        },
        enableMultipleSelection: false,
      ),
    ).showModal(context);
    update();
  }
//////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////

  List<SelectedListItem> polestar = [
    SelectedListItem(name: "1"),
    SelectedListItem(name: "2"),
  ];

  void showDropdownPolestar(context) {
    DropDownState(
      DropDown(
        searchHintText: "Søk i ${carmerke!.text} modeller",
        bottomSheetTitle: Text(
          "Polestar modell",
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        dropDownBackgroundColor: Myisellcolors.hvit,
        clearButtonChild: Text(
          'Nullstill',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.red),
        ),
        submitButtonChild: Text(
          'Ferdig',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.green),
        ),
        data: polestar,
        selectedItems: (List<dynamic> selectedLista) {
          List<String> list = [];
          for (var item in selectedLista) {
            if (item is SelectedListItem) {
              list.add(item.name);
            }
          }
          carmodell!.text = list.join(", ");
          gkBilerannonse.currentState?.validate();
          update();
        },
        enableMultipleSelection: false,
      ),
    ).showModal(context);
    update();
  }
//////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////

  List<SelectedListItem> pontiac = [
    SelectedListItem(name: "Bonneville"),
    SelectedListItem(name: "Fiero"),
    SelectedListItem(name: "Firebird"),
    SelectedListItem(name: "Solstice"),
    SelectedListItem(name: "Trans Am"),
    SelectedListItem(name: "Trans Sport"),
    SelectedListItem(name: "Andre"),
  ];

  void showDropdownPontiac(context) {
    DropDownState(
      DropDown(
        searchHintText: "Søk i ${carmerke!.text} modeller",
        bottomSheetTitle: Text(
          "Pontiac modell",
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        dropDownBackgroundColor: Myisellcolors.hvit,
        clearButtonChild: Text(
          'Nullstill',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.red),
        ),
        submitButtonChild: Text(
          'Ferdig',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.green),
        ),
        data: pontiac,
        selectedItems: (List<dynamic> selectedLista) {
          List<String> list = [];
          for (var item in selectedLista) {
            if (item is SelectedListItem) {
              list.add(item.name);
            }
          }
          carmodell!.text = list.join(", ");
          gkBilerannonse.currentState?.validate();
          update();
        },
        enableMultipleSelection: false,
      ),
    ).showModal(context);
    update();
  }
//////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////

  List<SelectedListItem> porsche = [
    SelectedListItem(name: "356"),
    SelectedListItem(name: "911"),
    SelectedListItem(name: "914"),
    SelectedListItem(name: "924"),
    SelectedListItem(name: "928"),
    SelectedListItem(name: "944"),
    SelectedListItem(name: "968"),
    SelectedListItem(name: "Boxster"),
    SelectedListItem(name: "Carrera GT"),
    SelectedListItem(name: "Cayenne"),
    SelectedListItem(name: "Cayenne Coupe"),
    SelectedListItem(name: "Cayman"),
    SelectedListItem(name: "Macan"),
    SelectedListItem(name: "Panamera"),
    SelectedListItem(name: "Taycan"),
    SelectedListItem(name: "Taycan Cross Turismo"),
    SelectedListItem(name: "Taycan Sport Turismo"),
    SelectedListItem(name: "Andre"),
  ];

  void showDropdownPorsche(context) {
    DropDownState(
      DropDown(
        searchHintText: "Søk i ${carmerke!.text} modeller",
        bottomSheetTitle: Text(
          "Porsche modell",
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        dropDownBackgroundColor: Myisellcolors.hvit,
        clearButtonChild: Text(
          'Nullstill',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.red),
        ),
        submitButtonChild: Text(
          'Ferdig',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.green),
        ),
        data: porsche,
        selectedItems: (List<dynamic> selectedLista) {
          List<String> list = [];
          for (var item in selectedLista) {
            if (item is SelectedListItem) {
              list.add(item.name);
            }
          }
          carmodell!.text = list.join(", ");
          gkBilerannonse.currentState?.validate();
          update();
        },
        enableMultipleSelection: false,
      ),
    ).showModal(context);
    update();
  }
//////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////

  List<SelectedListItem> radical = [
    SelectedListItem(name: "RXC"),
    SelectedListItem(name: "SR1"),
    SelectedListItem(name: "SR3"),
    SelectedListItem(name: "SR8"),
    SelectedListItem(name: "Andre"),
  ];

  void showDropdownRadical(context) {
    DropDownState(
      DropDown(
        searchHintText: "Søk i ${carmerke!.text} modeller",
        bottomSheetTitle: Text(
          "Radical modell",
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        dropDownBackgroundColor: Myisellcolors.hvit,
        clearButtonChild: Text(
          'Nullstill',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.red),
        ),
        submitButtonChild: Text(
          'Ferdig',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.green),
        ),
        data: radical,
        selectedItems: (List<dynamic> selectedLista) {
          List<String> list = [];
          for (var item in selectedLista) {
            if (item is SelectedListItem) {
              list.add(item.name);
            }
          }
          carmodell!.text = list.join(", ");
          gkBilerannonse.currentState?.validate();
          update();
        },
        enableMultipleSelection: false,
      ),
    ).showModal(context);
    update();
  }
//////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////

  List<SelectedListItem> ram = [
    SelectedListItem(name: "500"),
    SelectedListItem(name: "1500"),
    SelectedListItem(name: "2500"),
    SelectedListItem(name: "3500"),
    SelectedListItem(name: "5500"),
    SelectedListItem(name: "Andre"),
  ];

  void showDropdownRAM(context) {
    DropDownState(
      DropDown(
        searchHintText: "Søk i ${carmerke!.text} modeller",
        bottomSheetTitle: Text(
          "RAM modell",
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        dropDownBackgroundColor: Myisellcolors.hvit,
        clearButtonChild: Text(
          'Nullstill',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.red),
        ),
        submitButtonChild: Text(
          'Ferdig',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.green),
        ),
        data: ram,
        selectedItems: (List<dynamic> selectedLista) {
          List<String> list = [];
          for (var item in selectedLista) {
            if (item is SelectedListItem) {
              list.add(item.name);
            }
          }
          carmodell!.text = list.join(", ");
          gkBilerannonse.currentState?.validate();
          update();
        },
        enableMultipleSelection: false,
      ),
    ).showModal(context);
    update();
  }
//////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////

  List<SelectedListItem> renault = [
    SelectedListItem(name: "12"),
    SelectedListItem(name: "14"),
    SelectedListItem(name: "15"),
    SelectedListItem(name: "16"),
    SelectedListItem(name: "17"),
    SelectedListItem(name: "18"),
    SelectedListItem(name: "19"),
    SelectedListItem(name: "20"),
    SelectedListItem(name: "30"),
    SelectedListItem(name: "5"),
    SelectedListItem(name: "Avantime"),
    SelectedListItem(name: "C3"),
    SelectedListItem(name: "Captur"),
    SelectedListItem(name: "Clio"),
    SelectedListItem(name: "Espace"),
    SelectedListItem(name: "Express"),
    SelectedListItem(name: "Fuego"),
    SelectedListItem(name: "Grand Espace"),
    SelectedListItem(name: "Grand Scenic"),
    SelectedListItem(name: "Kadjar"),
    SelectedListItem(name: "Kangoo"),
    SelectedListItem(name: "Kangoo Electric"),
    SelectedListItem(name: "Kangoo Express"),
    SelectedListItem(name: "Koleos"),
    SelectedListItem(name: "Laguna"),
    SelectedListItem(name: "Master"),
    SelectedListItem(name: "Megane"),
    SelectedListItem(name: "Megane CC"),
    SelectedListItem(name: "Modus"),
    SelectedListItem(name: "Scenic"),
    SelectedListItem(name: "Talisman"),
    SelectedListItem(name: "Trafic"),
    SelectedListItem(name: "Twingo"),
    SelectedListItem(name: "Twizy"),
    SelectedListItem(name: "Zeo"),
    SelectedListItem(name: "Andre"),
  ];

  void showDropdownRenault(context) {
    DropDownState(
      DropDown(
        searchHintText: "Søk i ${carmerke!.text} modeller",
        bottomSheetTitle: Text(
          "Renault modell",
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        dropDownBackgroundColor: Myisellcolors.hvit,
        clearButtonChild: Text(
          'Nullstill',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.red),
        ),
        submitButtonChild: Text(
          'Ferdig',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.green),
        ),
        data: renault,
        selectedItems: (List<dynamic> selectedLista) {
          List<String> list = [];
          for (var item in selectedLista) {
            if (item is SelectedListItem) {
              list.add(item.name);
            }
          }
          carmodell!.text = list.join(", ");
          gkBilerannonse.currentState?.validate();
          update();
        },
        enableMultipleSelection: false,
      ),
    ).showModal(context);
    update();
  }
//////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////

  List<SelectedListItem> reva = [
    SelectedListItem(name: "Andre"),
  ];

  void showDropdownReva(context) {
    DropDownState(
      DropDown(
        searchHintText: "Søk i ${carmerke!.text} modeller",
        bottomSheetTitle: Text(
          "Reva modell",
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        dropDownBackgroundColor: Myisellcolors.hvit,
        clearButtonChild: Text(
          'Nullstill',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.red),
        ),
        submitButtonChild: Text(
          'Ferdig',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.green),
        ),
        data: reva,
        selectedItems: (List<dynamic> selectedLista) {
          List<String> list = [];
          for (var item in selectedLista) {
            if (item is SelectedListItem) {
              list.add(item.name);
            }
          }
          carmodell!.text = list.join(", ");
          gkBilerannonse.currentState?.validate();
          update();
        },
        enableMultipleSelection: false,
      ),
    ).showModal(context);
    update();
  }
//////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////

  List<SelectedListItem> rollsroyce = [
    SelectedListItem(name: "Cullinan"),
    SelectedListItem(name: "Ghost"),
    SelectedListItem(name: "Phantom"),
    SelectedListItem(name: "Silver Shadow"),
    SelectedListItem(name: "Wraith"),
    SelectedListItem(name: "Andre"),
  ];

  void showDropdownRollsroyce(context) {
    DropDownState(
      DropDown(
        searchHintText: "Søk i ${carmerke!.text} modeller",
        bottomSheetTitle: Text(
          "Rolls Royce modell",
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        dropDownBackgroundColor: Myisellcolors.hvit,
        clearButtonChild: Text(
          'Nullstill',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.red),
        ),
        submitButtonChild: Text(
          'Ferdig',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.green),
        ),
        data: rollsroyce,
        selectedItems: (List<dynamic> selectedLista) {
          List<String> list = [];
          for (var item in selectedLista) {
            if (item is SelectedListItem) {
              list.add(item.name);
            }
          }
          carmodell!.text = list.join(", ");
          gkBilerannonse.currentState?.validate();
          update();
        },
        enableMultipleSelection: false,
      ),
    ).showModal(context);
    update();
  }
//////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////

  List<SelectedListItem> rover = [
    SelectedListItem(name: "200-serie"),
    SelectedListItem(name: "400-serie"),
    SelectedListItem(name: "600-serie"),
    SelectedListItem(name: "800-serie"),
    SelectedListItem(name: "Defender"),
    SelectedListItem(name: "Mini"),
    SelectedListItem(name: "25"),
    SelectedListItem(name: "45"),
    SelectedListItem(name: "75"),
    SelectedListItem(name: "Andre"),
  ];

  void showDropdownRover(context) {
    DropDownState(
      DropDown(
        searchHintText: "Søk i ${carmerke!.text} modeller",
        bottomSheetTitle: Text(
          "Rover modell",
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        dropDownBackgroundColor: Myisellcolors.hvit,
        clearButtonChild: Text(
          'Nullstill',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.red),
        ),
        submitButtonChild: Text(
          'Ferdig',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.green),
        ),
        data: rover,
        selectedItems: (List<dynamic> selectedLista) {
          List<String> list = [];
          for (var item in selectedLista) {
            if (item is SelectedListItem) {
              list.add(item.name);
            }
          }
          carmodell!.text = list.join(", ");
          gkBilerannonse.currentState?.validate();
          update();
        },
        enableMultipleSelection: false,
      ),
    ).showModal(context);
    update();
  }
//////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////

  List<SelectedListItem> saab = [
    SelectedListItem(name: "9-3"),
    SelectedListItem(name: "9-5"),
    SelectedListItem(name: "900"),
    SelectedListItem(name: "9000"),
    SelectedListItem(name: "99"),
    SelectedListItem(name: "Andre"),
  ];

  void showDropdownSaab(context) {
    DropDownState(
      DropDown(
        searchHintText: "Søk i ${carmerke!.text} modeller",
        bottomSheetTitle: Text(
          "Saab modell",
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        dropDownBackgroundColor: Myisellcolors.hvit,
        clearButtonChild: Text(
          'Nullstill',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.red),
        ),
        submitButtonChild: Text(
          'Ferdig',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.green),
        ),
        data: saab,
        selectedItems: (List<dynamic> selectedLista) {
          List<String> list = [];
          for (var item in selectedLista) {
            if (item is SelectedListItem) {
              list.add(item.name);
            }
          }
          carmodell!.text = list.join(", ");
          gkBilerannonse.currentState?.validate();
          update();
        },
        enableMultipleSelection: false,
      ),
    ).showModal(context);
    update();
  }
//////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////

  List<SelectedListItem> santana = [
    SelectedListItem(name: "PS10"),
    SelectedListItem(name: "Andre"),
  ];

  void showDropdownSantana(context) {
    DropDownState(
      DropDown(
        searchHintText: "Søk i ${carmerke!.text} modeller",
        bottomSheetTitle: Text(
          "Santana modell",
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        dropDownBackgroundColor: Myisellcolors.hvit,
        clearButtonChild: Text(
          'Nullstill',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.red),
        ),
        submitButtonChild: Text(
          'Ferdig',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.green),
        ),
        data: santana,
        selectedItems: (List<dynamic> selectedLista) {
          List<String> list = [];
          for (var item in selectedLista) {
            if (item is SelectedListItem) {
              list.add(item.name);
            }
          }
          carmodell!.text = list.join(", ");
          gkBilerannonse.currentState?.validate();
          update();
        },
        enableMultipleSelection: false,
      ),
    ).showModal(context);
    update();
  }
//////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////

  List<SelectedListItem> scion = [
    SelectedListItem(name: "tC"),
    SelectedListItem(name: "xA"),
    SelectedListItem(name: "xB"),
    SelectedListItem(name: "Andre"),
  ];

  void showDropdownScion(context) {
    DropDownState(
      DropDown(
        searchHintText: "Søk i ${carmerke!.text} modeller",
        bottomSheetTitle: Text(
          "Scion modell",
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        dropDownBackgroundColor: Myisellcolors.hvit,
        clearButtonChild: Text(
          'Nullstill',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.red),
        ),
        submitButtonChild: Text(
          'Ferdig',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.green),
        ),
        data: scion,
        selectedItems: (List<dynamic> selectedLista) {
          List<String> list = [];
          for (var item in selectedLista) {
            if (item is SelectedListItem) {
              list.add(item.name);
            }
          }
          carmodell!.text = list.join(", ");
          gkBilerannonse.currentState?.validate();
          update();
        },
        enableMultipleSelection: false,
      ),
    ).showModal(context);
    update();
  }
//////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////

  List<SelectedListItem> seat = [
    SelectedListItem(name: "Alhambra"),
    SelectedListItem(name: "Altea"),
    SelectedListItem(name: "Arona"),
    SelectedListItem(name: "Arosa"),
    SelectedListItem(name: "Ateca"),
    SelectedListItem(name: "Cordoba"),
    SelectedListItem(name: "Cordoba Vario"),
    SelectedListItem(name: "Ibiza"),
    SelectedListItem(name: "Inca"),
    SelectedListItem(name: "Leon"),
    SelectedListItem(name: "Leon XP"),
    SelectedListItem(name: "Mii"),
    SelectedListItem(name: "Tarraco"),
    SelectedListItem(name: "Toledo"),
    SelectedListItem(name: "Andre"),
  ];

  void showDropdownSeat(context) {
    DropDownState(
      DropDown(
        searchHintText: "Søk i ${carmerke!.text} modeller",
        bottomSheetTitle: Text(
          "Seat modell",
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        dropDownBackgroundColor: Myisellcolors.hvit,
        clearButtonChild: Text(
          'Nullstill',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.red),
        ),
        submitButtonChild: Text(
          'Ferdig',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.green),
        ),
        data: seat,
        selectedItems: (List<dynamic> selectedLista) {
          List<String> list = [];
          for (var item in selectedLista) {
            if (item is SelectedListItem) {
              list.add(item.name);
            }
          }
          carmodell!.text = list.join(", ");
          gkBilerannonse.currentState?.validate();
          update();
        },
        enableMultipleSelection: false,
      ),
    ).showModal(context);
    update();
  }
//////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////

  List<SelectedListItem> seres = [
    SelectedListItem(name: "3"),
    SelectedListItem(name: "5"),
    SelectedListItem(name: "SF5"),
    SelectedListItem(name: "SF7"),
    SelectedListItem(name: "Andre"),
  ];

  void showDropdownSeres(context) {
    DropDownState(
      DropDown(
        searchHintText: "Søk i ${carmerke!.text} modeller",
        bottomSheetTitle: Text(
          "Seres modell",
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        dropDownBackgroundColor: Myisellcolors.hvit,
        clearButtonChild: Text(
          'Nullstill',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.red),
        ),
        submitButtonChild: Text(
          'Ferdig',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.green),
        ),
        data: seres,
        selectedItems: (List<dynamic> selectedLista) {
          List<String> list = [];
          for (var item in selectedLista) {
            if (item is SelectedListItem) {
              list.add(item.name);
            }
          }
          carmodell!.text = list.join(", ");
          gkBilerannonse.currentState?.validate();
          update();
        },
        enableMultipleSelection: false,
      ),
    ).showModal(context);
    update();
  }
//////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////

  List<SelectedListItem> skoda = [
    SelectedListItem(name: "Citigo"),
    SelectedListItem(name: "Enyaq"),
    SelectedListItem(name: "Enyaq Coupe RS"),
    SelectedListItem(name: "Fabia"),
    SelectedListItem(name: "Favorit"),
    SelectedListItem(name: "Felicia"),
    SelectedListItem(name: "Forman"),
    SelectedListItem(name: "Kamiq"),
    SelectedListItem(name: "Karoq"),
    SelectedListItem(name: "Kodiaq"),
    SelectedListItem(name: "Kodiaq Scout"),
    SelectedListItem(name: "Octavia"),
    SelectedListItem(name: "Octavia RS"),
    SelectedListItem(name: "Octavia Scout"),
    SelectedListItem(name: "Pickup"),
    SelectedListItem(name: "Rapid"),
    SelectedListItem(name: "Rapid Spaceback"),
    SelectedListItem(name: "Roomster"),
    SelectedListItem(name: "Scala"),
    SelectedListItem(name: "Superb"),
    SelectedListItem(name: "Yeti"),
    SelectedListItem(name: "Andre"),
  ];

  void showDropdownSkoda(context) {
    DropDownState(
      DropDown(
        searchHintText: "Søk i ${carmerke!.text} modeller",
        bottomSheetTitle: Text(
          "Skoda modell",
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        dropDownBackgroundColor: Myisellcolors.hvit,
        clearButtonChild: Text(
          'Nullstill',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.red),
        ),
        submitButtonChild: Text(
          'Ferdig',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.green),
        ),
        data: skoda,
        selectedItems: (List<dynamic> selectedLista) {
          List<String> list = [];
          for (var item in selectedLista) {
            if (item is SelectedListItem) {
              list.add(item.name);
            }
          }
          carmodell!.text = list.join(", ");
          gkBilerannonse.currentState?.validate();
          update();
        },
        enableMultipleSelection: false,
      ),
    ).showModal(context);
    update();
  }
//////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////

  List<SelectedListItem> smart = [
    SelectedListItem(name: "Crossblade"),
    SelectedListItem(name: "Forfour"),
    SelectedListItem(name: "Fortwo"),
    SelectedListItem(name: "Roadster"),
    SelectedListItem(name: "Roadster coupe"),
    SelectedListItem(name: "Andre"),
  ];

  void showDropdownSmart(context) {
    DropDownState(
      DropDown(
        searchHintText: "Søk i ${carmerke!.text} modeller",
        bottomSheetTitle: Text(
          "Smart modell",
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        dropDownBackgroundColor: Myisellcolors.hvit,
        clearButtonChild: Text(
          'Nullstill',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.red),
        ),
        submitButtonChild: Text(
          'Ferdig',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.green),
        ),
        data: smart,
        selectedItems: (List<dynamic> selectedLista) {
          List<String> list = [];
          for (var item in selectedLista) {
            if (item is SelectedListItem) {
              list.add(item.name);
            }
          }
          carmodell!.text = list.join(", ");
          gkBilerannonse.currentState?.validate();
          update();
        },
        enableMultipleSelection: false,
      ),
    ).showModal(context);
    update();
  }
//////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////

  List<SelectedListItem> ssangyong = [
    SelectedListItem(name: "Actyon Sport"),
    SelectedListItem(name: "Family"),
    SelectedListItem(name: "Korando"),
    SelectedListItem(name: "Kyron"),
    SelectedListItem(name: "Musso"),
    SelectedListItem(name: "Rexton"),
    SelectedListItem(name: "Rexton Sports"),
    SelectedListItem(name: "Rexton W"),
    SelectedListItem(name: "Rodius"),
    SelectedListItem(name: "Tivoli"),
    SelectedListItem(name: "XLV"),
    SelectedListItem(name: "Andre"),
  ];

  void showDropdownSsangyong(context) {
    DropDownState(
      DropDown(
        searchHintText: "Søk i ${carmerke!.text} modeller",
        bottomSheetTitle: Text(
          "Ssangyong modell",
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        dropDownBackgroundColor: Myisellcolors.hvit,
        clearButtonChild: Text(
          'Nullstill',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.red),
        ),
        submitButtonChild: Text(
          'Ferdig',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.green),
        ),
        data: ssangyong,
        selectedItems: (List<dynamic> selectedLista) {
          List<String> list = [];
          for (var item in selectedLista) {
            if (item is SelectedListItem) {
              list.add(item.name);
            }
          }
          carmodell!.text = list.join(", ");
          gkBilerannonse.currentState?.validate();
          update();
        },
        enableMultipleSelection: false,
      ),
    ).showModal(context);
    update();
  }
//////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////

  List<SelectedListItem> subaru = [
    SelectedListItem(name: "B9 Tribeca"),
    SelectedListItem(name: "BRZ"),
    SelectedListItem(name: "Domingo"),
    SelectedListItem(name: "Forester"),
    SelectedListItem(name: "Impreza"),
    SelectedListItem(name: "Justy"),
    SelectedListItem(name: "L-serie"),
    SelectedListItem(name: "Legacy"),
    SelectedListItem(name: "Levorg"),
    SelectedListItem(name: "Outback"),
    SelectedListItem(name: "Solterra"),
    SelectedListItem(name: "Trezia"),
    SelectedListItem(name: "XV"),
    SelectedListItem(name: "Andre"),
  ];

  void showDropdownSubaru(context) {
    DropDownState(
      DropDown(
        searchHintText: "Søk i ${carmerke!.text} modeller",
        bottomSheetTitle: Text(
          "Subaru modell",
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        dropDownBackgroundColor: Myisellcolors.hvit,
        clearButtonChild: Text(
          'Nullstill',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.red),
        ),
        submitButtonChild: Text(
          'Ferdig',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.green),
        ),
        data: subaru,
        selectedItems: (List<dynamic> selectedLista) {
          List<String> list = [];
          for (var item in selectedLista) {
            if (item is SelectedListItem) {
              list.add(item.name);
            }
          }
          carmodell!.text = list.join(", ");
          gkBilerannonse.currentState?.validate();
          update();
        },
        enableMultipleSelection: false,
      ),
    ).showModal(context);
    update();
  }
//////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////

  List<SelectedListItem> suzuki = [
    SelectedListItem(name: "Alto"),
    SelectedListItem(name: "Across"),
    SelectedListItem(name: "Baleno"),
    SelectedListItem(name: "Grand Vitara"),
    SelectedListItem(name: "Ignis"),
    SelectedListItem(name: "Jimny"),
    SelectedListItem(name: "Kizashi"),
    SelectedListItem(name: "Liana"),
    SelectedListItem(name: "SJ"),
    SelectedListItem(name: "SX4"),
    SelectedListItem(name: "SX4 S-Cross"),
    SelectedListItem(name: "Splash"),
    SelectedListItem(name: "Swift"),
    SelectedListItem(name: "Vitara"),
    SelectedListItem(name: "Wagon R+"),
    SelectedListItem(name: "XL7"),
    SelectedListItem(name: "Andre"),
  ];

  void showDropdownSuzuki(context) {
    DropDownState(
      DropDown(
        searchHintText: "Søk i ${carmerke!.text} modeller",
        bottomSheetTitle: Text(
          "Suzuki modell",
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        dropDownBackgroundColor: Myisellcolors.hvit,
        clearButtonChild: Text(
          'Nullstill',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.red),
        ),
        submitButtonChild: Text(
          'Ferdig',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.green),
        ),
        data: suzuki,
        selectedItems: (List<dynamic> selectedLista) {
          List<String> list = [];
          for (var item in selectedLista) {
            if (item is SelectedListItem) {
              list.add(item.name);
            }
          }
          carmodell!.text = list.join(", ");
          gkBilerannonse.currentState?.validate();
          update();
        },
        enableMultipleSelection: false,
      ),
    ).showModal(context);
    update();
  }
//////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////

  List<SelectedListItem> tvr = [
    SelectedListItem(name: "Andre"),
  ];

  void showDropdownTVR(context) {
    DropDownState(
      DropDown(
        searchHintText: "Søk i ${carmerke!.text} modeller",
        bottomSheetTitle: Text(
          "TVR modell",
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        dropDownBackgroundColor: Myisellcolors.hvit,
        clearButtonChild: Text(
          'Nullstill',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.red),
        ),
        submitButtonChild: Text(
          'Ferdig',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.green),
        ),
        data: tvr,
        selectedItems: (List<dynamic> selectedLista) {
          List<String> list = [];
          for (var item in selectedLista) {
            if (item is SelectedListItem) {
              list.add(item.name);
            }
          }
          carmodell!.text = list.join(", ");
          gkBilerannonse.currentState?.validate();
          update();
        },
        enableMultipleSelection: false,
      ),
    ).showModal(context);
    update();
  }
//////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////

  List<SelectedListItem> tazzari = [
    SelectedListItem(name: "Zero"),
  ];

  void showDropdownTazzari(context) {
    DropDownState(
      DropDown(
        searchHintText: "Søk i ${carmerke!.text} modeller",
        bottomSheetTitle: Text(
          "Tazzari modell",
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        dropDownBackgroundColor: Myisellcolors.hvit,
        clearButtonChild: Text(
          'Nullstill',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.red),
        ),
        submitButtonChild: Text(
          'Ferdig',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.green),
        ),
        data: tazzari,
        selectedItems: (List<dynamic> selectedLista) {
          List<String> list = [];
          for (var item in selectedLista) {
            if (item is SelectedListItem) {
              list.add(item.name);
            }
          }
          carmodell!.text = list.join(", ");
          gkBilerannonse.currentState?.validate();
          update();
        },
        enableMultipleSelection: false,
      ),
    ).showModal(context);
    update();
  }
//////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////

  List<SelectedListItem> tesla = [
    SelectedListItem(name: "Model 3"),
    SelectedListItem(name: "Model S"),
    SelectedListItem(name: "Model X"),
    SelectedListItem(name: "Model Y"),
    SelectedListItem(name: "Roadster"),
  ];

  void showDropdownTesla(context) {
    DropDownState(
      DropDown(
        searchHintText: "Søk i ${carmerke!.text} modeller",
        bottomSheetTitle: Text(
          "Tesla modell",
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        dropDownBackgroundColor: Myisellcolors.hvit,
        clearButtonChild: Text(
          'Nullstill',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.red),
        ),
        submitButtonChild: Text(
          'Ferdig',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.green),
        ),
        data: tesla,
        selectedItems: (List<dynamic> selectedLista) {
          List<String> list = [];
          for (var item in selectedLista) {
            if (item is SelectedListItem) {
              list.add(item.name);
            }
          }
          carmodell!.text = list.join(", ");
          gkBilerannonse.currentState?.validate();
          update();
        },
        enableMultipleSelection: false,
      ),
    ).showModal(context);
    update();
  }
//////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////

  List<SelectedListItem> think = [
    SelectedListItem(name: "City"),
    SelectedListItem(name: "Andre"),
  ];

  void showDropdownThink(context) {
    DropDownState(
      DropDown(
        searchHintText: "Søk i ${carmerke!.text} modeller",
        bottomSheetTitle: Text(
          "Think modell",
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        dropDownBackgroundColor: Myisellcolors.hvit,
        clearButtonChild: Text(
          'Nullstill',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.red),
        ),
        submitButtonChild: Text(
          'Ferdig',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.green),
        ),
        data: think,
        selectedItems: (List<dynamic> selectedLista) {
          List<String> list = [];
          for (var item in selectedLista) {
            if (item is SelectedListItem) {
              list.add(item.name);
            }
          }
          carmodell!.text = list.join(", ");
          gkBilerannonse.currentState?.validate();
          update();
        },
        enableMultipleSelection: false,
      ),
    ).showModal(context);
    update();
  }
//////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////

  List<SelectedListItem> toyota = [
    SelectedListItem(name: "4-Runner"),
    SelectedListItem(name: "Auris"),
    SelectedListItem(name: "Avensis"),
    SelectedListItem(name: "Avensis Verso"),
    SelectedListItem(name: "Aygo"),
    SelectedListItem(name: "Aygo X"),
    SelectedListItem(name: "bZ4X"),
    SelectedListItem(name: "C-HR"),
    SelectedListItem(name: "Camry"),
    SelectedListItem(name: "Carina"),
    SelectedListItem(name: "Celica"),
    SelectedListItem(name: "Corolla"),
    SelectedListItem(name: "Corolla Cross"),
    SelectedListItem(name: "Corolla Verso"),
    SelectedListItem(name: "Cressida"),
    SelectedListItem(name: "Crown"),
    SelectedListItem(name: "Dyna"),
    SelectedListItem(name: "GR Supra"),
    SelectedListItem(name: "GR86"),
    SelectedListItem(name: "GT86"),
    SelectedListItem(name: "HiAce"),
    SelectedListItem(name: "HiClass"),
    SelectedListItem(name: "HiLux"),
    SelectedListItem(name: "Highlander"),
    SelectedListItem(name: "IQ"),
    SelectedListItem(name: "Lander Cruiser"),
    SelectedListItem(name: "MR2"),
    SelectedListItem(name: "Mirai"),
    SelectedListItem(name: "Picnic"),
    SelectedListItem(name: "Previa"),
    SelectedListItem(name: "Prius"),
    SelectedListItem(name: "Prius Plug-in Hybrid"),
    SelectedListItem(name: "Prius+ Seven"),
    SelectedListItem(name: "Proace"),
    SelectedListItem(name: "Proace City"),
    SelectedListItem(name: "Proace Verso"),
    SelectedListItem(name: "RAV4"),
    SelectedListItem(name: "Sienna"),
    SelectedListItem(name: "Starlet"),
    SelectedListItem(name: "Supra"),
    SelectedListItem(name: "Tacoma"),
    SelectedListItem(name: "Tercel"),
    SelectedListItem(name: "Tundra"),
    SelectedListItem(name: "Urban Cruiser"),
    SelectedListItem(name: "Verso"),
    SelectedListItem(name: "Verso-S"),
    SelectedListItem(name: "Yaris"),
    SelectedListItem(name: "Yaris Cross"),
    SelectedListItem(name: "Yaris Verso"),
    SelectedListItem(name: "GR Yaris"),
    SelectedListItem(name: "Andre"),
  ];

  void showDropdownToyota(context) {
    DropDownState(
      DropDown(
        searchHintText: "Søk i ${carmerke!.text} modeller",
        bottomSheetTitle: Text(
          "Toyota modell",
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        dropDownBackgroundColor: Myisellcolors.hvit,
        clearButtonChild: Text(
          'Nullstill',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.red),
        ),
        submitButtonChild: Text(
          'Ferdig',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.green),
        ),
        data: toyota,
        selectedItems: (List<dynamic> selectedLista) {
          List<String> list = [];
          for (var item in selectedLista) {
            if (item is SelectedListItem) {
              list.add(item.name);
            }
          }
          carmodell!.text = list.join(", ");
          gkBilerannonse.currentState?.validate();
          update();
        },
        enableMultipleSelection: false,
      ),
    ).showModal(context);
    update();
  }
//////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////

  List<SelectedListItem> triumph = [
    SelectedListItem(name: "Spitfire"),
    SelectedListItem(name: "TR7"),
    SelectedListItem(name: "Andre"),
  ];

  void showDropdownTriumph(context) {
    DropDownState(
      DropDown(
        searchHintText: "Søk i ${carmerke!.text} modeller",
        bottomSheetTitle: Text(
          "Triumph modell",
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        dropDownBackgroundColor: Myisellcolors.hvit,
        clearButtonChild: Text(
          'Nullstill',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.red),
        ),
        submitButtonChild: Text(
          'Ferdig',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.green),
        ),
        data: triumph,
        selectedItems: (List<dynamic> selectedLista) {
          List<String> list = [];
          for (var item in selectedLista) {
            if (item is SelectedListItem) {
              list.add(item.name);
            }
          }
          carmodell!.text = list.join(", ");
          gkBilerannonse.currentState?.validate();
          update();
        },
        enableMultipleSelection: false,
      ),
    ).showModal(context);
    update();
  }
//////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////

  List<SelectedListItem> volkswagen = [
    SelectedListItem(name: "Amarok"),
    SelectedListItem(name: "Arteon"),
    SelectedListItem(name: "Beetle"),
    SelectedListItem(name: "Boble (gammel type)"),
    SelectedListItem(name: "Bora"),
    SelectedListItem(name: "Caddy"),
    SelectedListItem(name: "Caddy Alltrack"),
    SelectedListItem(name: "Caddy Maxi"),
    SelectedListItem(name: "Caravelle"),
    SelectedListItem(name: "Corrado"),
    SelectedListItem(name: "Crafter"),
    SelectedListItem(name: "Derby"),
    SelectedListItem(name: "Eos"),
    SelectedListItem(name: "Golf"),
    SelectedListItem(name: "Golf Alltrack"),
    SelectedListItem(name: "Golf Cross"),
    SelectedListItem(name: "Golf Plus"),
    SelectedListItem(name: "Golf Sportsvan"),
    SelectedListItem(name: "ID. Buzz"),
    SelectedListItem(name: "ID.3"),
    SelectedListItem(name: "ID.4"),
    SelectedListItem(name: "ID.4 GTX"),
    SelectedListItem(name: "ID.5"),
    SelectedListItem(name: "ID.5 GTX"),
    SelectedListItem(name: "ID.7"),
    SelectedListItem(name: "Jetta"),
    SelectedListItem(name: "K 70"),
    SelectedListItem(name: "LT"),
    SelectedListItem(name: "Lupo"),
    SelectedListItem(name: "Multivan"),
    SelectedListItem(name: "Passat"),
    SelectedListItem(name: "Passat Alltrack"),
    SelectedListItem(name: "Passat CC"),
    SelectedListItem(name: "Phaeton"),
    SelectedListItem(name: "Polo"),
    SelectedListItem(name: "Polo Cross"),
    SelectedListItem(name: "Santana"),
    SelectedListItem(name: "Scirocco"),
    SelectedListItem(name: "Sharan"),
    SelectedListItem(name: "T-Cross"),
    SelectedListItem(name: "T-Roc"),
    SelectedListItem(name: "Taro"),
    SelectedListItem(name: "Tiguan"),
    SelectedListItem(name: "Tiguan Allspace"),
    SelectedListItem(name: "Touareg"),
    SelectedListItem(name: "Touran"),
    SelectedListItem(name: "Transporter"),
    SelectedListItem(name: "UP!"),
    SelectedListItem(name: "Variant"),
    SelectedListItem(name: "Vento"),
    SelectedListItem(name: "Kombi"),
    SelectedListItem(name: "Andre"),
  ];

  void showDropdownVolkswagen(context) {
    DropDownState(
      DropDown(
        searchHintText: "Søk i ${carmerke!.text} modeller",
        bottomSheetTitle: Text(
          "Volkswagen modell",
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        dropDownBackgroundColor: Myisellcolors.hvit,
        clearButtonChild: Text(
          'Nullstill',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.red),
        ),
        submitButtonChild: Text(
          'Ferdig',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.green),
        ),
        data: volkswagen,
        selectedItems: (List<dynamic> selectedLista) {
          List<String> list = [];
          for (var item in selectedLista) {
            if (item is SelectedListItem) {
              list.add(item.name);
            }
          }
          carmodell!.text = list.join(", ");
          gkBilerannonse.currentState?.validate();
          update();
        },
        enableMultipleSelection: false,
      ),
    ).showModal(context);
    update();
  }
//////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////

  List<SelectedListItem> volvo = [
    SelectedListItem(name: "744"),
    SelectedListItem(name: "C30"),
    SelectedListItem(name: "C40"),
    SelectedListItem(name: "C70"),
    SelectedListItem(name: "P1800"),
    SelectedListItem(name: "S40"),
    SelectedListItem(name: "S60"),
    SelectedListItem(name: "S60 Cross Country"),
    SelectedListItem(name: "S70"),
    SelectedListItem(name: "S80"),
    SelectedListItem(name: "S90"),
    SelectedListItem(name: "V40"),
    SelectedListItem(name: "V40 Cross Country"),
    SelectedListItem(name: "V50"),
    SelectedListItem(name: "V60"),
    SelectedListItem(name: "V60 Cross Country"),
    SelectedListItem(name: "V70"),
    SelectedListItem(name: "V90"),
    SelectedListItem(name: "V90 Cross Country"),
    SelectedListItem(name: "XC40"),
    SelectedListItem(name: "XC60"),
    SelectedListItem(name: "XC70"),
    SelectedListItem(name: "XC90"),
    SelectedListItem(name: "142"),
    SelectedListItem(name: "144"),
    SelectedListItem(name: "145"),
    SelectedListItem(name: "164"),
    SelectedListItem(name: "240"),
    SelectedListItem(name: "242"),
    SelectedListItem(name: "244"),
    SelectedListItem(name: "245"),
    SelectedListItem(name: "264"),
    SelectedListItem(name: "265"),
    SelectedListItem(name: "340"),
    SelectedListItem(name: "343"),
    SelectedListItem(name: "345"),
    SelectedListItem(name: "360"),
    SelectedListItem(name: "440"),
    SelectedListItem(name: "460"),
    SelectedListItem(name: "480"),
    SelectedListItem(name: "740"),
    SelectedListItem(name: "745"),
    SelectedListItem(name: "760"),
    SelectedListItem(name: "780"),
    SelectedListItem(name: "850"),
    SelectedListItem(name: "940"),
    SelectedListItem(name: "960"),
    SelectedListItem(name: "Amazon"),
    SelectedListItem(name: "Duett"),
    SelectedListItem(name: "PV"),
    SelectedListItem(name: "Andre"),
  ];

  void showDropdownVolvo(context) {
    DropDownState(
      DropDown(
        searchHintText: "Søk i ${carmerke!.text} modeller",
        bottomSheetTitle: Text(
          "Volvo modell",
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        dropDownBackgroundColor: Myisellcolors.hvit,
        clearButtonChild: Text(
          'Nullstill',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.red),
        ),
        submitButtonChild: Text(
          'Ferdig',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.green),
        ),
        data: volvo,
        selectedItems: (List<dynamic> selectedLista) {
          List<String> list = [];
          for (var item in selectedLista) {
            if (item is SelectedListItem) {
              list.add(item.name);
            }
          }
          carmodell!.text = list.join(", ");
          gkBilerannonse.currentState?.validate();
          update();
        },
        enableMultipleSelection: false,
      ),
    ).showModal(context);
    update();
  }
//////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////

  List<SelectedListItem> voyah = [
    SelectedListItem(name: "FREE"),
  ];

  void showDropdownVOYAH(context) {
    DropDownState(
      DropDown(
        searchHintText: "Søk i ${carmerke!.text} modeller",
        bottomSheetTitle: Text(
          "VOYAH modell",
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        dropDownBackgroundColor: Myisellcolors.hvit,
        clearButtonChild: Text(
          'Nullstill',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.red),
        ),
        submitButtonChild: Text(
          'Ferdig',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.green),
        ),
        data: voyah,
        selectedItems: (List<dynamic> selectedLista) {
          List<String> list = [];
          for (var item in selectedLista) {
            if (item is SelectedListItem) {
              list.add(item.name);
            }
          }
          carmodell!.text = list.join(", ");
          gkBilerannonse.currentState?.validate();
          update();
        },
        enableMultipleSelection: false,
      ),
    ).showModal(context);
    update();
  }
//////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////

  List<SelectedListItem> wiesmann = [
    SelectedListItem(name: "GT MF4"),
    SelectedListItem(name: "GT MF5"),
    SelectedListItem(name: "MF3"),
    SelectedListItem(name: "MF30"),
    SelectedListItem(name: "Roadster MF4"),
    SelectedListItem(name: "Roadster MF5"),
    SelectedListItem(name: "Andre"),
  ];

  void showDropdownWiesmann(context) {
    DropDownState(
      DropDown(
        searchHintText: "Søk i ${carmerke!.text} modeller",
        bottomSheetTitle: Text(
          "Wiesmann modell",
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        dropDownBackgroundColor: Myisellcolors.hvit,
        clearButtonChild: Text(
          'Nullstill',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.red),
        ),
        submitButtonChild: Text(
          'Ferdig',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.green),
        ),
        data: wiesmann,
        selectedItems: (List<dynamic> selectedLista) {
          List<String> list = [];
          for (var item in selectedLista) {
            if (item is SelectedListItem) {
              list.add(item.name);
            }
          }
          carmodell!.text = list.join(", ");
          gkBilerannonse.currentState?.validate();
          update();
        },
        enableMultipleSelection: false,
      ),
    ).showModal(context);
    update();
  }
//////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////

  List<SelectedListItem> xpeng = [
    SelectedListItem(name: "G3"),
    SelectedListItem(name: "G3i"),
    SelectedListItem(name: "G9"),
    SelectedListItem(name: "P5"),
    SelectedListItem(name: "P7"),
    SelectedListItem(name: "Andre"),
  ];

  void showDropdownXPeng(context) {
    DropDownState(
      DropDown(
        searchHintText: "Søk i ${carmerke!.text} modeller",
        bottomSheetTitle: Text(
          "XPeng modell",
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        dropDownBackgroundColor: Myisellcolors.hvit,
        clearButtonChild: Text(
          'Nullstill',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.red),
        ),
        submitButtonChild: Text(
          'Ferdig',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.green),
        ),
        data: xpeng,
        selectedItems: (List<dynamic> selectedLista) {
          List<String> list = [];
          for (var item in selectedLista) {
            if (item is SelectedListItem) {
              list.add(item.name);
            }
          }
          carmodell!.text = list.join(", ");
          gkBilerannonse.currentState?.validate();
          update();
        },
        enableMultipleSelection: false,
      ),
    ).showModal(context);
    update();
  }
//////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////

  List<SelectedListItem> zd = [
    SelectedListItem(name: "D1"),
    SelectedListItem(name: "Andre"),
  ];

  void showDropdownZD(context) {
    DropDownState(
      DropDown(
        searchHintText: "Søk i ${carmerke!.text} modeller",
        bottomSheetTitle: Text(
          "ZD modell",
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        dropDownBackgroundColor: Myisellcolors.hvit,
        clearButtonChild: Text(
          'Nullstill',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.red),
        ),
        submitButtonChild: Text(
          'Ferdig',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.green),
        ),
        data: zd,
        selectedItems: (List<dynamic> selectedLista) {
          List<String> list = [];
          for (var item in selectedLista) {
            if (item is SelectedListItem) {
              list.add(item.name);
            }
          }
          carmodell!.text = list.join(", ");
          gkBilerannonse.currentState?.validate();
          update();
        },
        enableMultipleSelection: false,
      ),
    ).showModal(context);
    update();
  }
//////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////

  List<SelectedListItem> andre = [
    SelectedListItem(name: "Andre"),
  ];

  void showDropdownAndre(context) {
    DropDownState(
      DropDown(
        searchHintText: "Søk i ${carmerke!.text} modeller",
        bottomSheetTitle: Text(
          "Andre modell",
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        dropDownBackgroundColor: Myisellcolors.hvit,
        clearButtonChild: Text(
          'Nullstill',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.red),
        ),
        submitButtonChild: Text(
          'Ferdig',
          style: GoogleFonts.roboto(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.green),
        ),
        data: andre,
        selectedItems: (List<dynamic> selectedLista) {
          List<String> list = [];
          for (var item in selectedLista) {
            if (item is SelectedListItem) {
              list.add(item.name);
            }
          }
          carmodell!.text = list.join(", ");
          gkBilerannonse.currentState?.validate();
          update();
        },
        enableMultipleSelection: false,
      ),
    ).showModal(context);
    update();
  }
//////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////
}
