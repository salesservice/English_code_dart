import 'package:flutter_isell_new/core/services/services.dart';
import 'package:flutter_isell_new/sellx_link_api.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController {
  MyServices myServices = Get.find();
  loggut() {
    // int userid = myServices.sharedPreferences.getInt("id")!;
    // FirebaseMessaging.instance.unsubscribeFromTopic("users");
    // FirebaseMessaging.instance.unsubscribeFromTopic("users $userid");
    myServices.sharedPreferences.clear();
    Get.offAllNamed(AppLink.logginn);
  }
}
