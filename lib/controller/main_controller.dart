import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_isell_new/core/functions/fcnconfig.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  @override
  void onInit() {
    FirebaseMessaging.instance.getToken().then((value) {
      debugPrint("den er $value");
      // ignore: unused_local_variable
      String? token = value;
      requestPermissionNotification();
      fcmconfig();
    });
    RequestPerlocation();

    super.onInit();
  }

  RequestPerlocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Get.snackbar("Obs!", "Vennligst slå på posisjonen din");
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Get.snackbar("Obs!", "Vennligst slå på posisjonen din");
      }
    }
    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Get.snackbar("Obs!", "Vennligst slå på posisjonen din");
    }
  }
}
