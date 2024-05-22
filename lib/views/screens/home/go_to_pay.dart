import 'package:flutter/material.dart';
import 'package:flutter_isell_new/controller/complete_payment_controller.dart';
import 'package:flutter_isell_new/core/classes/handling_data_view.dart';
import 'package:flutter_isell_new/core/constants/sellx_colors.dart';
import 'package:flutter_isell_new/views/screens/home/navbar.dart';
import 'package:flutter_isell_new/views/widget/sellx_text_filed.dart';
import 'package:flutter_isell_new/views/widget/payment/payment_method.dart';
import 'package:flutter_isell_new/views/widget/sellx_%20buttons.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class GoToPay extends StatelessWidget {
  const GoToPay({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CompletePaymentController());
    return Scaffold(
        backgroundColor: Myisellcolors.home,
        appBar: AppBar(
          elevation: 0,
          iconTheme: const IconThemeData(color: Myisellcolors.hvit),
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
              "Fullfør betaling",
              style:
                  GoogleFonts.baloo2(fontSize: 20, color: Myisellcolors.hvit),
            ),
          ),
        ),
        endDrawer: const NavBar(),
        body: GetBuilder<CompletePaymentController>(
          builder: (controller) => HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: ListView(
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 10, top: 20),
                  child: Text(
                    "Velg betalingsmetode:",
                    style: GoogleFonts.roboto(
                        fontSize: 18, color: Myisellcolors.hvit),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () {
                        controller.VelgBetalingsMetode("Bank");
                      },
                      child: BetalingMetode(
                        title: "Bank",
                        isAktive:
                            controller.betalingsmetode == "Bank" ? true : false,
                        image: Image.asset("assets/images/card.png"),
                      ),
                    ),
                    SizedBox(width: Get.width / 100),
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () {
                        controller.VelgBetalingsMetode("Vipps");
                      },
                      child: BetalingMetode(
                          title: "Vipps",
                          isAktive: controller.betalingsmetode == "Vipps"
                              ? true
                              : false,
                          image: Image.asset("assets/images/vipps.png")),
                    )
                  ],
                ),
                controller.betalingsmetode == "Vipps"
                    ? IsellTextField(
                        // validater: (val) {
                        //   return validInput(val!, 0, 100, "");
                        // },
                        label: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 7),
                          child: Text(
                            'Telefonnummer',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.mandali(
                                color: Myisellcolors.hoved, fontSize: 19),
                          ),
                        ),
                        float: FloatingLabelBehavior.always,
                        icon: Container(
                          margin: const EdgeInsets.only(right: 10),
                          child: const Icon(
                            Icons.phone_iphone,
                            color: Myisellcolors.hoved,
                          ),
                        ),
                        contentpadding:
                            const EdgeInsets.fromLTRB(25, 25, 25, 20),
                        paddingcontainer: EdgeInsets.only(
                            left: Get.width / 22,
                            right: Get.width / 22,
                            top: Get.width / 10),
                        cursorColor: Myisellcolors.hvit70,
                        height: 22,
                        width: 1,
                        borderR: 10,
                        borderwidth: 1,
                        obs: false,
                        fontsizehinttext: 15,
                        //con: controller.name,
                        bordersidecolor: Myisellcolors.hoved,
                        hinttxt: "Skriv inn telefonnummer",
                        hinttxtcolor: Myisellcolors.hvit70,
                        txtcolor: Myisellcolors.hvit,
                        txttype: TextInputType.number)
                    : controller.betalingsmetode == "Bank"
                        ? Column(
                            children: [
                              IsellTextField(

                                  // validater: (val) {
                                  //   return validInput(val!, 0, 100, "");
                                  // },
                                  label: Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 7),
                                    child: Text(
                                      'Kortnummer',
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.mandali(
                                          color: Myisellcolors.hoved,
                                          fontSize: 19),
                                    ),
                                  ),
                                  float: FloatingLabelBehavior.always,
                                  icon: Container(
                                    margin: const EdgeInsets.only(right: 10),
                                    child: const Icon(
                                      Icons.phone_iphone,
                                      color: Myisellcolors.hoved,
                                    ),
                                  ),
                                  contentpadding:
                                      const EdgeInsets.fromLTRB(25, 25, 25, 20),
                                  paddingcontainer: EdgeInsets.only(
                                      left: Get.width / 22,
                                      right: Get.width / 22,
                                      top: Get.width / 10),
                                  cursorColor: Myisellcolors.hvit70,
                                  height: 22,
                                  width: 1,
                                  borderR: 10,
                                  borderwidth: 1,
                                  obs: false,
                                  fontsizehinttext: 15,
                                  //con: controller.name,
                                  bordersidecolor: Myisellcolors.hoved,
                                  hinttxt: "Skriv inn kortnummer",
                                  hinttxtcolor: Myisellcolors.hvit70,
                                  txtcolor: Myisellcolors.hvit,
                                  txttype: TextInputType.number),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: Get.width / 2.1,
                                    child: IsellTextField(
                                      // validater: (val) {
                                      //   return validInput(val!, 0, 100, "");
                                      // },
                                      label: Container(
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 7),
                                        child: Text(
                                          'Dato',
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.mandali(
                                              color: Myisellcolors.hoved,
                                              fontSize: 19),
                                        ),
                                      ),
                                      txttype: TextInputType.datetime,
                                      float: FloatingLabelBehavior.always,
                                      icon: Container(
                                        margin:
                                            const EdgeInsets.only(right: 10),
                                        child: const Icon(
                                          Icons.date_range,
                                          color: Myisellcolors.hoved,
                                        ),
                                      ),
                                      contentpadding: const EdgeInsets.fromLTRB(
                                          25, 25, 25, 20),
                                      paddingcontainer: const EdgeInsets.only(
                                          left: 7, right: 10, top: 30),
                                      cursorColor: Myisellcolors.hvit70,
                                      height: 22,
                                      width: 1,
                                      borderR: 10,
                                      borderwidth: 1,
                                      obs: false,
                                      fontsizehinttext: 15,
                                      //con: controller.name,
                                      bordersidecolor: Myisellcolors.hoved,
                                      hinttxt: "Dato",
                                      hinttxtcolor: Myisellcolors.hvit70,
                                      txtcolor: Myisellcolors.hvit,
                                    ),
                                  ),
                                  SizedBox(
                                    width: Get.width / 2.1,
                                    child: IsellTextField(
                                        // validater: (val) {
                                        //   return validInput(val!, 0, 100, "");
                                        // },
                                        label: Container(
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 7),
                                          child: Text(
                                            'coc',
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.mandali(
                                                color: Myisellcolors.hoved,
                                                fontSize: 19),
                                          ),
                                        ),
                                        float: FloatingLabelBehavior.always,
                                        icon: Container(
                                          margin:
                                              const EdgeInsets.only(right: 10),
                                          child: const Icon(
                                            Icons.code,
                                            color: Myisellcolors.hoved,
                                          ),
                                        ),
                                        contentpadding:
                                            const EdgeInsets.fromLTRB(
                                                25, 25, 25, 20),
                                        paddingcontainer: const EdgeInsets.only(
                                            left: 10, right: 7, top: 30),
                                        cursorColor: Myisellcolors.hvit70,
                                        height: 22,
                                        width: 1,
                                        borderR: 10,
                                        borderwidth: 1,
                                        obs: false,
                                        fontsizehinttext: 15,
                                        //con: controller.name,
                                        bordersidecolor: Myisellcolors.hoved,
                                        hinttxt: "coc",
                                        hinttxtcolor: Myisellcolors.hvit70,
                                        txtcolor: Myisellcolors.hvit,
                                        txttype: TextInputType.number),
                                  )
                                ],
                              )
                            ],
                          )
                        : const SizedBox(),
                const SizedBox(height: 30),
                controller.betalingsmetode != null
                    ? IsellButtons(
                        size: Size(Get.width / 1.09, 60),
                        name: controller.betalingsmetode == "Vipps"
                            ? "Fullfør betaling med Vipps"
                            : "Fullfør betaling med bankkort",
                        onPresset: () {},
                        alignmen: Alignment.center,
                        borderradius: 10,
                        fontsize: 16,
                        bgcolor: Myisellcolors.hoved)
                    : const SizedBox()
              ],
            ),
          ),
        ));
  }
}
