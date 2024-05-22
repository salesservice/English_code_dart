import 'package:flutter/material.dart';
import 'package:flutter_isell_new/views/widget/user_image.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../controller/home_page_controller.dart';
import '../../../core/constants/sellx_colors.dart';
import 'navbar.dart';

class Melding extends StatelessWidget {
  const Melding({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomePageControllerImp());
    // String setning = "${controller.userfname}";
    // List<String> ord = setning.split(" ");
    //final height = MediaQuery.of(context).size.height;
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
              "Meldinger",
              style:
                  GoogleFonts.baloo2(fontSize: 19, color: Myisellcolors.hvit),
            ),
          ),
        ),
      ),
      endDrawer: const NavBar(),
    );
  }
}
