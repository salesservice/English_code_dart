import 'package:flutter/material.dart';
import 'package:flutter_isell_new/core/classes/statusrequest.dart';
import 'package:flutter_isell_new/core/constants/sellx_images.dart';
import 'package:flutter_isell_new/core/functions/handling_data.dart';
import 'package:flutter_isell_new/core/services/services.dart';
import 'package:flutter_isell_new/data/static/remote/home_data.dart';
import 'package:flutter_isell_new/views/screens/home/sellx_relevant/babyrelevant.dart';
import 'package:flutter_isell_new/views/screens/home/sellx_relevant/bilettrelevant.dart';
import 'package:flutter_isell_new/views/screens/home/sellx_relevant/klokkerrelevant.dart';
import 'package:flutter_isell_new/views/screens/home/sellx_relevant/kosmetikkrelevant.dart';
import 'package:flutter_isell_new/views/screens/home/sellx_relevant/sportrelevant.dart';
import 'package:get/get.dart';

abstract class SellxController extends GetxController {
  getdata();
}

class SellxControllerImp extends SellxController {
  MyServices myServices = Get.find();
  HomeData homeData = HomeData(Get.find());
  late StatusRequest statusRequest;

  int selectedIndex = -1;

  List kate = [
    //"Apple",
    //"Sykler",
    "Baby",
    //"Tesla",
    "Klokker",
    "Sport",
    "Kosmetikk",
    //"Møbler",
    "Billetter",
    //"Klær",
  ];
  List kimage = [
    // const AssetImage(ImageAsset.apple),
    // const AssetImage(ImageAsset.sykkel),
    const AssetImage(ImageAsset.baby),
    // const AssetImage(ImageAsset.tesla),
    const AssetImage(ImageAsset.klokker),
    const AssetImage(ImageAsset.sport),
    const AssetImage(ImageAsset.kosmetikk),
    // const AssetImage(ImageAsset.mobler),
    const AssetImage(ImageAsset.billetter),
    // const AssetImage(ImageAsset.klar)
  ];
  @override
  getdata() async {
    statusRequest = StatusRequest.loading;
    var response = await homeData.getData();
    print("==================================== Controller $response ");
    statusRequest = handlingData(response);

    if (StatusRequest.suksess == statusRequest) {
      if (response['status'] == "success") {
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    getdata();
    getbaby();
    getklokker();
    getsport();
    getkosmetikk();
    getbiltetter();
    super.onInit();
  }

  bool bmwDataLoaded = false;
  List babydata = [];
  List kolkkerdata = [];
  List sportdata = [];
  List kosmetikkdata = [];
  List billetterdata = [];

  Future<void> getbaby() async {
    if (bmwDataLoaded) return;

    babydata.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await homeData.getbaby(myServices.sharedPreferences.getInt("id")!);
    statusRequest = handlingData(response);
    if (StatusRequest.suksess == statusRequest) {
      if (response['status'] == "success") {
        babydata.addAll(response['data']);
        bmwDataLoaded = true;
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  Future<void> getklokker() async {
    if (bmwDataLoaded) return;
    sportdata.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await homeData.getklokker(myServices.sharedPreferences.getInt("id")!);
    statusRequest = handlingData(response);
    if (StatusRequest.suksess == statusRequest) {
      if (response['status'] == "success") {
        sportdata.addAll(response['data']);
        bmwDataLoaded = true;
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  Future<void> getsport() async {
    if (bmwDataLoaded) return;
    kolkkerdata.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await homeData.getsport(myServices.sharedPreferences.getInt("id")!);
    statusRequest = handlingData(response);
    if (StatusRequest.suksess == statusRequest) {
      if (response['status'] == "success") {
        kolkkerdata.addAll(response['data']);
        bmwDataLoaded = true;
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  Future<void> getkosmetikk() async {
    if (bmwDataLoaded) return;
    kosmetikkdata.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await homeData.getkosmetikk(myServices.sharedPreferences.getInt("id")!);
    statusRequest = handlingData(response);
    if (StatusRequest.suksess == statusRequest) {
      if (response['status'] == "success") {
        kosmetikkdata.addAll(response['data']);
        bmwDataLoaded = true;
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  Future<void> getbiltetter() async {
    if (bmwDataLoaded) return;
    billetterdata.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await homeData.getbilletter(myServices.sharedPreferences.getInt("id")!);
    statusRequest = handlingData(response);
    if (StatusRequest.suksess == statusRequest) {
      if (response['status'] == "success") {
        billetterdata.addAll(response['data']);
        bmwDataLoaded = true;
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  void toggleCategory(int index) {
    if (selectedIndex == index) {
      selectedIndex = -1;
      update();
    } else {
      switch (index) {
        case 0:
          getbaby();
          break;
        case 1:
          getklokker();
          break;
        case 2:
          getsport();
          break;
        case 3:
          getkosmetikk();
          break;
        case 4:
          getbiltetter();
          break;
      }
      selectedIndex = index;
      update();
    }
  }

  Widget buildRelevantView(int selectedIndex) {
    switch (selectedIndex) {
      case 0:
        return const RelevantBABY();
      case 1:
        return const RelevantKOLKKER();
      case 2:
        return const RelevantSPORT();
      case 3:
        return const RelevantKOSMETIKK();
      case 4:
        return const RelevantBILETT();
      default:
        return const SizedBox();
    }
  }

  String buildRelevantName(selectedIndex) {
    switch (selectedIndex) {
      case 0:
        return "Relevant Baby";
      case 1:
        return "Relevant Klokker";
      case 2:
        return "Relevant Sport";
      case 3:
        return "Relevant Kosmetikk";
      case 4:
        return "Relevant Billetter";
      default:
        return "";
    }
  }

  List getListAtSelectedIndex() {
    switch (selectedIndex) {
      case 0:
        return babydata;
      case 1:
        return kolkkerdata;
      case 2:
        return sportdata;
      case 3:
        return kosmetikkdata;
      case 4:
        return billetterdata;
      default:
        return [];
    }
  }
}
