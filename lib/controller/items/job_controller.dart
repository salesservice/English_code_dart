import 'package:flutter/material.dart';
import 'package:flutter_isell_new/core/classes/statusrequest.dart';
import 'package:flutter_isell_new/core/functions/handling_data.dart';
import 'package:flutter_isell_new/core/services/services.dart';
import 'package:flutter_isell_new/data/items_data/jobs_data.dart';
import 'package:flutter_isell_new/views/screens/home/jobs_relevant/deltid.dart';
import 'package:flutter_isell_new/views/screens/home/jobs_relevant/heltid.dart';
import 'package:get/get.dart';

abstract class JobController extends GetxController {}

class JobControllerImp extends JobController {
  late StatusRequest statusRequest;
  MyServices myServices = Get.find();
  JobItemData jobItemData = JobItemData(Get.find());

  List<String> jobbtype = [
    "Heltidsstilling",
    "Deltidsstilling",
  ];
  @override
  void onInit() {
    getheltid();
    getdeltid();
    super.onInit();
  }

  bool bmwDataLoaded = false;

  List heltiddata = [];
  List deltiddata = [];

  Future<void> getheltid() async {
    if (bmwDataLoaded) return;
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await jobItemData.getheltid(myServices.sharedPreferences.getInt("id")!);
    statusRequest = handlingData(response);
    if (StatusRequest.suksess == statusRequest) {
      if (response['status'] == "success") {
        heltiddata.addAll(response['data']);
        bmwDataLoaded = true;
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  Future<void> getdeltid() async {
    if (bmwDataLoaded) return;
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await jobItemData.getdeltid(myServices.sharedPreferences.getInt("id")!);
    statusRequest = handlingData(response);
    if (StatusRequest.suksess == statusRequest) {
      if (response['status'] == "success") {
        deltiddata.addAll(response['data']);
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
          await getheltid();
          break;
        case 1:
          await getdeltid();
          break;
      }
      selectedIndex = index;
      update();
    }
  }

  Widget buildRelevantView(int selectedIndex) {
    switch (selectedIndex) {
      case 0:
        return const RelevantHELTID();
      case 1:
        return const RelevantDELTID();
      default:
        return const SizedBox();
    }
  }

  String buildRelevantName(selectedIndex) {
    switch (selectedIndex) {
      case 0:
        return "Relevant Heltidsstillinger";
      case 1:
        return "Relevant Deltidsstillinger";

      default:
        return "";
    }
  }

  List getListAtselectedindex() {
    switch (selectedIndex) {
      case 0:
        return heltiddata;
      case 1:
        return deltiddata;
      default:
        return [];
    }
  }
}
