import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_isell_new/core/classes/statusrequest.dart';
import 'package:flutter_isell_new/core/functions/handling_data.dart';
import 'package:flutter_isell_new/core/functions/upload_file.dart';
import 'package:flutter_isell_new/data/model/items_modell.dart';
import 'package:flutter_isell_new/data/static/remote/delete_edite_item_data.dart';
import 'package:get/get.dart';

class EditAnnonseController extends GetxController {
  EditDeleteItemData editDeleteItemData = EditDeleteItemData(Get.find());
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  late TextEditingController itemname;

  ItemsModel? itemsModel;

  StatusRequest? statusRequest = StatusRequest.none;

  File? file;

  chooseImage() async {
    file = await fileUploadGallery(true);
    update();
  }

  aeditData() async {
    if (formState.currentState!.validate()) {
      // if (file == null) {
      //   return Get.snackbar("opps", "Please choose image");
      // }
      statusRequest = StatusRequest.loading;

      Map data = {};

      var response = await editDeleteItemData.editItems(data, file!);
      //print("==================================== Controller $response ");
      statusRequest = handlingData(response);

      if (StatusRequest.suksess == statusRequest) {
        if (response['status'] == "success") {
        } else {
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    }
  }

  @override
  void onInit() {
    itemsModel = Get.arguments["itemsModel"];
    super.onInit();
  }
}
