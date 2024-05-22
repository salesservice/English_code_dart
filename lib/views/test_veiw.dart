// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';

// import '../controller/test_controller.dart';
// import '../core/classes/handling_data_view.dart';

// class TestVeiw extends StatelessWidget {
//   const TestVeiw({super.key});

//   @override
//   Widget build(BuildContext context) {
//     Get.put(TestController());
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.brown.shade600,
//         elevation: 0,
//         centerTitle: true,
//         title: Text(
//           "Test View",
//           style: GoogleFonts.baloo2(fontSize: 19, color: Colors.white),
//         ),
//       ),
//       body: Container(
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(colors: [
//             Colors.black,
//             Color.fromARGB(234, 103, 66, 53),
//           ], begin: Alignment.bottomCenter, end: Alignment.topCenter),
//         ),
//         child: GetBuilder<TestController>(builder: (controller) {
//           return HandlingDataView(
//               statusRequest: controller.statusRequest,
//               widget: ListView.builder(
//                   itemCount: controller.data.length,
//                   itemBuilder: (context, index) {
//                     return Text("${controller.data}");
//                   }));
//         }),
//       ),
//     );
//   }
// }
