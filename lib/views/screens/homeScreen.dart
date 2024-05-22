import 'package:flutter/material.dart';
import 'package:flutter_isell_new/core/constants/sellx_colors.dart';
import 'package:flutter_isell_new/views/screens/home/sellx_app_bar.dart';
import 'package:get/get.dart';

import '../../controller/home_page_controller.dart';
import '../../controller/home_screen_controller.dart';
//import '../../core/constants/isellcolors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomePageControllerImp());
    Get.put(HomeScrennControllerImp());
    return GetBuilder<HomeScrennControllerImp>(
      builder: (controller) => Scaffold(
        backgroundColor: Myisellcolors.home,
        // ignore: prefer_const_constructors
        bottomNavigationBar: CustomAppbar(),

        body: controller.listPage.elementAt(controller.currentpage),
      ),
    );
  }
}
