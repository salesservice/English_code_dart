import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_isell_new/controller/favorite/favorite_controller.dart';
import 'package:flutter_isell_new/controller/favorite/my_favorite_controller.dart';
import 'package:flutter_isell_new/core/constants/sellx_colors.dart';
import 'package:flutter_isell_new/core/constants/sellx_route_names.dart';
import 'package:flutter_isell_new/data/model/items_modell.dart';
import 'package:flutter_isell_new/sellx_link_api.dart';
import 'package:flutter_isell_new/views/widget/my_circle_separator.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class MineItemsList extends GetView<MyFavoritController> {
  final ItemsModel itemsModel;

  const MineItemsList({
    super.key,
    required this.itemsModel,
  });

  @override
  Widget build(BuildContext context) {
    MyFavoritController myFavoritController = Get.put(MyFavoritController());

    String dateCreate = itemsModel.itemDato!;
    DateTime parsedDate = DateTime.parse(dateCreate);
    DateTime now = DateTime.now(); // Dagens dato
    Duration difference = now.difference(parsedDate);
    int daysSince = difference.inDays;
    String formattedDate = '$daysSince dager siden';

    String itempris = NumberFormat.decimalPattern().format(itemsModel.itemPris);

    FavoritController favcontroller = Get.put(FavoritController());

    return InkWell(
      onTap: () {
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
        //margin: EdgeInsets.only(bottom: 10, top: 20),
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: Myisellcolors.hoved, width: 0.3),
          borderRadius: BorderRadius.circular(5),
        ),
        color: Myisellcolors.home,

        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  //margin:EdgeInsets.only(bottom:Get.height/9),
                  width: Get.width / 3.5,
                  height: Get.height / 8,
                  decoration: const BoxDecoration(),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(0),
                        topLeft: Radius.circular(5)),
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        List<String>? imagePaths =
                            itemsModel.itemIamge?.split(',');
                        if (imagePaths == null || imagePaths.isEmpty) {
                          // Handle the case where imagePaths is null or empty
                          return Container(); // or some default widget
                        }
                        if (itemsModel.itemIamge == null ||
                            itemsModel.itemIamge!.isEmpty) {
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
                          alignment: Alignment.center,
                          width: constraints.maxWidth,
                          height: constraints.maxHeight,
                          imageUrl: firstImagePath,
                        );
                        //  Hero(
                        //   tag: "${itemsModel.itemId}",
                        //   child: CachedNetworkImage(
                        //     fit: BoxFit.cover,
                        //     alignment: Alignment.center,
                        //     width: constraints.maxWidth,
                        //     height: constraints.maxHeight,
                        //     imageUrl: firstImagePath,
                        //   ),
                        // );
                      },
                    ),
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: Get.width / 1.55,
                      padding: const EdgeInsets.only(
                          bottom: 0, left: 6, right: 5, top: 4),
                      child: Row(
                        children: [
                          Text(
                            "${itemsModel.itemMerke}".isNotEmpty
                                ? "${itemsModel.itemMerke}"
                                : "${itemsModel.mcMerke}".isNotEmpty
                                    ? "${itemsModel.mcMerke}"
                                    : "${itemsModel.boatMerke}".isNotEmpty
                                        ? "${itemsModel.boatMerke}"
                                        : "${itemsModel.jobbAnsettelsesform}"
                                                .isNotEmpty
                                            ? "${itemsModel.jobbAnsettelsesform}"
                                            : "${itemsModel.carMerke}"
                                                    .isNotEmpty
                                                ? "${itemsModel.carMerke}"
                                                : "${itemsModel.boligType}"
                                                        .isNotEmpty
                                                    ? "${itemsModel.boligType}"
                                                    : "${itemsModel.itemName}",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.roboto(
                                fontSize: 13,
                                color: Myisellcolors.hvit,
                                height: 1.2,
                                fontWeight: FontWeight.w400),
                          ),
                          const Spacer(),
                          Text(
                            itemsModel.itemAktiv == 1 ? "Aktiv" : "Ikke-Aktiv",
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.roboto(
                                fontSize: 13,
                                color: Myisellcolors.hoved,
                                //  height: Get.height / 490,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: Get.width / 1.8,
                      padding: const EdgeInsets.only(
                          bottom: 12, left: 6, right: 5, top: 4),
                      child: Text(
                        "${itemsModel.itemBeskrivelse}",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.roboto(
                            fontSize: 13,
                            color: Myisellcolors.hvit,
                            height: 1.2,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    //  const Spacer(),
                    Container(
                      margin: const EdgeInsets.only(left: 5),
                      child: Row(
                        children: [
                          Text(
                            "${itemsModel.itemLikt}",
                            style: GoogleFonts.roboto(
                                color: Myisellcolors.hvit70, fontSize: 15),
                          ),
                          const SizedBox(width: 5),
                          const Icon(Icons.favorite,
                              color: Myisellcolors.hvit70, size: 16),
                          const SizedBox(width: 10),
                          const MyCircleSeparator(),
                          const SizedBox(width: 10),
                          Text("${itemsModel.itemSett}",
                              style: GoogleFonts.roboto(
                                  color: Myisellcolors.hvit70, fontSize: 15)),
                          const SizedBox(width: 5),
                          const Icon(Icons.remove_red_eye_rounded,
                              color: Myisellcolors.hvit70, size: 16),
                          const SizedBox(width: 10),
                          const MyCircleSeparator(),
                          const SizedBox(width: 10),
                          Text(
                            "${itemsModel.salgLeie}",
                            style: GoogleFonts.roboto(
                                color: Myisellcolors.hvit70, fontSize: 15),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
            const Spacer(),
            Container(
              padding: EdgeInsets.only(
                  left: Get.width / 50, right: Get.width / 50, top: 10),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {},
                    child: Text(
                      "Rediger annonse",
                      style: GoogleFonts.roboto(
                          color: Myisellcolors.hoved, fontSize: 14),
                    ),
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () {},
                    child: Text(
                      "Seltt annonsen",
                      style:
                          GoogleFonts.roboto(color: Colors.red, fontSize: 14),
                    ),
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () {},
                    child: Text(
                      itemsModel.salgLeie == "Til salgs"
                          ? "Marker som solgt"
                          : "Marker som utleid",
                      style:
                          GoogleFonts.roboto(color: Colors.green, fontSize: 14),
                    ),
                  ),
                ],
              ),
            ),
            //const Spacer(),
            Container(
              padding: EdgeInsets.only(
                  left: Get.width / 180, right: Get.width / 50, top: 10),
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 5),
                    child: Text(
                      itemsModel.itemKat == 7 ? formattedDate : "$itempris NOk",
                      style: GoogleFonts.baloo2(
                          fontSize: 13, color: Myisellcolors.hvit70),
                    ),
                  ),
                  const Spacer(),
                  Text(
                    formattedDate,
                    style: GoogleFonts.roboto(
                        fontSize: 13, color: Myisellcolors.hvit70),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
