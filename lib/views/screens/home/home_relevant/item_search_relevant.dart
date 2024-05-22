import 'package:flutter/material.dart';
import 'package:flutter_isell_new/controller/favorite/favorite_controller.dart';
import 'package:flutter_isell_new/controller/items_controller.dart';
import 'package:flutter_isell_new/core/classes/handling_data_view.dart';
import 'package:flutter_isell_new/data/model/items_modell.dart';
import 'package:flutter_isell_new/views/screens/items/item_lists/search_all_items_list.dart';
import 'package:get/get.dart';

import '../../../../core/constants/sellx_colors.dart';

class ItemsSearchRelevant extends GetView<ItemControllerImp> {
  const ItemsSearchRelevant({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Get.put(ItemControllerImp());
    //Get.put(HomePageControllerImp());
    // Get.put(InnloggingControllerImp());
    Get.put(ItemControllerImp());
    Widget buildRelevantView() {
      return Obx(() {
        return controller.showRelevant1.value
            ? ItemsSearchRelevant1(
                controller: controller,
              )
            : ItemsSearchRelevant2(
                controller: controller,
              );
      });
    }

    return Container(color: Myisellcolors.home, child: buildRelevantView());
  }
}

class ItemsSearchRelevant1 extends GetView<ItemControllerImp> {
  @override
  final ItemControllerImp controller;

  const ItemsSearchRelevant1({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    Get.put(ItemControllerImp());
    // Get.put(InnloggingControllerImp());
    FavoritController favcontroller = Get.put(FavoritController());
    final List<dynamic> data = controller.data;
    return Container(
      color: Myisellcolors.home,
      child: GetBuilder<ItemControllerImp>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: GridView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: data.length,
            physics: const ScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisSpacing: 0,
              mainAxisSpacing: 0,
              crossAxisCount: 2,
              childAspectRatio: 0.8,
            ),
            itemBuilder: (context, index) {
              favcontroller.isFavorite[data[index]['item_id']] =
                  controller.data[index]['favoritt'];
              // return SearchItemsLList(
              //   itemsModel: ItemsModel.fromJson(data[index]),

              final Map<String, dynamic> itemData = controller.data[index];
              final ItemsModel itemModel = ItemsModel.fromJson(itemData);
              return SearchItemsLList(itemsModel: itemModel);
              // );
            },
          ),
        ),
      ),
    );
  }

  // double _calculateChildAspectRatio(List<dynamic> data) {
  //   int? itemKat = ItemsModel.fromJson(data[0]).itemKat;

  //   switch (itemKat) {
  //     case 2:
  //       return 1.5;
  //     case 3:
  //       return 0.8;
  //     default:
  //       return 0.8;
  //   }
  // }

  // int _calculateCrossAxisCount(List<dynamic> data) {
  //   int? itemKat = ItemsModel.fromJson(data[0])
  //       .itemKat; // Use the appropriate index or logic here;

  //   switch (itemKat) {
  //     case 2:
  //       return 1;
  //     case 3:
  //       return 2;
  //     default:
  //       return 2;
  //   }
  // }
}

class ItemsSearchRelevant2 extends GetView<ItemControllerImp> {
  @override
  final ItemControllerImp controller;

  ItemsModel? itemsModel;
  ItemsSearchRelevant2({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    Get.put(ItemControllerImp());
    // Get.put(InnloggingControllerImp());
    FavoritController favcontroller = Get.put(FavoritController());

    final List<dynamic> data = controller.data;

    return Container(
      color: Myisellcolors.home,
      child: GetBuilder<ItemControllerImp>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: GridView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: data.length,
            physics: const ScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 0,
                mainAxisSpacing: 0,
                crossAxisCount: 1,
                childAspectRatio: 2.7),
            itemBuilder: (context, index) {
              favcontroller.isFavorite[data[index]['item_id']] =
                  data[index]['favoritt'];
              return SearchItemsLList(
                itemsModel: ItemsModel.fromJson(data[index]),
              );
            },
          ),
        ),
      ),
    );
  }
}
