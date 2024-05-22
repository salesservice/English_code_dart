import 'package:flutter/material.dart';
import 'package:flutter_isell_new/controller/home_page_controller.dart';
import 'package:get/get.dart';

import '../../../controller/home_screen_controller.dart';
import '../../../core/constants/sellx_colors.dart';

class CustomAppbar extends GetView<HomeScrennControllerImp> {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScrennControllerImp());
    HomePageControllerImp homePageControllerImp =
        Get.put(HomePageControllerImp());
    //ItemControllerImp favoritController = Get.put(ItemControllerImp());

    return GetBuilder<HomeScrennControllerImp>(
        builder: (controller) => Container(
              height: 60,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(40)),
              margin: const EdgeInsets.only(left: 15, right: 15, bottom: 20),
              child: Row(
                children: [
                  IconButton(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onPressed: () {
                      controller.changpage(1);
                    },
                    icon: Icon(
                      controller.currentpage == 1
                          ? Icons.house_sharp
                          : Icons.house_outlined,
                      size: 33,
                      color: controller.currentpage == 1
                          ? Myisellcolors.hoved
                          : Colors.grey,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onPressed: () {
                      homePageControllerImp.clearSearch();
                      homePageControllerImp.checksearch('');
                      controller.changpage(0);
                    },
                    icon: Icon(
                      controller.currentpage == 0
                          ? Icons.dashboard_rounded
                          : Icons.dashboard_outlined,
                      size: 29,
                      color: controller.currentpage == 0
                          ? Myisellcolors.hoved
                          : Colors.grey,
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(top: 0),
                    child: FloatingActionButton.small(
                      backgroundColor: controller.currentpage == 2
                          ? Myisellcolors.hoved
                          : Colors.grey,
                      onPressed: () {
                        controller.changpage(2);
                      },
                      child: const Icon(
                        Icons.add,
                      ),
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onPressed: () {
                      controller.changpage(3);
                    },
                    icon: Icon(
                      controller.currentpage == 3
                          ? Icons.mail
                          : Icons.mail_outline,
                      size: 29,
                      color: controller.currentpage == 3
                          ? Myisellcolors.hoved
                          : Colors.grey,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onPressed: () {
                      controller.changpage(4);
                    },
                    icon: Icon(
                      controller.currentpage == 4
                          ? Icons.person
                          : Icons.person_outlined,
                      size: 31,
                      color: controller.currentpage == 4
                          ? Myisellcolors.hoved
                          : Colors.grey,
                    ),
                  ),
                ],
              ),
              // ),
            ));
  }
}
