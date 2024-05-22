import 'package:flutter/material.dart';
import 'package:flutter_isell_new/controller/favorite/favorite_controller.dart';
import 'package:flutter_isell_new/controller/home_page_controller.dart';
import 'package:flutter_isell_new/controller/items_controller.dart';
import 'package:flutter_isell_new/controller/login_controller.dart';
import 'package:flutter_isell_new/core/classes/handling_data_view.dart';
import 'package:flutter_isell_new/data/model/items_modell.dart';
import 'package:flutter_isell_new/views/screens/items/item_lists/custom_list_all_items.dart';
import 'package:get/get.dart';

import '../../../../core/constants/sellx_colors.dart';

class HomeRelevant extends StatelessWidget {
  const HomeRelevant({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomePageControllerImp homePageControllerImp =
        Get.put(HomePageControllerImp());
    Widget buildRelevantView() {
      return Obx(() {
        return homePageControllerImp.showRelevant1.value
            ? HomeRelevant1(
                controller: ItemControllerImp(),
              )
            : HomeRelevant2(
                controller: ItemControllerImp(),
              );
      });
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
    return Container(
      color: Myisellcolors.home,
      child: GetBuilder<HomePageControllerImp>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: GridView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: controller.allitems.length,
            physics: const ScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisSpacing: 0,
              mainAxisSpacing: 0,
              crossAxisCount: 2,
              childAspectRatio: 0.8,
            ),
            itemBuilder: (context, index) {
              final List<dynamic> data = controller.allitems;
              favoritController.isFavorite[data[index]['item_id']] =
                  data[index]['favoritt'];
              return CustomlistAllitems(
                itemsModel: ItemsModel.fromJson(data[index]),
              );
            },
          ),
        ),
      ),
    );
  }
}

class HomeRelevant2 extends GetView<ItemControllerImp> {
  @override
  final ItemControllerImp controller;

  ItemsModel? itemsModel;
  HomeRelevant2({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    Get.put(InnloggingControllerImp());
    FavoritController favcontroller = Get.put(FavoritController());

    //ItemControllerImp itemControllerImp = Get.put(ItemControllerImp());

    return Container(
      color: Myisellcolors.home,
      child: GetBuilder<HomePageControllerImp>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: GridView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: controller.allitems.length,
            physics: const ScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 0,
                mainAxisSpacing: 0,
                crossAxisCount: 1,
                childAspectRatio: 2.7),
            itemBuilder: (context, index) {
              final List<dynamic> data = controller.allitems;
              favcontroller.isFavorite[data[index]['item_id']] =
                  data[index]['favoritt'];
              return CustomlistAllitems(
                itemsModel: ItemsModel.fromJson(data[index]),
              );
            },
          ),
        ),
      ),
    );
  }
}
