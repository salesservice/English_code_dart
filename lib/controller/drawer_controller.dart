import 'package:flutter_isell_new/data/model/users_model.dart';
import 'package:get/get.dart';

abstract class DrawerController extends GetxController {}

class DrawerControllerImp extends DrawerController {
  late UserModell userModell;

  initialdata() {}

  @override
  void onInit() {
    initialdata();
    super.onInit();
  }
}
