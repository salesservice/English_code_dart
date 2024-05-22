// import 'package:flutter/material.dart';
// import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';

// import '../../../controller/innloggingcontroller.dart';
// import '../../../core/constants/isellcolors.dart';
// import '../../../data/static/innloggingstatic.dart';
// import '../../widget/isellbottons.dart';

// class SjekkTelefonBare extends GetView<InnloggingControllerImp> {
//   const SjekkTelefonBare({super.key});

//   @override
//   Widget build(BuildContext context) {
//     Get.put({InnloggingControllerImp()});
//     final height = MediaQuery.of(context).size.height;

//     return Form(
//       child: Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.brown.shade600,
//           elevation: 0,
//           centerTitle: true,
//           title: Text(
//             "Bekreft Telefon",
//             style: GoogleFonts.baloo2(fontSize: 19, color: Colors.white),
//           ),
//         ),
//         body: Stack(children: [
//           Container(
//             height: height,
//             decoration: const BoxDecoration(
//               gradient: LinearGradient(colors: [
//                 Colors.black,
//                 Color.fromARGB(234, 103, 66, 53),
//               ], begin: Alignment.bottomCenter, end: Alignment.topCenter),
//             ),
//           ),
//           ListView(children: [
//             const SizedBox(
//               height: 30,
//             ),
//             Container(
//               margin: const EdgeInsets.only(left: 25, right: 25),
//               child: Text(
//                 innloggingList[5].title!,
//                 textAlign: TextAlign.left,
//                 style: GoogleFonts.merriweather(
//                     fontSize: 20,
//                     fontWeight: FontWeight.w500,
//                     color: Myisellcolors.hoved),
//               ),
//             ),
//             const SizedBox(
//               height: 25,
//             ),
//             Container(
//               margin: const EdgeInsets.only(left: 24),
//               child: RichText(
//                 text: TextSpan(
//                   children: <TextSpan>[
//                     TextSpan(
//                       text: 'Bekreftelseskoden Er Sendt Til: ',
//                       style: GoogleFonts.baloo2(
//                         textStyle: const TextStyle(
//                           fontSize: 18,
//                           fontWeight: FontWeight.normal,
//                           inherit: false,
//                         ),
//                       ),
//                     ),
//                     TextSpan(
//                       text: controller.numberController.text,
//                       style: GoogleFonts.baloo2(
//                         textStyle: const TextStyle(
//                             fontSize: 18,
//                             fontWeight: FontWeight.w600,
//                             inherit: false),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),

//               // child: Text(
//               //   "Bekreftelseskoden Er Sendt Til $controller.emailController.text",
//               //   textAlign: TextAlign.left,
//               //   style: GoogleFonts.baloo2(
//               //     color: Colors.white60,
//               //     fontSize: 16.4,
//               //   ),
//               // ),
//             ),
//             const SizedBox(
//               height: 150,
//             ),
//             OtpTextField(
//               fieldWidth: 45,
//               borderWidth: 2,
//               borderRadius: BorderRadius.circular(10),
//               numberOfFields: 5,
//               enabledBorderColor: Myisellcolors.hoved,
//               focusedBorderColor: Colors.white,
//               textStyle: const TextStyle(color: Colors.white),
//               cursorColor: Myisellcolors.hoved,
//               borderColor: Myisellcolors.hoved,
//               showFieldAsBox: true,
//               onCodeChanged: (String code) {},
//               onSubmit: (String verificationCode) {},
//             ),
//             const SizedBox(
//               height: 60,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 OutlineButtons(
//                     alignmen: Alignment.center,
//                     name: "Send På Nytt",
//                     onPresset: () {},
//                     size: const Size(140, 60),
//                     borderradius: 15,
//                     fontsize: 14),
//                 const Padding(padding: EdgeInsets.all(10)),
//                 IsellButtons(
//                     size: const Size(140, 60),
//                     name: "Bekreft",
//                     onPresset: () {
//                       controller.gotosuksessregistrert();
//                     },
//                     alignmen: Alignment.center,
//                     borderradius: 15,
//                     fontsize: 16,
//                     bgcolor: Myisellcolors.hoved),
//               ],
//             ),
//           ]),
//         ]),
//       ),
//     );
//   }
// }
