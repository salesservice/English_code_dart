import 'package:flutter/material.dart';
import 'package:flutter_isell_new/core/classes/statusrequest.dart';
import 'package:flutter_isell_new/core/functions/handling_data.dart';
import 'package:flutter_isell_new/core/services/services.dart';
import 'package:flutter_isell_new/data/items_data/clothes_data.dart';
import 'package:flutter_isell_new/views/screens/home/clothes_relevant/bukser.dart';
import 'package:flutter_isell_new/views/screens/home/clothes_relevant/dresser.dart';
import 'package:flutter_isell_new/views/screens/home/clothes_relevant/frakker.dart';
import 'package:flutter_isell_new/views/screens/home/clothes_relevant/kjoler.dart';
import 'package:flutter_isell_new/views/screens/home/clothes_relevant/skjorter.dart';
import 'package:flutter_isell_new/views/screens/home/clothes_relevant/sko.dart';
import 'package:flutter_isell_new/views/screens/home/clothes_relevant/tskjorter.dart';
import 'package:flutter_isell_new/views/screens/home/clothes_relevant/turbukser.dart';
import 'package:flutter_isell_new/views/screens/home/clothes_relevant/vester.dart';
import 'package:flutter_isell_new/views/screens/home/clothes_relevant/vinterjakker.dart';
import 'package:get/get.dart';

abstract class KlarController extends GetxController {}

class KlarControllerImp extends KlarController {
  late StatusRequest statusRequest;
  MyServices myServices = Get.find();
  ClothesItemData clothesItemData = ClothesItemData(Get.find());

  List<String> klartype = [
    "Sko",
    "Vinterjakker",
    "Bukser",
    "T-skjorter",
    "Frakker",
    "Dresser",
    "Kjoler",
    "Vester",
    "Skjorter",
    "Turbukser"
  ];

  bool bmwDataLoaded = false;

  List skodata = [];
  List vinterjakkerdata = [];
  List bukserdata = [];
  List tskjorterdata = [];
  List frakkerdata = [];
  List dresserdata = [];
  List kjolerdata = [];
  List vesterdata = [];
  List skjorterdata = [];
  List turbukserdata = [];

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> getsko() async {
    if (bmwDataLoaded) return;
    statusRequest = StatusRequest.loading;
    update();
    var response = await clothesItemData
        .getsko(myServices.sharedPreferences.getInt("id")!);
    statusRequest = handlingData(response);
    if (StatusRequest.suksess == statusRequest) {
      if (response['status'] == "success") {
        skodata.addAll(response['data']);
        bmwDataLoaded = true;
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  Future<void> getvinterjakker() async {
    if (bmwDataLoaded) return;
    statusRequest = StatusRequest.loading;
    update();
    var response = await clothesItemData
        .getvinterjakker(myServices.sharedPreferences.getInt("id")!);
    statusRequest = handlingData(response);
    if (StatusRequest.suksess == statusRequest) {
      if (response['status'] == "success") {
        vinterjakkerdata.addAll(response['data']);
        bmwDataLoaded = true;
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  Future<void> getbukser() async {
    if (bmwDataLoaded) return;
    statusRequest = StatusRequest.loading;
    update();
    var response = await clothesItemData
        .getbukser(myServices.sharedPreferences.getInt("id")!);
    statusRequest = handlingData(response);
    if (StatusRequest.suksess == statusRequest) {
      if (response['status'] == "success") {
        bukserdata.addAll(response['data']);
        bmwDataLoaded = true;
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  Future<void> gettskjorter() async {
    if (bmwDataLoaded) return;
    statusRequest = StatusRequest.loading;
    update();
    var response = await clothesItemData
        .gettskjorter(myServices.sharedPreferences.getInt("id")!);
    statusRequest = handlingData(response);
    if (StatusRequest.suksess == statusRequest) {
      if (response['status'] == "success") {
        tskjorterdata.addAll(response['data']);
        bmwDataLoaded = true;
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  Future<void> getfrakker() async {
    if (bmwDataLoaded) return;
    statusRequest = StatusRequest.loading;
    update();
    var response = await clothesItemData
        .getfrakker(myServices.sharedPreferences.getInt("id")!);
    statusRequest = handlingData(response);
    if (StatusRequest.suksess == statusRequest) {
      if (response['status'] == "success") {
        frakkerdata.addAll(response['data']);
        bmwDataLoaded = true;
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  Future<void> getdresser() async {
    if (bmwDataLoaded) return;
    statusRequest = StatusRequest.loading;
    update();
    var response = await clothesItemData
        .getdresser(myServices.sharedPreferences.getInt("id")!);
    statusRequest = handlingData(response);
    if (StatusRequest.suksess == statusRequest) {
      if (response['status'] == "success") {
        dresserdata.addAll(response['data']);
        bmwDataLoaded = true;
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  Future<void> getkjoler() async {
    if (bmwDataLoaded) return;
    statusRequest = StatusRequest.loading;
    update();
    var response = await clothesItemData
        .getkjoler(myServices.sharedPreferences.getInt("id")!);
    statusRequest = handlingData(response);
    if (StatusRequest.suksess == statusRequest) {
      if (response['status'] == "success") {
        kjolerdata.addAll(response['data']);
        bmwDataLoaded = true;
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  Future<void> getvester() async {
    if (bmwDataLoaded) return;
    statusRequest = StatusRequest.loading;
    update();
    var response = await clothesItemData
        .getvester(myServices.sharedPreferences.getInt("id")!);
    statusRequest = handlingData(response);
    if (StatusRequest.suksess == statusRequest) {
      if (response['status'] == "success") {
        vesterdata.addAll(response['data']);
        bmwDataLoaded = true;
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  Future<void> getskjorter() async {
    if (bmwDataLoaded) return;
    statusRequest = StatusRequest.loading;
    update();
    var response = await clothesItemData
        .getskjorter(myServices.sharedPreferences.getInt("id")!);
    statusRequest = handlingData(response);
    if (StatusRequest.suksess == statusRequest) {
      if (response['status'] == "success") {
        skjorterdata.addAll(response['data']);
        bmwDataLoaded = true;
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  Future<void> getturbukser() async {
    if (bmwDataLoaded) return;
    statusRequest = StatusRequest.loading;
    update();
    var response = await clothesItemData
        .getturbukser(myServices.sharedPreferences.getInt("id")!);
    statusRequest = handlingData(response);
    if (StatusRequest.suksess == statusRequest) {
      if (response['status'] == "success") {
        turbukserdata.addAll(response['data']);
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
          await getsko();
          break;
        case 1:
          await getvinterjakker();
          break;
        case 2:
          await getbukser();
          break;
        case 3:
          await gettskjorter();
          break;
        case 4:
          await getfrakker();
          break;
        case 5:
          await getdresser();
          break;
        case 6:
          await getkjoler();
          break;
        case 7:
          await getvester();
          break;
        case 8:
          await getskjorter();
          break;
        case 9:
          await getturbukser();
          break;
      }
      selectedIndex = index;
      update();
    }
  }

  Widget buildRelevantView(int selectedIndex) {
    switch (selectedIndex) {
      case 0:
        return const RelevantSKO();
      case 1:
        return const RelevantVINTERJAKKER();
      case 2:
        return const RelevantBUKSER();
      case 3:
        return const RelevantTSKJORTER();
      case 4:
        return const RelevantFRAKKER();
      case 5:
        return const RelevantDRESSER();
      case 6:
        return const RelevantKJOLER();
      case 7:
        return const RelevantVESTER();
      case 8:
        return const RelevantSKJORTER();
      case 9:
        return const RelevantTURBUKSER();
      default:
        return const SizedBox();
    }
  }

  String buildRelevantName(selectedIndex) {
    switch (selectedIndex) {
      case 0:
        return "Relevant Sko";
      case 1:
        return "Relevant Vinterjakker";
      case 2:
        return "Relevant Bukser";
      case 3:
        return "Relevant T-skjorter";
      case 4:
        return "Relevant Frakker";
      case 5:
        return "Relevant Dresser";
      case 6:
        return "Relevant Kjoler";
      case 7:
        return "Relevant Vester";
      case 8:
        return "Relevant Skjorter";
      case 9:
        return "Relevant Turbukser";
      default:
        return "";
    }
  }

  List getListAtselectedindex() {
    switch (selectedIndex) {
      case 0:
        return skodata;
      case 1:
        return vinterjakkerdata;
      case 2:
        return bukserdata;
      case 3:
        return tskjorterdata;
      case 4:
        return frakkerdata;
      case 5:
        return dresserdata;
      case 6:
        return kjolerdata;
      case 7:
        return vesterdata;
      case 8:
        return skjorterdata;
      case 9:
        return turbukserdata;
      default:
        return [];
    }
  }
}
