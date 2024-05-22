import 'package:flutter_isell_new/core/classes/statusrequest.dart';
import 'package:flutter_isell_new/core/functions/handling_data.dart';
import 'package:flutter_isell_new/core/services/services.dart';
import 'package:flutter_isell_new/data/model/items_modell.dart';
import 'package:flutter_isell_new/data/static/remote/delete_edite_item_data.dart';
import 'package:get/get.dart';

class ViewAnnonseController extends GetxController {
  EditDeleteItemData editDeleteItemData = EditDeleteItemData(Get.find());
  MyServices myServices = Get.find();

  List<ItemsModel> data = [];

  late StatusRequest statusRequest;

  viewData() async {
    statusRequest = StatusRequest.loading;
    var response = await editDeleteItemData
        .getItems(myServices.sharedPreferences.getInt("id")!);
    //print("==================================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.suksess == statusRequest) {
      if (response['status'] == "success") {
        List datalist = response['data'];
        data.addAll(datalist.map((e) => ItemsModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  deleteData(int id, String imagename) async {
    statusRequest = StatusRequest.loading;
    var response = await editDeleteItemData
        .deleteItems({"id": id, "imagename": imagename});
    statusRequest = handlingData(response);
    if (StatusRequest.suksess == statusRequest) {
      if (response['status'] == "success") {
        data.removeWhere((element) => element.itemId == id);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    viewData();
    super.onInit();
  }
}
