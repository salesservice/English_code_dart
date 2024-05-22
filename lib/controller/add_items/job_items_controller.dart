import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_isell_new/core/classes/statusrequest.dart';
import 'package:flutter_isell_new/core/constants/sellx_colors.dart';
import 'package:flutter_isell_new/core/constants/sellx_route_names.dart';
import 'package:flutter_isell_new/core/functions/handling_data.dart';
import 'package:flutter_isell_new/core/services/services.dart';
import 'package:flutter_isell_new/data/items_data/jobs_data.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class AddJobbAnnonseController extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;
  GlobalKey<FormState> gkJobbannonse = GlobalKey<FormState>();
  MyServices myServices = Get.find();
  JobItemData jobItemData = JobItemData(Get.find());

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

  Future<List<File?>> imageUploadGallery() async {
    try {
      final pickedFiles = await ImagePicker().pickMultiImage(
        imageQuality: 70,
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

  String? jobbtype;
  var hjemmekontor = "".obs;
  var dataValue = "Til salgs".obs;

  TextEditingController? name;
  TextEditingController? overskrift;
  TextEditingController? land;
  TextEditingController? postnummer;
  TextEditingController? itemtistand;
  TextEditingController? poststed;
  TextEditingController? gateadresse;
  TextEditingController? telefonnummer;
  TextEditingController? itemaktiv;
  TextEditingController? jobbdelheltid;
  TextEditingController? jobbfirma;
  TextEditingController? jobbstillingtitel;
  TextEditingController? jobbfrist;
  TextEditingController? jobbansettelsesform;
  TextEditingController? jobbsektor;
  TextEditingController? jobbhjemmekontor;
  TextEditingController? jobbbransje;
  TextEditingController? jobbstillingsfunksjon;
  TextEditingController? jobbbeskrivelse;
  TextEditingController? arbeidsprak;
  TextEditingController? jobbomarbeidsgiver;
  TextEditingController? jobbsted;
  TextEditingController? jobbkontaktperson;
  TextEditingController? jobbtelefonkontaktpers;
  TextEditingController? stillingkontaktperon1;
  TextEditingController? jobbantllstillinger;
  TextEditingController? jobbhjemmeside;
  TextEditingController? kontaktperson;
  TextEditingController? stillingkontaktperon2;

  AddJobbAnnonseController() {
    jobbtype = "Heltid";
  }

  VelgAnnonseType(String type) {
    jobbtype = type;

    if (type == "Heltid") {
      dataValue.value = "Heltid";
    } else if (type == "Deltid") {
      dataValue.value = "Deltid";
    }

    if (dataValue.value == "Heltid") {
      jobbdelheltid!.text = "Heltid";
    } else if (dataValue.value == "Deltid") {
      jobbdelheltid!.text = "Deltid";
    }
    update();
  }

  initialData() {
    name = TextEditingController();
    overskrift = TextEditingController();
    land = TextEditingController();
    postnummer = TextEditingController();
    poststed = TextEditingController();
    gateadresse = TextEditingController();
    telefonnummer = TextEditingController();
    itemtistand = TextEditingController();
    itemaktiv = TextEditingController();
    jobbdelheltid = TextEditingController();
    jobbfirma = TextEditingController();
    jobbstillingtitel = TextEditingController();
    jobbfrist = TextEditingController();
    jobbansettelsesform = TextEditingController();
    jobbsektor = TextEditingController();
    jobbhjemmekontor = TextEditingController();
    jobbbransje = TextEditingController();
    jobbstillingsfunksjon = TextEditingController();
    jobbbeskrivelse = TextEditingController();
    arbeidsprak = TextEditingController();
    jobbomarbeidsgiver = TextEditingController();
    jobbsted = TextEditingController();
    jobbkontaktperson = TextEditingController();
    jobbtelefonkontaktpers = TextEditingController();
    stillingkontaktperon1 = TextEditingController();
    jobbantllstillinger = TextEditingController();
    jobbhjemmeside = TextEditingController();
    kontaktperson = TextEditingController();
    stillingkontaktperon2 = TextEditingController();
  }

  @override
  void onInit() {
    initialData();

    super.onInit();
  }

  addJobbAnnonseData() async {
    var formdata = gkJobbannonse.currentState;
    if (formdata!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await jobItemData.addData(
        myServices.sharedPreferences.getInt("id")!,
        7,
        "1",
        overskrift!.text,
        name!.text,
        itemtistand!.text,
        land!.text,
        postnummer!.text,
        poststed!.text,
        gateadresse!.text,
        telefonnummer!.text,
        jobbdelheltid!.text,
        jobbfirma!.text,
        jobbstillingtitel!.text,
        jobbfrist!.text,
        jobbansettelsesform!.text,
        jobbsektor!.text,
        jobbhjemmekontor!.text,
        jobbbransje!.text,
        jobbstillingsfunksjon!.text,
        jobbbeskrivelse!.text,
        arbeidsprak!.text,
        jobbomarbeidsgiver!.text,
        jobbsted!.text,
        jobbkontaktperson!.text,
        jobbtelefonkontaktpers!.text,
        stillingkontaktperon1!.text,
        jobbantllstillinger!.text,
        jobbhjemmeside!.text,
        kontaktperson!.text,
        stillingkontaktperon2!.text,
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
}
