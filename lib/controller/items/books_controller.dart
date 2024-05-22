import 'package:flutter/material.dart';
import 'package:flutter_isell_new/core/classes/statusrequest.dart';
import 'package:flutter_isell_new/core/functions/handling_data.dart';
import 'package:flutter_isell_new/core/services/services.dart';
import 'package:flutter_isell_new/data/items_data/books_data.dart';
import 'package:flutter_isell_new/views/screens/home/books_relevant/high_school.dart';
import 'package:flutter_isell_new/views/screens/home/books_relevant/kids_books.dart';
import 'package:flutter_isell_new/views/screens/home/books_relevant/novels.dart';
import 'package:flutter_isell_new/views/screens/home/books_relevant/university.dart';
import 'package:get/get.dart';

abstract class BooksController extends GetxController {}

class BooksControllerImp extends BooksController {
  late StatusRequest statusRequest;
  MyServices myServices = Get.find();
  BooksItemsData booksItemsData = BooksItemsData(Get.find());

  List<String> boktype = [
    "Videregående",
    "Universitet",
    "Barnebøker",
    "Romaner",
  ];

  bool bmwDataLoaded = false;

  List videregoende = [];
  List universitet = [];
  List barneboker = [];
  List romaner = [];

  @override
  void onInit() {
    getvideregoende();
    getuniversitet();
    getbarneboker();
    getromaner();
    super.onInit();
  }

  Future<void> getvideregoende() async {
    if (bmwDataLoaded) return;

    videregoende.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await booksItemsData
        .getvideregoende(myServices.sharedPreferences.getInt("id")!);
    statusRequest = handlingData(response);
    if (StatusRequest.suksess == statusRequest) {
      if (response['status'] == "success") {
        videregoende.addAll(response['data']);
        bmwDataLoaded = true;
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  Future<void> getuniversitet() async {
    if (bmwDataLoaded) return;

    universitet.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await booksItemsData
        .getuniversitet(myServices.sharedPreferences.getInt("id")!);
    statusRequest = handlingData(response);
    if (StatusRequest.suksess == statusRequest) {
      if (response['status'] == "success") {
        universitet.addAll(response['data']);
        bmwDataLoaded = true;
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  Future<void> getbarneboker() async {
    if (bmwDataLoaded) return;

    barneboker.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await booksItemsData
        .getbarneboker(myServices.sharedPreferences.getInt("id")!);
    statusRequest = handlingData(response);
    if (StatusRequest.suksess == statusRequest) {
      if (response['status'] == "success") {
        barneboker.addAll(response['data']);
        bmwDataLoaded = true;
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  Future<void> getromaner() async {
    if (bmwDataLoaded) return;
    romaner.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await booksItemsData
        .getromaner(myServices.sharedPreferences.getInt("id")!);
    statusRequest = handlingData(response);
    if (StatusRequest.suksess == statusRequest) {
      if (response['status'] == "success") {
        romaner.addAll(response['data']);
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
          await getvideregoende();
          break;
        case 1:
          await getuniversitet();
          break;
        case 2:
          await getbarneboker();
          break;
        case 3:
          await getromaner();
          break;
      }
      selectedIndex = index;
      update();
    }
  }

  Widget buildRelevantView(int selectedIndex) {
    switch (selectedIndex) {
      case 0:
        return const RelevantVIDEREGOENDE();
      case 1:
        return const RelevantUNIVERSITET();
      case 2:
        return const RelevantBARNEBOKER();
      case 3:
        return const RelevantROMANER();

      default:
        return const SizedBox();
    }
  }

  String buildRelevantName(selectedIndex) {
    switch (selectedIndex) {
      case 0:
        return "Relevant Videregående bøker";
      case 1:
        return "Relevant Universitets bøker";
      case 2:
        return "Relevant Barnebøker";
      case 3:
        return "Relevant Romaner";

      default:
        return "";
    }
  }

  List getListAtselectedindex() {
    switch (selectedIndex) {
      case 0:
        return videregoende;
      case 1:
        return universitet;
      case 2:
        return barneboker;
      case 3:
        return romaner;
      default:
        return [];
    }
  }
}
