import 'package:flutter/material.dart';
import 'package:flutter_isell_new/core/constants/sellx_colors.dart';
import 'package:flutter_isell_new/views/screens/home/navbar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toggle_switch/toggle_switch.dart';

class Innstillinger extends StatelessWidget {
  const Innstillinger({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Myisellcolors.home,
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
            "Innstillinger",
            style: GoogleFonts.baloo2(fontSize: 20, color: Myisellcolors.hvit),
          ),
        ),
      ),
      endDrawer: const NavBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            child: Text(
              "Varslinger",
              style:
                  GoogleFonts.roboto(fontSize: 20, color: Myisellcolors.hvit),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: Myisellcolors.appbar,
                borderRadius: BorderRadius.circular(10)),
            margin: const EdgeInsets.only(top: 5, bottom: 5, left: 5, right: 5),
            child: ListTile(
              trailing: ToggleSwitch(
                animate: true,
                animationDuration: 150,
                activeBorders: [
                  Border.all(color: Myisellcolors.home),
                  Border.all(color: Myisellcolors.hoved)
                ],
                minHeight: 33,
                minWidth: 33.0,
                //cornerRadius: 25.0,
                activeBgColors: const [
                  [Myisellcolors.hoved],
                  [Myisellcolors.home],
                ],
                activeFgColor: Colors.white,
                inactiveBgColor: Colors.grey,
                activeBgColor: const [Myisellcolors.hoved],
                borderColor: const [Myisellcolors.hoved],
                borderWidth: 0.8,
                inactiveFgColor: Colors.white,
                initialLabelIndex: 1,
                fontSize: 9,
                totalSwitches: 2,
                labels: const ['På', 'Av'],
                radiusStyle: true,
                onToggle: (index) {
                  print('switched to: $index');
                },
              ),
              //  Switch(
              //   activeColor: Myisellcolors.hoved,
              //   inactiveTrackColor: Myisellcolors.picbg,
              //   value: true,
              //   onChanged: (value) {},
              // ),
              title: Text('Alle varslinger',
                  style: GoogleFonts.roboto(
                      fontSize: 17, color: Myisellcolors.hvit)),
            ),
          ),
        ],
      ),
    );
  }
}
