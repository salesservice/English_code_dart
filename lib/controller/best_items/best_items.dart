import 'package:flutter_isell_new/core/classes/statusrequest.dart';
import 'package:flutter_isell_new/core/functions/handling_data.dart';
import 'package:flutter_isell_new/core/services/services.dart';
import 'package:flutter_isell_new/data/items_data/best_items_data.dart';
import 'package:flutter_isell_new/data/static/remote/favorite_data.dart';
import 'package:flutter_isell_new/data/static/remote/my_favorite_data.dart';
import 'package:get/get.dart';

abstract class BestItemsController extends GetxController {}

class BestitemsCarControllerImp extends BestItemsController {
  RxInt currentIndex = 0.obs;
  BestitemsData bestitemsData = BestitemsData(Get.find());
  MyServices myServices = Get.find();
  late StatusRequest statusRequest;
  FavorittData favorittData = FavorittData(Get.find());
  MyFavorittData myfavorittData = MyFavorittData(Get.find());

  void updateCurrentIndex(int index) {
    currentIndex.value = index;
  }

  var currentPage = 0.obs;

  void updateCurrentPage(int index) {
    currentPage.value = index;
  }

  RxInt selectedIndex = RxInt(-1);

  List bestecarsdata = [];
  List besteboligdata = [];
  List bestboatitemsdata = [];
  List bestmcitemsdata = [];
  List bestitemssyklerdata = [];
  List besteitemsjobbdata = [];
  List besteitemsbokerdata = [];
  List bestitemsmoblerdata = [];
  List besteitemselektronikkdata = [];
  List besteitemsklardata = [];

  List bestallitems = [];

  bool bmwDataLoaded = false;

  @override
  void onInit() {
    getbestecaritems();
    getbesteboligitems();
    getbesteboatitems();
    getbestemcitems();
    getbestesykkelitems();
    getbestejobbitems();
    getbestebokeritems();
    getbestemobleritems();
    getbesteelektronikkitems();
    getbesteklaritems();
    getbesteallitems();
    super.onInit();
  }

  Future<void> getbestecaritems() async {
    if (bmwDataLoaded) return;

    statusRequest = StatusRequest.loading;
    update();
    var response = await bestitemsData
        .getbesteitemscar(myServices.sharedPreferences.getInt("id")!);
    statusRequest = handlingData(response);
    if (StatusRequest.suksess == statusRequest) {
      if (response['status'] == "success") {
        bestecarsdata.addAll(response['data']);
        bmwDataLoaded = true;
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  Future<void> getbesteboligitems() async {
    if (bmwDataLoaded) return;
    statusRequest = StatusRequest.loading;
    update();
    var response = await bestitemsData
        .getbesteitemsbolig(myServices.sharedPreferences.getInt("id")!);
    statusRequest = handlingData(response);
    if (StatusRequest.suksess == statusRequest) {
      if (response['status'] == "success") {
        besteboligdata.addAll(response['data']);
        bmwDataLoaded = true;
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  Future<void> getbesteboatitems() async {
    if (bmwDataLoaded) return;
    statusRequest = StatusRequest.loading;
    update();
    var response = await bestitemsData
        .getbesteitemsboat(myServices.sharedPreferences.getInt("id")!);
    statusRequest = handlingData(response);
    if (StatusRequest.suksess == statusRequest) {
      if (response['status'] == "success") {
        bestboatitemsdata.addAll(response['data']);
        bmwDataLoaded = true;
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  Future<void> getbestemcitems() async {
    if (bmwDataLoaded) return;
    statusRequest = StatusRequest.loading;
    update();
    var response = await bestitemsData
        .getbesteitemsmc(myServices.sharedPreferences.getInt("id")!);
    statusRequest = handlingData(response);
    if (StatusRequest.suksess == statusRequest) {
      if (response['status'] == "success") {
        bestmcitemsdata.addAll(response['data']);
        bmwDataLoaded = true;
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  Future<void> getbestesykkelitems() async {
    if (bmwDataLoaded) return;
    statusRequest = StatusRequest.loading;
    update();
    var response = await bestitemsData
        .getbesteitemssykler(myServices.sharedPreferences.getInt("id")!);
    statusRequest = handlingData(response);
    if (StatusRequest.suksess == statusRequest) {
      if (response['status'] == "success") {
        bestitemssyklerdata.addAll(response['data']);
        bmwDataLoaded = true;
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  Future<void> getbestejobbitems() async {
    if (bmwDataLoaded) return;
    statusRequest = StatusRequest.loading;
    update();
    var response = await bestitemsData
        .getbesteitemsjobb(myServices.sharedPreferences.getInt("id")!);
    statusRequest = handlingData(response);
    if (StatusRequest.suksess == statusRequest) {
      if (response['status'] == "success") {
        besteitemsjobbdata.addAll(response['data']);
        bmwDataLoaded = true;
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  Future<void> getbestebokeritems() async {
    if (bmwDataLoaded) return;
    statusRequest = StatusRequest.loading;
    update();
    var response = await bestitemsData
        .getbesteitemsboker(myServices.sharedPreferences.getInt("id")!);
    statusRequest = handlingData(response);
    if (StatusRequest.suksess == statusRequest) {
      if (response['status'] == "success") {
        besteitemsbokerdata.addAll(response['data']);
        bmwDataLoaded = true;
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  Future<void> getbestemobleritems() async {
    if (bmwDataLoaded) return;
    statusRequest = StatusRequest.loading;
    update();
    var response = await bestitemsData
        .getbesteitemsmobler(myServices.sharedPreferences.getInt("id")!);
    statusRequest = handlingData(response);
    if (StatusRequest.suksess == statusRequest) {
      if (response['status'] == "success") {
        bestitemsmoblerdata.addAll(response['data']);
        bmwDataLoaded = true;
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  Future<void> getbesteelektronikkitems() async {
    if (bmwDataLoaded) return;
    statusRequest = StatusRequest.loading;
    update();
    var response = await bestitemsData
        .getbesteitemselektronikk(myServices.sharedPreferences.getInt("id")!);
    statusRequest = handlingData(response);
    if (StatusRequest.suksess == statusRequest) {
      if (response['status'] == "success") {
        besteitemselektronikkdata.addAll(response['data']);
        bmwDataLoaded = true;
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  Future<void> getbesteklaritems() async {
    if (bmwDataLoaded) return;
    statusRequest = StatusRequest.loading;
    update();
    var response = await bestitemsData
        .getbesteitemsklar(myServices.sharedPreferences.getInt("id")!);
    statusRequest = handlingData(response);
    if (StatusRequest.suksess == statusRequest) {
      if (response['status'] == "success") {
        besteitemsklardata.addAll(response['data']);
        bmwDataLoaded = true;
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  Future<void> getbesteallitems() async {
    if (bmwDataLoaded) return;
    statusRequest = StatusRequest.loading;
    var response = await bestitemsData
        .getbesteallitems(myServices.sharedPreferences.getInt("id")!);
    statusRequest = handlingData(response);
    if (StatusRequest.suksess == statusRequest) {
      if (response['status'] == "success") {
        bestallitems.addAll(response['data']);
        bmwDataLoaded = true;
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
}
