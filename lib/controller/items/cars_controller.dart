import 'package:flutter_isell_new/core/classes/statusrequest.dart';
import 'package:flutter_isell_new/core/functions/handling_data.dart';
import 'package:flutter_isell_new/core/services/services.dart';
import 'package:flutter_isell_new/data/items_data/cars_data.dart';
import 'package:get/get.dart';

abstract class CarsController extends GetxController {}

class CarsControllerImp extends CarsController {
  RxInt currentIndex = 0.obs;
  CarsItemsData carsItemsData = CarsItemsData(Get.find());
  MyServices myServices = Get.find();
  late StatusRequest statusRequest;

  // Add a method to update the currentIndex
  void updateCurrentIndex(int index) {
    currentIndex.value = index;
  }

  RxInt selectedIndex = RxInt(-1);

  List bmwdata = [];
  List audidata = [];
  List tesladata = [];
  List mercedecdata = [];
  List vwdata = [];
  List porschedata = [];
  List volvodata = [];
  List toyotadata = [];
  List fordata = [];
  List mazdadata = [];

  List<String> bilmerke = [
    "assets/images/bmw.png",
    "assets/images/audiny.png",
    "assets/images/tesla.png",
    "assets/images/mercedes.png",
    "assets/images/folksbil.png",
    "assets/images/porsche.png",
    "assets/images/volvo.png",
    "assets/images/ford.png",
    "assets/images/toyota.png",
    "assets/images/mazda.png"
  ];

  bool bmwDataLoaded = false;

  @override
  void onInit() {
    getbmwmerke();
    getaudimerke();
    getteslamerke();
    getmercedecmerke();
    getvwmerke();
    getporschemerke();
    getvolvomerke();
    getfordmerke();
    gettoyotamerke();
    getmazdamerke();
    super.onInit();
  }

  Future<void> getbmwmerke() async {
    if (bmwDataLoaded) return;

    bmwdata.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await carsItemsData.getbmw(myServices.sharedPreferences.getInt("id")!);
    statusRequest = handlingData(response);
    if (StatusRequest.suksess == statusRequest) {
      if (response['status'] == "success") {
        bmwdata.addAll(response['data']);
        bmwDataLoaded = true;
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  Future<void> getaudimerke() async {
    if (bmwDataLoaded) return;

    audidata.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await carsItemsData.getaudi(myServices.sharedPreferences.getInt("id")!);
    statusRequest = handlingData(response);
    if (StatusRequest.suksess == statusRequest) {
      if (response['status'] == "success") {
        audidata.addAll(response['data']);
        bmwDataLoaded = true;
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  Future<void> getteslamerke() async {
    if (bmwDataLoaded) return;

    tesladata.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await carsItemsData
        .gettesla(myServices.sharedPreferences.getInt("id")!);
    statusRequest = handlingData(response);
    if (StatusRequest.suksess == statusRequest) {
      if (response['status'] == "success") {
        tesladata.addAll(response['data']);
        bmwDataLoaded = true;
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  Future<void> getmercedecmerke() async {
    if (bmwDataLoaded) return;

    mercedecdata.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await carsItemsData
        .getmercedec(myServices.sharedPreferences.getInt("id")!);
    statusRequest = handlingData(response);
    if (StatusRequest.suksess == statusRequest) {
      if (response['status'] == "success") {
        mercedecdata.addAll(response['data']);
        bmwDataLoaded = true;
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  Future<void> getvwmerke() async {
    if (bmwDataLoaded) return;

    vwdata.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await carsItemsData.getVW(myServices.sharedPreferences.getInt("id")!);
    statusRequest = handlingData(response);
    if (StatusRequest.suksess == statusRequest) {
      if (response['status'] == "success") {
        vwdata.addAll(response['data']);
        bmwDataLoaded = true;
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  Future<void> getporschemerke() async {
    if (bmwDataLoaded) return;

    porschedata.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await carsItemsData
        .getporsche(myServices.sharedPreferences.getInt("id")!);
    statusRequest = handlingData(response);
    if (StatusRequest.suksess == statusRequest) {
      if (response['status'] == "success") {
        porschedata.addAll(response['data']);
        bmwDataLoaded = true;
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  Future<void> getvolvomerke() async {
    if (bmwDataLoaded) return;

    volvodata.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await carsItemsData
        .getvolvo(myServices.sharedPreferences.getInt("id")!);
    statusRequest = handlingData(response);
    if (StatusRequest.suksess == statusRequest) {
      if (response['status'] == "success") {
        volvodata.addAll(response['data']);
        bmwDataLoaded = true;
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  Future<void> getfordmerke() async {
    if (bmwDataLoaded) return;

    fordata.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await carsItemsData.getford(myServices.sharedPreferences.getInt("id")!);
    statusRequest = handlingData(response);
    if (StatusRequest.suksess == statusRequest) {
      if (response['status'] == "success") {
        fordata.addAll(response['data']);
        bmwDataLoaded = true;
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  Future<void> gettoyotamerke() async {
    if (bmwDataLoaded) return;

    toyotadata.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await carsItemsData
        .gettoyota(myServices.sharedPreferences.getInt("id")!);
    statusRequest = handlingData(response);
    if (StatusRequest.suksess == statusRequest) {
      if (response['status'] == "success") {
        toyotadata.addAll(response['data']);
        bmwDataLoaded = true;
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  Future<void> getmazdamerke() async {
    if (bmwDataLoaded) return;

    mazdadata.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await carsItemsData
        .getmazda(myServices.sharedPreferences.getInt("id")!);
    statusRequest = handlingData(response);
    if (StatusRequest.suksess == statusRequest) {
      if (response['status'] == "success") {
        mazdadata.addAll(response['data']);
        bmwDataLoaded = true;
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
}
