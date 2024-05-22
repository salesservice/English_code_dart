import 'package:flutter/material.dart';
import 'package:flutter_isell_new/views/screens/home/home.dart';
import 'package:get/get.dart';

import '../views/screens/home/add_new_item.dart';
import '../views/screens/home/main_home.dart';
import '../views/screens/home/messeges.dart';
import '../views/screens/home/profil.dart';

abstract class HomeScrennController extends GetxController {
  changpage(int currentpage);
}

class HomeScrennControllerImp extends HomeScrennController {
  int currentpage = 0;
  List<Widget> listPage = [
    const MyHeader(),
    const HomePage(),
    const AddNewItem(),
    const Melding(),
    const Profil(),
  ];

  @override
  changpage(int i) {
    currentpage = i;
    update();
  }
}
