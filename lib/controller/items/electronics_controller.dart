import 'package:flutter/material.dart';
import 'package:flutter_isell_new/core/classes/statusrequest.dart';
import 'package:flutter_isell_new/core/functions/handling_data.dart';
import 'package:flutter_isell_new/core/services/services.dart';
import 'package:flutter_isell_new/data/items_data/electronics_data.dart';
import 'package:flutter_isell_new/views/screens/home/electronics_relevant/harfoner.dart';
import 'package:flutter_isell_new/views/screens/home/electronics_relevant/hoyttaler.dart';
import 'package:flutter_isell_new/views/screens/home/electronics_relevant/iphonelader.dart';
import 'package:flutter_isell_new/views/screens/home/electronics_relevant/kjoleskap.dart';
import 'package:flutter_isell_new/views/screens/home/electronics_relevant/mikrobolgeovn.dart';
import 'package:flutter_isell_new/views/screens/home/electronics_relevant/ovner.dart';
import 'package:flutter_isell_new/views/screens/home/electronics_relevant/pcskjermer.dart';
import 'package:flutter_isell_new/views/screens/home/electronics_relevant/torketrommel.dart';
import 'package:flutter_isell_new/views/screens/home/electronics_relevant/vaksemaskin.dart';
import 'package:flutter_isell_new/views/screens/home/electronics_relevant/vrbriller.dart';
import 'package:get/get.dart';

abstract class ElectronicsController extends GetxController {}

class ElektronikkControllerImp extends ElectronicsController {
  late StatusRequest statusRequest;
  MyServices myServices = Get.find();
  ElectronicsItemData electronicsItemData = ElectronicsItemData(Get.find());

  List<String> elektronikktype = [
    "PC-skjermer",
    "Høyttalere",
    "VR-briller",
    "Iphone lader",
    "Vaksemaskiner",
    "Tørketrømler",
    "Kjøleskap",
    "Ovner",
    "Hårføner",
    "Mikrobølgeovn"
  ];

  bool bmwDataLoaded = false;

  List pcskjermerdata = [];
  List hoyttalerdata = [];
  List vrbrillerdata = [];
  List iphoneladerdata = [];
  List vaskemaskindata = [];
  List torketrommeldata = [];
  List kjoleskapdata = [];
  List ovnerdata = [];
  List harfonerdata = [];
  List mikrobolgeovndata = [];

  @override
  void onInit() {
    getpcskjermer();
    gethoyttaler();
    getvrbriller();
    getiphonelader();
    getvaskemaskiner();
    gettorketrommel();
    getkjoleskap();
    getovner();
    getharfoner();
    getmikrobolgeovn();
    super.onInit();
  }

  Future<void> getpcskjermer() async {
    if (bmwDataLoaded) return;
    statusRequest = StatusRequest.loading;
    update();
    var response = await electronicsItemData
        .getpcskjermer(myServices.sharedPreferences.getInt("id")!);
    statusRequest = handlingData(response);
    if (StatusRequest.suksess == statusRequest) {
      if (response['status'] == "success") {
        pcskjermerdata.addAll(response['data']);
        bmwDataLoaded = true;
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  Future<void> gethoyttaler() async {
    if (bmwDataLoaded) return;
    statusRequest = StatusRequest.loading;
    update();
    var response = await electronicsItemData
        .gethoyttaler(myServices.sharedPreferences.getInt("id")!);
    statusRequest = handlingData(response);
    if (StatusRequest.suksess == statusRequest) {
      if (response['status'] == "success") {
        hoyttalerdata.addAll(response['data']);
        bmwDataLoaded = true;
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  Future<void> getvrbriller() async {
    if (bmwDataLoaded) return;
    statusRequest = StatusRequest.loading;
    update();
    var response = await electronicsItemData
        .getvrbriller(myServices.sharedPreferences.getInt("id")!);
    statusRequest = handlingData(response);
    if (StatusRequest.suksess == statusRequest) {
      if (response['status'] == "success") {
        vrbrillerdata.addAll(response['data']);
        bmwDataLoaded = true;
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  Future<void> getiphonelader() async {
    if (bmwDataLoaded) return;
    statusRequest = StatusRequest.loading;
    update();
    var response = await electronicsItemData
        .getiphonlader(myServices.sharedPreferences.getInt("id")!);
    statusRequest = handlingData(response);
    if (StatusRequest.suksess == statusRequest) {
      if (response['status'] == "success") {
        iphoneladerdata.addAll(response['data']);
        bmwDataLoaded = true;
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  Future<void> getvaskemaskiner() async {
    if (bmwDataLoaded) return;
    statusRequest = StatusRequest.loading;
    update();
    var response = await electronicsItemData
        .getvaksemaskin(myServices.sharedPreferences.getInt("id")!);
    statusRequest = handlingData(response);
    if (StatusRequest.suksess == statusRequest) {
      if (response['status'] == "success") {
        vaskemaskindata.addAll(response['data']);
        bmwDataLoaded = true;
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  Future<void> gettorketrommel() async {
    if (bmwDataLoaded) return;
    statusRequest = StatusRequest.loading;
    update();
    var response = await electronicsItemData
        .gettorketrommel(myServices.sharedPreferences.getInt("id")!);
    statusRequest = handlingData(response);
    if (StatusRequest.suksess == statusRequest) {
      if (response['status'] == "success") {
        torketrommeldata.addAll(response['data']);
        bmwDataLoaded = true;
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  Future<void> getkjoleskap() async {
    if (bmwDataLoaded) return;
    statusRequest = StatusRequest.loading;
    update();
    var response = await electronicsItemData
        .getkjoleskap(myServices.sharedPreferences.getInt("id")!);
    statusRequest = handlingData(response);
    if (StatusRequest.suksess == statusRequest) {
      if (response['status'] == "success") {
        kjoleskapdata.addAll(response['data']);
        bmwDataLoaded = true;
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  Future<void> getovner() async {
    if (bmwDataLoaded) return;
    statusRequest = StatusRequest.loading;
    update();
    var response = await electronicsItemData
        .getovner(myServices.sharedPreferences.getInt("id")!);
    statusRequest = handlingData(response);
    if (StatusRequest.suksess == statusRequest) {
      if (response['status'] == "success") {
        ovnerdata.addAll(response['data']);
        bmwDataLoaded = true;
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  Future<void> getharfoner() async {
    if (bmwDataLoaded) return;
    statusRequest = StatusRequest.loading;
    update();
    var response = await electronicsItemData
        .getharfoner(myServices.sharedPreferences.getInt("id")!);
    statusRequest = handlingData(response);
    if (StatusRequest.suksess == statusRequest) {
      if (response['status'] == "success") {
        harfonerdata.addAll(response['data']);
        bmwDataLoaded = true;
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  Future<void> getmikrobolgeovn() async {
    if (bmwDataLoaded) return;
    statusRequest = StatusRequest.loading;
    update();
    var response = await electronicsItemData
        .getmikrobolgeovn(myServices.sharedPreferences.getInt("id")!);
    statusRequest = handlingData(response);
    if (StatusRequest.suksess == statusRequest) {
      if (response['status'] == "success") {
        mikrobolgeovndata.addAll(response['data']);
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
          await getpcskjermer();
          break;
        case 1:
          await gethoyttaler();
          break;
        case 2:
          await getvrbriller();
          break;
        case 3:
          await getiphonelader();
          break;
        case 4:
          await getvaskemaskiner();
          break;
        case 5:
          await gettorketrommel();
          break;
        case 6:
          await getkjoleskap();
          break;
        case 7:
          await getovner();
          break;
        case 8:
          await getharfoner();
          break;
        case 9:
          await getmikrobolgeovn();
          break;
      }
      selectedIndex = index;
      update();
    }
  }

  Widget buildRelevantView(int selectedIndex) {
    switch (selectedIndex) {
      case 0:
        return const RelevantPCSKJERMER();
      case 1:
        return const RelevantHOYTTALER();
      case 2:
        return const RelevantVRBRILLER();
      case 3:
        return const RelevantIPHONELADER();
      case 4:
        return const RelevantVASKEMASKIN();
      case 5:
        return const RelevantTORKETROMMEL();
      case 6:
        return const RelevantKJOLESKAP();
      case 7:
        return const RelevantOVNER();
      case 8:
        return const RelevantHARFONER();
      case 9:
        return const RelevantMIKROBOLGEOVN();
      default:
        return const SizedBox();
    }
  }

  String buildRelevantName(selectedIndex) {
    switch (selectedIndex) {
      case 0:
        return "Relevant PC-skjermer";
      case 1:
        return "Relevant Høyttaler";
      case 2:
        return "Relevant VR-briller";
      case 3:
        return "Relevant Iphone lader";
      case 4:
        return "Relevant Vaskemaskiner";
      case 5:
        return "Relevant Tørketromler";
      case 6:
        return "Relevant Kjøleskap";
      case 7:
        return "Relevant Ovner";
      case 8:
        return "Relevant Hårføner";
      case 9:
        return "Relevant Mikrobølgeovn";
      default:
        return "";
    }
  }

  List getListAtselectedindex() {
    switch (selectedIndex) {
      case 0:
        return pcskjermerdata;
      case 1:
        return hoyttalerdata;
      case 2:
        return vrbrillerdata;
      case 3:
        return iphoneladerdata;
      case 4:
        return vaskemaskindata;
      case 5:
        return torketrommeldata;
      case 6:
        return kjoleskapdata;
      case 7:
        return ovnerdata;
      case 8:
        return harfonerdata;
      case 9:
        return mikrobolgeovndata;
      default:
        return [];
    }
  }
}
