// import 'package:dashed_circle/dashed_circle.dart';
// import 'package:flutter/material.dart';

// import '../../../core/constants/isellcolors.dart';
// import '../../../core/constants/isellimages.dart';

// class Historier extends StatefulWidget {
//   const Historier({super.key});

//   @override
//   State<Historier> createState() => _HistorierState();
// }

// class _HistorierState extends State<Historier> with TickerProviderStateMixin {
//   late Animation<double> gap;
//   late Animation<double> base;
//   late Animation<double> reverse;
//   late AnimationController controller;

//   var model = [
//     Image.asset(ImageAsset.onboardingImageone),
//     Image.asset(ImageAsset.onboardingImagethree)
//   ];

//   @override
//   void initState() {
//     super.initState();
//     controller =
//         AnimationController(vsync: this, duration: const Duration(seconds: 1));
//     base = CurvedAnimation(parent: controller, curve: Curves.easeOut);
//     reverse = Tween<double>(begin: 0.0, end: -1.0).animate(base);
//     gap = Tween<double>(begin: 15.0, end: 0.0).animate(base)
//       ..addListener(() {
//         setState(() {});
//       });
//     controller.forward();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: MediaQuery.of(context).size.height * 0.12,
//       child: Padding(
//         padding: const EdgeInsets.only(top: 10, left: 5, right: 8),
//         child: ListView.builder(
//             shrinkWrap: true,
//             itemCount: 10,
//             scrollDirection: Axis.horizontal,
//             itemBuilder: (context, index) {
//               return Padding(
//                 padding: const EdgeInsets.all(5.0),
//                 child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Container(
//                         alignment: Alignment.center,
//                         child: RotationTransition(
//                           turns: base,
//                           child: DashedCircle(
//                             gapSize: gap.value,
//                             dashes: 3,
//                             color: Myisellcolors.hoved,
//                             child: RotationTransition(
//                               turns: reverse,
//                               child: const Padding(
//                                 padding: EdgeInsets.all(3.1),
//                                 child: CircleAvatar(
//                                   radius: 35,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                       )
//                     ]),
//               );
//             }),
//       ),
//     );
//   }
// }
