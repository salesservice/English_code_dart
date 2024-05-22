import 'package:flutter/material.dart';
import 'package:flutter_isell_new/core/constants/sellx_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomClickableRow extends StatelessWidget {
  final String name;
  final dynamic child;
  const CustomClickableRow(
      {super.key, required this.name, required this.child});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (context) => buildBottomDrawer(context),
            backgroundColor: Myisellcolors.blak,
          );
        },
        child: InkWell(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: Text(
                  name,
                  style: GoogleFonts.roboto(
                    color: Myisellcolors.hvit,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: const Icon(
                  Icons.chevron_right,
                  color: Myisellcolors.hvit,
                  size: 27,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildBottomDrawer(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Myisellcolors.home,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50), topRight: Radius.circular(50))),
      height: MediaQuery.of(context).size.height * 0.75,
      child: child,
    );
  }
}
