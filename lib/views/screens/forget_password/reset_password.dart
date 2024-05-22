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

class ResetPassword extends GetView<InnloggingControllerImp> {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put({InnloggingControllerImp()});
    return GetBuilder<InnloggingControllerImp>(
      builder: (controller) => HandlingDataRequest(
        statusRequest: controller.statusRequest!,
        widget: Form(
          key: controller.gktilbakestillpass,
          child: Scaffold(
            backgroundColor: Myisellcolors.appbar,
            appBar: AppBar(
              backgroundColor: Myisellcolors.appbar,
              elevation: 0,
              centerTitle: true,
              title: Text(
                "Tilbakestill Passord",
                style: GoogleFonts.baloo2(fontSize: 19, color: Colors.white),
              ),
            ),
            // body: Stack(children: [
            //   ListView(
            //     children: [
            //       Text(
            //         innloggingList[4].title!,
            //         textAlign: TextAlign.center,
            //         style: GoogleFonts.merriweather(
            //             fontSize: 25,
            //             fontWeight: FontWeight.w500,
            //             color: Myisellcolors.hoved),
            //       ),
            //       const SizedBox(
            //         height: 20,
            //       ),
            //       Container(
            //         margin: const EdgeInsets.only(left: 25, right: 25),
            //         child: Text(
            //           innloggingList[4].body!,
            //           textAlign: TextAlign.center,
            //           style: GoogleFonts.baloo2(
            //             color: Colors.white60,
            //             fontSize: 16.4,
            //           ),
            //         ),
            //       ),
            //       const SizedBox(
            //         height: 20,
            //       ),
            //       Image.asset(
            //         ImageAsset.logobilde,
            //         width: 150,
            //         height: 150,
            //       ),
            //       const SizedBox(
            //         height: 20,
            //       ),
            //       Obx(
            //         () => IsellTextField(
            //           validater: (vale) {
            //             return validInput(vale!, 8, 50, "password");
            //           },
            //           fontsizehinttext: 14.5,
            //           hinttxt: "Skriv Inn Nytt Passord",
            //           hinttxtcolor: Colors.white30,
            //           contentpadding:
            //               const EdgeInsets.fromLTRB(25, 23, 25, 23),
            //           txtcolor: Colors.white70,
            //           txttype: TextInputType.emailAddress,
            //           paddingcontainer:
            //               const EdgeInsets.only(left: 20, right: 20),
            //           cursorColor: Colors.grey,
            //           height: 20,
            //           width: 1,
            //           con: controller.tilbakestillpassordController,
            //           onSav: (value) {
            //             controller.tilbakestillpassord = value!;
            //           },
            //           borderR: 15,
            //           borderwidth: 1,
            //           bordersidecolor: Myisellcolors.hoved,
            //           obs: controller.erPassordgjemt3.value,
            //           alignment: const Alignment(0, -1),
            //           label: Container(
            //             margin: const EdgeInsets.symmetric(horizontal: 7),
            //             child: Text(
            //               'Passord',
            //               textAlign: TextAlign.center,
            //               style: GoogleFonts.mandali(
            //                   color: Myisellcolors.hoved, fontSize: 19),
            //             ),
            //           ),
            //           float: FloatingLabelBehavior.always,
            //           icon: InkWell(
            //             child: Icon(
            //               controller.erPassordgjemt3.value
            //                   ? Icons.visibility_off_outlined
            //                   : Icons.visibility_outlined,
            //               color: Myisellcolors.hoved,
            //             ),
            //             onTap: () {
            //               controller.erPassordgjemt3.value =
            //                   !controller.erPassordgjemt3.value;
            //             },
            //           ),
            //         ),
            //       ),
            //       const SizedBox(height: 25),
            //       Obx(
            //         () => IsellTextField(
            //           validater: (val) {
            //             if (controller
            //                     .tilbakestillpassordController.value !=
            //                 controller
            //                     .bekrefttilbakestiltpasoordetController
            //                     .value) {
            //               return "Passordene Må Være Like";
            //             } else {
            //               return validInput(val!, 8, 50, "Password");
            //             }
            //           },
            //           fontsizehinttext: 14.5,
            //           hinttxt: "Bekreft Passord",
            //           hinttxtcolor: Colors.white30,
            //           contentpadding:
            //               const EdgeInsets.fromLTRB(25, 23, 25, 23),
            //           txtcolor: Colors.white70,
            //           txttype: TextInputType.emailAddress,
            //           paddingcontainer:
            //               const EdgeInsets.only(left: 20, right: 20),
            //           cursorColor: Colors.grey,
            //           height: 20,
            //           width: 1,
            //           con:
            //               controller.bekrefttilbakestiltpasoordetController,
            //           onSav: (value) {
            //             controller.bekrefttilbakestiltpasoordet = value!;
            //           },
            //           borderR: 15,
            //           borderwidth: 1,
            //           bordersidecolor: Myisellcolors.hoved,
            //           obs: controller.erPassordgjemt4.value,
            //           alignment: const Alignment(0, -1),
            //           label: Container(
            //             margin: const EdgeInsets.symmetric(horizontal: 7),
            //             child: Text(
            //               'Bekreft Passord',
            //               textAlign: TextAlign.center,
            //               style: GoogleFonts.mandali(
            //                   color: Myisellcolors.hoved, fontSize: 19),
            //             ),
            //           ),
            //           float: FloatingLabelBehavior.always,
            //           icon: InkWell(
            //             child: Icon(
            //               controller.erPassordgjemt4.value
            //                   ? Icons.visibility_off_outlined
            //                   : Icons.visibility_outlined,
            //               color: Myisellcolors.hoved,
            //             ),
            //             onTap: () {
            //               controller.erPassordgjemt4.value =
            //                   !controller.erPassordgjemt4.value;
            //             },
            //           ),
            //         ),
            //       ),
            //       const SizedBox(
            //         height: 25,
            //       ),
            //       IsellButtons(
            //           size: const Size(350, 65),
            //           name: "Tilbakestill",
            //           onPresset: () {
            //             controller.gotosuksesstilbakestiltpassord();
            //           },
            //           alignmen: Alignment.center,
            //           borderradius: 15,
            //           fontsize: 16,
            //           bgcolor: Myisellcolors.hoved),
            //     ],
            //   )
            // ]),

            body: Column(
              children: [
                const Expanded(flex: 2, child: SizedBox()),
                Text(
                  innloggingList[4].title!,
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
                    innloggingList[4].body!,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.baloo2(
                      color: Colors.white60,
                      fontSize: 16.4,
                    ),
                  ),
                ),
                const Spacer(),
                Image.asset(
                  ImageAsset.logobilde,
                  width: 150,
                  height: 150,
                ),
                const Spacer(),
                Obx(
                  () => IsellTextField(
                    validater: (vale) {
                      return validInput(vale!, 8, 50, "password");
                    },
                    fontsizehinttext: 14.5,
                    hinttxt: "Skriv Inn Nytt Passord",
                    hinttxtcolor: Colors.white30,
                    contentpadding: const EdgeInsets.fromLTRB(25, 23, 25, 23),
                    txtcolor: Colors.white70,
                    txttype: TextInputType.emailAddress,
                    paddingcontainer:
                        const EdgeInsets.only(left: 20, right: 20),
                    cursorColor: Colors.grey,
                    height: 20,
                    width: 1,
                    con: controller.tilbakestillpassordController,
                    onSav: (value) {
                      controller.tilbakestillpassord = value!;
                    },
                    borderR: 15,
                    borderwidth: 1,
                    bordersidecolor: Myisellcolors.hoved,
                    obs: controller.erPassordgjemt3.value,
                    alignment: const Alignment(0, -1),
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
                    icon: InkWell(
                      child: Icon(
                        controller.erPassordgjemt3.value
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        color: Myisellcolors.hoved,
                      ),
                      onTap: () {
                        controller.erPassordgjemt3.value =
                            !controller.erPassordgjemt3.value;
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Obx(
                  () => IsellTextField(
                    validater: (val) {
                      if (controller.tilbakestillpassordController.value !=
                          controller
                              .bekrefttilbakestiltpasoordetController.value) {
                        return "Passordene Må Være Like";
                      } else {
                        return validInput(val!, 8, 50, "Password");
                      }
                    },
                    fontsizehinttext: 14.5,
                    hinttxt: "Bekreft Passord",
                    hinttxtcolor: Colors.white30,
                    contentpadding: const EdgeInsets.fromLTRB(25, 23, 25, 23),
                    txtcolor: Colors.white70,
                    txttype: TextInputType.emailAddress,
                    paddingcontainer:
                        const EdgeInsets.only(left: 20, right: 20),
                    cursorColor: Colors.grey,
                    height: 20,
                    width: 1,
                    con: controller.bekrefttilbakestiltpasoordetController,
                    onSav: (value) {
                      controller.bekrefttilbakestiltpasoordet = value!;
                    },
                    borderR: 15,
                    borderwidth: 1,
                    bordersidecolor: Myisellcolors.hoved,
                    obs: controller.erPassordgjemt4.value,
                    alignment: const Alignment(0, -1),
                    label: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 7),
                      child: Text(
                        'Bekreft Passord',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.mandali(
                            color: Myisellcolors.hoved, fontSize: 19),
                      ),
                    ),
                    float: FloatingLabelBehavior.always,
                    icon: InkWell(
                      child: Icon(
                        controller.erPassordgjemt4.value
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        color: Myisellcolors.hoved,
                      ),
                      onTap: () {
                        controller.erPassordgjemt4.value =
                            !controller.erPassordgjemt4.value;
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                IsellButtons(
                    size: Size(Get.width / 1.1, 65),
                    name: "Tilbakestill",
                    onPresset: () {
                      controller.gotosuksesstilbakestiltpassord();
                    },
                    alignmen: Alignment.center,
                    borderradius: 15,
                    fontsize: 16,
                    bgcolor: Myisellcolors.hoved),
                const Expanded(flex: 6, child: SizedBox()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
