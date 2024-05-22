import 'package:flutter/material.dart';
import 'package:flutter_isell_new/controller/home_page_controller.dart';
import 'package:flutter_isell_new/core/constants/sellx_colors.dart';
import 'package:flutter_isell_new/core/constants/sellx_route_names.dart';
import 'package:flutter_isell_new/views/screens/home/navbar.dart';
import 'package:flutter_isell_new/views/widget/sellx_%20buttons.dart';
import 'package:flutter_isell_new/views/widget/sellx_text_filed.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Betaling extends StatelessWidget {
  const Betaling({super.key});

  @override
  Widget build(BuildContext context) {
    HomePageControllerImp homePageControllerImp =
        Get.put(HomePageControllerImp());
    return Form(
      key: homePageControllerImp.gkcoupon,
      child: Scaffold(
          backgroundColor: Myisellcolors.home,
          appBar: AppBar(
            iconTheme: const IconThemeData(color: Myisellcolors.hvit),
            elevation: 0,
            actions: [
              Builder(
                builder: (context) => IconButton(
                  icon: const Icon(
                    Icons.menu_rounded,
                    size: 30,
                    color: Myisellcolors.hvit,
                  ),
                  padding: const EdgeInsets.only(right: 20, top: 5),
                  onPressed: () => Scaffold.of(context).openEndDrawer(),
                  tooltip:
                      MaterialLocalizations.of(context).openAppDrawerTooltip,
                ),
              ),
            ],
            toolbarHeight: 65,
            backgroundColor: Myisellcolors.home,
            title: Container(
              alignment: Alignment.centerLeft,
              child: Text(
                "Betalinger",
                style:
                    GoogleFonts.baloo2(fontSize: 20, color: Myisellcolors.hvit),
              ),
            ),
          ),
          endDrawer: const NavBar(),
          body: GetBuilder<HomePageControllerImp>(
            builder: (controller) => ListView(
              children: [
                Column(
                  children: [
                    IsellTextField(
                      con: controller.coupon,
                      // validater: (val) {
                      //   if (val == null || val.isEmpty) {
                      //     return null;
                      //   }
                      //   if (controller.couponname != null) {
                      //     if (val != controller.couponModel!.couponName) {
                      //       controller.discountcoupon = 0;
                      //       return "not valid";
                      //     } else if (controller.couponname !=
                      //         controller.couponModel!.couponName) {
                      //       return "not valid";
                      //     } else {
                      //       controller.discountcoupon =
                      //           controller.couponModel!.couponDiscount;
                      //     }
                      //   }
                      //   return null;
                      // },
                      validater: (val) {
                        if (val == null || val.isEmpty) {
                          return null;
                        }
                        if (controller.couponModel != null &&
                            val != controller.couponModel!.couponName) {
                          controller.discountcoupon = 0;
                          return "Kupong-koden er ugyldig";
                        }
                        controller.discountcoupon =
                            controller.couponModel?.couponDiscount ?? 0;
                        return null;
                      },
                      label: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 7),
                        child: Text(
                          'Kupong',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.mandali(
                              color: Myisellcolors.hoved, fontSize: 19),
                        ),
                      ),
                      float: FloatingLabelBehavior.always,
                      icon: Container(
                        margin: const EdgeInsets.only(right: 10),
                        child: const Icon(
                          Icons.code,
                          color: Myisellcolors.hoved,
                        ),
                      ),
                      contentpadding: const EdgeInsets.fromLTRB(25, 25, 25, 20),
                      paddingcontainer:
                          const EdgeInsets.only(left: 20, right: 20, top: 30),
                      cursorColor: Myisellcolors.hvit70,
                      height: 22,
                      width: 1,
                      borderR: 10,
                      borderwidth: 1,
                      obs: false,
                      fontsizehinttext: 15,
                      bordersidecolor: Myisellcolors.hoved,
                      hinttxt: "Skriv inn kupong-koden",
                      hinttxtcolor: Myisellcolors.hvit70,
                      txtcolor: Myisellcolors.hvit,
                    ),
                    const SizedBox(height: 20),
                    IsellButtons(
                        size: Size(Get.width / 1.1, Get.height / 15),
                        name: "Bekreft",
                        onPresset: () {
                          print(controller.discountcoupon);
                          controller.checkcoupon();
                        },
                        alignmen: Alignment.center,
                        borderradius: 10,
                        fontsize: 16,
                        bgcolor: Myisellcolors.hoved),
                    const SizedBox(height: 200),
                    IsellButtons(
                        size: Size(Get.width / 1.1, Get.height / 15),
                        name: "Gå til betaling",
                        onPresset: () {
                          Get.toNamed(AppRouter.gotopay);
                        },
                        alignmen: Alignment.center,
                        borderradius: 10,
                        fontsize: 16,
                        bgcolor: Myisellcolors.hoved)
                  ],
                )
              ],
            ),
          )),
    );
  }
}
