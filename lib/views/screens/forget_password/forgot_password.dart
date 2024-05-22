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

class ForgotPassword extends GetView<InnloggingControllerImp> {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(InnloggingControllerImp());

    return Form(
      key: controller.gksjekkemailforgetpassord,
      child: GetBuilder<InnloggingControllerImp>(
        builder: (controller) => HandlingDataRequest(
          statusRequest: controller.statusRequest!,
          widget: Scaffold(
            backgroundColor: Myisellcolors.appbar,
            appBar: AppBar(
              backgroundColor: Myisellcolors.appbar,
              elevation: 0,
              centerTitle: true,
              title: Text(
                "Glemt Passord",
                style: GoogleFonts.baloo2(fontSize: 19, color: Colors.white),
              ),
            ),
            // body: Stack(
            //   children: [
            //     ListView(
            //       children: [
            //         const SizedBox(
            //           height: 50,
            //         ),
            //         Text(
            //           innloggingList[2].title!,
            //           textAlign: TextAlign.center,
            //           style: GoogleFonts.merriweather(
            //               fontSize: 25,
            //               fontWeight: FontWeight.w500,
            //               color: Myisellcolors.hoved),
            //         ),
            //         const SizedBox(
            //           height: 20,
            //         ),
            //         Container(
            //           margin: const EdgeInsets.only(left: 25, right: 25),
            //           child: Text(
            //             innloggingList[2].body!,
            //             textAlign: TextAlign.center,
            //             style: GoogleFonts.baloo2(
            //               color: Colors.white60,
            //               fontSize: 16.4,
            //             ),
            //           ),
            //         ),
            //         const SizedBox(
            //           height: 20,
            //         ),
            //         Image.asset(
            //           ImageAsset.logobilde,
            //           width: 150,
            //           height: 150,
            //         ),
            //         const SizedBox(
            //           height: 20,
            //         ),
            //         IsellTextField(
            //           fontsizehinttext: 14.5,
            //           validater: (val) {
            //             return validInput(val!, 5, 100, "email");
            //           },
            //           hinttxt: "Skriv Inn Din Email",
            //           hinttxtcolor: Colors.white30,
            //           contentpadding: const EdgeInsets.fromLTRB(25, 23, 25, 23),
            //           txtcolor: Colors.white70,
            //           txttype: TextInputType.emailAddress,
            //           con: controller.sjkkemailController,
            //           onSav: (value) {
            //             controller.sjkkemail = value!;
            //           },
            //           paddingcontainer:
            //               const EdgeInsets.only(left: 20, right: 20),
            //           cursorColor: Colors.grey,
            //           height: 20,
            //           width: 1,
            //           borderR: 15,
            //           borderwidth: 1,
            //           bordersidecolor: Myisellcolors.hoved,
            //           obs: false,
            //           alignment: const Alignment(0, -1),
            //           label: Container(
            //             margin: const EdgeInsets.symmetric(horizontal: 7),
            //             child: Text(
            //               'Email',
            //               textAlign: TextAlign.center,
            //               style: GoogleFonts.mandali(
            //                   color: Myisellcolors.hoved, fontSize: 19),
            //             ),
            //           ),
            //           float: FloatingLabelBehavior.always,
            //           icon: Container(
            //             margin: const EdgeInsets.only(right: 10),
            //             child: const Icon(
            //               Icons.email_outlined,
            //               color: Myisellcolors.hoved,
            //             ),
            //           ),
            //         ),
            //         const SizedBox(
            //           height: 40,
            //         ),
            //         IsellButtons(
            //             size: const Size(390, 60),
            //             name: "Sjekk Email",
            //             onPresset: () {
            //               controller.gotobekreftkoden();
            //             },
            //             alignmen: Alignment.center,
            //             borderradius: 15,
            //             fontsize: 16,
            //             bgcolor: Myisellcolors.hoved),
            //       ],
            //     )
            //   ],
            // ),
            body: Column(children: [
              const Expanded(flex: 2, child: SizedBox()),
              Text(
                innloggingList[2].title!,
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
                  innloggingList[2].body!,
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
              IsellTextField(
                fontsizehinttext: 14.5,
                validater: (val) {
                  return validInput(val!, 5, 100, "email");
                },
                hinttxt: "Skriv Inn Din Email",
                hinttxtcolor: Colors.white30,
                contentpadding: const EdgeInsets.fromLTRB(25, 23, 25, 23),
                txtcolor: Colors.white70,
                txttype: TextInputType.emailAddress,
                con: controller.sjkkemailController,
                onSav: (value) {
                  controller.sjkkemail = value!;
                },
                paddingcontainer: const EdgeInsets.only(left: 20, right: 20),
                cursorColor: Colors.grey,
                height: 20,
                width: 1,
                borderR: 15,
                borderwidth: 1,
                bordersidecolor: Myisellcolors.hoved,
                obs: false,
                alignment: const Alignment(0, -1),
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
              IsellButtons(
                  size: Size(Get.width / 1.1, 60),
                  name: "Sjekk Email",
                  onPresset: () {
                    controller.gotobekreftkoden();
                  },
                  alignmen: Alignment.center,
                  borderradius: 15,
                  fontsize: 16,
                  bgcolor: Myisellcolors.hoved),
              const Expanded(flex: 5, child: SizedBox()),
            ]),
          ),
        ),
      ),
    );
  }
}
