import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../controller/login_controller.dart';
import '../../../core/classes/handling_data_view.dart';
import '../../../core/constants/sellx_colors.dart';
import '../../../core/constants/sellx_images.dart';
import '../../../data/static/login_static.dart';

class ConfirmPassword extends GetView<InnloggingControllerImp> {
  const ConfirmPassword({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(InnloggingControllerImp());

    return Form(
        key: controller.gkverifycodeglemtpassord,
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
                        "Bekreft Kode",
                        style: GoogleFonts.baloo2(
                            fontSize: 19, color: Colors.white),
                      ),
                    ),
                    // body: Stack(children: [
                    //   ListView(
                    //     children: [
                    //       const SizedBox(
                    //         height: 50,
                    //       ),
                    //       Text(
                    //         innloggingList[3].title!,
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
                    //           innloggingList[3].body!,
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
                    //         height: 30,
                    //       ),
                    //       OtpTextField(
                    //         fieldWidth: 45,
                    //         borderRadius: BorderRadius.circular(15),
                    //         numberOfFields: 5,
                    //         enabledBorderColor: Myisellcolors.hoved,
                    //         focusedBorderColor: Colors.white,
                    //         textStyle: const TextStyle(color: Colors.white),
                    //         cursorColor: Myisellcolors.hoved,
                    //         borderColor: Myisellcolors.hoved,
                    //         showFieldAsBox: true,
                    //         onCodeChanged: (String code) {},
                    //         onSubmit: (String verificationcodeforgetpassord) {
                    //           controller.gototilbakestillpassord(
                    //               verificationcodeforgetpassord);
                    //         },
                    //       ),
                    //       const SizedBox(
                    //         height: 30,
                    //       ),
                    //       const SizedBox(height: 70),
                    //     ],
                    //   )
                    // ]),
                    body: Column(
                      children: [
                        const Expanded(flex: 1, child: SizedBox()),
                        Text(
                          innloggingList[3].title!,
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
                            innloggingList[3].body!,
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
                        OtpTextField(
                          fieldWidth: 45,
                          borderRadius: BorderRadius.circular(15),
                          numberOfFields: 5,
                          enabledBorderColor: Myisellcolors.hoved,
                          focusedBorderColor: Colors.white,
                          textStyle: const TextStyle(color: Colors.white),
                          cursorColor: Myisellcolors.hoved,
                          borderColor: Myisellcolors.hoved,
                          showFieldAsBox: true,
                          onCodeChanged: (String code) {},
                          onSubmit: (String verificationcodeforgetpassord) {
                            controller.gototilbakestillpassord(
                                verificationcodeforgetpassord);
                          },
                        ),
                        const Expanded(flex: 5, child: SizedBox()),
                      ],
                    ),
                  ),
                )));
  }
}
