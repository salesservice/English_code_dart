import 'package:flutter/material.dart';
import 'package:flutter_isell_new/controller/items_controller.dart';
import 'package:flutter_isell_new/controller/login_controller.dart';
import 'package:flutter_isell_new/data/model/category_model.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/constants/sellx_colors.dart';

class KategoriTem extends GetView<ItemControllerImp> {
  const KategoriTem({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ItemControllerImp());
    Get.put(InnloggingControllerImp());
    return GetBuilder<ItemControllerImp>(builder: (controller) {
      return Container(
          color: Myisellcolors.home,
          child: ListView.separated(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.only(left: 10, right: 8),
              separatorBuilder: (context, index) => const SizedBox(
                    width: 10,
                  ),
              shrinkWrap: true,
              itemCount: controller.kategorier.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return KategoriItemList(
                  i: index,
                  kategorierModell:
                      KategoriModell.fromJson(controller.kategorier[index]),
                );
              }));
    });
  }
}

class KategoriItemList extends StatelessWidget {
  final KategoriModell kategorierModell;
  final int? i;
  const KategoriItemList(
      {super.key, required this.kategorierModell, required this.i});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ItemControllerImp>(
      builder: ((controller) => InkWell(
            onTap: () {
              controller.changeCat(i!, kategorierModell.kategoriId!,
                  kategorierModell.kategoriName!);
              //controller.listPages[controller.currentpages]);
            },
            child: Container(
              width: 100,
              decoration: controller.selectedCat == i
                  ? BoxDecoration(
                      border: Border.all(width: 2, color: Myisellcolors.hoved),
                      borderRadius: BorderRadius.circular(12),
                      color: Myisellcolors.home)
                  : BoxDecoration(
                      border: Border.all(width: 1, color: Myisellcolors.hvit),
                      borderRadius: BorderRadius.circular(12),
                      color: Myisellcolors.home),
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  "${kategorierModell.kategoriName}",
                  style: GoogleFonts.baloo2(
                      color: Myisellcolors.hvit, fontSize: 15),
                ),
              ),
            ),
          )),
    );
  }
}
