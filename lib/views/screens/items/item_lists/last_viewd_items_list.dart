import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_isell_new/controller/favorite/favorite_controller.dart';
import 'package:flutter_isell_new/controller/home_page_controller.dart';
import 'package:flutter_isell_new/core/constants/sellx_colors.dart';
import 'package:flutter_isell_new/core/constants/sellx_route_names.dart';
import 'package:flutter_isell_new/data/model/items_modell.dart';
import 'package:flutter_isell_new/sellx_link_api.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class SettPaSistItems extends StatelessWidget {
  final ItemsModel itemsModel;

  const SettPaSistItems({
    super.key,
    required this.itemsModel,
  });

  @override
  Widget build(BuildContext context) {
    String dateCreate = itemsModel.itemDato!;
    DateTime parsedDate = DateTime.parse(dateCreate);
    DateFormat outputFormat = DateFormat("dd MMM yyyy");
    String formattedDate = outputFormat.format(parsedDate);
    String itempris = NumberFormat.decimalPattern().format(itemsModel.itemPris);

    // HomePageControllerImp homePageControllerImp =
    //     Get.put(HomePageControllerImp());

    HomePageControllerImp homePageControllerImp = Get.find();

    return InkWell(
      onTap: () {
        Map<String, dynamic> itemMap = itemsModel.toJson();
        homePageControllerImp.addToLastViewed(itemMap);

        itemsModel.itemSett = itemsModel.itemSett! + 1;
        homePageControllerImp.itemsett(itemsModel.itemSett, itemsModel.itemId);
        if (itemsModel.itemKat == 1) {
          Get.toNamed(AppRouter.itemdetailssellx,
              arguments: {"itemsmodel": itemsModel});
        }
        if (itemsModel.itemKat == 2) {
          Get.toNamed(AppRouter.itemdetailseiendom,
              arguments: {"itemsmodel": itemsModel});
        }
        if (itemsModel.itemKat == 3) {
          Get.toNamed(AppRouter.itemdetailscar,
              arguments: {"itemsmodel": itemsModel});
        }
        if (itemsModel.itemKat == 4) {
          Get.toNamed(AppRouter.itemdetailsboat,
              arguments: {"itemsmodel": itemsModel});
        }
        if (itemsModel.itemKat == 5) {
          Get.toNamed(AppRouter.itemdetailsmc,
              arguments: {"itemsmodel": itemsModel});
        }
        if (itemsModel.itemKat == 6) {
          Get.toNamed(AppRouter.itemdetailssykkel,
              arguments: {"itemsmodel": itemsModel});
        }
        if (itemsModel.itemKat == 7) {
          Get.toNamed(AppRouter.itemdetailsjobb,
              arguments: {"itemsmodel": itemsModel});
        }
        if (itemsModel.itemKat == 8) {
          Get.toNamed(AppRouter.itemdetailsboker,
              arguments: {"itemsmodel": itemsModel});
        }
        if (itemsModel.itemKat == 9) {
          Get.toNamed(AppRouter.itemdetailsmobler,
              arguments: {"itemsmodel": itemsModel});
        }
        if (itemsModel.itemKat == 10) {
          Get.toNamed(AppRouter.itemdetailselektronikk,
              arguments: {"itemsmodel": itemsModel});
        }
        if (itemsModel.itemKat == 11) {
          Get.toNamed(AppRouter.itemdetailsklar,
              arguments: {"itemsmodel": itemsModel});
        }
      },
      child: Card(
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: Myisellcolors.hoved, width: 0.4),
          borderRadius: BorderRadius.circular(5),
        ),
        color: Myisellcolors.home,
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                    child: Container(
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Myisellcolors.hoved,
                        width: 0.5,
                      ),
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(7),
                      topRight: Radius.circular(7),
                    ),
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        List<String>? imagePaths =
                            itemsModel.itemIamge!.split(',');

                        if (itemsModel.itemIamge!.isEmpty) {
                          // Return the default image directly
                          return Image.asset(
                            "assets/images/logoen-removebg.png",
                            fit: BoxFit.contain,
                            width: 100,
                            height: 100,
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
                  ),
                )),
                Container(
                  margin: const EdgeInsets.only(
                      bottom: 10, left: 6, right: 5, top: 4),
                  child: Text(
                    itemsModel.itemBeskrivelse!,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.roboto(
                        fontSize: 12.5,
                        color: Myisellcolors.hvit,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 6),
                      child: Text(
                        itemsModel.itemBy!,
                        style: GoogleFonts.roboto(
                            fontSize: 12, color: Myisellcolors.hvit70),
                      ),
                    ),
                    const Spacer(),
                    Container(
                      margin: const EdgeInsets.only(right: 6),
                      child: Text(
                        itemsModel.itemKat == 7
                            ? formattedDate
                            : "$itempris NOK",
                        style: GoogleFonts.baloo2(
                            fontSize: 12, color: Myisellcolors.hvit70),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            GetBuilder<FavoritController>(
              builder: (controller) => Align(
                alignment: Alignment.topRight,
                child: Container(
                  height: 30,
                  padding: EdgeInsets.zero,
                  margin: const EdgeInsets.only(top: 5, right: 5),
                  decoration: BoxDecoration(
                    border: (itemsModel.itemLikt == 0)
                        ? null
                        : Border.all(color: Myisellcolors.hoved, width: 1),
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
                          (itemsModel.itemLikt == 0)
                              ? ""
                              : "${itemsModel.itemLikt}",
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
                            itemsModel.itemLikt = itemsModel.itemLikt - 1;
                            homePageControllerImp.itemlikt(
                                itemsModel.itemLikt, itemsModel.itemId);
                            controller.update(); // Trigger UI update
                          } else {
                            controller.setFavorite(itemsModel.itemId, 1);
                            controller.addFavoritt(itemsModel.itemId);
                            itemsModel.itemLikt = itemsModel.itemLikt + 1;
                            homePageControllerImp.itemlikt(
                                itemsModel.itemLikt, itemsModel.itemId);
                            controller.update(); // Trigger UI update
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
            )
          ],
        ),
      ),
    );
  }
}
