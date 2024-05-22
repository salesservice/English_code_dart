import 'dart:io';

import 'package:drop_down_list/drop_down_list.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_isell_new/core/classes/statusrequest.dart';
import 'package:flutter_isell_new/core/constants/sellx_colors.dart';
import 'package:flutter_isell_new/core/constants/sellx_route_names.dart';
import 'package:flutter_isell_new/core/functions/handling_data.dart';
import 'package:flutter_isell_new/core/services/services.dart';
import 'package:flutter_isell_new/data/items_data/motorcycle_data.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class AddMCAnnonseController extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;
  GlobalKey<FormState> gkMCerannonse = GlobalKey<FormState>();
  MyServices myServices = Get.find();
  MotorcycleItemData motorcycleItemData = MotorcycleItemData(Get.find());

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
        imageQuality: 70, // Set the image quality (0 to 100)
      );
      if (pickedFiles != null && pickedFiles.isNotEmpty) {
        // Return the list of selected images
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
  String? motorsykkeltypene;

  var tilstandmc = "".obs;
  var mcenstari = "".obs;
  var mcdrivstoffet = "".obs;
  var fritakfraomreg = "".obs;
  var dataValue = "Til salgs".obs;
  var biltistandrapport = "".obs;
  var bilvedlikeholdsprogram = "".obs;

  bool clicked = false;

  final RxInt totalpris = 0.obs;
  void updateTotalPrice() {
    double prisValue = double.tryParse(pris?.text ?? '') ?? 0.0;
    double omregnetavgiftValue =
        double.tryParse(mcomregavgift?.text ?? '') ?? 0.0;
    totalpris.value = (prisValue + omregnetavgiftValue).round();

    update();
  }

  RxList<String> mcstari = ["Norge", "Utlandet"].obs;
  void onChangedCarStari(value) {
    mcenstari.value = value as String;
    mcparkerti!.text = value;
    gkMCerannonse.currentState?.validate();
    update();
  }

  RxList<String> fritak = ["Ja", "Nei"].obs;
  void onChangedCaromregFritak(value) {
    fritakfraomreg.value = value as String;
    mcomregfritak!.text = value;
    gkMCerannonse.currentState?.validate();
    update();
  }

  TextEditingController? name;
  TextEditingController? overskrift;
  TextEditingController? pris;
  TextEditingController? merke;
  TextEditingController? land;
  TextEditingController? postnummer;
  TextEditingController? itemtistand;
  TextEditingController? sellxbeskrivelse;
  TextEditingController? poststed;
  TextEditingController? gateadresse;
  TextEditingController? telefonnummer;
  TextEditingController? salgleie;
  TextEditingController? itemaktiv;
  TextEditingController? mctype;
  TextEditingController? mcregnummer;
  TextEditingController? mcchassisnr;
  TextEditingController? mcmodellar;
  TextEditingController? mcmerke;
  TextEditingController? mcmodell;
  TextEditingController? motorsykkeltype;
  TextEditingController? mcslagvolumiccm;
  TextEditingController? mchk;
  TextEditingController? mcdrivstoff;
  TextEditingController? mcvektkg;
  TextEditingController? mcfarge;
  TextEditingController? mcutstyr;
  TextEditingController? mckilometerstand;
  TextEditingController? mcantalleiere;
  TextEditingController? mctilstandsrappoet;
  TextEditingController? mcvelikeholdsprogram;
  TextEditingController? mcgjenvarendegarantimnd;
  TextEditingController? mcgjenvarendegarantikm;
  TextEditingController? mcvideo;
  TextEditingController? mcbeskrivelse;
  TextEditingController? mcomregavgift;
  TextEditingController? mcomregfritak;
  TextEditingController? mcparkerti;
  TextEditingController? itemselger;
  TextEditingController? kontaktperson;
//////////leies
  TextEditingController? startleiecar;
  TextEditingController? manedsbelopcar;
  TextEditingController? gjenvarendekjoredistanse;
  TextEditingController? debitorskiftegebyrikr;
  TextEditingController? avtalensutlopsdato;
  TextEditingController? antallmonedertilavtalenutloper;
  TextEditingController? leieselskap;
  TextEditingController? stedforlevering;

  AddMCAnnonseController() {
    annonsetype = "Selge";
    motorsykkeltypene = "Motorsykkel";
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

  VelgMCType(String type) {
    motorsykkeltypene = type;

    if (type == "Motorsykkel") {
      dataValue.value = "Motorsykkel";
    } else if (type == "Moped") {
      dataValue.value = "Moped";
    } else if (type == "ATV") {
      dataValue.value = "ATV";
    } else if (type == "Snøscooter") {
      dataValue.value = "Snøscooter";
    }

    if (dataValue.value == "Motorsykkel") {
      mctype!.text = "Motorsykkel";
    } else if (dataValue.value == "Moped") {
      mctype!.text = "Moped";
    } else if (dataValue.value == "ATV") {
      mctype!.text = "ATV";
    } else if (dataValue.value == "Snøscooter") {
      mctype!.text = "Snøscooter";
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
    itemtistand = TextEditingController();
    salgleie = TextEditingController();
    itemaktiv = TextEditingController();
    mctype = TextEditingController();
    mcregnummer = TextEditingController();
    mcchassisnr = TextEditingController();
    mcmodellar = TextEditingController();
    mcmerke = TextEditingController();
    mcmodell = TextEditingController();
    motorsykkeltype = TextEditingController();
    mcslagvolumiccm = TextEditingController();
    mchk = TextEditingController();
    mcdrivstoff = TextEditingController();
    mcvektkg = TextEditingController();
    mcfarge = TextEditingController();
    mcutstyr = TextEditingController();
    mckilometerstand = TextEditingController();
    mcantalleiere = TextEditingController();
    mctilstandsrappoet = TextEditingController();
    mcvelikeholdsprogram = TextEditingController();
    mcgjenvarendegarantimnd = TextEditingController();
    mcgjenvarendegarantikm = TextEditingController();
    mcvideo = TextEditingController();
    mcbeskrivelse = TextEditingController();
    mcomregavgift = TextEditingController();
    mcomregfritak = TextEditingController();
    mcparkerti = TextEditingController();
    itemselger = TextEditingController();
    kontaktperson = TextEditingController();
//////////leie
    startleiecar = TextEditingController();
    manedsbelopcar = TextEditingController();
    gjenvarendekjoredistanse = TextEditingController();
    debitorskiftegebyrikr = TextEditingController();
    avtalensutlopsdato = TextEditingController();
    antallmonedertilavtalenutloper = TextEditingController();
    leieselskap = TextEditingController();
    stedforlevering = TextEditingController();
  }

  @override
  void onInit() {
    initialData();

    super.onInit();
  }

  addMCAnnonseData() async {
    var formdata = gkMCerannonse.currentState;
    if (formdata!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await motorcycleItemData.addData(
        myServices.sharedPreferences.getInt("id")!,
        5,
        "1",
        overskrift!.text,
        name!.text,
        pris!.text,
        merke!.text,
        itemtistand!.text,
        sellxbeskrivelse!.text,
        land!.text,
        postnummer!.text,
        poststed!.text,
        gateadresse!.text,
        telefonnummer!.text,
        salgleie!.text,
        mctype!.text,
        mcregnummer!.text,
        mcchassisnr!.text,
        mcmodellar!.text,
        mcmerke!.text,
        mcmodell!.text,
        motorsykkeltype!.text,
        mcslagvolumiccm!.text,
        mchk!.text,
        mcdrivstoff!.text,
        mcvektkg!.text,
        mcfarge!.text,
        mcutstyr!.text,
        mckilometerstand!.text,
        mcantalleiere!.text,
        mctilstandsrappoet!.text,
        mcvelikeholdsprogram!.text,
        mcgjenvarendegarantimnd!.text,
        mcgjenvarendegarantikm!.text,
        mcvideo!.text,
        mcbeskrivelse!.text,
        mcomregavgift!.text,
        mcomregfritak!.text,
        mcparkerti!.text,
        itemselger!.text,
        kontaktperson!.text,
        startleiecar!.text,
        manedsbelopcar!.text,
        gjenvarendekjoredistanse!.text,
        debitorskiftegebyrikr!.text,
        avtalensutlopsdato!.text,
        antallmonedertilavtalenutloper!.text,
        leieselskap!.text,
        stedforlevering!.text,
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

  List<SelectedListItem> mcmerkene = [
    SelectedListItem(name: "4Speed"),
    SelectedListItem(name: "4W-Moto"),
    SelectedListItem(name: "AIE"),
    SelectedListItem(name: "AJS"),
    SelectedListItem(name: "ARGO"),
    SelectedListItem(name: "ATZ"),
    SelectedListItem(name: "Access"),
    SelectedListItem(name: "Adiva"),
    SelectedListItem(name: "Adly"),
    SelectedListItem(name: "Aenon"),
    SelectedListItem(name: "Aeon"),
    SelectedListItem(name: "Aero"),
    SelectedListItem(name: "Agirra"),
    SelectedListItem(name: "AIMA"),
    SelectedListItem(name: "Aixam"),
    SelectedListItem(name: "AJP"),
    SelectedListItem(name: "Allroad"),
    SelectedListItem(name: "Alpina"),
    SelectedListItem(name: "Altina"),
    SelectedListItem(name: "American Iron Horse"),
    SelectedListItem(name: "Apex"),
    SelectedListItem(name: "Aprilia"),
    SelectedListItem(name: "Arctic-cat"),
    SelectedListItem(name: "Ariel"),
    SelectedListItem(name: "Atala"),
    SelectedListItem(name: "Atex"),
    SelectedListItem(name: "BMW"),
    SelectedListItem(name: "BSA"),
    SelectedListItem(name: "Bajaj"),
    SelectedListItem(name: "Baotian"),
    SelectedListItem(name: "Barossa"),
    SelectedListItem(name: "Benelli"),
    SelectedListItem(name: "Benghe"),
    SelectedListItem(name: "Beta"),
    SelectedListItem(name: "Big Dog"),
    SelectedListItem(name: "Bimota"),
    SelectedListItem(name: "Bluroc"),
    SelectedListItem(name: "Bombardier"),
    SelectedListItem(name: "Boss Hoss"),
    SelectedListItem(name: "Bourget"),
    SelectedListItem(name: "Brudeli"),
    SelectedListItem(name: "Buell"),
    SelectedListItem(name: "Bullit"),
    SelectedListItem(name: "Bultaco"),
    SelectedListItem(name: "Bunker Trike"),
    SelectedListItem(name: "Cake"),
    SelectedListItem(name: "Casalini"),
    SelectedListItem(name: "CFMOTO"),
    SelectedListItem(name: "Comarth"),
    SelectedListItem(name: "CPI"),
    SelectedListItem(name: "Cagiva"),
    SelectedListItem(name: "Can-Am"),
    SelectedListItem(name: "Cectek"),
    SelectedListItem(name: "Chatenet"),
    SelectedListItem(name: "Classic"),
    SelectedListItem(name: "Club Cadet"),
    SelectedListItem(name: "Cobra"),
    SelectedListItem(name: "Corvus"),
    SelectedListItem(name: "Crescent"),
    SelectedListItem(name: "DTV Shredder"),
    SelectedListItem(name: "Daelim"),
    SelectedListItem(name: "Dayun"),
    SelectedListItem(name: "Derbi"),
    SelectedListItem(name: "Di Blasi"),
    SelectedListItem(name: "Dinli"),
    SelectedListItem(name: "Ducati"),
    SelectedListItem(name: "E-tob"),
    SelectedListItem(name: "Electric Motion"),
    SelectedListItem(name: "Elo"),
    SelectedListItem(name: "EMC"),
    SelectedListItem(name: "Enduro"),
    SelectedListItem(name: "Energica"),
    SelectedListItem(name: "Estrima"),
    SelectedListItem(name: "Euroscooter"),
    SelectedListItem(name: "Evoride"),
    SelectedListItem(name: "Eznen"),
    SelectedListItem(name: "F7"),
    SelectedListItem(name: "FH"),
    SelectedListItem(name: "FYM"),
    SelectedListItem(name: "Fantic"),
    SelectedListItem(name: "Furia"),
    SelectedListItem(name: "Gamax"),
    SelectedListItem(name: "Garelli"),
    SelectedListItem(name: "GasGas"),
    SelectedListItem(name: "Generic"),
    SelectedListItem(name: "Gilera"),
    SelectedListItem(name: "Goes"),
    SelectedListItem(name: "Govecs"),
    SelectedListItem(name: "Hammer"),
    SelectedListItem(name: "Hanway"),
    SelectedListItem(name: "Harley-Davidson"),
    SelectedListItem(name: "Hero"),
    SelectedListItem(name: "Hecht"),
    SelectedListItem(name: "Highland"),
    SelectedListItem(name: "Hisun"),
    SelectedListItem(name: "Honda"),
    SelectedListItem(name: "Hooper"),
    SelectedListItem(name: "Horwin"),
    SelectedListItem(name: "Husaberg"),
    SelectedListItem(name: "Husqvarna"),
    SelectedListItem(name: "Hyosung"),
    SelectedListItem(name: "INDIAN"),
    SelectedListItem(name: "Iso Milano"),
    SelectedListItem(name: "Italjet"),
    SelectedListItem(name: "Jawa/CZ"),
    SelectedListItem(name: "JCB"),
    SelectedListItem(name: "Jinling"),
    SelectedListItem(name: "John Deere"),
    SelectedListItem(name: "Jonway"),
    SelectedListItem(name: "Jotagas"),
    SelectedListItem(name: "Junak"),
    SelectedListItem(name: "KTM"),
    SelectedListItem(name: "Kainuo"),
    SelectedListItem(name: "Kawasaki"),
    SelectedListItem(name: "Kayo"),
    SelectedListItem(name: "Kazuma"),
    SelectedListItem(name: "Keeway"),
    SelectedListItem(name: "Kinroad"),
    SelectedListItem(name: "Knievel Cycles"),
    SelectedListItem(name: "Kreidler"),
    SelectedListItem(name: "Kubota"),
    SelectedListItem(name: "Kudaki"),
    SelectedListItem(name: "Kymco"),
    SelectedListItem(name: "Lambretta"),
    SelectedListItem(name: "Lauge Jensen"),
    SelectedListItem(name: "Laverda"),
    SelectedListItem(name: "Lem"),
    SelectedListItem(name: "Lifan"),
    SelectedListItem(name: "Ligir"),
    SelectedListItem(name: "Lingben"),
    SelectedListItem(name: "Linhai"),
    SelectedListItem(name: "LMX"),
    SelectedListItem(name: "Loncin"),
    SelectedListItem(name: "Longjia"),
    SelectedListItem(name: "Lvneng"),
    SelectedListItem(name: "Lynx"),
    SelectedListItem(name: "MGB"),
    SelectedListItem(name: "MV Agusta"),
    SelectedListItem(name: "MZ"),
    SelectedListItem(name: "Malaguti"),
    SelectedListItem(name: "Mancini"),
    SelectedListItem(name: "Mademoto"),
    SelectedListItem(name: "Maxgass"),
    SelectedListItem(name: "Maxus"),
    SelectedListItem(name: "Mega"),
    SelectedListItem(name: "Megelli"),
    SelectedListItem(name: "Meijs"),
    SelectedListItem(name: "MEV"),
    SelectedListItem(name: "Microcar"),
    SelectedListItem(name: "Mikilon"),
    SelectedListItem(name: "Mobelli"),
    SelectedListItem(name: "Moden"),
    SelectedListItem(name: "Mondial"),
    SelectedListItem(name: "Moto Guzzi"),
    SelectedListItem(name: "Moto Morini Corsarino"),
    SelectedListItem(name: "Moto Zeta"),
    SelectedListItem(name: "MotoNordic"),
    SelectedListItem(name: "MotorMoro"),
    SelectedListItem(name: "Motorbike"),
    SelectedListItem(name: "Motorhispania"),
    SelectedListItem(name: "Motrac"),
    SelectedListItem(name: "NIU"),
    SelectedListItem(name: "Norton"),
    SelectedListItem(name: "NSU"),
    SelectedListItem(name: "Nzita"),
    SelectedListItem(name: "Ockelbo"),
    SelectedListItem(name: "Oset"),
    SelectedListItem(name: "Odes"),
    SelectedListItem(name: "Ossa"),
    SelectedListItem(name: "Panthera"),
    SelectedListItem(name: "Paxster"),
    SelectedListItem(name: "Paoletti"),
    SelectedListItem(name: "Peugeot"),
    SelectedListItem(name: "Pgo"),
    SelectedListItem(name: "Piaggio"),
    SelectedListItem(name: "Pioneer"),
    SelectedListItem(name: "Pitpro"),
    SelectedListItem(name: "Polaris"),
    SelectedListItem(name: "Proffy"),
    SelectedListItem(name: "Puch"),
    SelectedListItem(name: "QINGQI"),
    SelectedListItem(name: "Qooder"),
    SelectedListItem(name: "Qroad"),
    SelectedListItem(name: "Quaddy"),
    SelectedListItem(name: "Quadro"),
    SelectedListItem(name: "Quark"),
    SelectedListItem(name: "RAM"),
    SelectedListItem(name: "Redline"),
    SelectedListItem(name: "Regal Raptor"),
    SelectedListItem(name: "RGNT"),
    SelectedListItem(name: "Rieju"),
    SelectedListItem(name: "Romet"),
    SelectedListItem(name: "Royal Enfield"),
    SelectedListItem(name: "SMC"),
    SelectedListItem(name: "SYM"),
    SelectedListItem(name: "Sachs"),
    SelectedListItem(name: "Saxon"),
    SelectedListItem(name: "Scorpa"),
    SelectedListItem(name: "Secma"),
    SelectedListItem(name: "Segway"),
    SelectedListItem(name: "Senda"),
    SelectedListItem(name: "Sherco"),
    SelectedListItem(name: "Silence"),
    SelectedListItem(name: "Simson"),
    SelectedListItem(name: "Skandic"),
    SelectedListItem(name: "Ski-doo"),
    SelectedListItem(name: "Skyteam"),
    SelectedListItem(name: "Somoto"),
    SelectedListItem(name: "Sonik"),
    SelectedListItem(name: "Starway"),
    SelectedListItem(name: "Streetsmart"),
    SelectedListItem(name: "Super Moto"),
    SelectedListItem(name: "Super Soco"),
    SelectedListItem(name: "Sur Ron"),
    SelectedListItem(name: "Suzuki"),
    SelectedListItem(name: "SWM"),
    SelectedListItem(name: "Talaria"),
    SelectedListItem(name: "Taotao"),
    SelectedListItem(name: "Tazzari"),
    SelectedListItem(name: "Ten7"),
    SelectedListItem(name: "Tempo"),
    SelectedListItem(name: "TGB"),
    SelectedListItem(name: "Thunder by City Wheels"),
    SelectedListItem(name: "Thundercat"),
    SelectedListItem(name: "Tinger"),
    SelectedListItem(name: "TM"),
    SelectedListItem(name: "Tms"),
    SelectedListItem(name: "Tomos"),
    SelectedListItem(name: "Torrot"),
    SelectedListItem(name: "Triumph"),
    SelectedListItem(name: "Tromox"),
    SelectedListItem(name: "TRS Motorcycles"),
    SelectedListItem(name: "Ural"),
    SelectedListItem(name: "URBET"),
    SelectedListItem(name: "V3"),
    SelectedListItem(name: "V8 Choppers"),
    SelectedListItem(name: "VGA"),
    SelectedListItem(name: "Vectra"),
    SelectedListItem(name: "Veli"),
    SelectedListItem(name: "VERTIGO"),
    SelectedListItem(name: "Vespa"),
    SelectedListItem(name: "Viarelli"),
    SelectedListItem(name: "Victory"),
    SelectedListItem(name: "VOGE"),
    SelectedListItem(name: "XEL"),
    SelectedListItem(name: "X-PRO"),
    SelectedListItem(name: "XWAY"),
    SelectedListItem(name: "Yadea"),
    SelectedListItem(name: "Yamaha"),
    SelectedListItem(name: "Yamoto"),
    SelectedListItem(name: "Yiying"),
    SelectedListItem(name: "Zero"),
    SelectedListItem(name: "Znen"),
    SelectedListItem(name: "Zontes"),
    SelectedListItem(name: "Zundapp"),
    SelectedListItem(name: "Andre"),
  ];

  void showDropdownMCMerke(context) {
    DropDownState(
      DropDown(
        searchHintText: "Søk",
        bottomSheetTitle: Container(
          padding: const EdgeInsets.only(top: 15, bottom: 5),
          child: Text(
            "Mereke",
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
        data: mcmerkene,
        selectedItems: (List<dynamic> selectedList) {
          List<String> list = [];
          for (var item in selectedList) {
            if (item is SelectedListItem) {
              list.add(item.name);
            }
          }
          mcmerke!.text = list.join(", ");
          gkMCerannonse.currentState?.validate();
          update();
        },
        enableMultipleSelection: false,
      ),
    ).showModal(context);
    update();
  }

  List<SelectedListItem> typemotorskler = [
    SelectedListItem(name: "Chopper"),
    SelectedListItem(name: "Cruiser"),
    SelectedListItem(name: "Classic/Nakne"),
    SelectedListItem(name: "Cross/Enduro/Trial"),
    SelectedListItem(name: "Custom"),
    SelectedListItem(name: "Lett MC"),
    SelectedListItem(name: "Offroad/Motard"),
    SelectedListItem(name: "Scooter"),
    SelectedListItem(name: "Sidevogn"),
    SelectedListItem(name: "Sport"),
    SelectedListItem(name: "Touring"),
    SelectedListItem(name: "Trike"),
    SelectedListItem(name: "Veteran"),
    SelectedListItem(name: "Andre"),
  ];

  void showDropdownTypeMC(context) {
    DropDownState(
      DropDown(
        searchHintText: "Søk",
        bottomSheetTitle: Container(
          padding: const EdgeInsets.only(top: 15, bottom: 5),
          child: Text(
            "Type MC",
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
        data: typemotorskler,
        selectedItems: (List<dynamic> selectedList) {
          List<String> list = [];
          for (var item in selectedList) {
            if (item is SelectedListItem) {
              list.add(item.name);
            }
          }
          motorsykkeltype!.text = list.join(", ");
          //gkMCerannonse.currentState?.validate();
          update();
        },
        enableMultipleSelection: false,
      ),
    ).showModal(context);
    update();
  }

  List<SelectedListItem> typemopeder = [
    SelectedListItem(name: "Moped"),
    SelectedListItem(name: "Scooter"),
  ];

  void showDropdownTypeMoped(context) {
    DropDownState(
      DropDown(
        searchHintText: "Søk",
        bottomSheetTitle: Container(
          padding: const EdgeInsets.only(top: 15, bottom: 5),
          child: Text(
            "Type moped",
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
        data: typemopeder,
        selectedItems: (List<dynamic> selectedList) {
          List<String> list = [];
          for (var item in selectedList) {
            if (item is SelectedListItem) {
              list.add(item.name);
            }
          }
          motorsykkeltype!.text = list.join(", ");
          //gkMCerannonse.currentState?.validate();
          update();
        },
        enableMultipleSelection: false,
      ),
    ).showModal(context);
    update();
  }

  List<SelectedListItem> mcutstyrne = [
    SelectedListItem(name: "ABS"),
    SelectedListItem(name: "Traction control"),
    SelectedListItem(name: "Varmeholker"),
    SelectedListItem(name: "Varmesete"),
    SelectedListItem(name: "12V uttak"),
    SelectedListItem(name: "Høyttalere"),
    SelectedListItem(name: "Sidevesker"),
    SelectedListItem(name: "Radio/CD/MP3"),
    SelectedListItem(name: "Handelbeskyttere"),
    SelectedListItem(name: "Tankpad"),
    SelectedListItem(name: "Tanktrekk"),
    SelectedListItem(name: "Tankveske"),
    SelectedListItem(name: "Toppveske"),
    SelectedListItem(name: "Gaffelveske"),
    SelectedListItem(name: "Vindskjerm"),
    SelectedListItem(name: "Alarm"),
    SelectedListItem(name: "Bagasjebrett"),
    SelectedListItem(name: "Solodeksel"),
    SelectedListItem(name: "Velteklosser"),
    SelectedListItem(name: "Koppholder"),
    SelectedListItem(name: "Ekstra kåper"),
    SelectedListItem(name: "Intercom"),
    SelectedListItem(name: "Overtrekk"),
    SelectedListItem(name: "Navigasjonssystem"),
    SelectedListItem(name: "Effektanlegg"),
    SelectedListItem(name: "Xenon lys"),
    SelectedListItem(name: "Cruise control"),
    SelectedListItem(name: "Kjørecomputer"),
    SelectedListItem(name: "Slepekrok"),
    SelectedListItem(name: "Revers"),
    SelectedListItem(name: "Aut. demperjustering"),
    SelectedListItem(name: "Midtstøtte"),
    SelectedListItem(name: "LED lys"),
    SelectedListItem(name: "Adre"),
  ];

  void showDropdownMCutstyr(context) {
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
        data: mcutstyrne,
        selectedItems: (List<dynamic> selectedList) {
          List<String> list = [];
          for (var item in selectedList) {
            if (item is SelectedListItem) {
              list.add(item.name);
            }
          }
          mcutstyr!.text = list.join(", ");
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
}
