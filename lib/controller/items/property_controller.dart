import 'package:flutter/material.dart';
import 'package:flutter_isell_new/core/classes/statusrequest.dart';
import 'package:flutter_isell_new/core/functions/handling_data.dart';
import 'package:flutter_isell_new/core/services/services.dart';
import 'package:flutter_isell_new/data/items_data/property_data.dart';
import 'package:flutter_isell_new/views/screens/home/property_relevant/aksjerelevant.dart';
import 'package:flutter_isell_new/views/screens/home/property_relevant/boligtileie.dart';
import 'package:flutter_isell_new/views/screens/home/property_relevant/boligtilsalgs.dart';
import 'package:flutter_isell_new/views/screens/home/property_relevant/eneboligrelevant.dart';
import 'package:flutter_isell_new/views/screens/home/property_relevant/garasje.dart';
import 'package:flutter_isell_new/views/screens/home/property_relevant/gardsbruk.dart';
import 'package:flutter_isell_new/views/screens/home/property_relevant/leilighetdata.dart';
import 'package:flutter_isell_new/views/screens/home/property_relevant/rekkehusrelevant.dart';
import 'package:flutter_isell_new/views/screens/home/property_relevant/selveierrelevant.dart';
import 'package:flutter_isell_new/views/screens/home/property_relevant/tomannsboligrelevant.dart';
import 'package:get/get.dart';

abstract class PropertyController extends GetxController {}

class PropertyControllerImp extends PropertyController {
  PropertyItemData propertyItemData = PropertyItemData(Get.find());
  MyServices myServices = Get.find();
  late StatusRequest statusRequest;

  List<String> eieendomtyper = [
    "Bolig til leie",
    "Bolig til salgs",
    "Enebolig",
    "Garasje/Parkering",
    "Gårdsbruk/Småbruk",
    "Leiligheter",
    "Rekkehus",
    "Tomannsbolig",
    "Aksje",
    "Eier (Selveier)",
  ];
  @override
  void onInit() {
    getboligaksje();
    getboligtilleie();
    getboligtilsalgs();
    getenebolig();
    getgarasje();
    getgardsbruk();
    getleilighet();
    getrekkehus();
    getselveier();
    gettomannsbolig();
    super.onInit();
  }

  bool bmwDataLoaded = false;
  List aksjedata = [];
  List boligtileiedata = [];
  List boligtilsalgsdata = [];
  List eneboligdata = [];
  List garasjedata = [];
  List gardsbrukdata = [];
  List leilighetdata = [];
  List rekkehusdata = [];
  List selveierdata = [];
  List tomannsboligdata = [];

  Future<void> getboligaksje() async {
    if (bmwDataLoaded) return;

    aksjedata.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await propertyItemData
        .getaksje(myServices.sharedPreferences.getInt("id")!);
    statusRequest = handlingData(response);
    if (StatusRequest.suksess == statusRequest) {
      if (response['status'] == "success") {
        aksjedata.addAll(response['data']);
        bmwDataLoaded = true;
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  Future<void> getboligtilleie() async {
    if (bmwDataLoaded) return;
    boligtileiedata.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await propertyItemData
        .getboligtileie(myServices.sharedPreferences.getInt("id")!);
    statusRequest = handlingData(response);
    if (StatusRequest.suksess == statusRequest) {
      if (response['status'] == "success") {
        boligtileiedata.addAll(response['data']);
        bmwDataLoaded = true;
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  Future<void> getboligtilsalgs() async {
    if (bmwDataLoaded) return;
    boligtilsalgsdata.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await propertyItemData
        .getboligtilsalgs(myServices.sharedPreferences.getInt("id")!);
    statusRequest = handlingData(response);
    if (StatusRequest.suksess == statusRequest) {
      if (response['status'] == "success") {
        boligtilsalgsdata.addAll(response['data']);
        bmwDataLoaded = true;
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  Future<void> getenebolig() async {
    if (bmwDataLoaded) return;
    eneboligdata.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await propertyItemData
        .getenebolig(myServices.sharedPreferences.getInt("id")!);
    statusRequest = handlingData(response);
    if (StatusRequest.suksess == statusRequest) {
      if (response['status'] == "success") {
        eneboligdata.addAll(response['data']);
        bmwDataLoaded = true;
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  Future<void> getgarasje() async {
    if (bmwDataLoaded) return;
    garasjedata.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await propertyItemData
        .getgarasje(myServices.sharedPreferences.getInt("id")!);
    statusRequest = handlingData(response);
    if (StatusRequest.suksess == statusRequest) {
      if (response['status'] == "success") {
        garasjedata.addAll(response['data']);
        bmwDataLoaded = true;
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  Future<void> getgardsbruk() async {
    if (bmwDataLoaded) return;
    gardsbrukdata.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await propertyItemData
        .getgardsbruk(myServices.sharedPreferences.getInt("id")!);
    statusRequest = handlingData(response);
    if (StatusRequest.suksess == statusRequest) {
      if (response['status'] == "success") {
        gardsbrukdata.addAll(response['data']);
        bmwDataLoaded = true;
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  Future<void> getleilighet() async {
    if (bmwDataLoaded) return;
    leilighetdata.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await propertyItemData
        .getleilighet(myServices.sharedPreferences.getInt("id")!);
    statusRequest = handlingData(response);
    if (StatusRequest.suksess == statusRequest) {
      if (response['status'] == "success") {
        leilighetdata.addAll(response['data']);
        bmwDataLoaded = true;
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  Future<void> getrekkehus() async {
    if (bmwDataLoaded) return;
    rekkehusdata.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await propertyItemData
        .getrekkehus(myServices.sharedPreferences.getInt("id")!);
    statusRequest = handlingData(response);
    if (StatusRequest.suksess == statusRequest) {
      if (response['status'] == "success") {
        rekkehusdata.addAll(response['data']);
        bmwDataLoaded = true;
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  Future<void> getselveier() async {
    if (bmwDataLoaded) return;
    selveierdata.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await propertyItemData
        .getselveier(myServices.sharedPreferences.getInt("id")!);
    statusRequest = handlingData(response);
    if (StatusRequest.suksess == statusRequest) {
      if (response['status'] == "success") {
        selveierdata.addAll(response['data']);
        bmwDataLoaded = true;
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  Future<void> gettomannsbolig() async {
    if (bmwDataLoaded) return;
    tomannsboligdata.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await propertyItemData
        .gettomannsbolig(myServices.sharedPreferences.getInt("id")!);
    statusRequest = handlingData(response);
    if (StatusRequest.suksess == statusRequest) {
      if (response['status'] == "success") {
        tomannsboligdata.addAll(response['data']);
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
          await getboligaksje();
          break;
        case 1:
          await getboligtilleie();
          break;
        case 2:
          await getboligtilsalgs();
          break;
        case 3:
          await getenebolig();
          break;
        case 4:
          await getgarasje();
          break;
        case 5:
          await getgardsbruk();
          break;
        case 6:
          await getleilighet();
          break;
        case 7:
          await getrekkehus();
          break;
        case 8:
          await getselveier();
          break;
        case 9:
          await gettomannsbolig();
          break;
      }
      selectedIndex = index;
      update();
    }
  }

  Widget buildRelevantView(int selectedIndex) {
    switch (selectedIndex) {
      case 0:
        return const RelevantBOLIGTILLEIE();
      case 1:
        return const RelevantBOLIGTILSALGS();
      case 2:
        return const RelevantENEBOLIG();
      case 3:
        return const RelevantGARASJE();
      case 4:
        return const RelevantGARDSBRUK();
      case 5:
        return const RelevantLEILIGHET();
      case 6:
        return const RelevantREKKEHUS();
      case 7:
        return const RelevantTOMANNSBOLIG();
      case 8:
        return const RelevantAKSJE();
      case 9:
        return const RelevantSELVEIER();
      default:
        return const SizedBox();
    }
  }

  String buildRelevantName(selectedIndex) {
    switch (selectedIndex) {
      case 0:
        return "Relevant Bolig til leie";
      case 1:
        return "Relevant Bolig til salgs";
      case 2:
        return "Relevant Enebolig";
      case 3:
        return "Relevant Garasje/Parkering";
      case 4:
        return "Relevant Gårdsbruk/Småbruk";
      case 5:
        return "Relevant Leilighet";
      case 6:
        return "Relevant Rekkehus";
      case 7:
        return "Relevant Tomannsbolig";
      case 8:
        return "Relevant Aksje";
      case 9:
        return "Relevant Eier (Selveier)";
      default:
        return "";
    }
  }

  List getListAtselectedindex() {
    switch (selectedIndex) {
      case 0:
        return boligtileiedata;
      case 1:
        return boligtilsalgsdata;
      case 2:
        return eneboligdata;
      case 3:
        return garasjedata;
      case 4:
        return gardsbrukdata;
      case 5:
        return leilighetdata;
      case 6:
        return rekkehusdata;
      case 7:
        return tomannsboligdata;
      case 8:
        return aksjedata;
      case 9:
        return selveierdata;
      default:
        return [];
    }
  }
}
