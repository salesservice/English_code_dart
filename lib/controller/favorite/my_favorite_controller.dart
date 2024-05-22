import 'package:flutter_isell_new/core/classes/statusrequest.dart';
import 'package:flutter_isell_new/core/functions/handling_data.dart';
import 'package:flutter_isell_new/core/services/services.dart';
import 'package:flutter_isell_new/data/model/items_modell.dart';
import 'package:flutter_isell_new/data/static/remote/my_favorite_data.dart';
import 'package:get/get.dart';

// class MyFavoritController extends GetxController {
//   MyServices myServices = Get.find();
//   late StatusRequest statusRequest;
//   MyFavorittData myfavorittData = MyFavorittData(Get.find());
//   late ItemsModel itemsModel;
//   //late FavorittModel favorittModel;

//   List<ItemsModel> data = [];

//   myFavoritt() async {
//     statusRequest = StatusRequest.loading;

//     var response = await myfavorittData
//         .getData(myServices.sharedPreferences.getInt("id")!);
//     statusRequest = handlingData(response);
//     if (StatusRequest.suksess == statusRequest) {
//       if (response['status'] == "success") {
//         List responseData = response['data'];
//         data.addAll(responseData.map((e) => ItemsModel.fromJson(e)));
//         update();
//       } else {
//         statusRequest = StatusRequest.failure;
//       }
//     }
//     update();
//   }

//   deleteFavoritt(favorittid) async {
//     statusRequest = StatusRequest.loading;
//     var response = await myfavorittData.deleteMyfavoritt(favorittid);
//     statusRequest = handlingData(response);
//     if (StatusRequest.suksess == statusRequest) {
//       if (response['status'] == "success") {
//         data.removeWhere((element) => element.favorittId == favorittid);
//         update();
//       } else {
//         statusRequest = StatusRequest.failure;
//       }
//     }
//     //update();
//   }

//   @override
//   void onInit() {
//     myFavoritt();
//     // deleteFavoritt(itemsModel.favorittId);
//     super.onInit();
//   }
// }

class MyFavoritController extends GetxController {
  MyServices myServices = Get.find();
  late StatusRequest statusRequest;
  MyFavorittData myfavorittData = MyFavorittData(Get.find());

  List<ItemsModel> data = [];

  myFavoritt() async {
    statusRequest = StatusRequest.loading;

    var response = await myfavorittData
        .getData(myServices.sharedPreferences.getInt("id")!);
    statusRequest = handlingData(response);
    if (StatusRequest.suksess == statusRequest) {
      if (response['status'] == "success") {
        List responseData = response['data'];
        data.addAll(responseData.map((e) => ItemsModel.fromJson(e)));
        update();
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  deleteFavoritt(favorittid) async {
    statusRequest = StatusRequest.loading;
    var response = await myfavorittData.deleteMyfavoritt(favorittid);
    statusRequest = handlingData(response);
    if (StatusRequest.suksess == statusRequest) {
      if (response['status'] == "success") {
        data.removeWhere((element) => element.favorittId == favorittid);
        update();
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
  }

  @override
  void onInit() {
    myFavoritt();
    super.onInit();
  }
}
