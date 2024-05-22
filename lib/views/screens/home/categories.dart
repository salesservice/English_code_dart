import 'package:flutter/material.dart';
import 'package:flutter_isell_new/controller/login_controller.dart';
import 'package:flutter_isell_new/data/model/category_model.dart';
import 'package:flutter_isell_new/sellx_link_api.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../controller/home_page_controller.dart';
import '../../../core/constants/sellx_colors.dart';

class Kategorier extends StatelessWidget {
  const Kategorier({super.key});

  @override
  Widget build(BuildContext context) {
    HomePageControllerImp homePageControllerImp =
        Get.put(HomePageControllerImp());
    Get.put(InnloggingControllerImp());
    return Scaffold(
      backgroundColor: Myisellcolors.home,
      body: ListView.separated(
          padding: const EdgeInsets.only(left: 12),
          separatorBuilder: (context, index) => const SizedBox(
                width: 10,
              ),
          shrinkWrap: true,
          itemCount: homePageControllerImp.kategorier.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return KategoriList(
              i: index,
              kategorierModell: KategoriModell.fromJson(
                  homePageControllerImp.kategorier.elementAt(index)),
            );
          }),
    );
  }
}

class KategoriList extends StatelessWidget {
  final KategoriModell kategorierModell;
  final int? i;
  const KategoriList(
      {super.key, required this.kategorierModell, required this.i});

  @override
  Widget build(BuildContext context) {
    HomePageControllerImp homePageControllerImp =
        Get.put(HomePageControllerImp());
    Get.put(InnloggingControllerImp());

    return InkWell(
        onTap: () {
          homePageControllerImp.gotoitems(homePageControllerImp.kategorier, i!,
              kategorierModell.kategoriId!, kategorierModell.kategoriName!);
        },
        child: Container(
          width: 100,
          decoration: BoxDecoration(
              border: Border.all(width: 1, color: Myisellcolors.hoved),
              borderRadius: BorderRadius.circular(8),
              color: Myisellcolors.home),
          padding: const EdgeInsets.only(top: 13),
          child: Column(
            children: [
              SvgPicture.network(
                "${AppLink.imagekategorier}/${kategorierModell.kategoriImage}",
                height: 38,
                // ignore: deprecated_member_use
                color: Myisellcolors.hvit,
              ),
              Container(
                //height: 30,
                padding: const EdgeInsets.only(top: 9),
                child: Text(
                  "${kategorierModell.kategoriName}",
                  style: GoogleFonts.baloo2(
                      color: Myisellcolors.hvit, fontSize: 15),
                ),
              ),
            ],
          ),
        ));
  }
}

/////////////////////////////////////////

class KategoriHead extends StatelessWidget {
  const KategoriHead({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(InnloggingControllerImp());
    HomePageControllerImp homePageControllerImp =
        Get.put(HomePageControllerImp());
    return ListView.separated(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.only(left: 11, right: 8),
        separatorBuilder: (context, index) => const SizedBox(
              width: 10,
            ),
        shrinkWrap: true,
        itemCount: homePageControllerImp.kategorier.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return KategoriHeadList(
              i: index,
              kategorierModell: KategoriModell.fromJson(
                  homePageControllerImp.kategorier[index]));
        });
  }
}

class KategoriHeadList extends StatelessWidget {
  final KategoriModell kategorierModell;
  final int? i;
  const KategoriHeadList(
      {super.key, required this.kategorierModell, required this.i});

  @override
  Widget build(BuildContext context) {
    HomePageControllerImp homePageControllerImp =
        Get.put(HomePageControllerImp());
    Get.put(InnloggingControllerImp());

    return InkWell(
      onTap: () {
        homePageControllerImp.gotoitems(homePageControllerImp.kategorier, i!,
            kategorierModell.kategoriId!, kategorierModell.kategoriName!);
      },
      child: Container(
        width: 100,
        decoration: BoxDecoration(
            border: Border.all(width: 1, color: Myisellcolors.hoved),
            borderRadius: BorderRadius.circular(8),
            color: Myisellcolors.home),
        child: Center(
          child: Text(
            "${kategorierModell.kategoriName}",
            style: GoogleFonts.baloo2(color: Myisellcolors.hvit, fontSize: 15),
          ),
        ),
      ),
    );
  }
}
