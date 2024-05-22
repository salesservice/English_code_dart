import 'package:flutter/material.dart';
import 'package:flutter_isell_new/core/classes/statusrequest.dart';
import 'package:flutter_isell_new/core/functions/handling_data.dart';
import 'package:flutter_isell_new/core/services/services.dart';
import 'package:flutter_isell_new/data/items_data/boat_data.dart';
import 'package:flutter_isell_new/views/screens/home/boat_relevant/bowrider.dart';
import 'package:flutter_isell_new/views/screens/home/boat_relevant/cabincruiser.dart';
import 'package:flutter_isell_new/views/screens/home/boat_relevant/daycruiser.dart';
import 'package:flutter_isell_new/views/screens/home/boat_relevant/gummi.dart';
import 'package:flutter_isell_new/views/screens/home/boat_relevant/pilothouse.dart';
import 'package:flutter_isell_new/views/screens/home/boat_relevant/rib.dart';
import 'package:flutter_isell_new/views/screens/home/boat_relevant/seilboat.dart';
import 'package:flutter_isell_new/views/screens/home/boat_relevant/skjargardjeep.dart';
import 'package:flutter_isell_new/views/screens/home/boat_relevant/speedboat.dart';
import 'package:flutter_isell_new/views/screens/home/boat_relevant/treboat.dart';
import 'package:flutter_isell_new/views/screens/home/boat_relevant/vannscooter.dart';
import 'package:flutter_isell_new/views/screens/home/boat_relevant/yacht.dart';
import 'package:flutter_isell_new/views/screens/home/boat_relevant/yrkesboat.dart';
import 'package:get/get.dart';

abstract class BoatController extends GetxController {}

class BoatControllerImp extends BoatController {
  late StatusRequest statusRequest;
  MyServices myServices = Get.find();
  BoatItemsData boatItemsData = BoatItemsData(Get.find());
  List<String> boattyper = [
    "Bowrider",
    "Cabincruiser",
    "Daycruiser",
    "Gummibåt/Jolle",
    "RIB",
    "Seilbåt/Motorseiler",
    "Skjærgårdsjeep/Landstedsbåt",
    "Pilothouse",
    "Speedbåt",
    "Trebåt/Snekke",
    "Yacht",
    "Vannscooter",
    "Yrkesbåt/Sjark/Skøyte",
  ];
  @override
  void onInit() {
    getbowrider();
    getcabincruiser();
    getdaycruiser();
    getgummi();
    getrib();
    getseilboat();
    getskjargardsjeep();
    getpilothouse();
    getspeedboat();
    gettreboat();
    getyacht();
    getvanscooter();
    getyrkesboat();
    super.onInit();
  }

  bool bmwDataLoaded = false;

  List bowriderdata = [];
  List cabincruiserdata = [];
  List daycruiserdata = [];
  List gummidata = [];
  List ribdata = [];
  List seilboatdata = [];
  List skjargardjeepdata = [];
  List pilothusdata = [];
  List speedboatdata = [];
  List treboatdata = [];
  List yachtdata = [];
  List vannscooterdata = [];
  List yrkesboatdata = [];

  Future<void> getbowrider() async {
    if (bmwDataLoaded) return;

    bowriderdata.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await boatItemsData
        .getbowrider(myServices.sharedPreferences.getInt("id")!);
    statusRequest = handlingData(response);
    if (StatusRequest.suksess == statusRequest) {
      if (response['status'] == "success") {
        bowriderdata.addAll(response['data']);
        bmwDataLoaded = true;
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  Future<void> getcabincruiser() async {
    if (bmwDataLoaded) return;

    cabincruiserdata.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await boatItemsData
        .getcabincruiser(myServices.sharedPreferences.getInt("id")!);
    statusRequest = handlingData(response);
    if (StatusRequest.suksess == statusRequest) {
      if (response['status'] == "success") {
        cabincruiserdata.addAll(response['data']);
        bmwDataLoaded = true;
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  Future<void> getdaycruiser() async {
    if (bmwDataLoaded) return;

    daycruiserdata.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await boatItemsData
        .getdaycruiser(myServices.sharedPreferences.getInt("id")!);
    statusRequest = handlingData(response);
    if (StatusRequest.suksess == statusRequest) {
      if (response['status'] == "success") {
        daycruiserdata.addAll(response['data']);
        bmwDataLoaded = true;
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  Future<void> getgummi() async {
    if (bmwDataLoaded) return;

    gummidata.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await boatItemsData
        .getgummi(myServices.sharedPreferences.getInt("id")!);
    statusRequest = handlingData(response);
    if (StatusRequest.suksess == statusRequest) {
      if (response['status'] == "success") {
        gummidata.addAll(response['data']);
        bmwDataLoaded = true;
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  Future<void> getrib() async {
    if (bmwDataLoaded) return;

    ribdata.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await boatItemsData.getrib(myServices.sharedPreferences.getInt("id")!);
    statusRequest = handlingData(response);
    if (StatusRequest.suksess == statusRequest) {
      if (response['status'] == "success") {
        ribdata.addAll(response['data']);
        bmwDataLoaded = true;
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  Future<void> getseilboat() async {
    if (bmwDataLoaded) return;

    seilboatdata.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await boatItemsData
        .getseilboat(myServices.sharedPreferences.getInt("id")!);
    statusRequest = handlingData(response);
    if (StatusRequest.suksess == statusRequest) {
      if (response['status'] == "success") {
        seilboatdata.addAll(response['data']);
        bmwDataLoaded = true;
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  Future<void> getskjargardsjeep() async {
    if (bmwDataLoaded) return;

    skjargardjeepdata.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await boatItemsData
        .getskjargardsjeep(myServices.sharedPreferences.getInt("id")!);
    statusRequest = handlingData(response);
    if (StatusRequest.suksess == statusRequest) {
      if (response['status'] == "success") {
        skjargardjeepdata.addAll(response['data']);
        bmwDataLoaded = true;
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  Future<void> getpilothouse() async {
    if (bmwDataLoaded) return;

    pilothusdata.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await boatItemsData
        .getpilothouse(myServices.sharedPreferences.getInt("id")!);
    statusRequest = handlingData(response);
    if (StatusRequest.suksess == statusRequest) {
      if (response['status'] == "success") {
        pilothusdata.addAll(response['data']);
        bmwDataLoaded = true;
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  Future<void> getspeedboat() async {
    if (bmwDataLoaded) return;

    speedboatdata.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await boatItemsData
        .getspeedboat(myServices.sharedPreferences.getInt("id")!);
    statusRequest = handlingData(response);
    if (StatusRequest.suksess == statusRequest) {
      if (response['status'] == "success") {
        speedboatdata.addAll(response['data']);
        bmwDataLoaded = true;
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  Future<void> gettreboat() async {
    if (bmwDataLoaded) return;

    treboatdata.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await boatItemsData
        .gettreboat(myServices.sharedPreferences.getInt("id")!);
    statusRequest = handlingData(response);
    if (StatusRequest.suksess == statusRequest) {
      if (response['status'] == "success") {
        treboatdata.addAll(response['data']);
        bmwDataLoaded = true;
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  Future<void> getyacht() async {
    if (bmwDataLoaded) return;

    yachtdata.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await boatItemsData
        .getyacht(myServices.sharedPreferences.getInt("id")!);
    statusRequest = handlingData(response);
    if (StatusRequest.suksess == statusRequest) {
      if (response['status'] == "success") {
        yachtdata.addAll(response['data']);
        bmwDataLoaded = true;
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  Future<void> getvanscooter() async {
    if (bmwDataLoaded) return;

    vannscooterdata.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await boatItemsData
        .getvannscooter(myServices.sharedPreferences.getInt("id")!);
    statusRequest = handlingData(response);
    if (StatusRequest.suksess == statusRequest) {
      if (response['status'] == "success") {
        vannscooterdata.addAll(response['data']);
        bmwDataLoaded = true;
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  Future<void> getyrkesboat() async {
    if (bmwDataLoaded) return;

    yrkesboatdata.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await boatItemsData
        .getyrkesboat(myServices.sharedPreferences.getInt("id")!);
    statusRequest = handlingData(response);
    if (StatusRequest.suksess == statusRequest) {
      if (response['status'] == "success") {
        yrkesboatdata.addAll(response['data']);
        bmwDataLoaded = true;
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  int selectedIndex = -1;

  Future<void> toggleCategory(int index) async {
    if (selectedIndex == index) {
      selectedIndex = -1;
      update();
    } else {
      switch (index) {
        case 0:
          await getbowrider();
          break;
        case 1:
          await getcabincruiser();
          break;
        case 2:
          await getdaycruiser();
          break;
        case 3:
          await getgummi();
          break;
        case 4:
          await getrib();
          break;
        case 5:
          await getseilboat();
          break;
        case 6:
          await getskjargardsjeep();
          break;
        case 7:
          await getpilothouse();
          break;
        case 8:
          await getspeedboat();
          break;
        case 9:
          await gettreboat();
          break;
        case 10:
          await getyacht();
          break;
        case 11:
          await getvanscooter();
          break;
        case 12:
          await getyrkesboat();

          break;
      }
      selectedIndex = index;
      update();
    }
  }

  Widget buildRelevantView(int selectedIndex) {
    switch (selectedIndex) {
      case 0:
        return const RelevantBOWRIDER();
      case 1:
        return const RelevantCABINCRUISER();
      case 2:
        return const RelevantDAYCRUISER();
      case 3:
        return const RelevantGUMMI();
      case 4:
        return const RelevantRIB();
      case 5:
        return const RelevantSEILBOAT();
      case 6:
        return const RelevantSKJARGARDSJEEP();
      case 7:
        return const RelevantPILOTHOUSE();
      case 8:
        return const RelevantSPEEDBOAT();
      case 9:
        return const RelevantTREBOAT();
      case 10:
        return const RelevantYACHT();
      case 11:
        return const RelevantVANNSCOOTER();
      case 12:
        return const RelevantYRKESBOAT();
      default:
        return const SizedBox();
    }
  }

  String buildRelevantName(selectedIndex) {
    switch (selectedIndex) {
      case 0:
        return "Relevant Bowrider";
      case 1:
        return "Relevant Cabincruiser";
      case 2:
        return "Relevant Daycruiser";
      case 3:
        return "Relevant Gummibåt/Jolle";
      case 4:
        return "Relevant RIB";
      case 5:
        return "Relevant Seilbåt/Motorseiler";
      case 6:
        return "Relevant Skjærgårdsjeep/Landstedsbåt";
      case 7:
        return "Relevant Pilothouse";
      case 8:
        return "Relevant Speedbåt";
      case 9:
        return "Relevant Trebåt/Snekke";
      case 10:
        return "Relevant Yacht";
      case 11:
        return "Relevant Vannscooter";
      case 12:
        return "Relevant Yrkesbåt/Sjark/skøyte";
      default:
        return "";
    }
  }

  List getListAtselectedindex() {
    switch (selectedIndex) {
      case 0:
        return bowriderdata;
      case 1:
        return cabincruiserdata;
      case 2:
        return daycruiserdata;
      case 3:
        return gummidata;
      case 4:
        return ribdata;
      case 5:
        return seilboatdata;
      case 6:
        return skjargardjeepdata;
      case 7:
        return pilothusdata;
      case 8:
        return speedboatdata;
      case 9:
        return treboatdata;
      case 10:
        return yachtdata;
      case 11:
        return vannscooterdata;
      case 12:
        return yrkesboatdata;
      default:
        return [];
    }
  }
}
