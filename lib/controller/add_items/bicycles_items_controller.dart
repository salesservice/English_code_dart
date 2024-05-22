import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_isell_new/core/classes/statusrequest.dart';
import 'package:flutter_isell_new/core/constants/sellx_colors.dart';
import 'package:flutter_isell_new/core/constants/sellx_route_names.dart';
import 'package:flutter_isell_new/core/functions/handling_data.dart';
import 'package:flutter_isell_new/core/services/services.dart';
import 'package:flutter_isell_new/data/items_data/bicycles_data.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class AddSyklerAnnonseController extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;
  GlobalKey<FormState> gkSyklerannonse = GlobalKey<FormState>();
  MyServices myServices = Get.find();
  BicyclesItemData bicyclesItemData = BicyclesItemData(Get.find());

  // Modify the counter to be two separate Rx variables
  final RxInt currentIndex = 0.obs;
  final RxInt totalImages = 0.obs;

  // ... other methods

  // Add a method to update the counter
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

  //  Future<List<File?>> imageUploadGallery() async {
  //   try {
  //     final pickedFiles = await ImagePicker().pickMultiImage(
  //       imageQuality: 70, // Set the image quality (0 to 100)
  //     );

  //     if (pickedFiles != null && pickedFiles.isNotEmpty) {
  //       // Return the list of selected images
  //       return pickedFiles.map((pickedFile) => File(pickedFile.path)).toList();
  //     } else {
  //       // If no image is selected, add a default image to the list
  //       imagenames = [File("assets/images/logoen-removebg.png")];
  //       return imagenames;
  //     }
  //   } catch (e) {
  //     print("Error picking images from gallery: $e");
  //     return [];
  //   }
  // }

  String? annonsetype;
  var sykkeltypen = "".obs;
  var tilstand = "".obs;
  var tilsalgleie = "".obs;
  var dataValue = "Til salgs".obs;

  TextEditingController? name;
  TextEditingController? overskrift;
  TextEditingController? pris;
  TextEditingController? merke;
  TextEditingController? land;
  TextEditingController? postnummer;
  TextEditingController? itemtistand;
  TextEditingController? sykkelbeskrivelse;
  TextEditingController? poststed;
  TextEditingController? gateadresse;
  TextEditingController? telefonnummer;
  TextEditingController? salgleie;
  TextEditingController? itemaktiv;
  TextEditingController? sykkeltype;

  AddSyklerAnnonseController() {
    annonsetype = "Selge";
    //VelgAnnonseType("Selge");
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
    sykkelbeskrivelse = TextEditingController();
    itemtistand = TextEditingController();
    salgleie = TextEditingController();
    itemaktiv = TextEditingController();
    sykkeltype = TextEditingController();
  }

  @override
  void onInit() {
    initialData();

    super.onInit();
  }

  addSyklerAnnonseData() async {
    var formdata = gkSyklerannonse.currentState;
    if (formdata!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await bicyclesItemData.addData(
        myServices.sharedPreferences.getInt("id")!,
        6,
        "1",
        overskrift!.text,
        name!.text,
        pris!.text,
        merke!.text,
        itemtistand!.text,
        sykkelbeskrivelse!.text,
        land!.text,
        postnummer!.text,
        poststed!.text,
        gateadresse!.text,
        telefonnummer!.text,
        salgleie!.text,
        sykkeltype!.text,
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

//response['status'] == "success"
  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}