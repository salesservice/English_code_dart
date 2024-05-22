import 'package:flutter/material.dart';
import 'package:flutter_isell_new/controller/home_page_controller.dart';
import 'package:flutter_isell_new/controller/login_controller.dart';
import 'package:flutter_isell_new/core/constants/sellx_route_names.dart';
import 'package:flutter_isell_new/views/widget/user_image.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../../core/constants/sellx_colors.dart';
import 'navbar.dart';

class Profil extends StatelessWidget {
  const Profil({super.key});

  @override
  Widget build(BuildContext context) {
    HomePageControllerImp homePageControllerImp =
        Get.put(HomePageControllerImp());
    Get.put(InnloggingControllerImp());

    String dateCreate = homePageControllerImp.usercreate!;
    DateTime parsedDate = DateTime.parse(dateCreate);
    DateFormat outputFormat = DateFormat("dd MMM yyyy");
    String formattedDate = outputFormat.format(parsedDate);
    return Scaffold(
      backgroundColor: Myisellcolors.home,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          Builder(
            builder: (context) => IconButton(
              icon: const Icon(
                Icons.menu_rounded,
                size: 35,
                color: Myisellcolors.hoved,
              ),
              padding: const EdgeInsets.only(right: 25, top: 5),
              onPressed: () => Scaffold.of(context).openEndDrawer(),
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            ),
          ),
        ],
        leadingWidth: 57,
        leading: Container(
          padding: const EdgeInsets.only(left: 15, bottom: 5),
          child: const InkWell(
              child: UserImage(
            iconsize: 20,
            radius: 20,
          )),
        ),
        toolbarHeight: 65,
        backgroundColor: Myisellcolors.home,
        title: Container(
          alignment: const Alignment(-0.999999, 0),
          child: Container(
            padding: const EdgeInsets.only(bottom: 1),
            child: Text(
              "Profilen",
              style:
                  GoogleFonts.baloo2(fontSize: 19, color: Myisellcolors.hvit),
            ),
          ),
        ),
      ),
      endDrawer: const NavBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                Container(
                  height: 150,
                  color: Myisellcolors.appbar,
                ),
                Positioned(
                  top: 105,
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Myisellcolors.hoved),
                        shape: BoxShape.circle),
                    child: const UserImage(
                      radius: 40,
                      iconsize: 40,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    homePageControllerImp.userfname!,
                    style: GoogleFonts.roboto(
                        fontSize: 16, color: Myisellcolors.hvit),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 60),
                  child: Text(
                    homePageControllerImp.useremail!,
                    style: GoogleFonts.roboto(
                        fontSize: 19, color: Myisellcolors.hvit),
                  ),
                )
              ]),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 80, right: 10, left: 10),
                child: Text(
                  'Ble medlem i Sellx',
                  style: GoogleFonts.roboto(
                      fontSize: 16, color: Myisellcolors.hvit),
                ),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.only(top: 80, right: 10, left: 10),
                child: Text(
                  formattedDate,
                  style: GoogleFonts.roboto(
                      fontSize: 16, color: Myisellcolors.hvit),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            height: 40,
            color: Myisellcolors.appbar,
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.only(right: 10, left: 10),
                  child: Text(
                    'Din Sellx-ID',
                    style: GoogleFonts.roboto(
                        fontSize: 16, color: Myisellcolors.hvit),
                  ),
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.only(right: 10, left: 10),
                  child: Text(
                    "${homePageControllerImp.userid}",
                    style: GoogleFonts.roboto(
                        fontSize: 16, color: Myisellcolors.hvit),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            padding: const EdgeInsets.only(left: 10, right: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Registrerte adresser:',
                      style: GoogleFonts.roboto(
                          fontSize: 16, color: Myisellcolors.hvit),
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () {
                        Get.toNamed(AppRouter.addressview);
                      },
                      child: Text(
                        "Bytt adresse",
                        style: GoogleFonts.roboto(
                            fontSize: 16, color: Myisellcolors.hoved),
                      ),
                    )
                  ],
                ),
                // const SizedBox(
                //   height: 10,
                // ),
                // Text(
                //   "${formattedDate}",
                //   style: GoogleFonts.roboto(
                //       fontSize: 16, color: Myisellcolors.hvit),
                // ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            height: 40,
            color: Myisellcolors.appbar,
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.only(right: 10, left: 10),
                  child: Text(
                    'Ditt telefonnummer',
                    style: GoogleFonts.roboto(
                        fontSize: 16, color: Myisellcolors.hvit),
                  ),
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.only(right: 10, left: 10),
                  child: Text(
                    "+47 ${homePageControllerImp.userphone}",
                    style: GoogleFonts.roboto(
                        fontSize: 16, color: Myisellcolors.hvit),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            // height: 30,
            color: Myisellcolors.home,
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.only(right: 10, left: 10),
                  child: Text(
                    'Dine vurderinger',
                    style: GoogleFonts.roboto(
                        fontSize: 16, color: Myisellcolors.hvit),
                  ),
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.only(right: 10, left: 10),
                  child: Text(
                    "11 vurderinger \n (3.2/5) ******",
                    style: GoogleFonts.roboto(
                        fontSize: 16, color: Myisellcolors.hvit),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
