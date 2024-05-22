import 'package:flutter/material.dart';
import 'package:flutter_isell_new/core/classes/statusrequest.dart';
import 'package:flutter_isell_new/core/functions/handling_data.dart';
import 'package:flutter_isell_new/core/services/services.dart';
import 'package:flutter_isell_new/data/items_data/furniture_data.dart';
import 'package:flutter_isell_new/views/screens/home/furniture_relavnt/klesskap.dart';
import 'package:flutter_isell_new/views/screens/home/furniture_relavnt/lamper.dart';
import 'package:flutter_isell_new/views/screens/home/furniture_relavnt/maleri.dart';
import 'package:flutter_isell_new/views/screens/home/furniture_relavnt/peis.dart';
import 'package:flutter_isell_new/views/screens/home/furniture_relavnt/senger.dart';
import 'package:flutter_isell_new/views/screens/home/furniture_relavnt/sofaer.dart';
import 'package:flutter_isell_new/views/screens/home/furniture_relavnt/speil.dart';
import 'package:flutter_isell_new/views/screens/home/furniture_relavnt/spisebord.dart';
import 'package:flutter_isell_new/views/screens/home/furniture_relavnt/stoler.dart';
import 'package:flutter_isell_new/views/screens/home/furniture_relavnt/tepper.dart';
import 'package:get/get.dart';

abstract class FurnitureController extends GetxController {}

class FurnitureControllerImp extends FurnitureController {
  late StatusRequest statusRequest;
  MyServices myServices = Get.find();
  FurnitureItemData furnitureItemData = FurnitureItemData(Get.find());

  List<String> moblertype = [
    "Senger",
    "Sofaer",
    "Tepper",
    "Spisebord",
    "Klesskap",
    "Lampe",
    "Speil",
    "Stoler",
    "Peis",
    "Malerier"
  ];

  bool bmwDataLoaded = false;

  List sengerdata = [];
  List sofaerdata = [];
  List tepperdata = [];
  List spiseborddata = [];
  List klesskapdata = [];
  List lampedata = [];
  List speildata = [];
  List stolerdata = [];
  List peisdata = [];
  List malerierdata = [];

  @override
  void onInit() {
    getsenger();
    getsofaer();
    gettepper();
    getspisebord();
    getkleskap();
    getlampe();
    getspeil();
    getstoler();
    getpeis();
    getmalerier();
    super.onInit();
  }

  Future<void> getsenger() async {
    if (bmwDataLoaded) return;
    statusRequest = StatusRequest.loading;
    update();
    var response = await furnitureItemData
        .getsenger(myServices.sharedPreferences.getInt("id")!);
    statusRequest = handlingData(response);
    if (StatusRequest.suksess == statusRequest) {
      if (response['status'] == "success") {
        sengerdata.addAll(response['data']);
        bmwDataLoaded = true;
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  Future<void> getsofaer() async {
    if (bmwDataLoaded) return;
    statusRequest = StatusRequest.loading;
    update();
    var response = await furnitureItemData
        .getsofaer(myServices.sharedPreferences.getInt("id")!);
    statusRequest = handlingData(response);
    if (StatusRequest.suksess == statusRequest) {
      if (response['status'] == "success") {
        sofaerdata.addAll(response['data']);
        bmwDataLoaded = true;
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  Future<void> gettepper() async {
    if (bmwDataLoaded) return;
    statusRequest = StatusRequest.loading;
    update();
    var response = await furnitureItemData
        .gettepper(myServices.sharedPreferences.getInt("id")!);
    statusRequest = handlingData(response);
    if (StatusRequest.suksess == statusRequest) {
      if (response['status'] == "success") {
        tepperdata.addAll(response['data']);
        bmwDataLoaded = true;
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  Future<void> getspisebord() async {
    if (bmwDataLoaded) return;
    statusRequest = StatusRequest.loading;
    update();
    var response = await furnitureItemData
        .getspisebord(myServices.sharedPreferences.getInt("id")!);
    statusRequest = handlingData(response);
    if (StatusRequest.suksess == statusRequest) {
      if (response['status'] == "success") {
        spiseborddata.addAll(response['data']);
        bmwDataLoaded = true;
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  Future<void> getkleskap() async {
    if (bmwDataLoaded) return;
    statusRequest = StatusRequest.loading;
    update();
    var response = await furnitureItemData
        .getkleskap(myServices.sharedPreferences.getInt("id")!);
    statusRequest = handlingData(response);
    if (StatusRequest.suksess == statusRequest) {
      if (response['status'] == "success") {
        klesskapdata.addAll(response['data']);
        bmwDataLoaded = true;
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  Future<void> getlampe() async {
    if (bmwDataLoaded) return;
    statusRequest = StatusRequest.loading;
    update();
    var response = await furnitureItemData
        .getlampe(myServices.sharedPreferences.getInt("id")!);
    statusRequest = handlingData(response);
    if (StatusRequest.suksess == statusRequest) {
      if (response['status'] == "success") {
        lampedata.addAll(response['data']);
        bmwDataLoaded = true;
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  Future<void> getspeil() async {
    if (bmwDataLoaded) return;
    statusRequest = StatusRequest.loading;
    update();
    var response = await furnitureItemData
        .getspeil(myServices.sharedPreferences.getInt("id")!);
    statusRequest = handlingData(response);
    if (StatusRequest.suksess == statusRequest) {
      if (response['status'] == "success") {
        speildata.addAll(response['data']);
        bmwDataLoaded = true;
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  Future<void> getstoler() async {
    if (bmwDataLoaded) return;
    statusRequest = StatusRequest.loading;
    update();
    var response = await furnitureItemData
        .getstoler(myServices.sharedPreferences.getInt("id")!);
    statusRequest = handlingData(response);
    if (StatusRequest.suksess == statusRequest) {
      if (response['status'] == "success") {
        stolerdata.addAll(response['data']);
        bmwDataLoaded = true;
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  Future<void> getpeis() async {
    if (bmwDataLoaded) return;
    statusRequest = StatusRequest.loading;
    update();
    var response = await furnitureItemData
        .getpeis(myServices.sharedPreferences.getInt("id")!);
    statusRequest = handlingData(response);
    if (StatusRequest.suksess == statusRequest) {
      if (response['status'] == "success") {
        peisdata.addAll(response['data']);
        bmwDataLoaded = true;
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  Future<void> getmalerier() async {
    if (bmwDataLoaded) return;
    statusRequest = StatusRequest.loading;
    update();
    var response = await furnitureItemData
        .getmaleri(myServices.sharedPreferences.getInt("id")!);
    statusRequest = handlingData(response);
    if (StatusRequest.suksess == statusRequest) {
      if (response['status'] == "success") {
        malerierdata.addAll(response['data']);
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
          await getsenger();
          break;
        case 1:
          await getsofaer();
          break;
        case 2:
          await gettepper();
          break;
        case 3:
          await getspisebord();
          break;
        case 4:
          await getkleskap();
          break;
        case 5:
          await getlampe();
          break;
        case 6:
          await getspeil();
          break;
        case 7:
          await getstoler();
          break;
        case 8:
          await getpeis();
          break;
        case 9:
          await getmalerier();
          break;
      }
      selectedIndex = index;
      update();
    }
  }

  Widget buildRelevantView(int selectedIndex) {
    switch (selectedIndex) {
      case 0:
        return const RelevantSENGER();
      case 1:
        return const RelevantSOFAER();
      case 2:
        return const RelevantTEPPER();
      case 3:
        return const RelevantSPISEBORD();
      case 4:
        return const RelevantKLESSKAP();
      case 5:
        return const RelevantLAMPER();
      case 6:
        return const RelevantSPEIL();
      case 7:
        return const RelevantSTOLER();
      case 8:
        return const RelevantPEIS();
      case 9:
        return const RelevantMALERIER();
      default:
        return const SizedBox();
    }
  }

  String buildRelevantName(selectedIndex) {
    switch (selectedIndex) {
      case 0:
        return "Relevant Senger";
      case 1:
        return "Relevant Sofaer";
      case 2:
        return "Relevant Tepper";
      case 3:
        return "Relevant Spisebord";
      case 4:
        return "Relevant Klesskap";
      case 5:
        return "Relevant Lampe";
      case 6:
        return "Relevant Speil";
      case 7:
        return "Relevant Stoler";
      case 8:
        return "Relevant Peis";
      case 9:
        return "Relevant Malerier";
      default:
        return "";
    }
  }

  List getListAtselectedindex() {
    switch (selectedIndex) {
      case 0:
        return sengerdata;
      case 1:
        return sofaerdata;
      case 2:
        return tepperdata;
      case 3:
        return spiseborddata;
      case 4:
        return klesskapdata;
      case 5:
        return lampedata;
      case 6:
        return speildata;
      case 7:
        return stolerdata;
      case 8:
        return peisdata;
      case 9:
        return malerierdata;
      default:
        return [];
    }
  }
}
