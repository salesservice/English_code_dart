import 'package:flutter/material.dart';
import 'package:flutter_isell_new/views/screens/home/navbar.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/constants/sellx_colors.dart';

class Vurdering extends StatelessWidget {
  const Vurdering({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: const IconThemeData(color: Myisellcolors.hvit),
        actions: [
          Builder(
            builder: (context) => IconButton(
              icon: const Icon(
                Icons.menu_rounded,
                size: 30,
                color: Myisellcolors.hvit,
              ),
              padding: const EdgeInsets.only(right: 20, top: 5),
              onPressed: () => Scaffold.of(context).openEndDrawer(),
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            ),
          ),
        ],
        toolbarHeight: 65,
        backgroundColor: Myisellcolors.home,
        title: Container(
          alignment: Alignment.centerLeft,
          child: Text(
            "Vurderinger",
            style: GoogleFonts.baloo2(fontSize: 20, color: Myisellcolors.hvit),
          ),
        ),
      ),
      endDrawer: const NavBar(),
    );
  }
}
