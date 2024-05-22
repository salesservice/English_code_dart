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
import 'package:flutter_isell_new/data/items_data/boat_data.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class AddBoatAnnonseController extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;
  GlobalKey<FormState> gkBoaterannonse = GlobalKey<FormState>();
  MyServices myServices = Get.find();
  BoatItemsData boatItemsData = BoatItemsData(Get.find());

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
  String? bottype;

  var tilstandboat = "".obs;
  var botstari = "".obs;
  var mcdrivstoffet = "".obs;
  var fritakfraomreg = "".obs;
  var dataValue = "Til salgs".obs;
  var biltistandrapport = "".obs;
  var bilvedlikeholdsprogram = "".obs;
  var includermotorboat = "".obs;
  var motortypen = "".obs;
  var drivstoff = "".obs;
  var byggematrialet = "".obs;
  var boattypen = "".obs;

  bool clicked = false;

  final RxInt totalpris = 0.obs;
  void updateTotalPrice() {
    // ignore: unused_local_variable
    double prisValue = double.tryParse(pris?.text ?? '') ?? 0.0;
    // double omregnetavgiftValue =
    //  double.tryParse(mcomregavgift?.text ?? '') ?? 0.0;
    // totalpris.value = (prisValue + omregnetavgiftValue).round();

    update();
  }

  RxList<String> mcstari = ["Norge", "Utlandet"].obs;
  void onChangedBatStari(value) {
    botstari.value = value as String;
    boatliggeri!.text = value;
    gkBoaterannonse.currentState?.validate();
    update();
  }

  RxList<String> fritak = ["Ja", "Nei"].obs;
  void onChangedCaromregFritak(value) {
    fritakfraomreg.value = value as String;
    // mcomregfritak!.text = value;
    gkBoaterannonse.currentState?.validate();
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
  TextEditingController? boattype;
  TextEditingController? boatliggeri;
  TextEditingController? boatregnr;
  TextEditingController? boatmodellar;
  TextEditingController? boatmerke;
  TextEditingController? boatmotorinc;
  TextEditingController? boatmodell;
  TextEditingController? boatmotortype;
  TextEditingController? boatmotormerke;
  TextEditingController? boathk;
  TextEditingController? boatfartiknop;
  TextEditingController? boatdrivstoff;
  TextEditingController? boatlengdefot;
  TextEditingController? boatbreddecm;
  TextEditingController? boatdybdecm;
  TextEditingController? boatvektkg;
  TextEditingController? boatbyggematerial;
  TextEditingController? boatfarge;
  TextEditingController? boatsitteplasser;
  TextEditingController? boatsoveplasser;
  TextEditingController? boatlystall;
  TextEditingController? boatutstyr;
  TextEditingController? boatbeskrivevlse;
  TextEditingController? boatvideo;
  TextEditingController? itemselger;
  TextEditingController? kontaktperson;
  TextEditingController? boatbeliggenhet;

  AddBoatAnnonseController() {
    annonsetype = "Selge";
    bottype = "Båt";
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
    bottype = type;

    if (type == "Båt") {
      dataValue.value = "Båt";
    } else if (type == "Båtplass") {
      dataValue.value = "Båtplass";
    } else if (type == "Båtmotor") {
      dataValue.value = "Båtmotor";
    } else if (type == "Motordeler") {
      dataValue.value = "Motordeler";
    }

    if (dataValue.value == "Båt") {
      name!.text = "Båt";
    } else if (dataValue.value == "Båtplass") {
      name!.text = "Båtplass";
    } else if (dataValue.value == "Båtmotor") {
      name!.text = "Båtmotor";
    } else if (dataValue.value == "Motordeler") {
      name!.text = "Motordeler";
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
    boattype = TextEditingController();
    boatliggeri = TextEditingController();
    boatregnr = TextEditingController();
    boatmodellar = TextEditingController();
    boatmerke = TextEditingController();
    boatmotorinc = TextEditingController();
    boatmodell = TextEditingController();
    boatmotortype = TextEditingController();
    boatmotormerke = TextEditingController();
    boathk = TextEditingController();
    boatfartiknop = TextEditingController();
    boatdrivstoff = TextEditingController();
    boatlengdefot = TextEditingController();
    boatbreddecm = TextEditingController();
    boatdybdecm = TextEditingController();
    boatvektkg = TextEditingController();
    boatbyggematerial = TextEditingController();
    boatfarge = TextEditingController();
    boatsitteplasser = TextEditingController();
    boatsoveplasser = TextEditingController();
    boatlystall = TextEditingController();
    boatutstyr = TextEditingController();
    boatbeskrivevlse = TextEditingController();
    boatvideo = TextEditingController();
    itemselger = TextEditingController();
    kontaktperson = TextEditingController();
    boatbeliggenhet = TextEditingController();
  }

  @override
  void onInit() {
    initialData();

    super.onInit();
  }

  addBoatAnnonseData() async {
    var formdata = gkBoaterannonse.currentState;
    if (formdata!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await boatItemsData.addData(
        myServices.sharedPreferences.getInt("id")!,
        4,
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
        boattype!.text,
        boatliggeri!.text,
        boatregnr!.text,
        boatmodellar!.text,
        boatmerke!.text,
        boatmotorinc!.text,
        boatmodell!.text,
        boatmotortype!.text,
        boatmotormerke!.text,
        boathk!.text,
        boatfartiknop!.text,
        boatdrivstoff!.text,
        boatlengdefot!.text,
        boatbreddecm!.text,
        boatdybdecm!.text,
        boatvektkg!.text,
        boatbyggematerial!.text,
        boatfarge!.text,
        boatsitteplasser!.text,
        boatsoveplasser!.text,
        boatlystall!.text,
        boatutstyr!.text,
        boatbeskrivevlse!.text,
        boatvideo!.text,
        itemselger!.text,
        kontaktperson!.text,
        boatbeliggenhet!.text,
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

  List<SelectedListItem> boatmerkene = [
    SelectedListItem(name: "5,5 meter"),
    SelectedListItem(name: "8 meter"),
    SelectedListItem(name: "AB Inflatables"),
    SelectedListItem(name: "AB Yacht"),
    SelectedListItem(name: "Adonis"),
    SelectedListItem(name: "AGA"),
    SelectedListItem(name: "AL"),
    SelectedListItem(name: "AMT"),
    SelectedListItem(name: "Absolute"),
    SelectedListItem(name: "Accent"),
    SelectedListItem(name: "Achilles"),
    SelectedListItem(name: "Acquaviva"),
    SelectedListItem(name: "Adrenaline"),
    SelectedListItem(name: "Adriatic"),
    SelectedListItem(name: "Adventurer"),
    SelectedListItem(name: "Aermarine"),
    SelectedListItem(name: "Agder"),
    SelectedListItem(name: "Aicon"),
    SelectedListItem(name: "Airon Marine"),
    SelectedListItem(name: "Airship"),
    SelectedListItem(name: "Airship Ribs"),
    SelectedListItem(name: "Akerø"),
    SelectedListItem(name: "Albatross"),
    SelectedListItem(name: "Albin"),
    SelectedListItem(name: "Alfa"),
    SelectedListItem(name: "Aliboats"),
    SelectedListItem(name: "Alicraft"),
    SelectedListItem(name: "Alloycraft"),
    SelectedListItem(name: "Allures"),
    SelectedListItem(name: "Almarcraft"),
    SelectedListItem(name: "Alo"),
    SelectedListItem(name: "Alpha Boat"),
    SelectedListItem(name: "AluVenture"),
    SelectedListItem(name: "Alubat"),
    SelectedListItem(name: "Alucraft"),
    SelectedListItem(name: "Alufish"),
    SelectedListItem(name: "Alukin"),
    SelectedListItem(name: "AluMarin"),
    SelectedListItem(name: "Alunaut"),
    SelectedListItem(name: "Alunautic"),
    SelectedListItem(name: "Alutec"),
    SelectedListItem(name: "Ancas Queen"),
    SelectedListItem(name: "Andunge"),
    SelectedListItem(name: "Andy"),
    SelectedListItem(name: "Angler"),
    SelectedListItem(name: "Antaris"),
    SelectedListItem(name: "Anytec"),
    SelectedListItem(name: "Aphrodite"),
    SelectedListItem(name: "Apollo"),
    SelectedListItem(name: "Aqua"),
    SelectedListItem(name: "Aquamot"),
    SelectedListItem(name: "Aquador"),
    SelectedListItem(name: "Aqualela"),
    SelectedListItem(name: "Aquamar"),
    SelectedListItem(name: "Aquamarine"),
    SelectedListItem(name: "Aquapro"),
    SelectedListItem(name: "Aquaquad"),
    SelectedListItem(name: "Aquaquick"),
    SelectedListItem(name: "Aquarius"),
    SelectedListItem(name: "Aquaspirit"),
    SelectedListItem(name: "Aquatron"),
    SelectedListItem(name: "Aquid"),
    SelectedListItem(name: "Archambault"),
    SelectedListItem(name: "Arcona"),
    SelectedListItem(name: "Arctic"),
    SelectedListItem(name: "Arctic Blue"),
    SelectedListItem(name: "Ardea"),
    SelectedListItem(name: "Arendalsnekke"),
    SelectedListItem(name: "Argo"),
    SelectedListItem(name: "Arimar"),
    SelectedListItem(name: "Arksund"),
    SelectedListItem(name: "Armor"),
    SelectedListItem(name: "Arronet"),
    SelectedListItem(name: "Artekno"),
    SelectedListItem(name: "Artic"),
    SelectedListItem(name: "Arvor"),
    SelectedListItem(name: "Askeladden"),
    SelectedListItem(name: "Aspen"),
    SelectedListItem(name: "Astondoa"),
    SelectedListItem(name: "Athena"),
    SelectedListItem(name: "Athena 38"),
    SelectedListItem(name: "Atlantic"),
    SelectedListItem(name: "Atlantic Marine"),
    SelectedListItem(name: "Atlantis"),
    SelectedListItem(name: "Atomix"),
    SelectedListItem(name: "Australian high performance"),
    SelectedListItem(name: "Avance"),
    SelectedListItem(name: "Avanti"),
    SelectedListItem(name: "Aventura"),
    SelectedListItem(name: "Avon"),
    SelectedListItem(name: "Awtish"),
    SelectedListItem(name: "Axopar"),
    SelectedListItem(name: "Azimut"),
    SelectedListItem(name: "Azure"),
    SelectedListItem(name: "Azzurro"),
    SelectedListItem(name: "BAJA"),
    SelectedListItem(name: "BB"),
    SelectedListItem(name: "Belassi"),
    SelectedListItem(name: "Bente"),
    SelectedListItem(name: "BIC"),
    SelectedListItem(name: "BMB"),
    SelectedListItem(name: "BOWI Serai"),
    SelectedListItem(name: "BRIG"),
    SelectedListItem(name: "BRP"),
    SelectedListItem(name: "BWA"),
    SelectedListItem(name: "Bakke"),
    SelectedListItem(name: "Bali"),
    SelectedListItem(name: "Ballistic"),
    SelectedListItem(name: "Balt"),
    SelectedListItem(name: "Baltic"),
    SelectedListItem(name: "Bandholm"),
    SelectedListItem(name: "Banner"),
    SelectedListItem(name: "Barcon"),
    SelectedListItem(name: "Baretta"),
    SelectedListItem(name: "Barracuda"),
    SelectedListItem(name: "Baug"),
    SelectedListItem(name: "Bavaria"),
    SelectedListItem(name: "Bayliner"),
    SelectedListItem(name: "Becker"),
    SelectedListItem(name: "Bell"),
    SelectedListItem(name: "Bella"),
    SelectedListItem(name: "Benelli"),
    SelectedListItem(name: "Beneteau"),
    SelectedListItem(name: "Bennington"),
    SelectedListItem(name: "Berika"),
    SelectedListItem(name: "Berkut"),
    SelectedListItem(name: "Bertram"),
    SelectedListItem(name: "BestMarin"),
    SelectedListItem(name: "Bestyear"),
    SelectedListItem(name: "Bever"),
    SelectedListItem(name: "Biam"),
    SelectedListItem(name: "Bianca"),
    SelectedListItem(name: "Birchwood"),
    SelectedListItem(name: "Blackwater"),
    SelectedListItem(name: "Black Fin"),
    SelectedListItem(name: "Blesser"),
    SelectedListItem(name: "Blusail"),
    SelectedListItem(name: "Blue Spirit"),
    SelectedListItem(name: "Bluesea"),
    SelectedListItem(name: "Boheme"),
    SelectedListItem(name: "Bolero"),
    SelectedListItem(name: "Bombard"),
    SelectedListItem(name: "Bonanza"),
    SelectedListItem(name: "Boston Whaler"),
    SelectedListItem(name: "Bostrøm"),
    SelectedListItem(name: "Bowrider"),
    SelectedListItem(name: "Brabus Marine"),
    SelectedListItem(name: "Braveboat"),
    SelectedListItem(name: "Brenta"),
    SelectedListItem(name: "Brioni"),
    SelectedListItem(name: "Brizo Yachts"),
    SelectedListItem(name: "Broom"),
    SelectedListItem(name: "Bryant"),
    SelectedListItem(name: "Bryza"),
    SelectedListItem(name: "Bumerang"),
    SelectedListItem(name: "Buster"),
    SelectedListItem(name: "Båtsmann"),
    SelectedListItem(name: "C&C"),
    SelectedListItem(name: "CAP FERRET"),
    SelectedListItem(name: "CB"),
    SelectedListItem(name: "CDE"),
    SelectedListItem(name: "CR"),
    SelectedListItem(name: "CRN"),
    SelectedListItem(name: "Calypso"),
    SelectedListItem(name: "Camoline"),
    SelectedListItem(name: "Campion"),
    SelectedListItem(name: "Canmar"),
    SelectedListItem(name: "Cantieri di Sarnico"),
    SelectedListItem(name: "Capelli"),
    SelectedListItem(name: "Carat"),
    SelectedListItem(name: "Caravelle"),
    SelectedListItem(name: "Caribe"),
    SelectedListItem(name: "Carver"),
    SelectedListItem(name: "Castello Marine"),
    SelectedListItem(name: "Catalina"),
    SelectedListItem(name: "Cayenne"),
    SelectedListItem(name: "Cenit"),
    SelectedListItem(name: "Century"),
    SelectedListItem(name: "Challenger"),
    SelectedListItem(name: "Champion"),
    SelectedListItem(name: "Chaparral"),
    SelectedListItem(name: "Checkmate"),
    SelectedListItem(name: "Chris Craft"),
    SelectedListItem(name: "Cigarette"),
    SelectedListItem(name: "Ciljan"),
    SelectedListItem(name: "Cleopatra"),
    SelectedListItem(name: "Clipper"),
    SelectedListItem(name: "Coast Liner"),
    SelectedListItem(name: "CoastMaster"),
    SelectedListItem(name: "Coaster"),
    SelectedListItem(name: "Cobalt"),
    SelectedListItem(name: "Cobra"),
    SelectedListItem(name: "Cobrey"),
    SelectedListItem(name: "Colin Archer"),
    SelectedListItem(name: "Colombo"),
    SelectedListItem(name: "Comet"),
    SelectedListItem(name: "Comfort"),
    SelectedListItem(name: "Comfortina"),
    SelectedListItem(name: "Compass"),
    SelectedListItem(name: "Concord"),
    SelectedListItem(name: "Contessa"),
    SelectedListItem(name: "Contest"),
    SelectedListItem(name: "Contrast"),
    SelectedListItem(name: "Conqubin"),
    SelectedListItem(name: "Cooper"),
    SelectedListItem(name: "Cormate"),
    SelectedListItem(name: "Coronet"),
    SelectedListItem(name: "Corvette"),
    SelectedListItem(name: "Coverline"),
    SelectedListItem(name: "Cranchi"),
    SelectedListItem(name: "Crescent"),
    SelectedListItem(name: "Crownline"),
    SelectedListItem(name: "Cruiser"),
    SelectedListItem(name: "Cruisers"),
    SelectedListItem(name: "Custom Line"),
    SelectedListItem(name: "Cutwater"),
    SelectedListItem(name: "Cyber 370"),
    SelectedListItem(name: "Dacapo"),
    SelectedListItem(name: "Dalla Pieta"),
    SelectedListItem(name: "Dateline"),
    SelectedListItem(name: "DeFever"),
    SelectedListItem(name: "Degerø"),
    SelectedListItem(name: "Dehler"),
    SelectedListItem(name: "Dell Quay Dory"),
    SelectedListItem(name: "Delphia"),
    SelectedListItem(name: "Delta"),
    SelectedListItem(name: "Derubis Yachts"),
    SelectedListItem(name: "Diana"),
    SelectedListItem(name: "Discovery"),
    SelectedListItem(name: "Diva"),
    SelectedListItem(name: "Dixie"),
    SelectedListItem(name: "Dolmøy"),
    SelectedListItem(name: "Dolphin"),
    SelectedListItem(name: "Dolvik"),
    SelectedListItem(name: "Dominant"),
    SelectedListItem(name: "Donzi"),
    SelectedListItem(name: "Doral"),
    SelectedListItem(name: "Doriff"),
    SelectedListItem(name: "Drabant"),
    SelectedListItem(name: "Draco"),
    SelectedListItem(name: "Drago"),
    SelectedListItem(name: "Dragonfly"),
    SelectedListItem(name: "Drake"),
    SelectedListItem(name: "Drive"),
    SelectedListItem(name: "Dromeas"),
    SelectedListItem(name: "Dromedille"),
    SelectedListItem(name: "Dsp"),
    SelectedListItem(name: "Dufour"),
    SelectedListItem(name: "Duramar"),
    SelectedListItem(name: "Dynamic"),
    SelectedListItem(name: "Ebbtide"),
    SelectedListItem(name: "Edge Water"),
    SelectedListItem(name: "Eikeli"),
    SelectedListItem(name: "Elan"),
    SelectedListItem(name: "Elling"),
    SelectedListItem(name: "Elwaro"),
    SelectedListItem(name: "Emili"),
    SelectedListItem(name: "Endourance"),
    SelectedListItem(name: "Enes"),
    SelectedListItem(name: "Eolo"),
    SelectedListItem(name: "Epoca"),
    SelectedListItem(name: "Etap"),
    SelectedListItem(name: "Euro Yacht"),
    SelectedListItem(name: "Eurocraft"),
    SelectedListItem(name: "Europajolle"),
    SelectedListItem(name: "Eurosport"),
    SelectedListItem(name: "Evada"),
    SelectedListItem(name: "Excedo"),
    SelectedListItem(name: "Excess catamarans"),
    SelectedListItem(name: "Explorer"),
    SelectedListItem(name: "FM"),
    SelectedListItem(name: "FUN"),
    SelectedListItem(name: "Fabola"),
    SelectedListItem(name: "Faeton"),
    SelectedListItem(name: "Fagitta"),
    SelectedListItem(name: "Fairline"),
    SelectedListItem(name: "Falcon"),
    SelectedListItem(name: "Fantasi"),
    SelectedListItem(name: "Farr"),
    SelectedListItem(name: "Fast CAB"),
    SelectedListItem(name: "Faster"),
    SelectedListItem(name: "Faurby"),
    SelectedListItem(name: "Feeling"),
    SelectedListItem(name: "Femundbåt"),
    SelectedListItem(name: "Fenix"),
    SelectedListItem(name: "Ferretti"),
    SelectedListItem(name: "Fevik"),
    SelectedListItem(name: "Fiart"),
    SelectedListItem(name: "Finessa"),
    SelectedListItem(name: "Finncamp"),
    SelectedListItem(name: "Finngulf"),
    SelectedListItem(name: "Finnmaster"),
    SelectedListItem(name: "Finnsailer"),
    SelectedListItem(name: "Finnsport"),
    SelectedListItem(name: "Firling"),
    SelectedListItem(name: "First"),
    SelectedListItem(name: "First Calss 8"),
    SelectedListItem(name: "Fiskeskøyte"),
    SelectedListItem(name: "Fiord"),
    SelectedListItem(name: "Fjord Terne"),
    SelectedListItem(name: "Fjord boats"),
    SelectedListItem(name: "Fjordling"),
    SelectedListItem(name: "Flem"),
    SelectedListItem(name: "Fleming"),
    SelectedListItem(name: "Fletcher"),
    SelectedListItem(name: "Flipper"),
    SelectedListItem(name: "Folla"),
    SelectedListItem(name: "Forbina"),
    SelectedListItem(name: "Forgus"),
    SelectedListItem(name: "Formosa"),
    SelectedListItem(name: "Formula"),
    SelectedListItem(name: "Formula Watercraft"),
    SelectedListItem(name: "Fortego"),
    SelectedListItem(name: "Fountain"),
    SelectedListItem(name: "Fountaine Pajot"),
    SelectedListItem(name: "Fourwinns"),
    SelectedListItem(name: "Fram"),
    SelectedListItem(name: "Frauscher"),
    SelectedListItem(name: "Freedom"),
    SelectedListItem(name: "Freeman"),
    SelectedListItem(name: "Frers & Cibil"),
    SelectedListItem(name: "Frib"),
    SelectedListItem(name: "Friendship"),
    SelectedListItem(name: "Fun-Yak"),
    SelectedListItem(name: "Furuholmen"),
    SelectedListItem(name: "Færing"),
    SelectedListItem(name: "GH"),
    SelectedListItem(name: "GP"),
    SelectedListItem(name: "GRP"),
    SelectedListItem(name: "Gala"),
    SelectedListItem(name: "Galeon"),
    SelectedListItem(name: "Galia"),
    SelectedListItem(name: "Gambling"),
    SelectedListItem(name: "Gamler"),
    SelectedListItem(name: "Gecco"),
    SelectedListItem(name: "Gemi"),
    SelectedListItem(name: "Gemini"),
    SelectedListItem(name: "Gib'Sea"),
    SelectedListItem(name: "Gibbs"),
    SelectedListItem(name: "Gilbert"),
    SelectedListItem(name: "Gimle"),
    SelectedListItem(name: "GJ"),
    SelectedListItem(name: "GJ690"),
    SelectedListItem(name: "Gjeving"),
    SelectedListItem(name: "Gladiator"),
    SelectedListItem(name: "Glastron"),
    SelectedListItem(name: "Gliseris"),
    SelectedListItem(name: "Gobbi"),
    SelectedListItem(name: "Goldenship"),
    SelectedListItem(name: "Goldfish"),
    SelectedListItem(name: "Gozzi"),
    SelectedListItem(name: "Grady-White"),
    SelectedListItem(name: "Granada"),
    SelectedListItem(name: "Grand"),
    SelectedListItem(name: "Grand Banks"),
    SelectedListItem(name: "Grand Soleil"),
    SelectedListItem(name: "Grand Zessa"),
    SelectedListItem(name: "Grandezza"),
    SelectedListItem(name: "Greatline"),
    SelectedListItem(name: "Greatwhite"),
    SelectedListItem(name: "Greenline"),
    SelectedListItem(name: "Green Waves"),
    SelectedListItem(name: "Grimsøy"),
    SelectedListItem(name: "Grimstadjolle"),
    SelectedListItem(name: "Grinde"),
    SelectedListItem(name: "Grizzly"),
    SelectedListItem(name: "Gromling"),
    SelectedListItem(name: "Gruno"),
    SelectedListItem(name: "Gulf Craft"),
    SelectedListItem(name: "Guernsey"),
    SelectedListItem(name: "Guy"),
    SelectedListItem(name: "H-Båt"),
    SelectedListItem(name: "HB"),
    SelectedListItem(name: "HR"),
    SelectedListItem(name: "HRS-Benelli"),
    SelectedListItem(name: "Halco"),
    SelectedListItem(name: "Hallberg Rassy"),
    SelectedListItem(name: "Hankø Terna"),
    SelectedListItem(name: "Hanse"),
    SelectedListItem(name: "Hansvik"),
    SelectedListItem(name: "Hanto"),
    SelectedListItem(name: "Happy"),
    SelectedListItem(name: "Hardanger"),
    SelectedListItem(name: "Hardangersnekke"),
    SelectedListItem(name: "Harmony"),
    SelectedListItem(name: "Hasla"),
    SelectedListItem(name: "Hasle"),
    SelectedListItem(name: "Hasle Summer Fun"),
    SelectedListItem(name: "Hastig"),
    SelectedListItem(name: "Havboat"),
    SelectedListItem(name: "Hawk"),
    SelectedListItem(name: "Hellefiskeren"),
    SelectedListItem(name: "Hero"),
    SelectedListItem(name: "Herva"),
    SelectedListItem(name: "Herwa"),
    SelectedListItem(name: "HeyDay"),
    SelectedListItem(name: "HighPerformance"),
    SelectedListItem(name: "Highfield"),
    SelectedListItem(name: "Hitra"),
    SelectedListItem(name: "Hobby"),
    SelectedListItem(name: "Hobiecat"),
    SelectedListItem(name: "Honda"),
    SelectedListItem(name: "Hortensnekka"),
    SelectedListItem(name: "Hudson"),
    SelectedListItem(name: "Hui"),
    SelectedListItem(name: "Humber"),
    SelectedListItem(name: "Hunter"),
    SelectedListItem(name: "Hurrycane"),
    SelectedListItem(name: "Husky"),
    SelectedListItem(name: "Hutting"),
    SelectedListItem(name: "Hydrolift"),
    SelectedListItem(name: "Hydromarin"),
    SelectedListItem(name: "Hydrosport"),
    SelectedListItem(name: "Hyundai"),
    SelectedListItem(name: "Hårek"),
    SelectedListItem(name: "IF"),
    SelectedListItem(name: "IOD Princess"),
    SelectedListItem(name: "ISY"),
    SelectedListItem(name: "ITAMA"),
    SelectedListItem(name: "Ibiza"),
    SelectedListItem(name: "Ideal"),
    SelectedListItem(name: "Idylla"),
    SelectedListItem(name: "Impala"),
    SelectedListItem(name: "In Lander"),
    SelectedListItem(name: "Infra"),
    SelectedListItem(name: "Integrity"),
    SelectedListItem(name: "Inter"),
    SelectedListItem(name: "Invictus"),
    SelectedListItem(name: "Invictus Capoforte"),
    SelectedListItem(name: "Irene"),
    SelectedListItem(name: "IRON Boats"),
    SelectedListItem(name: "Isis"),
    SelectedListItem(name: "Italia Yachts"),
    SelectedListItem(name: "Italmar"),
    SelectedListItem(name: "J Craft"),
    SelectedListItem(name: "J-boats"),
    SelectedListItem(name: "Jaguar"),
    SelectedListItem(name: "Janmor"),
    SelectedListItem(name: "Jens Entry"),
    SelectedListItem(name: "Jarrack"),
    SelectedListItem(name: "Jeanneau"),
    SelectedListItem(name: "Jeppe"),
    SelectedListItem(name: "Joda"),
    SelectedListItem(name: "Johnson"),
    SelectedListItem(name: "Joker"),
    SelectedListItem(name: "Jolly"),
    SelectedListItem(name: "Junker"),
    SelectedListItem(name: "Jupiter"),
    SelectedListItem(name: "Jypling"),
    SelectedListItem(name: "Kavaler"),
    SelectedListItem(name: "KB Snekke"),
    SelectedListItem(name: "KMV"),
    SelectedListItem(name: "Kaasbøll"),
    SelectedListItem(name: "Kaisla"),
    SelectedListItem(name: "Karmøy"),
    SelectedListItem(name: "Karnic"),
    SelectedListItem(name: "Kawasaki"),
    SelectedListItem(name: "Kayot"),
    SelectedListItem(name: "Kelt"),
    SelectedListItem(name: "Killing"),
    SelectedListItem(name: "Kimple"),
    SelectedListItem(name: "Kloster"),
    SelectedListItem(name: "Knarr"),
    SelectedListItem(name: "Kolibri"),
    SelectedListItem(name: "Krosfjord"),
    SelectedListItem(name: "Korsø"),
    SelectedListItem(name: "Kragerø"),
    SelectedListItem(name: "Kral"),
    SelectedListItem(name: "Krash"),
    SelectedListItem(name: "Krona"),
    SelectedListItem(name: "Kulla"),
    SelectedListItem(name: "Kværnø"),
    SelectedListItem(name: "LM"),
    SelectedListItem(name: "LN"),
    SelectedListItem(name: "Lagoon"),
    SelectedListItem(name: "Laguna"),
    SelectedListItem(name: "Lami"),
    SelectedListItem(name: "Larsen"),
    SelectedListItem(name: "Larson"),
    SelectedListItem(name: "Laser"),
    SelectedListItem(name: "Lasse"),
    SelectedListItem(name: "Lema"),
    SelectedListItem(name: "Lextor Marin"),
    SelectedListItem(name: "Libra"),
    SelectedListItem(name: "Lima"),
    SelectedListItem(name: "Limbo"),
    SelectedListItem(name: "Limestone"),
    SelectedListItem(name: "Linder"),
    SelectedListItem(name: "Linjett"),
    SelectedListItem(name: "Linssen"),
    SelectedListItem(name: "Lodestar"),
    SelectedListItem(name: "Lomac"),
    SelectedListItem(name: "Los"),
    SelectedListItem(name: "Luna"),
    SelectedListItem(name: "Lyngør"),
    SelectedListItem(name: "Långedrag"),
    SelectedListItem(name: "Lærling"),
    SelectedListItem(name: "Malo"),
    SelectedListItem(name: "M Sport"),
    SelectedListItem(name: "MS Boat"),
    SelectedListItem(name: "MTX"),
    SelectedListItem(name: "MV"),
    SelectedListItem(name: "MV yachts"),
    SelectedListItem(name: "Mab"),
    SelectedListItem(name: "Mabi Yachts"),
    SelectedListItem(name: "MacGregor"),
    SelectedListItem(name: "Maestral"),
    SelectedListItem(name: "Maestro"),
    SelectedListItem(name: "Magnum"),
    SelectedListItem(name: "Mainship"),
    SelectedListItem(name: "Majesty"),
    SelectedListItem(name: "Mako"),
    SelectedListItem(name: "Malibu"),
    SelectedListItem(name: "Malø Yachts"),
    SelectedListItem(name: "Måløy"),
    SelectedListItem(name: "Mamba"),
    SelectedListItem(name: "Mantra"),
    SelectedListItem(name: "Marine Technology Inc"),
    SelectedListItem(name: "MAR-CO"),
    SelectedListItem(name: "Marex"),
    SelectedListItem(name: "Mariah"),
    SelectedListItem(name: "Marieholm"),
    SelectedListItem(name: "Maril"),
    SelectedListItem(name: "Marina"),
    SelectedListItem(name: "Mariner"),
    SelectedListItem(name: "Marino"),
    SelectedListItem(name: "Marion"),
    SelectedListItem(name: "Maritimo"),
    SelectedListItem(name: "Marlin"),
    SelectedListItem(name: "Marquis"),
    SelectedListItem(name: "Mascot"),
    SelectedListItem(name: "Master"),
    SelectedListItem(name: "Mastercraft"),
    SelectedListItem(name: "Matrix"),
    SelectedListItem(name: "Maxi"),
    SelectedListItem(name: "Maxum"),
    SelectedListItem(name: "Maxus"),
    SelectedListItem(name: "Mazury"),
    SelectedListItem(name: "Mekling"),
    SelectedListItem(name: "Melges"),
    SelectedListItem(name: "Menken Maritiem"),
    SelectedListItem(name: "Mercury"),
    SelectedListItem(name: "Meridian Yachts"),
    SelectedListItem(name: "Mery Nautic"),
    SelectedListItem(name: "Micore"),
    SelectedListItem(name: "Mikkel"),
    SelectedListItem(name: "Milia"),
    SelectedListItem(name: "Millenium"),
    SelectedListItem(name: "Minor"),
    SelectedListItem(name: "Mirage"),
    SelectedListItem(name: "Mixer"),
    SelectedListItem(name: "Modesty"),
    SelectedListItem(name: "Modius"),
    SelectedListItem(name: "Momentum"),
    SelectedListItem(name: "Monaco"),
    SelectedListItem(name: "Monark"),
    SelectedListItem(name: "Monterey"),
    SelectedListItem(name: "Moody"),
    SelectedListItem(name: "Morgan"),
    SelectedListItem(name: "Mosquito"),
    SelectedListItem(name: "Motiva"),
    SelectedListItem(name: "Motor Scoop"),
    SelectedListItem(name: "Musling"),
    SelectedListItem(name: "Mustang"),
    SelectedListItem(name: "Myra"),
    SelectedListItem(name: "Møn"),
    SelectedListItem(name: "Mørebas"),
    SelectedListItem(name: "Mørejet"),
    SelectedListItem(name: "NB"),
    SelectedListItem(name: "NEEL"),
    SelectedListItem(name: "NabCat"),
    SelectedListItem(name: "NabWork"),
    SelectedListItem(name: "Nacra"),
    SelectedListItem(name: "Najad"),
    SelectedListItem(name: "Narwhal"),
    SelectedListItem(name: "Nauta"),
    SelectedListItem(name: "Nauticat"),
    SelectedListItem(name: "Nautico"),
    SelectedListItem(name: "Nautor"),
    SelectedListItem(name: "Nautus"),
    SelectedListItem(name: "NAVAN"),
    SelectedListItem(name: "Naver"),
    SelectedListItem(name: "Navette"),
    SelectedListItem(name: "Neptim"),
    SelectedListItem(name: "Neptunkrysser"),
    SelectedListItem(name: "Neptunus"),
    SelectedListItem(name: "Nessy"),
    SelectedListItem(name: "NewClassic"),
    SelectedListItem(name: "NF"),
    SelectedListItem(name: "Nicholson"),
    SelectedListItem(name: "Nidelv"),
    SelectedListItem(name: "Nilsen"),
    SelectedListItem(name: "Nimbus"),
    SelectedListItem(name: "Nimo"),
    SelectedListItem(name: "Nisami Rib"),
    SelectedListItem(name: "Nitra"),
    SelectedListItem(name: "Nor Sea"),
    SelectedListItem(name: "Nor Star"),
    SelectedListItem(name: "Nor-Dan"),
    SelectedListItem(name: "Nor-Tech"),
    SelectedListItem(name: "Nordic Season"),
    SelectedListItem(name: "NorPlast"),
    SelectedListItem(name: "NorTech"),
    SelectedListItem(name: "Noratlantis"),
    SelectedListItem(name: "Norbas"),
    SelectedListItem(name: "Norbelle"),
    SelectedListItem(name: "Norbåt"),
    SelectedListItem(name: "Norcraft"),
    SelectedListItem(name: "Nord West"),
    SelectedListItem(name: "NordStar"),
    SelectedListItem(name: "Nordic Marine"),
    SelectedListItem(name: "Nordic Ocean Craft"),
    SelectedListItem(name: "Nordic Star"),
    SelectedListItem(name: "Nordisk folkebåt"),
    SelectedListItem(name: "Nordkapp"),
    SelectedListItem(name: "Nordship"),
    SelectedListItem(name: "Norfun"),
    SelectedListItem(name: "Norlin"),
    SelectedListItem(name: "Norline"),
    SelectedListItem(name: "Norman"),
    SelectedListItem(name: "Norrib"),
    SelectedListItem(name: "Norsafe"),
    SelectedListItem(name: "North Atlantic Rib"),
    SelectedListItem(name: "Northman"),
    SelectedListItem(name: "North Pacific"),
    SelectedListItem(name: "North ribs"),
    SelectedListItem(name: "Northmaster"),
    SelectedListItem(name: "NorthStar"),
    SelectedListItem(name: "Nottoy"),
    SelectedListItem(name: "Nova"),
    SelectedListItem(name: "NuovaJolly"),
    SelectedListItem(name: "Novurania"),
    SelectedListItem(name: "Nymar"),
    SelectedListItem(name: "OX"),
    SelectedListItem(name: "Obsession"),
    SelectedListItem(name: "Ocean Alexander"),
    SelectedListItem(name: "OceanMarin"),
    SelectedListItem(name: "Oceancraft"),
    SelectedListItem(name: "Oceanfarer"),
    SelectedListItem(name: "Oceanis"),
    SelectedListItem(name: "Oceanmaster"),
    SelectedListItem(name: "Oceanrunner"),
    SelectedListItem(name: "Ockelbo"),
    SelectedListItem(name: "Ocqueteau"),
    SelectedListItem(name: "Olson 88"),
    SelectedListItem(name: "Olympic"),
    SelectedListItem(name: "Ombrine"),
    SelectedListItem(name: "Omega"),
    SelectedListItem(name: "Optima"),
    SelectedListItem(name: "Orrskär"),
    SelectedListItem(name: "Oselvar"),
    SelectedListItem(name: "Otasport"),
    SelectedListItem(name: "Oyster"),
    SelectedListItem(name: "Pacific Craft"),
    SelectedListItem(name: "Paijan"),
    SelectedListItem(name: "Pakri"),
    SelectedListItem(name: "Paragon"),
    SelectedListItem(name: "Paramount Powerboats"),
    SelectedListItem(name: "Parent"),
    SelectedListItem(name: "Partizan"),
    SelectedListItem(name: "Pearlsea"),
    SelectedListItem(name: "Pegazus"),
    SelectedListItem(name: "Pershing"),
    SelectedListItem(name: "Pettersson"),
    SelectedListItem(name: "Piet Hein Sloep"),
    SelectedListItem(name: "Pilot"),
    SelectedListItem(name: "Pioner"),
    SelectedListItem(name: "Plattgatter"),
    SelectedListItem(name: "Polar"),
    SelectedListItem(name: "Polarcirkel"),
    SelectedListItem(name: "Polaris"),
    SelectedListItem(name: "Polarkraft"),
    SelectedListItem(name: "Pogo"),
    SelectedListItem(name: "Polo"),
    SelectedListItem(name: "Poseidon"),
    SelectedListItem(name: "PowerQuest"),
    SelectedListItem(name: "Powercraft"),
    SelectedListItem(name: "Predator"),
    SelectedListItem(name: "Prestige"),
    SelectedListItem(name: "Princess"),
    SelectedListItem(name: "Pro Rib"),
    SelectedListItem(name: "Pro-Line"),
    SelectedListItem(name: "ProWorker"),
    SelectedListItem(name: "Pronavia"),
    SelectedListItem(name: "Protagon"),
    SelectedListItem(name: "Protector"),
    SelectedListItem(name: "Puma"),
    SelectedListItem(name: "Pursuit"),
    SelectedListItem(name: "Quarken"),
    SelectedListItem(name: "Quicksilver"),
    SelectedListItem(name: "RIS"),
    SelectedListItem(name: "Racemaster"),
    SelectedListItem(name: "Racing Sailboats"),
    SelectedListItem(name: "Rafnar"),
    SelectedListItem(name: "Ram-Marine"),
    SelectedListItem(name: "Ramin"),
    SelectedListItem(name: "Ran Craft"),
    SelectedListItem(name: "Rana"),
    SelectedListItem(name: "Rand"),
    SelectedListItem(name: "Ranger"),
    SelectedListItem(name: "Ranger Tugs"),
    SelectedListItem(name: "Ranieri"),
    SelectedListItem(name: "Rascala"),
    SelectedListItem(name: "Rasmus"),
    SelectedListItem(name: "Ravage"),
    SelectedListItem(name: "Real"),
    SelectedListItem(name: "Realcraft"),
    SelectedListItem(name: "Regal"),
    SelectedListItem(name: "Reinell"),
    SelectedListItem(name: "Remus"),
    SelectedListItem(name: "Revenger"),
    SelectedListItem(name: "Rhea"),
    SelectedListItem(name: "Rib Limited"),
    SelectedListItem(name: "Ribcraft"),
    SelectedListItem(name: "Ribeye"),
    SelectedListItem(name: "Ridas"),
    SelectedListItem(name: "Rinker"),
    SelectedListItem(name: "Risør"),
    SelectedListItem(name: "Riva"),
    SelectedListItem(name: "Rival"),
    SelectedListItem(name: "Rivena Yachts"),
    SelectedListItem(name: "River"),
    SelectedListItem(name: "Riviera"),
    SelectedListItem(name: "RM-Yachts"),
    SelectedListItem(name: "Robalo"),
    SelectedListItem(name: "Rocad"),
    SelectedListItem(name: "Rodman"),
    SelectedListItem(name: "Rondo"),
    SelectedListItem(name: "Row"),
    SelectedListItem(name: "Royal Cruiser"),
    SelectedListItem(name: "Royal Marine"),
    SelectedListItem(name: "RS Sailing"),
    SelectedListItem(name: "R-boats"),
    SelectedListItem(name: "Rubenetti"),
    SelectedListItem(name: "Runn37"),
    SelectedListItem(name: "Rupert"),
    SelectedListItem(name: "Rush"),
    SelectedListItem(name: "Ryck"),
    SelectedListItem(name: "Ryds"),
    SelectedListItem(name: "RW"),
    SelectedListItem(name: "SACS"),
    SelectedListItem(name: "SK"),
    SelectedListItem(name: "SL"),
    SelectedListItem(name: "SUN"),
    SelectedListItem(name: "Safir"),
    SelectedListItem(name: "Saffier Yachts"),
    SelectedListItem(name: "Safter"),
    SelectedListItem(name: "Saga"),
    SelectedListItem(name: "Sagen"),
    SelectedListItem(name: "Sagitta"),
    SelectedListItem(name: "Salman Theri"),
    SelectedListItem(name: "Salona"),
    SelectedListItem(name: "Salpa"),
    SelectedListItem(name: "Sand"),
    SelectedListItem(name: "Sandström"),
    SelectedListItem(name: "Sandstø"),
    SelectedListItem(name: "Sandtangen"),
    SelectedListItem(name: "Sandvik"),
    SelectedListItem(name: "Sandøy"),
    SelectedListItem(name: "Sargo"),
    SelectedListItem(name: "Saver"),
    SelectedListItem(name: "Saxdor"),
    SelectedListItem(name: "Saxe"),
    SelectedListItem(name: "Scampi"),
    SelectedListItem(name: "Scand"),
    SelectedListItem(name: "Scandica"),
    SelectedListItem(name: "Scandinaval"),
    SelectedListItem(name: "Scandinavien"),
    SelectedListItem(name: "Scanmar"),
    SelectedListItem(name: "Scanner"),
    SelectedListItem(name: "Scarab"),
    SelectedListItem(name: "Scarani"),
    SelectedListItem(name: "Schaefer Yachts"),
    SelectedListItem(name: "Scorpion"),
    SelectedListItem(name: "Scout"),
    SelectedListItem(name: "SeasAll"),
    SelectedListItem(name: "Sea Finn"),
    SelectedListItem(name: "Sea Hawk"),
    SelectedListItem(name: "Sea Jeep"),
    SelectedListItem(name: "Sea Master"),
    SelectedListItem(name: "Sea Pro"),
    SelectedListItem(name: "Sea Queen"),
    SelectedListItem(name: "Sea Ray"),
    SelectedListItem(name: "Sea Star"),
    SelectedListItem(name: "SeaDan"),
    SelectedListItem(name: "SeaDoo"),
    SelectedListItem(name: "Sea Force One"),
    SelectedListItem(name: "SeaHunter"),
    SelectedListItem(name: "SeaRider"),
    SelectedListItem(name: "SeaWave"),
    SelectedListItem(name: "Seabird"),
    SelectedListItem(name: "SeaBoy"),
    SelectedListItem(name: "Seabraker"),
    SelectedListItem(name: "Seaco"),
    SelectedListItem(name: "SEACORE"),
    SelectedListItem(name: "Seacraft"),
    SelectedListItem(name: "Seaking"),
    SelectedListItem(name: "Seaking Dominator"),
    SelectedListItem(name: "Sealegs"),
    SelectedListItem(name: "Sealine"),
    SelectedListItem(name: "Sealver"),
    SelectedListItem(name: "Seamarin"),
    SelectedListItem(name: "Seaqrest"),
    SelectedListItem(name: "Seaside"),
    SelectedListItem(name: "Seaspirit"),
    SelectedListItem(name: "Seaswirl"),
    SelectedListItem(name: "Seaviking"),
    SelectedListItem(name: "Seawings"),
    SelectedListItem(name: "Seigur"),
    SelectedListItem(name: "Selby"),
    SelectedListItem(name: "Selco"),
    SelectedListItem(name: "Selfa"),
    SelectedListItem(name: "Selmar"),
    SelectedListItem(name: "Selva"),
    SelectedListItem(name: "Serecraft"),
    SelectedListItem(name: "Sessa"),
    SelectedListItem(name: "SF-Maritim"),
    SelectedListItem(name: "Shakespeare"),
    SelectedListItem(name: "Sheriff"),
    SelectedListItem(name: "Shimano"),
    SelectedListItem(name: "Shipman"),
    SelectedListItem(name: "Sigma"),
    SelectedListItem(name: "Sillinger"),
    SelectedListItem(name: "Silver"),
    SelectedListItem(name: "Silver Viking"),
    SelectedListItem(name: "Silver Yacht"),
    SelectedListItem(name: "Silverton"),
    SelectedListItem(name: "Simms"),
    SelectedListItem(name: "Simppu"),
    SelectedListItem(name: "Sirena"),
    SelectedListItem(name: "Sirius"),
    SelectedListItem(name: "Sisumar"),
    SelectedListItem(name: "Sjark"),
    SelectedListItem(name: "Sjømann"),
    SelectedListItem(name: "Sjøtroll"),
    SelectedListItem(name: "Skaar"),
    SelectedListItem(name: "Skager"),
    SelectedListItem(name: "Skagerak"),
    SelectedListItem(name: "Skarpnes"),
    SelectedListItem(name: "Skarsvåg"),
    SelectedListItem(name: "Skater"),
    SelectedListItem(name: "Skibsplast"),
    SelectedListItem(name: "Skilsø"),
    SelectedListItem(name: "Skipper"),
    SelectedListItem(name: "Skipperyachts"),
    SelectedListItem(name: "Skorgenes"),
    SelectedListItem(name: "Skøyte"),
    SelectedListItem(name: "Smart Rib"),
    SelectedListItem(name: "Smartliner"),
    SelectedListItem(name: "Smiling"),
    SelectedListItem(name: "Smuggler"),
    SelectedListItem(name: "Snipe"),
    SelectedListItem(name: "Solaris"),
    SelectedListItem(name: "Soling"),
    SelectedListItem(name: "Sollux"),
    SelectedListItem(name: "Solvik"),
    SelectedListItem(name: "Spirit"),
    SelectedListItem(name: "Spornes"),
    SelectedListItem(name: "Sportique"),
    SelectedListItem(name: "Spoty"),
    SelectedListItem(name: "Sprint"),
    SelectedListItem(name: "SPX Rib"),
    SelectedListItem(name: "Starcraft"),
    SelectedListItem(name: "Starfisher"),
    SelectedListItem(name: "Statesman"),
    SelectedListItem(name: "Steady"),
    SelectedListItem(name: "Stigfjord"),
    SelectedListItem(name: "Sting"),
    SelectedListItem(name: "Stingher"),
    SelectedListItem(name: "Stingray"),
    SelectedListItem(name: "Storebro"),
    SelectedListItem(name: "Storm"),
    SelectedListItem(name: "Stormway"),
    SelectedListItem(name: "Stormy"),
    SelectedListItem(name: "Storø"),
    SelectedListItem(name: "Strandebarmer"),
    SelectedListItem(name: "Stråholmen"),
    SelectedListItem(name: "Strana"),
    SelectedListItem(name: "Strømøy Rib"),
    SelectedListItem(name: "Style"),
    SelectedListItem(name: "SugarSand"),
    SelectedListItem(name: "Summer Dreams"),
    SelectedListItem(name: "Summer Family"),
    SelectedListItem(name: "Summersport"),
    SelectedListItem(name: "Sun Fast"),
    SelectedListItem(name: "Sun Marine"),
    SelectedListItem(name: "Sun Odyssey"),
    SelectedListItem(name: "Sun Quest"),
    SelectedListItem(name: "Sun Tracker"),
    SelectedListItem(name: "Sunbeam"),
    SelectedListItem(name: "Sunbird"),
    SelectedListItem(name: "Sunchaser"),
    SelectedListItem(name: "Sunline"),
    SelectedListItem(name: "Sunrider"),
    SelectedListItem(name: "Sunsation"),
    SelectedListItem(name: "Sunseeker"),
    SelectedListItem(name: "Sunwind"),
    SelectedListItem(name: "Suomi"),
    SelectedListItem(name: "SurPlus"),
    SelectedListItem(name: "Sur Marine"),
    SelectedListItem(name: "Suvi"),
    SelectedListItem(name: "Suzumar"),
    SelectedListItem(name: "Swan"),
    SelectedListItem(name: "Swede"),
    SelectedListItem(name: "SwedeStar"),
    SelectedListItem(name: "Sweden Yachts"),
    SelectedListItem(name: "Sørlandssnekka"),
    SelectedListItem(name: "TB"),
    SelectedListItem(name: "TG-Boat"),
    SelectedListItem(name: "TP Marine"),
    SelectedListItem(name: "Tahoe"),
    SelectedListItem(name: "Takacat"),
    SelectedListItem(name: "Tango"),
    SelectedListItem(name: "Targo"),
    SelectedListItem(name: "Tartan"),
    SelectedListItem(name: "Tayana"),
    SelectedListItem(name: "TD Power"),
    SelectedListItem(name: "Teal"),
    SelectedListItem(name: "Technohull"),
    SelectedListItem(name: "Technorib"),
    SelectedListItem(name: "TEKNOMAR"),
    SelectedListItem(name: "Terhi"),
    SelectedListItem(name: "Tethys Yachts"),
    SelectedListItem(name: "Tetis"),
    SelectedListItem(name: "Thunderbird"),
    SelectedListItem(name: "Tiara"),
    SelectedListItem(name: "Tiger Marine"),
    SelectedListItem(name: "Tiwal"),
    SelectedListItem(name: "Tobias"),
    SelectedListItem(name: "Topaz"),
    SelectedListItem(name: "Topcat"),
    SelectedListItem(name: "Tornado"),
    SelectedListItem(name: "Toy"),
    SelectedListItem(name: "Tracker"),
    SelectedListItem(name: "Trader"),
    SelectedListItem(name: "Trapper"),
    SelectedListItem(name: "Trawler"),
    SelectedListItem(name: "Tresfjord"),
    SelectedListItem(name: "Trinella"),
    SelectedListItem(name: "Trintella"),
    SelectedListItem(name: "Trio"),
    SelectedListItem(name: "Tristan"),
    SelectedListItem(name: "Triton"),
    SelectedListItem(name: "Troll"),
    SelectedListItem(name: "Tromøy"),
    SelectedListItem(name: "Trophy"),
    SelectedListItem(name: "Trønder'n"),
    SelectedListItem(name: "TS Boats"),
    SelectedListItem(name: "Tullio Abbate"),
    SelectedListItem(name: "Tune-jolle"),
    SelectedListItem(name: "Tustna"),
    SelectedListItem(name: "Twostar"),
    SelectedListItem(name: "UMS"),
    SelectedListItem(name: "UMS Boats"),
    SelectedListItem(name: "Uniesse"),
    SelectedListItem(name: "Unique"),
    SelectedListItem(name: "Uttern"),
    SelectedListItem(name: "Vaagen"),
    SelectedListItem(name: "Valiant"),
    SelectedListItem(name: "Van Der Heijden"),
    SelectedListItem(name: "Venus"),
    SelectedListItem(name: "VENTUM"),
    SelectedListItem(name: "Vermøy"),
    SelectedListItem(name: "Vernøy"),
    SelectedListItem(name: "Verøy"),
    SelectedListItem(name: "Veslefrikk"),
    SelectedListItem(name: "Vest"),
    SelectedListItem(name: "Vestfjord"),
    SelectedListItem(name: "Viggo"),
    SelectedListItem(name: "Vikfjord"),
    SelectedListItem(name: "Viking"),
    SelectedListItem(name: "Viknes"),
    SelectedListItem(name: "Viko Yachts"),
    SelectedListItem(name: "Viksfjord"),
    SelectedListItem(name: "Viksund"),
    SelectedListItem(name: "Vindø"),
    SelectedListItem(name: "Vinstrabåten"),
    SelectedListItem(name: "Viper"),
    SelectedListItem(name: "Vira"),
    SelectedListItem(name: "Virus"),
    SelectedListItem(name: "Vista"),
    SelectedListItem(name: "Walker Bay"),
    SelectedListItem(name: "Wally"),
    SelectedListItem(name: "Wasa"),
    SelectedListItem(name: "Waszp"),
    SelectedListItem(name: "Water Fun"),
    SelectedListItem(name: "Watercraft"),
    SelectedListItem(name: "Waterwish"),
    SelectedListItem(name: "Wauquies"),
    SelectedListItem(name: "Wayfarer"),
    SelectedListItem(name: "Wellcraft"),
    SelectedListItem(name: "Wesling"),
    SelectedListItem(name: "West"),
    SelectedListItem(name: "Westbas"),
    SelectedListItem(name: "Westcruiser"),
    SelectedListItem(name: "Wester"),
    SelectedListItem(name: "Westerly"),
    SelectedListItem(name: "Westfjord"),
    SelectedListItem(name: "Westline"),
    SelectedListItem(name: "WESTPLAST"),
    SelectedListItem(name: "Wharram"),
    SelectedListItem(name: "White Shark"),
    SelectedListItem(name: "Whitehouse"),
    SelectedListItem(name: "Wiking"),
    SelectedListItem(name: "Williams"),
    SelectedListItem(name: "Willing"),
    SelectedListItem(name: "Windy"),
    SelectedListItem(name: "Winga"),
    SelectedListItem(name: "Winrace"),
    SelectedListItem(name: "With"),
    SelectedListItem(name: "X-Yachts"),
    SelectedListItem(name: "XO"),
    SelectedListItem(name: "XShore"),
    SelectedListItem(name: "XS Ribs"),
    SelectedListItem(name: "Yam"),
    SelectedListItem(name: "Yamaha"),
    SelectedListItem(name: "Yamarin"),
    SelectedListItem(name: "Yngling"),
    SelectedListItem(name: "ZAR"),
    SelectedListItem(name: "Zebec"),
    SelectedListItem(name: "Zee Marine"),
    SelectedListItem(name: "Zephyr"),
    SelectedListItem(name: "Zitarra"),
    SelectedListItem(name: "Zodiac"),
    SelectedListItem(name: "Zulu Marine"),
    SelectedListItem(name: "Ribtech"),
    SelectedListItem(name: "Øien"),
    SelectedListItem(name: "Ørnvik"),
    SelectedListItem(name: "Årø"),
    SelectedListItem(name: "Andre"),
  ];

  void showDropdownBoatMerke(context) {
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
        data: boatmerkene,
        selectedItems: (List<dynamic> selectedList) {
          List<String> list = [];
          for (var item in selectedList) {
            if (item is SelectedListItem) {
              list.add(item.name);
            }
          }
          boatmerke!.text = list.join(", ");
          gkBoaterannonse.currentState?.validate();
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
          //  motorsykkeltype!.text = list.join(", ");
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
          //   motorsykkeltype!.text = list.join(", ");
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
          //    mcutstyr!.text = list.join(", ");
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
