import 'package:flutter/material.dart';
import 'package:flutter_isell_new/core/classes/statusrequest.dart';
import 'package:flutter_isell_new/core/functions/handling_data.dart';
import 'package:flutter_isell_new/core/services/services.dart';
import 'package:flutter_isell_new/data/items_data/bicycles_data.dart';
import 'package:flutter_isell_new/views/screens/home/bicycles_relevant/barnesykkel.dart';
import 'package:flutter_isell_new/views/screens/home/bicycles_relevant/bmx.dart';
import 'package:flutter_isell_new/views/screens/home/bicycles_relevant/bysykkel.dart';
import 'package:flutter_isell_new/views/screens/home/bicycles_relevant/cyclocross.dart';
import 'package:flutter_isell_new/views/screens/home/bicycles_relevant/elektrikse.dart';
import 'package:flutter_isell_new/views/screens/home/bicycles_relevant/fulldamper.dart';
import 'package:flutter_isell_new/views/screens/home/bicycles_relevant/hybrid.dart';
import 'package:flutter_isell_new/views/screens/home/bicycles_relevant/landevei.dart';
import 'package:flutter_isell_new/views/screens/home/bicycles_relevant/sparkesykkel.dart';
import 'package:flutter_isell_new/views/screens/home/bicycles_relevant/terreng.dart';
import 'package:flutter_isell_new/views/screens/home/bicycles_relevant/trehjulsykkel.dart';
import 'package:get/get.dart';

abstract class BicycleController extends GetxController {}

class BicycleControllerImp extends BicycleController {
  BicyclesItemData bicyclesItemData = BicyclesItemData(Get.find());
  MyServices myServices = Get.find();
  late StatusRequest statusRequest;

  List<String> sykkeltype = [
    "BMX",
    "Cyclocross/gravel",
    "Elektriske",
    "Fulldamper",
    "Hybrid",
    "Landevei",
    "Terreng",
    "Barnesykkel 2-12 år",
    "Bysykkel/sammenleggbare",
    "Sparkesykkel",
    "Trehjulssykkel/løpesykkel",
  ];

  bool bmwDataLoaded = false;

  List bmx = [];
  List cyclocross = [];
  List elektrisk = [];
  List fulldamper = [];
  List hybrid = [];
  List landevei = [];
  List terreng = [];
  List barnesykkel = [];
  List bysykkel = [];
  List sparkesykkel = [];
  List trehjulsykkel = [];

  @override
  void onInit() {
    getbmx();
    getcyclocross();
    getelektrikse();
    getfulldamper();
    gethybrid();
    getlandevei();
    getterreng();
    getbarnesykkel();
    getbysykkel();
    getsparkesykkel();
    gettrehjulsykkel();
    super.onInit();
  }

  Future<void> getbmx() async {
    if (bmwDataLoaded) return;

    bmx.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await bicyclesItemData
        .getbmx(myServices.sharedPreferences.getInt("id")!);
    statusRequest = handlingData(response);
    if (StatusRequest.suksess == statusRequest) {
      if (response['status'] == "success") {
        bmx.addAll(response['data']);
        bmwDataLoaded = true;
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  Future<void> getcyclocross() async {
    if (bmwDataLoaded) return;

    cyclocross.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await bicyclesItemData
        .getcyclocross(myServices.sharedPreferences.getInt("id")!);
    statusRequest = handlingData(response);
    if (StatusRequest.suksess == statusRequest) {
      if (response['status'] == "success") {
        cyclocross.addAll(response['data']);
        bmwDataLoaded = true;
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  Future<void> getelektrikse() async {
    if (bmwDataLoaded) return;

    elektrisk.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await bicyclesItemData
        .getelektrisk(myServices.sharedPreferences.getInt("id")!);
    statusRequest = handlingData(response);
    if (StatusRequest.suksess == statusRequest) {
      if (response['status'] == "success") {
        elektrisk.addAll(response['data']);
        bmwDataLoaded = true;
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  Future<void> getfulldamper() async {
    if (bmwDataLoaded) return;

    fulldamper.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await bicyclesItemData
        .getfulldamper(myServices.sharedPreferences.getInt("id")!);
    statusRequest = handlingData(response);
    if (StatusRequest.suksess == statusRequest) {
      if (response['status'] == "success") {
        fulldamper.addAll(response['data']);
        bmwDataLoaded = true;
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  Future<void> gethybrid() async {
    if (bmwDataLoaded) return;

    hybrid.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await bicyclesItemData
        .gethybrid(myServices.sharedPreferences.getInt("id")!);
    statusRequest = handlingData(response);
    if (StatusRequest.suksess == statusRequest) {
      if (response['status'] == "success") {
        hybrid.addAll(response['data']);
        bmwDataLoaded = true;
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  // Future<void> getlandevei() async {
  //   if (bmwDataLoaded) return;

  //   landevei.clear();
  //   statusRequest = StatusRequest.loading;
  //   update();
  //   var response = await syklerAnnonseData
  //       .getlandvei(myServices.sharedPreferences.getInt("id")!);
  //   statusRequest = handlingData(response);
  //   if (StatusRequest.suksess == statusRequest) {
  //     if (response['status'] == "success") {
  //       landevei.addAll(response['data']);
  //       bmwDataLoaded = true;
  //     } else {
  //       statusRequest = StatusRequest.failure;
  //     }
  //   }
  //   update();
  // }

  //////////////////
  getlandevei() async {
    landevei.clear();
    update();
    statusRequest = StatusRequest.loading;
    var response = await bicyclesItemData
        .getlandvei(myServices.sharedPreferences.getInt("id")!);
    statusRequest = handlingData(response);
    if (StatusRequest.suksess == statusRequest) {
      statusRequest = StatusRequest.loading;
      if (response['status'] == "success") {
        landevei.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
  /////////////////

  Future<void> getterreng() async {
    if (bmwDataLoaded) return;

    terreng.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await bicyclesItemData
        .getterreng(myServices.sharedPreferences.getInt("id")!);
    statusRequest = handlingData(response);
    if (StatusRequest.suksess == statusRequest) {
      if (response['status'] == "success") {
        terreng.addAll(response['data']);
        bmwDataLoaded = true;
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  Future<void> getbarnesykkel() async {
    if (bmwDataLoaded) return;

    barnesykkel.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await bicyclesItemData
        .getbarnesykkel(myServices.sharedPreferences.getInt("id")!);
    statusRequest = handlingData(response);
    if (StatusRequest.suksess == statusRequest) {
      if (response['status'] == "success") {
        barnesykkel.addAll(response['data']);
        bmwDataLoaded = true;
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  Future<void> getbysykkel() async {
    if (bmwDataLoaded) return;

    bysykkel.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await bicyclesItemData
        .getbysykkel(myServices.sharedPreferences.getInt("id")!);
    statusRequest = handlingData(response);
    if (StatusRequest.suksess == statusRequest) {
      if (response['status'] == "success") {
        bysykkel.addAll(response['data']);
        bmwDataLoaded = true;
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  // Future<void> getsparkesykkel() async {
  //   if (bmwDataLoaded) return;

  //   sparkesykkel.clear();
  //   statusRequest = StatusRequest.loading;
  //   update();
  //   var response = await syklerAnnonseData
  //       .getsparkesykkel(myServices.sharedPreferences.getInt("id")!);
  //   statusRequest = handlingData(response);
  //   if (StatusRequest.suksess == statusRequest) {
  //     if (response['status'] == "success") {
  //       sparkesykkel.addAll(response['data']);
  //       bmwDataLoaded = true;
  //     } else {
  //       statusRequest = StatusRequest.failure;
  //     }
  //   }
  //   update();
  // }

  /////////////

  getsparkesykkel() async {
    sparkesykkel.clear();
    update();
    statusRequest = StatusRequest.loading;
    var response = await bicyclesItemData
        .getsparkesykkel(myServices.sharedPreferences.getInt("id")!);
    statusRequest = handlingData(response);
    if (StatusRequest.suksess == statusRequest) {
      if (response['status'] == "success") {
        sparkesykkel.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  ////////////

  Future<void> gettrehjulsykkel() async {
    if (bmwDataLoaded) return;

    trehjulsykkel.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await bicyclesItemData
        .gettrehjulsykkel(myServices.sharedPreferences.getInt("id")!);
    statusRequest = handlingData(response);
    if (StatusRequest.suksess == statusRequest) {
      if (response['status'] == "success") {
        trehjulsykkel.addAll(response['data']);
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
          await getbmx();
          break;
        case 1:
          await getcyclocross();
          break;
        case 2:
          await getelektrikse();
          break;
        case 3:
          await getfulldamper();
          break;
        case 4:
          await gethybrid();
          break;
        case 5:
          await getlandevei();
          break;
        case 6:
          await getterreng();
          break;
        case 7:
          await getbarnesykkel();
          break;
        case 8:
          await getbysykkel();
          break;
        case 9:
          await getsparkesykkel();
          break;
        case 10:
          await gettrehjulsykkel();
          break;
      }
      selectedIndex = index;
      update();
    }
  }

  Widget buildRelevantView(int selectedIndex) {
    switch (selectedIndex) {
      case 0:
        return const RelevantBMX();
      case 1:
        return const RelevantCYCLOCROSS();
      case 2:
        return const RelevantELEKTRISKE();
      case 3:
        return const RelevantFULLDAMPER();
      case 4:
        return const RelevantHYBRID();
      case 5:
        return const RelevantLANDEVEI();
      case 6:
        return const RelevantTERRENG();
      case 7:
        return const RelevantBARNESYKKEL();
      case 8:
        return const RelevantBYSYKKEL();
      case 9:
        return const RelevantSPARKESYKKEL();
      case 10:
        return const RelevantTREHJULSYKKEL();
      default:
        return const SizedBox();
    }
  }

  String buildRelevantName(selectedIndex) {
    switch (selectedIndex) {
      case 0:
        return "Relevant BMX";
      case 1:
        return "Relevant Cyclocross/gravel";
      case 2:
        return "Relevant Elektriske";
      case 3:
        return "Relevant Fulldamper";
      case 4:
        return "Relevant Hybrid";
      case 5:
        return "Relevant Landevei";
      case 6:
        return "Relevant Terreng";
      case 7:
        return "Relevant Barnesykkel 2-12 år";
      case 8:
        return "Relevant Bysykkel/sammenleggbare";
      case 9:
        return "Relevant Sparkesykkel";
      case 10:
        return "Relevant Trehjulssykkel/løpesykkel";
      default:
        return "";
    }
  }

  List getListAtselectedindex() {
    switch (selectedIndex) {
      case 0:
        return bmx;
      case 1:
        return cyclocross;
      case 2:
        return elektrisk;
      case 3:
        return fulldamper;
      case 4:
        return hybrid;
      case 5:
        return landevei;
      case 6:
        return terreng;
      case 7:
        return barnesykkel;
      case 8:
        return bysykkel;
      case 9:
        return sparkesykkel;
      case 10:
        return trehjulsykkel;
      default:
        return [];
    }
  }
}
