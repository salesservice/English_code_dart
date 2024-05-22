import 'package:flutter/material.dart';
import 'package:flutter_isell_new/controller/itemdeatails_controller.dart';
import 'package:flutter_isell_new/core/classes/statusrequest.dart';
import 'package:flutter_isell_new/core/constants/sellx_colors.dart';
import 'package:flutter_isell_new/core/functions/handling_data.dart';
import 'package:flutter_isell_new/core/services/services.dart';
import 'package:flutter_isell_new/data/model/items_modell.dart';
import 'package:flutter_isell_new/data/static/remote/favorite_data.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class FavoritController extends GetxController {
  Map isFavorite = {}.obs;

  MyServices myServices = Get.find();
  late StatusRequest statusRequest = StatusRequest.none;
  FavorittData favorittData = FavorittData(Get.find());

  List data = [];

  late ItemsModel itemsModel;

  setFavorite(id, val) {
    isFavorite[id] = val;
    update();
  }

  addFavoritt(itemid) async {
    data.clear();
    update();
    statusRequest = StatusRequest.loading;
    var response = await favorittData.addFavoritt(
        myServices.sharedPreferences.getInt("id")!, itemid);
    statusRequest = handlingData(response);
    if (StatusRequest.suksess == statusRequest) {
      if (response['status'] == "success") {
        Get.rawSnackbar(
            backgroundColor: Myisellcolors.appbar,
            titleText: Text("Obs!",
                style: GoogleFonts.roboto(
                    fontSize: 17, color: Myisellcolors.hvit)),
            messageText: Text("Annonsen ble lagt til under dine favoritter",
                style: GoogleFonts.roboto(
                    fontSize: 17, color: Myisellcolors.hvit70)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  removeFavoritt(itemid) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await favorittData.removeFavoritt(
        myServices.sharedPreferences.getInt("id")!, itemid);
    statusRequest = handlingData(response);
    if (StatusRequest.suksess == statusRequest) {
      if (response['status'] == "success") {
        Get.rawSnackbar(
            backgroundColor: Myisellcolors.appbar,
            titleText: Text("Obs!",
                style: GoogleFonts.roboto(
                    fontSize: 17, color: Myisellcolors.hvit)),
            messageText: Text(
              "Annonsen fjernet fra dine favoritter",
              style:
                  GoogleFonts.roboto(fontSize: 17, color: Myisellcolors.hvit70),
            ));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  itemlikt(itemlikt, itemid) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await favorittData.itemlikt(itemlikt, itemid);
    statusRequest = handlingData(response);
    if (StatusRequest.suksess == statusRequest) {
      if (response['status'] == "success") {
        //data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  RxBool showRelevant1 = true.obs;
  Icon getIcon() {
    return showRelevant1.value
        ? const Icon(
            Icons.grid_view_rounded,
            size: 24,
            color: Myisellcolors.hvit,
          )
        : const Icon(
            Icons.view_stream_rounded,
            size: 24,
            color: Myisellcolors.hvit,
          );
  }

  RxBool showRelevantallitems = true.obs;
  Icon getIconItems() {
    return showRelevantallitems.value
        ? const Icon(
            Icons.grid_view_rounded,
            size: 24,
            color: Myisellcolors.hvit,
          )
        : const Icon(
            Icons.view_stream_rounded,
            size: 24,
            color: Myisellcolors.hvit,
          );
  }

  void toggleFavorite(FavoritController favoritController,
      ItemDetailsControllerImp controller) {
    if (favoritController.isFavorite[controller.itemsModel.itemId] == 1) {
      favoritController.setFavorite(controller.itemsModel.itemId, 0);
      favoritController.removeFavoritt(controller.itemsModel.itemId);
      controller.itemsModel.itemLikt = controller.itemsModel.itemLikt! - 1;
      favoritController.itemlikt(
          controller.itemsModel.itemLikt, controller.itemsModel.itemId);
    } else {
      favoritController.setFavorite(controller.itemsModel.itemId, 1);
      favoritController.addFavoritt(controller.itemsModel.itemId);
      controller.itemsModel.itemLikt = controller.itemsModel.itemLikt! + 1;
      favoritController.itemlikt(
          controller.itemsModel.itemLikt, controller.itemsModel.itemId);
    }
    update();
  }
}

  // Future<void> toggleFavorite(FavoritController favoritController,
  //     ItemDetailsControllerImp controller) async {
  //   // Set statusRequest to loading when operation starts
  //   statusRequest = StatusRequest.none;
  //   update(); // Trigger an update to reflect the loading state

  //   try {
  //     if (favoritController.isFavorite[controller.itemsModel.itemId] == 1) {
  //       favoritController.setFavorite(controller.itemsModel.itemId, 0);
  //       await favoritController.removeFavoritt(controller.itemsModel.itemId);
  //       controller.itemsModel.itemLikt = controller.itemsModel.itemLikt! - 1;
  //       favoritController.itemlikt(
  //           controller.itemsModel.itemLikt, controller.itemsModel.itemId);
  //     } else {
  //       favoritController.setFavorite(controller.itemsModel.itemId, 1);
  //       await favoritController.addFavoritt(controller.itemsModel.itemId);
  //       controller.itemsModel.itemLikt = controller.itemsModel.itemLikt! + 1;
  //       favoritController.itemlikt(
  //           controller.itemsModel.itemLikt, controller.itemsModel.itemId);
  //     }

  //     // Update the UI after the operation completes successfully
  //     statusRequest = StatusRequest.suksess;
  //     update(); // Trigger an update to reflect the change
  //   } catch (error) {
  //     // Handle any errors that occur during the operation
  //     statusRequest = StatusRequest.failure;
  //     update(); // Trigger an update to reflect the failure state
  //   }
  // }

