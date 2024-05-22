import 'package:flutter_isell_new/core/services/services.dart';
import 'package:flutter_isell_new/data/model/notifications_model.dart';
import 'package:flutter_isell_new/data/static/remote/notification_data.dart';
import 'package:get/get.dart';

import '../core/classes/statusrequest.dart';
import '../core/functions/handling_data.dart';

class NotificationController extends GetxController {
  NotificationData notificationData = NotificationData(Get.find());

  List<NotificationModel> data = [];
  MyServices myServices = Get.find();
  late StatusRequest statusRequest;

  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await notificationData
        .getData(myServices.sharedPreferences.getInt("id")!);
    //print("==================================== Controller $response ");
    statusRequest = handlingData(response);

    if (StatusRequest.suksess == statusRequest) {
      if (response['status'] == "success") {
        // data.addAll(response['data']);
        List notificationslist = response['data'];
        data.addAll(
            notificationslist.map((e) => NotificationModel.fromJson(e)));
        if (data.isEmpty) {
          statusRequest = StatusRequest.failure;
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  deleteNoti(int notiid) async {
    notificationData.deleteData(notiid);
    data.removeWhere((element) => element.notificationId == notiid);
    update();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
