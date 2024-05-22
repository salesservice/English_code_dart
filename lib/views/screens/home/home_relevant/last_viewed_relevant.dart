import 'package:flutter/material.dart';
import 'package:flutter_isell_new/controller/favorite/favorite_controller.dart';
import 'package:flutter_isell_new/controller/favorite/my_favorite_controller.dart';
import 'package:flutter_isell_new/controller/home_page_controller.dart';
import 'package:flutter_isell_new/controller/items_controller.dart';
import 'package:flutter_isell_new/controller/login_controller.dart';
import 'package:flutter_isell_new/core/classes/handling_data_view.dart';
import 'package:flutter_isell_new/data/model/items_modell.dart';
import 'package:flutter_isell_new/views/screens/items/item_lists/last_viewd_items_list.dart';
import 'package:get/get.dart';

import '../../../../core/constants/sellx_colors.dart';

class SettPaRelevant extends StatelessWidget {
  const SettPaRelevant({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomePageControllerImp homePageControllerImp =
        Get.put(HomePageControllerImp());
    Widget buildRelevantView() {
      return HomeRelevant1(
        controller: ItemControllerImp(),
      );
    }

    return Container(color: Myisellcolors.home, child: buildRelevantView());
  }
}

class HomeRelevant1 extends GetView<ItemControllerImp> {
  @override
  final ItemControllerImp controller;

  const HomeRelevant1({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    Get.put(InnloggingControllerImp());
    FavoritController favoritController = Get.put(FavoritController());
    HomePageControllerImp homePageControllerImp =
        Get.put(HomePageControllerImp());
    MyFavoritController myFavoritController = Get.put(MyFavoritController());

    return Container(
      color: Myisellcolors.home,
      child: GetBuilder<HomePageControllerImp>(
        builder: (controller) => HandlingDataView(
          statusRequest: homePageControllerImp.statusRequest,
          widget: GridView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: homePageControllerImp.lastViewed.length,
            physics: const ScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisSpacing: 0,
              mainAxisSpacing: 0,
              crossAxisCount: 1,
              childAspectRatio: 1.2,
            ),
            itemBuilder: (context, index) {
              final List<dynamic> data = homePageControllerImp.lastViewed;
              // favoritController.isFavorite[data[index]['item_id']] =
              //     data[index]['favoritt'];

              return SettPaSistItems(
                  itemsModel: ItemsModel.fromJson(data[index]));
            },
          ),
        ),
      ),
    );
  }
}
