import 'package:flutter/material.dart';
import 'package:flutter_isell_new/core/constants/sellx_colors.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../controller/onboarding_controller.dart';
import '../../../data/static/onboarding_static.dart';
import '../../widget/sellx_ buttons.dart';

class OnBoarding extends GetView<OnboardingControllerImp> {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OnboardingControllerImp());
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Myisellcolors.appbar,
      // body: Stack(
      //   children: [
      //     PageView.builder(
      //       controller: controller.pageController,
      //       onPageChanged: (val) {
      //         controller.onPageChange(val);
      //       },
      //       itemCount: onBoardingList.length,
      //       itemBuilder: (context, i) => Stack(
      //         children: [
      //           Align(
      //             alignment: const Alignment(0, -0.4),
      //             child: Image.asset(
      //               onBoardingList[i].image!,
      //               height: 280,
      //               fit: BoxFit.cover,
      //             ),
      //           ),
      //           Column(
      //             children: [
      //               const SizedBox(
      //                 height: 100,
      //               ),
      //               Container(
      //                 child: Text(
      //                   onBoardingList[i].title!,
      //                   textAlign: TextAlign.center,
      //                   style: GoogleFonts.baloo2(
      //                       color: Myisellcolors.hvit,
      //                       fontSize: 28,
      //                       fontWeight: FontWeight.w500),
      //                 ),
      //               ),
      //               const SizedBox(
      //                 height: 400,
      //               ),
      //               Container(
      //                 padding: const EdgeInsets.only(left: 23, right: 23),
      //                 child: Text(
      //                   onBoardingList[i].body!,
      //                   textAlign: TextAlign.center,
      //                   style: GoogleFonts.poppins(
      //                       height: 1.7,
      //                       color: Myisellcolors.hvit,
      //                       fontSize: 14,
      //                       fontWeight: FontWeight.w400),
      //                 ),
      //               ),
      //               const SizedBox(
      //                 height: 100,
      //               ),
      //               IsellButtons(
      //                   size: const Size(300, 50),
      //                   name: onBoardingList[i].buttontitl!,
      //                   onPresset: () {
      //                     controller.next();
      //                   },
      //                   alignmen: Alignment.center,
      //                   borderradius: 30,
      //                   fontsize: 18,
      //                   bgcolor: Myisellcolors.hoved),
      //             ],
      //           ),
      //         ],
      //       ),
      //     ),
      //     Column(
      //       children: [
      //         const SizedBox(
      //           height: 850,
      //         ),
      //         GetBuilder<OnboardingControllerImp>(
      //           builder: (controller) => Row(
      //             mainAxisAlignment: MainAxisAlignment.center,
      //             children: [
      //               ...List.generate(
      //                 onBoardingList.length,
      //                 (index) => AnimatedContainer(
      //                   duration: const Duration(milliseconds: 400),
      //                   margin: const EdgeInsets.only(right: 4),
      //                   width: controller.currentPage == index ? 25 : 8,
      //                   height: 8,
      //                   decoration: BoxDecoration(
      //                       color: Myisellcolors.hoved,
      //                       borderRadius: BorderRadius.circular(10),
      //                       border: Border.all(
      //                           color: Myisellcolors.hoved, width: 1)),
      //                 ),
      //               ),
      //             ],
      //           ),
      //         )
      //       ],
      //     ),
      //   ],
      // ),

      body: PageView.builder(
        controller: controller.pageController,
        onPageChanged: (val) {
          controller.onPageChange(val);
        },
        itemCount: onBoardingList.length,
        itemBuilder: (context, i) => Column(
          children: [
            const Expanded(flex: 2, child: SizedBox()),
            Text(
              onBoardingList[i].title!,
              textAlign: TextAlign.center,
              style: GoogleFonts.baloo2(
                  color: Myisellcolors.hvit,
                  fontSize: 28,
                  fontWeight: FontWeight.w500),
            ),
            const Spacer(),
            Expanded(
              flex: 5,
              child: Image.asset(
                onBoardingList[i].image!,
                height: 280,
                fit: BoxFit.cover,
              ),
            ),
            const Spacer(),
            Container(
              padding: const EdgeInsets.only(left: 23, right: 23),
              child: Text(
                onBoardingList[i].body!,
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                    height: 1.7,
                    color: Myisellcolors.hvit,
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
              ),
            ),
            const Spacer(),
            IsellButtons(
                size: const Size(300, 50),
                name: onBoardingList[i].buttontitl!,
                onPresset: () {
                  controller.next();
                },
                alignmen: Alignment.center,
                borderradius: 30,
                fontsize: 18,
                bgcolor: Myisellcolors.hoved),
            const Spacer(),
            GetBuilder<OnboardingControllerImp>(
              builder: (controller) => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ...List.generate(
                    onBoardingList.length,
                    (index) => AnimatedContainer(
                      duration: const Duration(milliseconds: 400),
                      margin: const EdgeInsets.only(right: 4),
                      width: controller.currentPage == index ? 25 : 8,
                      height: 8,
                      decoration: BoxDecoration(
                          color: Myisellcolors.hoved,
                          borderRadius: BorderRadius.circular(10),
                          border:
                              Border.all(color: Myisellcolors.hoved, width: 1)),
                    ),
                  ),
                ],
              ),
            ),
            const Expanded(flex: 1, child: SizedBox()),
          ],
        ),
      ),
    );
  }
}
