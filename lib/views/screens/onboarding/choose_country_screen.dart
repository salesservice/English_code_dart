import 'package:flutter/material.dart';
import 'package:flutter_isell_new/core/constants/sellx_images.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../controller/onboarding_controller.dart';
import '../../../core/constants/sellx_colors.dart';
import '../../widget/sellx_ buttons.dart';

class ChooseLand extends GetView<OnboardingControllerImp> {
  const ChooseLand({super.key});
//Color.fromARGB(255, 29, 59, 59),
//Color.fromARGB(255, 11, 29, 29),
  @override
  Widget build(BuildContext context) {
    List toJson = [
      {'id': 1, 'image': 'assets/images/norway.jpg', 'name': 'Norway'},
      {'id': 2, 'image': 'assets/images/sweden.jpg', 'name': 'Sweden'},
      {'id': 3, 'image': 'assets/images/denmark.jpg', 'name': 'Denmark'},
      {'id': 4, 'image': 'assets/images/finland.jpg', 'name': 'Finland'}
    ];
    final formKey = GlobalKey<FormState>();
    //final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    Get.put(OnboardingControllerImp());

    return Scaffold(
      backgroundColor: Myisellcolors.appbar,
      body: Form(
        key: formKey,
        // child: Stack(
        //   children: [
        //     IsellButtons(
        //         size: const Size(345, 63),
        //         name: 'Lets Start',
        //         onPresset: () {
        //           if (formKey.currentState!.validate()) {
        //             controller.gotoLests();
        //           }
        //         },
        //         alignmen: const Alignment(0, 0.68),
        //         borderradius: 10,
        //         fontsize: 17,
        //         bgcolor: Myisellcolors.hoved),
        //     Container(
        //       alignment: const Alignment(0, -0.34),
        //       child: Image.asset(
        //         ImageAsset.velkommenhus,
        //         width: 250,
        //         color: Myisellcolors.hoved,
        //       ),
        //     ),
        //     Container(
        //       alignment: const Alignment(0, 0.19),
        //       child: Text(
        //         'Please Choose Your Country',
        //         style: GoogleFonts.poppins(
        //             fontSize: 20, color: Myisellcolors.hoved),
        //       ),
        //     ),
        //     Container(
        //       alignment: const Alignment(0, -0.71),
        //       child: Text(
        //         'Welcome To SELLX',
        //         style: GoogleFonts.robotoSlab(
        //             fontSize: 28,
        //             wordSpacing: 4,
        //             fontWeight: FontWeight.w500,
        //             color: Myisellcolors.hoved),
        //       ),
        //     ),
        //     Container(
        //       alignment: const Alignment(0, 0.46),
        //       child: SizedBox(
        //         width: 345,
        //         height: 85,
        //         child: DropdownButtonHideUnderline(
        //           child: ButtonTheme(
        //             alignedDropdown: true,
        //             child: DropdownButtonFormField(
        //               dropdownColor: Colors.brown.shade100,
        //               decoration: InputDecoration(
        //                   contentPadding: const EdgeInsets.only(
        //                       right: 8, left: 1, top: 20, bottom: 20),
        //                   enabledBorder: const OutlineInputBorder(
        //                     borderRadius: BorderRadius.all(Radius.circular(10)),
        //                     borderSide: BorderSide(
        //                         color: Myisellcolors.hoved, width: 1.5),
        //                   ),
        //                   fillColor: Colors.brown.shade100,
        //                   focusedBorder: const OutlineInputBorder(
        //                     borderRadius: BorderRadius.all(Radius.circular(10)),
        //                     borderSide: BorderSide(
        //                         color: Myisellcolors.hoved, width: 1.5),
        //                   ),
        //                   border: const OutlineInputBorder(
        //                     borderRadius: BorderRadius.all(
        //                       Radius.circular(10),
        //                     ),
        //                   ),
        //                   filled: true),
        //               validator: (value) {
        //                 if (value == null) {
        //                   return 'You should choose the country!';
        //                 } else if (value != '1') {
        //                   return 'Sorry, Your Country Is Not Available Yet!';
        //                 } else {
        //                   return null;
        //                 }
        //               },
        //               icon: const Icon(
        //                 Icons.keyboard_arrow_down_sharp,
        //                 size: (28),
        //                 color: Myisellcolors.hoved,
        //               ),
        //               hint: const Text('Choose Your Country',
        //                   style: TextStyle(color: Colors.black)),
        //               items: toJson.map(
        //                 (e) {
        //                   return DropdownMenuItem(
        //                       value: e['id'].toString(),
        //                       child: Row(
        //                         children: [
        //                           Image.asset(
        //                             e['image'],
        //                             width: 25,
        //                           ),
        //                           Container(
        //                             margin: const EdgeInsets.only(left: 10),
        //                             child: Text(e['name']),
        //                           )
        //                         ],
        //                       ));
        //                 },
        //               ).toList(),
        //               onChanged: (value) {
        //                 controller.selectedland.value = value as String;
        //               },
        //             ),
        //           ),
        //         ),
        //       ),
        //     )
        //   ],
        // ),
        child: Column(children: [
          const Expanded(flex: 2, child: SizedBox()),
          Container(
            alignment: const Alignment(0, -0.71),
            child: Text(
              'Welcome To SELLX',
              style: GoogleFonts.robotoSlab(
                  fontSize: 28,
                  wordSpacing: 4,
                  fontWeight: FontWeight.w500,
                  color: Myisellcolors.hoved),
            ),
          ),
          const Spacer(),
          Expanded(
            flex: 3,
            child: Image.asset(
              ImageAsset.velkommenhus,
              width: 250,
              color: Myisellcolors.hoved,
            ),
          ),
          const Spacer(),
          Container(
            alignment: const Alignment(0, 0.19),
            child: Text(
              'Please Choose Your Country',
              style:
                  GoogleFonts.poppins(fontSize: 20, color: Myisellcolors.hoved),
            ),
          ),
          const Spacer(),
          Expanded(
            flex: 2,
            child: SizedBox(
              width: 345,
              height: 85,
              child: DropdownButtonHideUnderline(
                child: ButtonTheme(
                  alignedDropdown: true,
                  child: DropdownButtonFormField(
                    dropdownColor: Colors.brown.shade100,
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.only(
                            right: 8, left: 1, top: 20, bottom: 20),
                        enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(
                              color: Myisellcolors.hoved, width: 1.5),
                        ),
                        fillColor: Colors.brown.shade100,
                        focusedBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(
                              color: Myisellcolors.hoved, width: 1.5),
                        ),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        filled: true),
                    validator: (value) {
                      if (value == null) {
                        return 'You should choose the country!';
                      } else if (value != '1') {
                        return 'Sorry, Your Country Is Not Available Yet!';
                      } else {
                        return null;
                      }
                    },
                    icon: const Icon(
                      Icons.keyboard_arrow_down_sharp,
                      size: (28),
                      color: Myisellcolors.hoved,
                    ),
                    hint: const Text('Choose Your Country',
                        style: TextStyle(color: Colors.black)),
                    items: toJson.map(
                      (e) {
                        return DropdownMenuItem(
                            value: e['id'].toString(),
                            child: Row(
                              children: [
                                Image.asset(
                                  e['image'],
                                  width: 25,
                                ),
                                Container(
                                  margin: const EdgeInsets.only(left: 10),
                                  child: Text(e['name']),
                                )
                              ],
                            ));
                      },
                    ).toList(),
                    onChanged: (value) {
                      controller.selectedland.value = value as String;
                    },
                  ),
                ),
              ),
            ),
          ),
          const Spacer(),
          IsellButtons(
              size: const Size(345, 63),
              name: 'Lets Start',
              onPresset: () {
                if (formKey.currentState!.validate()) {
                  controller.gotoLests();
                }
              },
              alignmen: Alignment.center,
              borderradius: 10,
              fontsize: 17,
              bgcolor: Myisellcolors.hoved),
          const Expanded(flex: 2, child: SizedBox()),
        ]),
      ),
    );
  }
}







// class ChooseLand extends StatelessWidget {
//   const ChooseLand({super.key});

//   @override
//   Widget build(BuildContext context) {
//     // final GlobalKey<AdvanceExpansionTileState> _globalKey = GlobalKey();

//     Get.put(OnboardingControllerImp());
//     return Scaffold(
//       body: Stack(
//         children: [
//           Container(
//             decoration: const BoxDecoration(
//                 gradient: LinearGradient(
//                     colors: [Colors.brown, Colors.black],
//                     stops: [0.2, 1],
//                     begin: Alignment.topCenter,
//                     end: Alignment.bottomCenter)),
//           ),
//           IsellButtons(
//               size: const Size(345, 63),
//               name: 'Lets Start',
//               onPresset: () {},
//               alignmen: const Alignment(0, 0.62),
//               borderradius: 12,
//               fontsize: 17,
//               bgcolor: Myisellcolors.hoved),
//           Container(
//             alignment: const Alignment(0, -0.34),
//             child: Image.asset(
//               '/Users/muskha11/Developer/flutter_demo/flutter_isell_new/assets/images/7399134.png',
//               width: 250,
//             ),
//           ),
//           Container(
//             alignment: const Alignment(0, -0.7),
//             child: Text(
//               'Welcome To ISELL!',
//               style: GoogleFonts.rubikMicrobe(
//                   fontSize: 33,
//                   fontWeight: FontWeight.w600,
//                   color: Myisellcolors.hoved),
//             ),
//           ),
//           Container(
//             alignment: const Alignment(0, 0.19),
//             child: Text(
//               'Please Choose Your Country',
//               style:
//                   GoogleFonts.poppins(fontSize: 20, color: Myisellcolors.hoved),
//             ),
//           ),
//           GetBuilder<OnboardingControllerImp>(
//             builder: ((controller) => Container(
//                   alignment: const Alignment(0, 0.4),
//                   padding: const EdgeInsets.only(left: 18, right: 18),
//                   child: Card(
//                     color: Colors.brown.shade100,
//                     shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(12),
//                         side: const BorderSide(
//                             width: 2, color: Myisellcolors.hoved)),
//                     child: ExpansionTile(
//                       //maintainState: true,
//                       onExpansionChanged: (bool valu) {
//                         controller.selectedland = valu;
//                       },
//                       title: Text(
//                         'Choose Your Country',
//                         style: GoogleFonts.montserrat(
//                             fontSize: 16, color: Colors.black),
//                       ),
//                       children: [
//                         ListTile(
//                           selected: true,
//                           onTap: () {
//                             controller.selectedland.toString();
//                             controller.selectedland;
//                           },
//                           title: Text(
//                             'Norway',
//                             style: GoogleFonts.poppins(
//                                 fontSize: 15, color: Colors.black),
//                           ),
//                           leading: Image.asset(
//                             '/Users/muskha11/Developer/flutter_demo/flutter_isell_new/assets/images/norway.jpg',
//                             width: 25,
//                           ),
//                         ),
//                         ListTile(
//                           onTap: () {},
//                           title: Text(
//                             // strutStyle: StrutStyle(),
//                             'Sweden',
//                             style: GoogleFonts.poppins(
//                                 fontSize: 15, color: Colors.black),
//                           ),
//                           leading: Image.asset(
//                             '/Users/muskha11/Developer/flutter_demo/flutter_isell_new/assets/images/sweden.jpg',
//                             width: 25,
//                           ),
//                         ),
//                         ListTile(
//                           onTap: () {},
//                           title: Text(
//                             'Denmark',
//                             style: GoogleFonts.poppins(
//                                 fontSize: 15, color: Colors.black),
//                           ),
//                           leading: Image.asset(
//                             '/Users/muskha11/Developer/flutter_demo/flutter_isell_new/assets/images/denmark.jpg',
//                             width: 25,
//                           ),
//                         ),
//                         ListTile(
//                           onTap: () {},
//                           title: Text(
//                             'Finland',
//                             style: GoogleFonts.poppins(
//                                 fontSize: 15, color: Colors.black),
//                           ),
//                           leading: Image.asset(
//                             '/Users/muskha11/Developer/flutter_demo/flutter_isell_new/assets/images/finland.jpg',
//                             width: 25,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),),
//           ),
//         ],
//       ),
//     );
//   }
// }
