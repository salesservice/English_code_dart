import 'package:flutter/material.dart';
import 'package:flutter_isell_new/core/classes/statusrequest.dart';
import 'package:flutter_isell_new/core/functions/handling_data.dart';
import 'package:flutter_isell_new/core/services/services.dart';
import 'package:flutter_isell_new/data/items_data/motorcycle_data.dart';
import 'package:flutter_isell_new/views/screens/home/motorcycles_relevant/atv.dart';
import 'package:flutter_isell_new/views/screens/home/motorcycles_relevant/moped.dart';
import 'package:flutter_isell_new/views/screens/home/motorcycles_relevant/motorsykler.dart';
import 'package:flutter_isell_new/views/screens/home/motorcycles_relevant/snoscooter.dart';
import 'package:get/get.dart';

abstract class MCController extends GetxController {}

class MCControllerImp extends MCController {
  late StatusRequest statusRequest;
  MyServices myServices = Get.find();
  MotorcycleItemData motorcycleItemData = MotorcycleItemData(Get.find());
  List<String> mctype = [
    "Motorsykler",
    "Mopeder",
    "Snøscooter",
    "ATVer",
  ];
  @override
  void onInit() {
    getmotorsykler();
    getmopeder();
    getsnoscooter();
    getatv();
    super.onInit();
  }

  bool bmwDataLoaded = false;

  List motorsyklerdata = [];
  List mopeddata = [];
  List snoscooterdata = [];
  List atvdata = [];

  Future<void> getmotorsykler() async {
    if (bmwDataLoaded) return;
    statusRequest = StatusRequest.loading;
    update();
    var response = await motorcycleItemData
        .getmotosykler(myServices.sharedPreferences.getInt("id")!);
    statusRequest = handlingData(response);
    if (StatusRequest.suksess == statusRequest) {
      if (response['status'] == "success") {
        motorsyklerdata.addAll(response['data']);
        bmwDataLoaded = true;
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  Future<void> getmopeder() async {
    if (bmwDataLoaded) return;

    mopeddata.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await motorcycleItemData
        .getmoped(myServices.sharedPreferences.getInt("id")!);
    statusRequest = handlingData(response);
    if (StatusRequest.suksess == statusRequest) {
      if (response['status'] == "success") {
        mopeddata.addAll(response['data']);
        bmwDataLoaded = true;
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  Future<void> getsnoscooter() async {
    if (bmwDataLoaded) return;

    snoscooterdata.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await motorcycleItemData
        .getsnoscooter(myServices.sharedPreferences.getInt("id")!);
    statusRequest = handlingData(response);
    if (StatusRequest.suksess == statusRequest) {
      if (response['status'] == "success") {
        snoscooterdata.addAll(response['data']);
        bmwDataLoaded = true;
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  Future<void> getatv() async {
    if (bmwDataLoaded) return;

    atvdata.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await motorcycleItemData
        .getatv(myServices.sharedPreferences.getInt("id")!);
    statusRequest = handlingData(response);
    if (StatusRequest.suksess == statusRequest) {
      if (response['status'] == "success") {
        atvdata.addAll(response['data']);
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
          await getmotorsykler();
          break;
        case 1:
          await getmopeder();
          break;
        case 2:
          await getsnoscooter();
          break;
        case 3:
          await getatv();
          break;
      }
      selectedIndex = index;
      update();
    }
  }

  Widget buildRelevantView(int selectedIndex) {
    switch (selectedIndex) {
      case 0:
        return const RelevantMOTORSYKLER();
      case 1:
        return const RelevantMOPED();
      case 2:
        return const RelevantSNOSCOOTER();
      case 3:
        return const RelevantATV();

      default:
        return const SizedBox();
    }
  }

  String buildRelevantName(selectedIndex) {
    switch (selectedIndex) {
      case 0:
        return "Relevant Motorsykler";
      case 1:
        return "Relevant Mopeder";
      case 2:
        return "Relevant Snøscooter";
      case 3:
        return "Relevant ATVer";

      default:
        return "";
    }
  }

  List getListAtselectedindex() {
    switch (selectedIndex) {
      case 0:
        return motorsyklerdata;
      case 1:
        return mopeddata;
      case 2:
        return snoscooterdata;
      case 3:
        return atvdata;

      default:
        return [];
    }
  }
}
