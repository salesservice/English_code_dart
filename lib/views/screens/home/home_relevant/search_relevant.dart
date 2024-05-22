import 'package:flutter/material.dart';
import 'package:flutter_isell_new/controller/favorite/favorite_controller.dart';
import 'package:flutter_isell_new/controller/favorite/my_favorite_controller.dart';
import 'package:flutter_isell_new/controller/home_page_controller.dart';
import 'package:flutter_isell_new/controller/items_controller.dart';
import 'package:flutter_isell_new/core/classes/handling_data_view.dart';
import 'package:flutter_isell_new/data/model/items_modell.dart';
import 'package:flutter_isell_new/views/screens/items/item_lists/search_items_list.dart';
import 'package:get/get.dart';

import '../../../../core/constants/sellx_colors.dart';

class SearchRelevant extends StatelessWidget {
  const SearchRelevant({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Get.put(ItemControllerImp());
    //Get.put(InnloggingControllerImp());
    HomePageControllerImp homePageControllerImp =
        Get.put(HomePageControllerImp());
    Widget buildRelevantView() {
      return Obx(() {
        return homePageControllerImp.showRelevant1.value
            ? SearchRelevant1(
                controller: ItemControllerImp(),
              )
            : SearchRelevant2(
                controller: ItemControllerImp(),
              );
      });
    }

    return Container(color: Myisellcolors.home, child: buildRelevantView());
  }
}

class SearchRelevant1 extends GetView<ItemControllerImp> {
  @override
  final ItemControllerImp controller;

  const SearchRelevant1({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    //Get.put(ItemControllerImp());
    //Get.put(InnloggingControllerImp());
    // HomePageControllerImp homePageControllerImp =
    //     Get.put(HomePageControllerImp());
    MyFavoritController myFavoritController = Get.put(MyFavoritController());

    FavoritController favoritController = Get.put(FavoritController());
    return Container(
      color: Myisellcolors.home,
      child: GetBuilder<HomePageControllerImp>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: GridView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: controller.searchdata.length,
            physics: const ScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisSpacing: 0,
              mainAxisSpacing: 0,
              crossAxisCount: 2,
              childAspectRatio: 0.8,
            ),
            itemBuilder: (context, index) {
              final List<dynamic> data = controller.searchdata;
              // favoritController.isFavorite[data[index]['item_id']] =
              //     data[index]['favoritt'];
              // favoritController
              //         .isFavorite[myFavoritController.data[index].itemId] =
              //     myFavoritController.data[index].favoritt;
              return SearchItemLList(
                itemsModel: data[index],
              );
            },
          ),
        ),
      ),
    );
  }
}

class SearchRelevant2 extends GetView<ItemControllerImp> {
  @override
  final ItemControllerImp controller;

  ItemsModel? itemsModel;
  SearchRelevant2({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    //rGet.put(InnloggingControllerImp());
    FavoritController favoritController = Get.put(FavoritController());
    MyFavoritController myFavoritController = Get.put(MyFavoritController());

    return Container(
      color: Myisellcolors.home,
      child: GetBuilder<HomePageControllerImp>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: GridView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: controller.searchdata.length,
            physics: const ScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 0,
                mainAxisSpacing: 0,
                crossAxisCount: 1,
                childAspectRatio: 2.7),
            itemBuilder: (context, index) {
              final List<dynamic> data = controller.searchdata;
              // favoritController.isFavorite[data[index]['item_id']] =
              //     data[index]['favoritt'];
              // favoritController
              //         .isFavorite[myFavoritController.data[index].itemId] =
              //     myFavoritController.data[index].favoritt;
              return SearchItemLList(
                itemsModel: data[index],
              );
            },
          ),
        ),
      ),
    );
  }
}
