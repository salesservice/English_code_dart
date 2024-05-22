import 'package:flutter/material.dart';
import 'package:flutter_isell_new/controller/address/write_address_controller.dart';
import 'package:flutter_isell_new/core/classes/handling_data_view.dart';
import 'package:flutter_isell_new/core/constants/sellx_colors.dart';
import 'package:flutter_isell_new/core/functions/validate_input.dart';
import 'package:flutter_isell_new/views/screens/home/navbar.dart';
import 'package:flutter_isell_new/views/widget/sellx_%20buttons.dart';
import 'package:flutter_isell_new/views/widget/sellx_text_filed.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class WriteAddress extends StatelessWidget {
  const WriteAddress({super.key});

  @override
  Widget build(BuildContext context) {
    WriteAddressController writeAddressController =
        Get.put(WriteAddressController());
    return Form(
      key: writeAddressController.gkaddress,
      child: Scaffold(
        backgroundColor: Myisellcolors.home,
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Myisellcolors.hvit),
          elevation: 1,
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
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              ),
            ),
          ],
          toolbarHeight: 65,
          backgroundColor: Myisellcolors.home,
          title: Container(
            alignment: Alignment.centerLeft,
            child: Text(
              "Legg til ny adresse",
              style:
                  GoogleFonts.baloo2(fontSize: 20, color: Myisellcolors.hvit),
            ),
          ),
        ),
        endDrawer: const NavBar(),
        body: ListView(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 20),
              child: GetBuilder<WriteAddressController>(
                builder: (controller) => HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: Column(
                    children: [
                      Text(
                        "Skriv inn adressedetaljene",
                        style: GoogleFonts.baloo2(
                            fontSize: 25, color: Myisellcolors.hvit),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      SvgPicture.asset(
                        "assets/images/address.svg",
                        width: 200,
                      ),
                      IsellTextField(
                        validater: (val) {
                          return validInput(val!, 0, 100, "");
                        },
                        label: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 7),
                          child: Text(
                            'Adressenavn',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.mandali(
                                color: Myisellcolors.hoved, fontSize: 19),
                          ),
                        ),
                        float: FloatingLabelBehavior.always,
                        icon: Container(
                          margin: const EdgeInsets.only(right: 10),
                          child: const Icon(
                            Icons.location_on,
                            color: Myisellcolors.hoved,
                          ),
                        ),
                        contentpadding:
                            const EdgeInsets.fromLTRB(25, 25, 25, 20),
                        paddingcontainer:
                            const EdgeInsets.only(left: 20, right: 20, top: 30),
                        cursorColor: Myisellcolors.hvit70,
                        height: 22,
                        width: 1,
                        borderR: 10,
                        borderwidth: 1,
                        obs: false,
                        fontsizehinttext: 15,
                        con: controller.name,
                        bordersidecolor: Myisellcolors.hoved,
                        hinttxt: "Adressenavn som Hjemme/Jobb",
                        hinttxtcolor: Myisellcolors.hvit70,
                        txtcolor: Myisellcolors.hvit,
                      ),
                      IsellTextField(
                        validater: (val) {
                          return validInput(val!, 0, 100, "");
                        },
                        label: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 7),
                          child: Text(
                            'Gate- eller stedsadresse',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.mandali(
                                color: Myisellcolors.hoved, fontSize: 19),
                          ),
                        ),
                        float: FloatingLabelBehavior.always,
                        icon: Container(
                          margin: const EdgeInsets.only(right: 10),
                          child: const Icon(
                            Icons.streetview_outlined,
                            color: Myisellcolors.hoved,
                          ),
                        ),
                        contentpadding:
                            const EdgeInsets.fromLTRB(25, 25, 25, 20),
                        paddingcontainer:
                            const EdgeInsets.only(left: 20, right: 20, top: 30),
                        cursorColor: Myisellcolors.hvit70,
                        height: 22,
                        width: 1,
                        borderR: 10,
                        borderwidth: 1,
                        obs: false,
                        fontsizehinttext: 15,
                        con: controller.gata,
                        bordersidecolor: Myisellcolors.hoved,
                        hinttxt: "Skriv inn gate eller stedsnavn",
                        hinttxtcolor: Myisellcolors.hvit70,
                        txtcolor: Myisellcolors.hvit,
                      ),
                      IsellTextField(
                        validater: (val) {
                          return validInput(val!, 0, 100, "");
                        },
                        label: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 7),
                          child: Text(
                            'Husnummer',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.mandali(
                                color: Myisellcolors.hoved, fontSize: 19),
                          ),
                        ),
                        float: FloatingLabelBehavior.always,
                        icon: Container(
                          margin: const EdgeInsets.only(right: 10),
                          child: const Icon(
                            Icons.local_convenience_store,
                            color: Myisellcolors.hoved,
                          ),
                        ),
                        contentpadding:
                            const EdgeInsets.fromLTRB(25, 25, 25, 20),
                        paddingcontainer:
                            const EdgeInsets.only(left: 20, right: 20, top: 30),
                        cursorColor: Myisellcolors.hvit70,
                        height: 22,
                        width: 1,
                        borderR: 10,
                        borderwidth: 1,
                        obs: false,
                        fontsizehinttext: 15,
                        con: controller.nummer,
                        bordersidecolor: Myisellcolors.hoved,
                        hinttxt: "Skriv inn husnummer",
                        hinttxtcolor: Myisellcolors.hvit70,
                        txtcolor: Myisellcolors.hvit,
                      ),
                      IsellTextField(
                        validater: (val) {
                          return validInput(val!, 0, 100, "");
                        },
                        label: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 7),
                          child: Text(
                            'By',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.mandali(
                                color: Myisellcolors.hoved, fontSize: 19),
                          ),
                        ),
                        float: FloatingLabelBehavior.always,
                        icon: Container(
                          margin: const EdgeInsets.only(right: 10),
                          child: const Icon(
                            Icons.location_city_outlined,
                            color: Myisellcolors.hoved,
                          ),
                        ),
                        contentpadding:
                            const EdgeInsets.fromLTRB(25, 25, 25, 20),
                        paddingcontainer:
                            const EdgeInsets.only(left: 20, right: 20, top: 30),
                        cursorColor: Myisellcolors.hvit70,
                        height: 22,
                        width: 1,
                        borderR: 10,
                        borderwidth: 1,
                        obs: false,
                        fontsizehinttext: 15,
                        con: controller.city,
                        bordersidecolor: Myisellcolors.hoved,
                        hinttxt: "Skriv inn bynavn",
                        hinttxtcolor: Myisellcolors.hvit70,
                        txtcolor: Myisellcolors.hvit,
                      ),
                      IsellTextField(
                        validater: (val) {
                          return validInput(val!, 0, 100, "");
                        },
                        label: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 7),
                          child: Text(
                            'Postnummer',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.mandali(
                                color: Myisellcolors.hoved, fontSize: 19),
                          ),
                        ),
                        float: FloatingLabelBehavior.always,
                        icon: Container(
                          margin: const EdgeInsets.only(right: 10),
                          child: const Icon(
                            Icons.numbers,
                            color: Myisellcolors.hoved,
                          ),
                        ),
                        contentpadding:
                            const EdgeInsets.fromLTRB(25, 25, 25, 20),
                        paddingcontainer:
                            const EdgeInsets.only(left: 20, right: 20, top: 30),
                        cursorColor: Myisellcolors.hvit70,
                        height: 22,
                        width: 1,
                        borderR: 10,
                        borderwidth: 1,
                        obs: false,
                        fontsizehinttext: 15,
                        con: controller.zip,
                        bordersidecolor: Myisellcolors.hoved,
                        hinttxt: "Skriv inn postnummer",
                        hinttxtcolor: Myisellcolors.hvit70,
                        txtcolor: Myisellcolors.hvit,
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 20, bottom: 20),
                        child: IsellButtons(
                            size: Size(Get.width / 1.1, 68),
                            name: "Legg til adressen",
                            onPresset: () {
                              controller.addAddressData();
                            },
                            alignmen: Alignment.bottomCenter,
                            borderradius: 10,
                            fontsize: 17,
                            bgcolor: Myisellcolors.hoved),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
