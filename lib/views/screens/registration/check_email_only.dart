import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../controller/login_controller.dart';
import '../../../core/classes/handling_data_view.dart';
import '../../../core/constants/sellx_colors.dart';
import '../../../data/static/login_static.dart';

class SjekkEmailBare extends GetView<InnloggingControllerImp> {
  const SjekkEmailBare({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put({InnloggingControllerImp()});
    final height = MediaQuery.of(context).size.height;

    return Form(
      key: controller.gksjekkemailbare,
      child: GetBuilder<InnloggingControllerImp>(
        builder: (controller) => HandlingDataRequest(
          statusRequest: controller.statusRequest!,
          widget: Scaffold(
            backgroundColor: Myisellcolors.appbar,
            appBar: AppBar(
              iconTheme: const IconThemeData(color: Myisellcolors.hvit),
              backgroundColor: Myisellcolors.appbar,
              elevation: 0,
              centerTitle: true,
              title: Text(
                "Bekreft Email",
                style:
                    GoogleFonts.baloo2(fontSize: 19, color: Myisellcolors.hvit),
              ),
            ),
            // body: Stack(
            //   children: [
            //     ListView(
            //       children: [
            //         const SizedBox(
            //           height: 30,
            //         ),
            //         Container(
            //           margin: const EdgeInsets.only(left: 25, right: 25),
            //           child: Text(
            //             innloggingList[6].title!,
            //             textAlign: TextAlign.left,
            //             style: GoogleFonts.merriweather(
            //                 fontSize: 20,
            //                 fontWeight: FontWeight.w500,
            //                 color: Myisellcolors.hoved),
            //           ),
            //         ),
            //         const SizedBox(
            //           height: 25,
            //         ),
            //         Container(
            //           margin: const EdgeInsets.only(left: 24),
            //           child: RichText(
            //             text: TextSpan(
            //               children: <TextSpan>[
            //                 TextSpan(
            //                   text: 'Bekreftelseskoden Er Sendt Til: ',
            //                   style: GoogleFonts.baloo2(
            //                     textStyle: const TextStyle(
            //                         fontSize: 18,
            //                         fontWeight: FontWeight.normal,
            //                         inherit: false,
            //                         color: Myisellcolors.hvit),
            //                   ),
            //                 ),
            //                 TextSpan(
            //                   text: controller.emailController.text.isNotEmpty
            //                       ? controller.emailController.text
            //                       : controller.emaillogginnController.text,
            //                   style: GoogleFonts.baloo2(
            //                     textStyle: const TextStyle(
            //                         fontSize: 18,
            //                         fontWeight: FontWeight.w600,
            //                         inherit: false,
            //                         color: Myisellcolors.hvit),
            //                   ),
            //                 ),
            //               ],
            //             ),
            //           ),

            //           // child: Text(
            //           //   "Bekreftelseskoden Er Sendt Til $controller.emailController.text",
            //           //   textAlign: TextAlign.left,
            //           //   style: GoogleFonts.baloo2(
            //           //     color: Colors.white60,
            //           //     fontSize: 16.4,
            //           //   ),
            //           // ),
            //         ),
            //         const SizedBox(
            //           height: 60,
            //         ),
            //         OtpTextField(
            //           fieldWidth: 45,
            //           borderWidth: 2,
            //           borderRadius: BorderRadius.circular(8),
            //           numberOfFields: 5,
            //           mainAxisAlignment: MainAxisAlignment.center,
            //           enabledBorderColor: Myisellcolors.hoved,
            //           focusedBorderColor: Myisellcolors.hvit,
            //           textStyle: const TextStyle(color: Myisellcolors.hvit),
            //           cursorColor: Myisellcolors.hoved,
            //           borderColor: Myisellcolors.hoved,
            //           showFieldAsBox: true,
            //           onCodeChanged: (String code) {},
            //           onSubmit: (String verificationCode) {
            //             controller.gotosuksessregistrert(verificationCode);
            //           },
            //         ),
            //         const SizedBox(
            //           height: 60,
            //         ),
            //         // IsellButtons(
            //         //     size: const Size(240, 65),
            //         //     name: "Bekreft",
            //         //     onPresset: () {},
            //         //     alignmen: Alignment.center,
            //         //     borderradius: 20,
            //         //     fontsize: 17,
            //         //     bgcolor: Myisellcolors.hoved)
            //         Row(
            //           children: [
            //             Container(
            //               margin: const EdgeInsets.only(left: 24),
            //               child: RichText(
            //                 text: TextSpan(
            //                   children: <TextSpan>[
            //                     TextSpan(
            //                       text: 'Ikke mottatt Bekreftelseskoden? ',
            //                       style: GoogleFonts.baloo2(
            //                         textStyle: const TextStyle(
            //                             fontSize: 18,
            //                             fontWeight: FontWeight.normal,
            //                             inherit: false,
            //                             color: Myisellcolors.hvit),
            //                       ),
            //                     ),
            //                   ],
            //                 ),
            //               ),
            //             ),
            //             GestureDetector(
            //               onTap: () {
            //                 controller.reSend();
            //               },
            //               child: Text(
            //                 controller.resendTapped
            //                     ? "Kode ble Sendt"
            //                     : "Send igjen",
            //                 style: GoogleFonts.baloo2(
            //                   color: Myisellcolors.hoved,
            //                   fontSize: 18,
            //                   decoration: TextDecoration.underline,
            //                 ),
            //               ),
            //             ),
            //           ],
            //         ),
            //       ],
            //     ),
            //   ],
            // ),
            body: Column(children: [
              const Expanded(flex: 1, child: SizedBox()),
              Container(
                margin: const EdgeInsets.only(left: 25, right: 25),
                child: Text(
                  innloggingList[6].title!,
                  textAlign: TextAlign.left,
                  style: GoogleFonts.merriweather(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Myisellcolors.hoved),
                ),
              ),
              const Spacer(),
              Container(
                margin: const EdgeInsets.only(left: 24),
                child: RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Bekreftelseskoden Er Sendt Til: ',
                        style: GoogleFonts.baloo2(
                          textStyle: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                              inherit: false,
                              color: Myisellcolors.hvit),
                        ),
                      ),
                      TextSpan(
                        text: controller.emailController.text.isNotEmpty
                            ? controller.emailController.text
                            : controller.emaillogginnController.text,
                        style: GoogleFonts.baloo2(
                          textStyle: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              inherit: false,
                              color: Myisellcolors.hvit),
                        ),
                      ),
                    ],
                  ),
                ),

                // child: Text(
                //   "Bekreftelseskoden Er Sendt Til $controller.emailController.text",
                //   textAlign: TextAlign.left,
                //   style: GoogleFonts.baloo2(
                //     color: Colors.white60,
                //     fontSize: 16.4,
                //   ),
                // ),
              ),
              const Spacer(),
              OtpTextField(
                fieldWidth: 45,
                borderWidth: 2,
                borderRadius: BorderRadius.circular(8),
                numberOfFields: 5,
                mainAxisAlignment: MainAxisAlignment.center,
                enabledBorderColor: Myisellcolors.hoved,
                focusedBorderColor: Myisellcolors.hvit,
                textStyle: const TextStyle(color: Myisellcolors.hvit),
                cursorColor: Myisellcolors.hoved,
                borderColor: Myisellcolors.hoved,
                showFieldAsBox: true,
                onCodeChanged: (String code) {},
                onSubmit: (String verificationCode) {
                  controller.gotosuksessregistrert(verificationCode);
                },
              ),
              const Spacer(),
              // IsellButtons(
              //     size: const Size(240, 65),
              //     name: "Bekreft",
              //     onPresset: () {},
              //     alignmen: Alignment.center,
              //     borderradius: 20,
              //     fontsize: 17,
              //     bgcolor: Myisellcolors.hoved)
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 24),
                    child: RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Ikke mottatt Bekreftelseskoden? ',
                            style: GoogleFonts.baloo2(
                              textStyle: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.normal,
                                  inherit: false,
                                  color: Myisellcolors.hvit),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      controller.reSend();
                    },
                    child: Text(
                      controller.resendTapped ? "Kode ble Sendt" : "Send igjen",
                      style: GoogleFonts.baloo2(
                        color: Myisellcolors.hoved,
                        fontSize: 18,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
              const Expanded(flex: 6, child: SizedBox()),
            ]),
          ),
        ),
      ),
    );
  }
}
