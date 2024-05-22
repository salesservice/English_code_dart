import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_isell_new/controller/favorite/favorite_controller.dart';
import 'package:flutter_isell_new/controller/home_page_controller.dart';
import 'package:flutter_isell_new/controller/items_controller.dart';
import 'package:flutter_isell_new/core/constants/sellx_colors.dart';
import 'package:flutter_isell_new/data/model/items_modell.dart';
import 'package:flutter_isell_new/sellx_link_api.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class BestitemList extends StatelessWidget {
  final ItemsModel itemsModel;
  const BestitemList({
    super.key,
    required this.itemsModel,
  });

  @override
  Widget build(BuildContext context) {
    HomePageControllerImp homePageControllerImp =
        Get.put(HomePageControllerImp());
    return InkWell(
        onTap: () {
          Map<String, dynamic> itemMap = itemsModel.toJson();
          homePageControllerImp.addToLastViewed(itemMap);
          itemsModel.itemSett = itemsModel.itemSett! + 1;
          homePageControllerImp.itemsett(
              itemsModel.itemSett, itemsModel.itemId);
          ItemControllerImp().goToItemPageDetails(itemsModel);
        },
        child: GetBuilder<FavoritController>(
          builder: (controller) => Stack(
            children: [
              LayoutBuilder(
                builder: (context, constraints) {
                  List<String>? imagePaths = itemsModel.itemIamge?.split(',');
                  if (imagePaths == null || imagePaths.isEmpty) {
                    return Container();
                  }
                  if (itemsModel.itemIamge == null ||
                      itemsModel.itemIamge!.isEmpty) {
                    // Return the default image directly
                    return Center(
                      child: Image.asset(
                        "assets/images/logoen-removebg.png",
                        fit: BoxFit.contain,
                        width: 100,
                        height: 100,
                      ),
                    );
                  }
                  String firstImagePath =
                      "${AppLink.imageitems}/${imagePaths[0]}";
                  return CachedNetworkImage(
                    fit: BoxFit.cover,
                    width: constraints.maxWidth,
                    height: constraints.maxHeight,
                    imageUrl: firstImagePath,
                  );
                },
              ),
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  height: 30,
                  padding: EdgeInsets.zero,
                  margin: const EdgeInsets.only(top: 5, right: 5),
                  decoration: BoxDecoration(
                    border: Border.all(color: Myisellcolors.hoved, width: 1),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 10),
                        child: Text(
                          "${itemsModel.itemLikt}",
                          style: GoogleFonts.roboto(
                            color: Myisellcolors.hoved,
                            fontSize: 18,
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ),
                      IconButton(
                        splashColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        disabledColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          if (controller.isFavorite[itemsModel.itemId] == 1) {
                            controller.setFavorite(itemsModel.itemId, 0);
                            controller.removeFavoritt(itemsModel.itemId);
                            itemsModel.itemLikt = itemsModel.itemLikt! - 1;
                            controller.itemlikt(
                                itemsModel.itemLikt, itemsModel.itemId);
                          } else {
                            controller.setFavorite(itemsModel.itemId, 1);
                            controller.addFavoritt(itemsModel.itemId);
                            itemsModel.itemLikt = itemsModel.itemLikt! + 1;
                            controller.itemlikt(
                                itemsModel.itemLikt, itemsModel.itemId);
                          }
                        },
                        icon: Icon(
                          controller.isFavorite[itemsModel.itemId] == 1
                              ? Icons.favorite
                              : Icons.favorite_outline,
                          color: Myisellcolors.hoved,
                          size: 25,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
