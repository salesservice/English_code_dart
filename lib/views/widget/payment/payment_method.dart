import 'package:flutter/material.dart';
import 'package:flutter_isell_new/core/constants/sellx_colors.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class BetalingMetode extends StatelessWidget {
  final String title;
  final bool isAktive;
  final Widget image;
  const BetalingMetode(
      {super.key,
      required this.title,
      required this.isAktive,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
            margin: EdgeInsets.only(top: Get.height / 40),
            height: Get.height / 8,
            width: Get.width / 2.15,
            decoration: BoxDecoration(
              color: Myisellcolors.hvit,
              border: Border.all(
                  color: Myisellcolors.hoved, width: isAktive == true ? 3 : 0),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Container(
                margin: const EdgeInsets.only(top: 0, bottom: 0),
                child: image)),
        Container(
          margin: const EdgeInsets.only(top: 5, left: 10),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: GoogleFonts.roboto(fontSize: 18, color: Myisellcolors.hvit),
          ),
        ),
      ],
    );
  }
}
