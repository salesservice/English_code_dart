// import 'package:flutter/material.dart';
// import 'package:flutter_isell_new/controller/best_items/best_items.dart';
// import 'package:flutter_isell_new/controller/favorite/favorite_controller.dart';
// import 'package:flutter_isell_new/controller/home_page_controller.dart';
// import 'package:flutter_isell_new/controller/items_controller.dart';
// import 'package:flutter_isell_new/controller/login_controller.dart';
// import 'package:flutter_isell_new/core/classes/handling_data_view.dart';
// import 'package:flutter_isell_new/core/constants/sellx_colors.dart';
// import 'package:flutter_isell_new/data/model/items_modell.dart';
// import 'package:flutter_isell_new/views/screens/items/bestitems/bestitemslist.dart';
// import 'package:get/get.dart';

// class BesteHomeRelevant extends StatelessWidget {
//   const BesteHomeRelevant({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     HomePageControllerImp homePageControllerImp =
//         Get.put(HomePageControllerImp());
//     Widget buildRelevantView() {
//       return HomeRelevant1(
//         controller: ItemControllerImp(),
//       );
//     }

//     return Container(color: Myisellcolors.home, child: buildRelevantView());
//   }
// }

// class HomeRelevant1 extends GetView<ItemControllerImp> {
//   @override
//   final ItemControllerImp controller;

//   const HomeRelevant1({super.key, required this.controller});

//   @override
//   Widget build(BuildContext context) {
//     Get.put(InnloggingControllerImp());
//     FavoritController favoritController = Get.put(FavoritController());
//     PageController pageController = PageController();
//     int currentIndex =
//         0; // Define currentIndex here or replace it with the appropriate variable
//     return Container(
//       color: Myisellcolors.home,
//       child: GetBuilder<BestitemsCarControllerImp>(
//         builder: (controller) => HandlingDataView(
//           statusRequest: controller.statusRequest,
//           widget: Stack(
//             children: [
//               Container(
//                 margin: const EdgeInsets.only(left: 10, right: 10),
//                 decoration: BoxDecoration(
//                   border: Border.all(width: 0.5, color: Myisellcolors.hoved),
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.circular(10),
//                   child: SizedBox(
//                     height: Get.height / 3.5,
//                     child: PageView.builder(
//                       controller: pageController,
//                       itemCount: controller.bestallitems.length,
//                       itemBuilder: (context, index) {
//                         final List<dynamic> data = controller.bestallitems;
//                         // favoritController.isFavorite[data[index]['item_id']] =
//                         //     data[index]['favoritt'];
//                         return BestitemList(
//                           itemsModel: ItemsModel.fromJson(data[index]),
//                         );
//                       },
//                       onPageChanged: (index) {
//                         // Update currentIndex when page changes
//                         currentIndex = index;
//                       },
//                     ),
//                   ),
//                 ),
//               ),
//               Positioned(
//                 bottom: 5,
//                 left: 0,
//                 right: 0,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: List.generate(
//                     controller.bestallitems.length,
//                     (index) {
//                       return AnimatedContainer(
//                         duration: const Duration(milliseconds: 400),
//                         margin: const EdgeInsets.only(right: 4),
//                         width: currentIndex == index ? 20 : 8,
//                         height: 8,
//                         decoration: BoxDecoration(
//                           color: currentIndex == index
//                               ? Myisellcolors.hoved
//                               : Myisellcolors.hvit70,
//                           borderRadius: BorderRadius.circular(10),
//                           border: Border.all(
//                             color: currentIndex == index
//                                 ? Myisellcolors.hoved
//                                 : Myisellcolors.hvit70,
//                             width: 1,
//                           ),
//                           boxShadow: [
//                             BoxShadow(
//                               color: Colors.black.withOpacity(0.5),
//                               blurRadius: currentIndex == index ? 5.0 : 0.0,
//                             ),
//                           ],
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
