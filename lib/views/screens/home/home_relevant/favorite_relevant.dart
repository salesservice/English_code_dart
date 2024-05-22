// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_isell_new/controller/favorite/favorite_controller.dart';
import 'package:flutter_isell_new/controller/home_page_controller.dart';
import 'package:flutter_isell_new/controller/items_controller.dart';
import 'package:flutter_isell_new/controller/login_controller.dart';
import 'package:flutter_isell_new/core/classes/handling_data_view.dart';
import 'package:flutter_isell_new/data/model/items_modell.dart';
import 'package:flutter_isell_new/views/screens/items/item_lists/my_favorite_custom_list.dart';
import 'package:get/get.dart';

import '../../../../core/constants/sellx_colors.dart';

class FavorittRelevant extends StatelessWidget {
  const FavorittRelevant({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomePageControllerImp homePageControllerImp =
        Get.put(HomePageControllerImp());
    Widget buildRelevantView() {
      return Obx(() {
        return homePageControllerImp.showRelevant1.value
            ? FavorittRelevant1(
                controller: ItemControllerImp(),
              )
            : FavorittRelevant2(
                controller: ItemControllerImp(),
              );
      });
    }

    return Container(color: Myisellcolors.home, child: buildRelevantView());
  }
}

class FavorittRelevant1 extends GetView<ItemControllerImp> {
  @override
  final ItemControllerImp controller;

  const FavorittRelevant1({super.key, required this.controller});

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
            itemCount: controller.datafavoritt.length,
            physics: const ScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisSpacing: 0,
              mainAxisSpacing: 0,
              crossAxisCount: 2,
              childAspectRatio: 0.8,
            ),
            itemBuilder: (context, index) {
              final List favdata = controller.datafavoritt;
              favoritController.isFavorite[favdata[index]['item_id']] =
                  favdata[index]['favoritt'];
              return MyFAvorittCustomList(
                itemsModel: ItemsModel.fromJson(favdata[index]),
              );
            },
          ),
        ),
      ),
    );
  }
}

class FavorittRelevant2 extends GetView<ItemControllerImp> {
  @override
  final ItemControllerImp controller;

  ItemsModel? itemsModel;
  FavorittRelevant2({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    Get.put(InnloggingControllerImp());
    FavoritController favcontroller = Get.put(FavoritController());

    return Container(
      color: Myisellcolors.home,
      child: GetBuilder<HomePageControllerImp>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: GridView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: controller.datafavoritt.length,
            physics: const ScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 0,
                mainAxisSpacing: 0,
                crossAxisCount: 1,
                childAspectRatio: 2.7),
            itemBuilder: (context, index) {
              final List<dynamic> data = controller.datafavoritt;
              favcontroller.isFavorite[data[index]['item_id']] =
                  data[index]['favoritt'];
              return MyFAvorittCustomList(
                  itemsModel: ItemsModel.fromJson(data[index]));
            },
          ),
        ),
      ),
    );
  }
}
