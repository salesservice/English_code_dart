import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../controller/login_controller.dart';
import '../../../core/constants/sellx_colors.dart';
import '../../../core/constants/sellx_images.dart';
import '../../widget/sellx_ buttons.dart';

class Loggellerreg extends GetView<InnloggingControllerImp> {
  const Loggellerreg({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(InnloggingControllerImp());
    return Scaffold(
      backgroundColor: Myisellcolors.appbar,
      // body: Stack(
      //   children: [
      //     Row(
      //       children: [
      //         Align(
      //           //alignment: const Alignment(0.1, -0.76),
      //           child: Text(
      //             'SELLX.no',
      //             style: GoogleFonts.baloo2(
      //                 fontSize: 30,
      //                 color: Myisellcolors.hoved,
      //                 fontWeight: FontWeight.w100),
      //           ),
      //         ),
      //         SizedBox(
      //           width: 6,
      //         ),
      //         Container(
      //           // alignment: const Alignment(-0.39, -0.753),
      //           child: Image.asset(
      //             ImageAsset.logobilde,
      //             width: 37,
      //             height: 37,
      //             color: Myisellcolors.hoved,
      //           ),
      //         ),
      //       ],
      //     ),
      //     Align(
      //       alignment: const Alignment(0, -0.4),
      //       child: Image.asset(
      //         ImageAsset.loggellerregbilde,
      //         height: 300,
      //       ),
      //     ),
      //     Align(
      //       alignment: const Alignment(0, 0.18),
      //       child: RichText(
      //         text: TextSpan(
      //           children: <TextSpan>[
      //             TextSpan(
      //               text: 'Velkommen Til ',
      //               style: GoogleFonts.baloo2(
      //                 textStyle: const TextStyle(
      //                     fontSize: 26,
      //                     fontWeight: FontWeight.normal,
      //                     inherit: false,
      //                     color: Myisellcolors.hvit),
      //               ),
      //             ),
      //             TextSpan(
      //               text: 'SELLX',
      //               style: GoogleFonts.baloo2(
      //                 textStyle: const TextStyle(
      //                     fontSize: 26,
      //                     fontWeight: FontWeight.w700,
      //                     inherit: false,
      //                     color: Myisellcolors.hvit),
      //               ),
      //             ),
      //           ],
      //         ),
      //       ),
      //     ),
      //     Align(
      //       alignment: const Alignment(0, 0.36),
      //       child: Text(
      //         'Uendlig mange valg til å sette\ndrømmene i gang',
      //         textAlign: TextAlign.center,
      //         style: GoogleFonts.baloo2(
      //             textStyle: const TextStyle(
      //                 fontSize: 18,
      //                 fontWeight: FontWeight.w500,
      //                 color: Myisellcolors.hvit70)),
      //       ),
      //     ),
      //     IsellButtons(
      //         size: const Size(320, 60),
      //         name: 'Logg Inn',
      //         onPresset: () {
      //           controller.gotologginn();
      //         },
      //         alignmen: const Alignment(0, 0.64),
      //         borderradius: 6,
      //         fontsize: 18,
      //         bgcolor: Myisellcolors.hoved),
      //     OutlineButtons(
      //       alignmen: const Alignment(0, 0.83),
      //       borderradius: 5,
      //       fontsize: 18,
      //       name: 'Registrer',
      //       onPresset: () {
      //         controller.gotoregistrer();
      //       },
      //       size: const Size(320, 60),
      //     )
      //   ],
      // ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        const Expanded(flex: 3, child: SizedBox()),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'SELLX.no',
              style: GoogleFonts.baloo2(
                  fontSize: 30,
                  color: Myisellcolors.hoved,
                  fontWeight: FontWeight.w100),
            ),
            const SizedBox(
              width: 6,
            ),
            Image.asset(
              ImageAsset.logobilde,
              width: 37,
              height: 37,
              color: Myisellcolors.hoved,
            ),
          ],
        ),
        const Spacer(),
        Align(
          alignment: const Alignment(0, -0.4),
          child: Image.asset(
            ImageAsset.loggellerregbilde,
            height: 300,
          ),
        ),
        const Spacer(),
        Align(
          alignment: const Alignment(0, 0.18),
          child: RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                  text: 'Velkommen Til ',
                  style: GoogleFonts.baloo2(
                    textStyle: const TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.normal,
                        inherit: false,
                        color: Myisellcolors.hvit),
                  ),
                ),
                TextSpan(
                  text: 'SELLX',
                  style: GoogleFonts.baloo2(
                    textStyle: const TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w700,
                        inherit: false,
                        color: Myisellcolors.hvit),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 10),
        Align(
          alignment: const Alignment(0, 0.36),
          child: Text(
            'Uendlig mange valg til å sette\ndrømmene i gang',
            textAlign: TextAlign.center,
            style: GoogleFonts.baloo2(
                textStyle: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Myisellcolors.hvit70)),
          ),
        ),
        const Spacer(),
        IsellButtons(
            size: const Size(320, 60),
            name: 'Logg Inn',
            onPresset: () {
              controller.gotologginn();
            },
            alignmen: const Alignment(0, 0),
            borderradius: 6,
            fontsize: 18,
            bgcolor: Myisellcolors.hoved),
        const SizedBox(height: 20),
        OutlineButtons(
          textcolor: Myisellcolors.hoved,
          bordercolor: Myisellcolors.hoved,
          alignmen: const Alignment(0, 0),
          borderradius: 5,
          fontsize: 18,
          name: 'Registrer',
          onPresset: () {
            controller.gotoregistrer();
          },
          size: const Size(320, 60),
        ),
        const Expanded(flex: 2, child: SizedBox()),
      ]),
    );
  }
}
