import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/constants/sellx_colors.dart';

class Popularknapp extends StatelessWidget {
  final void Function()? ontap;
  final dynamic text;

  const Popularknapp({super.key, this.ontap, this.text});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: Myisellcolors.hoved)),
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Text(
            text,
            style: GoogleFonts.poppins(fontSize: 13, color: Myisellcolors.hvit),
          ),
        ),
      ),
    );
  }
}
