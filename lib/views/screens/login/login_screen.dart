import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../controller/login_controller.dart';
import '../../../core/classes/handling_data_view.dart';
import '../../../core/constants/sellx_colors.dart';
import '../../../core/constants/sellx_images.dart';
import '../../../core/functions/validate_input.dart';
import '../../../data/static/login_static.dart';
import '../../widget/sellx_ buttons.dart';
import '../../widget/sellx_text_filed.dart';

class Logginn extends GetView<InnloggingControllerImp> {
  const Logginn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(InnloggingControllerImp());
    final height = MediaQuery.of(context).size.height;
    return Form(
      key: controller.gklogginn,
      child: GetBuilder<InnloggingControllerImp>(
        builder: (controller) => HandlingDataRequest(
          statusRequest: controller.statusRequest!,
          widget: Scaffold(
            resizeToAvoidBottomInset: true,
            extendBodyBehindAppBar: true,
            backgroundColor: Myisellcolors.appbar,
            appBar: AppBar(
              iconTheme: const IconThemeData(color: Myisellcolors.hvit),
              backgroundColor: Myisellcolors.appbar,
              elevation: 0,
              centerTitle: true,
              title: Text(
                "Logg Inn",
                style:
                    GoogleFonts.baloo2(fontSize: 19, color: Myisellcolors.hvit),
              ),
            ),
            body: ListView(
              children: [
                SizedBox(
                  height: height,
                  child: Column(
                    //mainAxisSize: MainAxisSize.min,
                    children: [
                      const Spacer(),
                      //const Expanded(flex: 1, child: SizedBox()),
                      Text(
                        innloggingList[0].title!,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.merriweather(
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                            color: Myisellcolors.hoved),
                      ),

                      const Spacer(),
                      Container(
                        margin: const EdgeInsets.only(left: 25, right: 25),
                        child: Text(
                          innloggingList[0].body!,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.baloo2(
                            color: Myisellcolors.hvit70,
                            fontSize: 16.4,
                          ),
                        ),
                      ),
                      const Spacer(),
                      Image.asset(
                        ImageAsset.logobilde,
                        width: 120,
                        height: 120,
                        color: Myisellcolors.hoved,
                      ),
                      const Spacer(),
                      IsellTextField(
                        paddingcontainer:
                            const EdgeInsets.only(left: 20, right: 20),
                        fontsizehinttext: 14.5,
                        validater: (val) {
                          return validInput(val!, 5, 100, "email");
                        },
                        hinttxt: "Skriv Inn Din Email",
                        hinttxtcolor: Myisellcolors.hvit70,
                        contentpadding:
                            const EdgeInsets.fromLTRB(25, 25, 25, 25),
                        txtcolor: Myisellcolors.hvit70,
                        txttype: TextInputType.emailAddress,
                        con: controller.emaillogginnController,
                        onSav: (value) {
                          controller.emailloggin = value!;
                        },
                        height: 20,
                        width: 1,
                        cursorColor: Myisellcolors.hvit70,
                        borderR: 15,
                        borderwidth: 1,
                        bordersidecolor: Myisellcolors.hoved,
                        obs: false,
                        alignment: const Alignment(0, -0.2),
                        label: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 7),
                          child: Text(
                            'Email',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.mandali(
                                color: Myisellcolors.hoved, fontSize: 19),
                          ),
                        ),
                        float: FloatingLabelBehavior.always,
                        icon: Container(
                          margin: const EdgeInsets.only(right: 10),
                          child: const Icon(
                            Icons.email_outlined,
                            color: Myisellcolors.hoved,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Obx(
                        () => IsellTextField(
                          maxlines: 1,
                          height: 20,
                          width: 1,
                          cursorColor: Myisellcolors.hvit70,
                          paddingcontainer:
                              const EdgeInsets.only(left: 20, right: 20),
                          fontsizehinttext: 14.5,
                          hinttxt: "Skriv Inn Ditt Passord",
                          validater: (val) {
                            return validInput(val!, 1, 50, "Password");
                          },
                          hinttxtcolor: Myisellcolors.hvit70,
                          contentpadding:
                              const EdgeInsets.fromLTRB(25, 25, 25, 25),
                          txtcolor: Myisellcolors.hvit70,
                          txttype: TextInputType.emailAddress,
                          con: controller.passordlogginnController,
                          onSav: (value) {
                            controller.passordlogginn = value!;
                          },
                          borderR: 15,
                          borderwidth: 1,
                          bordersidecolor: Myisellcolors.hoved,
                          alignment: const Alignment(0, 0.1),
                          label: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 7),
                            child: Text(
                              'Passord',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.mandali(
                                  color: Myisellcolors.hoved, fontSize: 19),
                            ),
                          ),
                          float: FloatingLabelBehavior.always,
                          obs: controller.erPassordgjemt.value,
                          icon: Container(
                            padding: const EdgeInsets.only(right: 10),
                            child: InkWell(
                              child: Icon(
                                controller.erPassordgjemt.value
                                    ? Icons.visibility_off_outlined
                                    : Icons.visibility_outlined,
                                color: Myisellcolors.hoved,
                              ),
                              onTap: () {
                                controller.erPassordgjemt.value =
                                    !controller.erPassordgjemt.value;
                              },
                            ),
                          ),
                        ),
                      ),
                      const Spacer(),
                      Container(
                        padding: const EdgeInsets.only(left: 20, right: 265),
                        child: InkWell(
                          onTap: () {
                            controller.gotoforgetpassord();
                          },
                          child: Ink(
                            child: Text(
                              'Glemt Passord?',
                              style: GoogleFonts.poppins(
                                  color: Myisellcolors.hoved, fontSize: 13),
                            ),
                          ),
                        ),
                      ),
                      const Spacer(),
                      IsellButtons(
                          size: Size(Get.width / 1.1, 65),
                          name: "Logg Inn",
                          onPresset: () {
                            controller.logginn();
                          },
                          alignmen: Alignment.center,
                          borderradius: 15,
                          fontsize: 18,
                          bgcolor: Myisellcolors.hoved),
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Har Du Ikke En Konto? ',
                            style: GoogleFonts.poppins(
                              color: Myisellcolors.hvit70,
                              fontSize: 13,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              controller.gotoregistrer();
                            },
                            child: Text(
                              'Registrer Her',
                              style: GoogleFonts.poppins(
                                  color: Myisellcolors.hoved,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500),
                            ),
                          )
                        ],
                      ),
                      const Expanded(flex: 6, child: SizedBox()),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
