import 'dart:io';

import 'package:drop_down_list/drop_down_list.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_isell_new/core/classes/statusrequest.dart';
import 'package:flutter_isell_new/core/constants/sellx_colors.dart';
import 'package:flutter_isell_new/core/constants/sellx_route_names.dart';
import 'package:flutter_isell_new/core/functions/handling_data.dart';
import 'package:flutter_isell_new/core/services/services.dart';
import 'package:flutter_isell_new/data/items_data/property_data.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class AddBoligAnnonseController extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;
  GlobalKey<FormState> gkBoligannonse = GlobalKey<FormState>();
  MyServices myServices = Get.find();
  PropertyItemData propertyItemData = PropertyItemData(Get.find());

  final RxInt currentIndex = 0.obs;
  final RxInt totalImages = 0.obs;

  void updateCounter() {
    currentIndex.value = pageController.page?.round() ?? 0;
    totalImages.value = imagenames.length;
    update();
  }

  final RxInt totalpris = 0.obs;
  void updateTotalPrice() {
    // Extracting numeric values from controllers
    double prisValue = double.tryParse(pris?.text ?? '') ?? 0.0;
    double boligomkostningerValue =
        double.tryParse(boligomkostninger?.text ?? '') ?? 0.0;
    double andelfellesgjeldValue =
        double.tryParse(andelfellesgjeld?.text ?? '') ?? 0.0;

    // Calculating the total price
    totalpris.value =
        (prisValue + boligomkostningerValue + andelfellesgjeldValue).round();
  }

  final PageController pageController = PageController();

  List<File?> imagenames = [];

  chooseImages() async {
    imagenames = await imageUploadGallery();
    updateCounter();
    update();
  }

  bool clicked = false;

  Future<List<File?>> imageUploadGallery() async {
    try {
      final pickedFiles = await ImagePicker().pickMultiImage(
        imageQuality: 70, // Set the image quality (0 to 100)
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
  var selectedland = "".obs;
  var eieform = "".obs;
  var energikarakter = "".obs;
  var oppvarmingskarakter = "".obs;
  var moblering = "".obs;
  var dyrtillate = "".obs;

  var dataValue = "Til salgs".obs;

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
  TextEditingController? boligadkomst;
  TextEditingController? boligbeliggenhet;
  TextEditingController? boligtype;
  TextEditingController? boligeieform;
  TextEditingController? boligkommunenr;
  TextEditingController? boliggarsnummer;
  TextEditingController? boligbruksnummer;
  TextEditingController? boligseksjonsnr;
  TextEditingController? boligfestenummer;
  TextEditingController? leilighetsnummer;
  TextEditingController? boligbruksareal;
  TextEditingController? primaarrom;
  TextEditingController? flateareal;
  TextEditingController? boligarealbeskribelse;
  TextEditingController? boligbyggar;
  TextEditingController? boligrenovertar;
  TextEditingController? boligenergikarakter;
  TextEditingController? boligoppvarmingskarakter;
  TextEditingController? antallsoverom;
  TextEditingController? antallstuer;
  TextEditingController? antallrom;
  TextEditingController? boligetasje;
  TextEditingController? totaletasje;
  TextEditingController? borettslagetsnavn;
  TextEditingController? borettslagetseier;
  TextEditingController? borettslagetsorgnr;
  TextEditingController? borettslagetsandelnr;
  TextEditingController? tomtareal;
  TextEditingController? festeaar;
  TextEditingController? festeavgift;
  TextEditingController? felleskostnader;
  TextEditingController? felleskostnaderetteravdper;
  TextEditingController? felleskostnaderinkluderer;
  TextEditingController? formuesverdi;
  TextEditingController? boligomkostninger;
  TextEditingController? omkostningerinkluderer;
  TextEditingController? andelfellesgjeld;
  TextEditingController? verditakst;
  TextEditingController? lanelakst;
  TextEditingController? andelfellesformue;
  TextEditingController? kommunaleavgiftar;
  TextEditingController? eiendomsskattar;
  TextEditingController? forskjopsrett;
  TextEditingController? boligbeskrivelse;
  TextEditingController? boligtilleggsinfo;
  TextEditingController? boligvideolink;
  TextEditingController? boligurllink;
  TextEditingController? visningdato;
  TextEditingController? fraklokke;
  TextEditingController? tilklokke;
  TextEditingController? visningmerknad;
  TextEditingController? boligtelefon;
  TextEditingController? kontaktperson;
  TextEditingController? boliglokalomrade;
  TextEditingController? itemselger;
  TextEditingController? apentareal;
  TextEditingController? mobleringleie;
  TextEditingController? dyrtillat;
  TextEditingController? depositumleie;
  TextEditingController? inkludertileie;
  TextEditingController? leiesfra;
  TextEditingController? leiestil;
  TextEditingController? boligfasiliteter;
  TextEditingController? fasiliteterleie;

  AddBoligAnnonseController() {
    annonsetype = "Selge";
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
    update();

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
    boligadkomst = TextEditingController();
    boligbeliggenhet = TextEditingController();
    boligtype = TextEditingController();
    boligeieform = TextEditingController();
    boligkommunenr = TextEditingController();
    boliggarsnummer = TextEditingController();
    boligbruksnummer = TextEditingController();
    boligseksjonsnr = TextEditingController();
    boligfestenummer = TextEditingController();
    leilighetsnummer = TextEditingController();
    /////////////////////////////////////////////
    boligbruksareal = TextEditingController();
    primaarrom = TextEditingController();
    flateareal = TextEditingController();
    boligarealbeskribelse = TextEditingController();
    boligbyggar = TextEditingController();
    boligrenovertar = TextEditingController();
    boligenergikarakter = TextEditingController();
    boligoppvarmingskarakter = TextEditingController();
    antallsoverom = TextEditingController();
    antallstuer = TextEditingController();
    antallrom = TextEditingController();
    boligetasje = TextEditingController();
    totaletasje = TextEditingController();
    borettslagetsnavn = TextEditingController();
    borettslagetseier = TextEditingController();
    borettslagetsorgnr = TextEditingController();
    borettslagetsandelnr = TextEditingController();
    tomtareal = TextEditingController();
    festeaar = TextEditingController();
    festeavgift = TextEditingController();
    felleskostnader = TextEditingController();
    felleskostnaderetteravdper = TextEditingController();
    felleskostnaderinkluderer = TextEditingController();
    formuesverdi = TextEditingController();
    boligomkostninger = TextEditingController();
    omkostningerinkluderer = TextEditingController();
    andelfellesgjeld = TextEditingController();
    verditakst = TextEditingController();
    lanelakst = TextEditingController();
    andelfellesformue = TextEditingController();
    kommunaleavgiftar = TextEditingController();
    eiendomsskattar = TextEditingController();
    forskjopsrett = TextEditingController();
    boligbeskrivelse = TextEditingController();
    boligtilleggsinfo = TextEditingController();
    boligvideolink = TextEditingController();
    boligurllink = TextEditingController();
    visningdato = TextEditingController();
    fraklokke = TextEditingController();
    tilklokke = TextEditingController();
    visningmerknad = TextEditingController();
    boligtelefon = TextEditingController();
    kontaktperson = TextEditingController();
    boliglokalomrade = TextEditingController();
    itemselger = TextEditingController();
    apentareal = TextEditingController();
    mobleringleie = TextEditingController();
    dyrtillat = TextEditingController();
    depositumleie = TextEditingController();
    inkludertileie = TextEditingController();
    leiesfra = TextEditingController();
    leiestil = TextEditingController();
    boligfasiliteter = TextEditingController();
    fasiliteterleie = TextEditingController();
  }

  @override
  void onInit() {
    initialData();

    super.onInit();
  }

  addBoligAnnonseData() async {
    var formdata = gkBoligannonse.currentState;
    if (formdata!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await propertyItemData.addData(
        myServices.sharedPreferences.getInt("id")!,
        2,
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
        boligadkomst!.text,
        boligbeliggenhet!.text,
        boligtype!.text,
        boligeieform!.text,
        boligkommunenr!.text,
        boliggarsnummer!.text,
        boligbruksnummer!.text,
        boligseksjonsnr!.text,
        boligfestenummer!.text,
        leilighetsnummer!.text,
        boligbruksareal!.text,
        primaarrom!.text,
        flateareal!.text,
        boligarealbeskribelse!.text,
        boligbyggar!.text,
        boligrenovertar!.text,
        boligenergikarakter!.text,
        boligoppvarmingskarakter!.text,
        antallsoverom!.text,
        antallstuer!.text,
        antallrom!.text,
        boligetasje!.text,
        totaletasje!.text,
        borettslagetsnavn!.text,
        borettslagetseier!.text,
        borettslagetsorgnr!.text,
        borettslagetsandelnr!.text,
        tomtareal!.text,
        festeaar!.text,
        festeavgift!.text,
        felleskostnader!.text,
        felleskostnaderetteravdper!.text,
        felleskostnaderinkluderer!.text,
        formuesverdi!.text,
        boligomkostninger!.text,
        omkostningerinkluderer!.text,
        andelfellesgjeld!.text,
        verditakst!.text,
        lanelakst!.text,
        andelfellesformue!.text,
        kommunaleavgiftar!.text,
        eiendomsskattar!.text,
        forskjopsrett!.text,
        boligbeskrivelse!.text,
        boligtilleggsinfo!.text,
        boligvideolink!.text,
        boligurllink!.text,
        visningdato!.text,
        fraklokke!.text,
        tilklokke!.text,
        visningmerknad!.text,
        boligtelefon!.text,
        kontaktperson!.text,
        boliglokalomrade!.text,
        itemselger!.text,
        apentareal!.text,
        mobleringleie!.text,
        dyrtillat!.text,
        depositumleie!.text,
        inkludertileie!.text,
        leiesfra!.text,
        leiestil!.text,
        boligfasiliteter!.text,
        fasiliteterleie!.text,
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

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }

  List<SelectedListItem> fasiliteter = [
    SelectedListItem(name: "Aircondition"),
    SelectedListItem(name: "Balkong/Terrasse"),
    SelectedListItem(name: "Barnevennlig"),
    SelectedListItem(name: "Fellesvaskeri"),
    SelectedListItem(name: "Heis"),
    SelectedListItem(name: "Kabel-TV"),
    SelectedListItem(name: "Offentlig vann/kloakk"),
    SelectedListItem(name: "Peis"),
    SelectedListItem(name: "Sentralt"),
    SelectedListItem(name: "Vaktmester/vektertjeneste"),
    SelectedListItem(name: "Fiskemulighet"),
    SelectedListItem(name: "Alram"),
    SelectedListItem(name: "Takterrasse"),
    SelectedListItem(name: "Bredbåndstilknytning"),
    SelectedListItem(name: "Garasje/P-plass"),
    SelectedListItem(name: "Ingen gjenboere"),
    SelectedListItem(name: "Lademulighet"),
    SelectedListItem(name: "Moderne"),
    SelectedListItem(name: "Parkett"),
    SelectedListItem(name: "Rolig"),
    SelectedListItem(name: "Utsikt"),
    SelectedListItem(name: "Bademulighet"),
    SelectedListItem(name: "Turterreng"),
  ];

  void showDropdown(context) {
    DropDownState(
      DropDown(
        searchHintText: "Søk",
        bottomSheetTitle: Text(
          "Fasiliteter",
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
        data: fasiliteter,
        selectedItems: (List<dynamic> selectedList) {
          List<String> list = [];
          for (var item in selectedList) {
            if (item is SelectedListItem) {
              list.add(item.name);
            }
          }
          boligfasiliteter!.text = list.join(", ");
          update();
        },
        enableMultipleSelection: true,
      ),
    ).showModal(context);
    update();
  }

  List<SelectedListItem> fasiliteterleien = [
    SelectedListItem(name: "Aircondition"),
    SelectedListItem(name: "Alram"),
    SelectedListItem(name: "Balkong/Terrasse"),
    SelectedListItem(name: "Barnevennlig"),
    SelectedListItem(name: "Bredbåndstilknytning"),
    SelectedListItem(name: "Fellesvaskeri"),
    SelectedListItem(name: "Heis"),
    SelectedListItem(name: "Ingen gjenboere"),
    SelectedListItem(name: "Kabel-TV"),
    SelectedListItem(name: "Lademulighet"),
    SelectedListItem(name: "Livsløpsstandard"),
    SelectedListItem(name: "Moderne"),
    SelectedListItem(name: "Parkett"),
    SelectedListItem(name: "Peis"),
    SelectedListItem(name: "Rolig"),
    SelectedListItem(name: "Sentralt"),
    SelectedListItem(name: "Utsikt"),
    SelectedListItem(name: "Vaktmester"),
    SelectedListItem(name: "Turterreng"),
  ];

  void showDropdownleie(context) {
    DropDownState(
      DropDown(
        searchHintText: "Søk",
        bottomSheetTitle: Text(
          "Fasiliteter",
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
        data: fasiliteterleien,
        selectedItems: (List<dynamic> selectedLista) {
          List<String> list = [];
          for (var item in selectedLista) {
            if (item is SelectedListItem) {
              list.add(item.name);
            }
          }
          fasiliteterleie!.text = list.join(", ");
          update();
        },
        enableMultipleSelection: true,
      ),
    ).showModal(context);
    update();
  }
}
