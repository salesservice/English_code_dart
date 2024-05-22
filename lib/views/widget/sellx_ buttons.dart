import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../controller/onboarding_controller.dart';
import '../../core/constants/sellx_colors.dart';

class IsellButtons extends GetView<OnboardingControllerImp> {
  final void Function() onPresset;
  final dynamic alignmen;
  final String name;
  final double fontsize;
  final double borderradius;
  final dynamic bgcolor, iconcolor, icon, iconsize, widthbetweeniconandtext;

  final Size size;

  IsellButtons(
      {required this.size,
      required this.name,
      required this.onPresset(),
      required this.alignmen,
      required this.borderradius,
      required this.fontsize,
      required this.bgcolor,
      this.icon,
      this.iconcolor,
      this.iconsize,
      this.widthbetweeniconandtext});
  @override
  Widget build(BuildContext context) {
    Get.put(OnboardingControllerImp());
    return Container(
      alignment: alignmen,
      child: ElevatedButton(
        onPressed: onPresset,
        style: ElevatedButton.styleFrom(
            foregroundColor: Myisellcolors.blak,
            backgroundColor: bgcolor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderradius)),
            minimumSize: size,
            maximumSize: size),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              name,
              style: GoogleFonts.roboto(
                textStyle: TextStyle(
                  fontSize: fontsize,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(
              width: widthbetweeniconandtext,
            ),
            if (icon != null)
              Icon(
                icon,
                color: iconcolor,
                size: iconsize,
              )
            else
              const SizedBox(),
          ],
        ),
      ),
    );
  }
}

class OutlineButtons extends StatelessWidget {
  final void Function() onPresset;
  final dynamic alignmen, textcolor, bordercolor, selectedbutton;
  final String name;
  final dynamic size;
  final double borderradius, fontsize;

  OutlineButtons(
      {this.alignmen,
      this.selectedbutton,
      this.textcolor,
      this.bordercolor,
      required this.name,
      required this.onPresset,
      required this.size,
      required this.borderradius,
      required this.fontsize});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignmen,
      child: OutlinedButton(
        onPressed: onPresset,
        style: OutlinedButton.styleFrom(
            foregroundColor: textcolor,
            minimumSize: size,
            side: BorderSide(color: bordercolor, width: 1),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderradius))),
        child: Text(
          name,
          style: GoogleFonts.roboto(
              textStyle:
                  TextStyle(fontSize: fontsize, fontWeight: FontWeight.w600)),
        ),
      ),
    );
  }
}
