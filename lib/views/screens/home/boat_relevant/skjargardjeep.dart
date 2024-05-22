import 'package:flutter/material.dart';
import 'package:flutter_isell_new/controller/favorite/favorite_controller.dart';
import 'package:flutter_isell_new/controller/home_page_controller.dart';
import 'package:flutter_isell_new/controller/items/boat_controller.dart';
import 'package:flutter_isell_new/controller/items_controller.dart';
import 'package:flutter_isell_new/core/classes/handling_data_view.dart';
import 'package:flutter_isell_new/core/constants/sellx_colors.dart';
import 'package:flutter_isell_new/data/model/items_modell.dart';
import 'package:flutter_isell_new/views/screens/items/item_lists/custom_list_item.dart';
import 'package:get/get.dart';

class RelevantSKJARGARDSJEEP extends GetView<ItemControllerImp> {
  const RelevantSKJARGARDSJEEP({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ItemControllerImp());
    Get.put(HomePageControllerImp());
    //Get.put(ItemDetailsControllerImp());
    // Get.put(InnloggingControllerImp());
    FavoritController favcontroller = Get.put(FavoritController());
    Widget buildRelevantView() {
      return Obx(() {
        return favcontroller.showRelevant1.value
            ? Relevant1(
                controller: controller,
              )
            : Relevant2(
                controller: controller,
              );
      });
    }

    return Container(color: Myisellcolors.home, child: buildRelevantView());
  }
}

class Relevant1 extends GetView<ItemControllerImp> {
  @override
  final ItemControllerImp controller;

  const Relevant1({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    Get.put(ItemControllerImp());
    //Get.put(InnloggingControllerImp());
    FavoritController favcontroller = Get.put(FavoritController());
    BoatControllerImp boatControllerImp = Get.put(BoatControllerImp());
    final List<dynamic> data = boatControllerImp.skjargardjeepdata;
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
              // favcontroller.isFavorite[data[index]['item_id']] =
              //     controller.data[index]['favoritt'];
              return CustomListItem(
                itemsModel: ItemsModel.fromJson(data[index]),
              );
            },
          ),
        ),
      ),
    );
  }
}

@override
class Relevant2 extends GetView<ItemControllerImp> {
  final ItemControllerImp controller;

  ItemsModel? itemsModel;
  Relevant2({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    Get.put(ItemControllerImp());
    // Get.put(InnloggingControllerImp());
    FavoritController favcontroller = Get.put(FavoritController());

    BoatControllerImp boatControllerImp = Get.put(BoatControllerImp());
    final List<dynamic> data = boatControllerImp.skjargardjeepdata;

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
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisSpacing: 0,
              mainAxisSpacing: 0,
              crossAxisCount: 1,
              childAspectRatio: (favcontroller.showRelevant1.value == false &&
                          controller.katname == "Sellx") ||
                      (favcontroller.showRelevant1.value == false &&
                          controller.katname == "Båter") ||
                      (favcontroller.showRelevant1.value == false &&
                          controller.katname == "Motorsykler") ||
                      (favcontroller.showRelevant1.value == false &&
                          controller.katname == "Sykler") ||
                      (favcontroller.showRelevant1.value == false &&
                          controller.katname == "Jobber") ||
                      (favcontroller.showRelevant1.value == false &&
                          controller.katname == "Bøker") ||
                      (favcontroller.showRelevant1.value == false &&
                          controller.katname == "Møbler") ||
                      (favcontroller.showRelevant1.value == false &&
                          controller.katname == "Elektronikk") ||
                      (favcontroller.showRelevant1.value == false &&
                          controller.katname == "Klær")
                  ? 2.7
                  : 1.2,
            ),
            itemBuilder: (context, index) {
              // favcontroller.isFavorite[data[index]['item_id']] =
              //     data[index]['favoritt'];
              return CustomListItem(
                itemsModel: ItemsModel.fromJson(data[index]),
              );
            },
          ),
        ),
      ),
    );
  }
}
