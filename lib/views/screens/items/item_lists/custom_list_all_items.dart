import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_isell_new/controller/favorite/favorite_controller.dart';
import 'package:flutter_isell_new/controller/home_page_controller.dart';
import 'package:flutter_isell_new/core/constants/sellx_colors.dart';
import 'package:flutter_isell_new/core/constants/sellx_route_names.dart';
import 'package:flutter_isell_new/data/model/items_modell.dart';
import 'package:flutter_isell_new/sellx_link_api.dart';
import 'package:flutter_isell_new/views/widget/my_circle_separator.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class CustomlistAllitems extends StatelessWidget {
  final ItemsModel itemsModel;

  const CustomlistAllitems({
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

    HomePageControllerImp homePageControllerImp =
        Get.put(HomePageControllerImp());

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
            (itemsModel.itemKat == 1 &&
                        homePageControllerImp.showRelevant1.value == false) ||
                    (homePageControllerImp.showRelevant1.value == false &&
                        itemsModel.itemKat == 4) ||
                    (homePageControllerImp.showRelevant1.value == false &&
                        itemsModel.itemKat == 5) ||
                    (homePageControllerImp.showRelevant1.value == false &&
                        itemsModel.itemKat == 6) ||
                    (homePageControllerImp.showRelevant1.value == false &&
                        itemsModel.itemKat == 7) ||
                    (homePageControllerImp.showRelevant1.value == false &&
                        itemsModel.itemKat == 8) ||
                    (homePageControllerImp.showRelevant1.value == false &&
                        itemsModel.itemKat == 9) ||
                    (homePageControllerImp.showRelevant1.value == false &&
                        itemsModel.itemKat == 10) ||
                    (homePageControllerImp.showRelevant1.value == false &&
                        itemsModel.itemKat == 11) ||
                    (homePageControllerImp.showRelevant1.value == false &&
                        itemsModel.itemKat == 2) ||
                    (homePageControllerImp.showRelevant1.value == false &&
                        itemsModel.itemKat == 3)
                ? Row(
                    children: [
                      Container(
                        width: Get.width / 3,
                        height: double.infinity,
                        decoration: const BoxDecoration(),
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(5),
                            topLeft: Radius.circular(5),
                          ),
                          child: LayoutBuilder(
                            builder: (context, constraints) {
                              List<String>? imagePaths =
                                  itemsModel.itemIamge?.split(',');

                              // Check if imagePaths is null or empty
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

                              // Load the first image from the network
                              String firstImagePath =
                                  "${AppLink.imageitems}/${imagePaths?[0]}";
                              return CachedNetworkImage(
                                fit: BoxFit.cover,
                                width: constraints.maxWidth,
                                height: constraints.maxHeight,
                                imageUrl: firstImagePath,
                              );
                            },
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 160,
                            padding: const EdgeInsets.only(
                                bottom: 0, left: 6, right: 5, top: 4),
                            child: Text(
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
                          ),
                          Container(
                            width: 220,
                            padding: const EdgeInsets.only(
                                bottom: 5, left: 6, right: 5, top: 4),
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
                          itemsModel.itemKat == 7
                              ? Container(
                                  margin:
                                      const EdgeInsets.only(left: 5, top: 6),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            "${itemsModel.jobbFirma}",
                                            style: GoogleFonts.roboto(
                                                color: Myisellcolors.hvit70,
                                                fontSize: 11),
                                          ),
                                          const MyCircleSeparator(),
                                          Text(
                                            "${itemsModel.jobbSektor}",
                                            style: GoogleFonts.roboto(
                                                color: Myisellcolors.hvit70,
                                                fontSize: 11),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            "${itemsModel.jobbAnsettelsesform}",
                                            style: GoogleFonts.roboto(
                                                color: Myisellcolors.hvit70,
                                                fontSize: 11),
                                          ),
                                          const MyCircleSeparator(),
                                          itemsModel.jobbAntllstillinger != 0
                                              ? Row(
                                                  children: [
                                                    Text(
                                                      "${itemsModel.jobbAntllstillinger} ${itemsModel.jobbAntllstillinger!.isEqual(1) ? "Stilling" : "Stillinger"}",
                                                      style: GoogleFonts.roboto(
                                                          color: Myisellcolors
                                                              .hvit70,
                                                          fontSize: 11),
                                                    ),
                                                    const MyCircleSeparator(),
                                                  ],
                                                )
                                              : const SizedBox(),
                                          Text(
                                            "${itemsModel.jobbFrist}",
                                            style: GoogleFonts.roboto(
                                                color: Myisellcolors.hvit70,
                                                fontSize: 11),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                )
                              : const SizedBox(),
                          itemsModel.itemKat == 5
                              ? Container(
                                  margin:
                                      const EdgeInsets.only(left: 5, top: 6),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            "${itemsModel.mcKilometerstand} km",
                                            style: GoogleFonts.roboto(
                                                color: Myisellcolors.hvit70,
                                                fontSize: 13),
                                          ),
                                          const MyCircleSeparator(),
                                          Text(
                                            "${itemsModel.mcModellar}",
                                            style: GoogleFonts.roboto(
                                                color: Myisellcolors.hvit70,
                                                fontSize: 13),
                                          ),
                                          const MyCircleSeparator(),
                                          Text(
                                            "${itemsModel.mcDrivstoff}",
                                            style: GoogleFonts.roboto(
                                                color: Myisellcolors.hvit70,
                                                fontSize: 13),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            "${itemsModel.mcType}",
                                            style: GoogleFonts.roboto(
                                                color: Myisellcolors.hvit70,
                                                fontSize: 13),
                                          ),
                                          const MyCircleSeparator(),
                                          Text(
                                            "${itemsModel.mcMerke}",
                                            style: GoogleFonts.roboto(
                                                color: Myisellcolors.hvit70,
                                                fontSize: 13),
                                          ),
                                          const MyCircleSeparator(),
                                          Text(
                                            itemsModel.itemSelger!.isNotEmpty
                                                ? itemsModel.itemSelger!
                                                : "Privat",
                                            style: GoogleFonts.roboto(
                                                color: Myisellcolors.hvit70,
                                                fontSize: 13),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              : const SizedBox(),
                          itemsModel.itemKat == 4
                              ? Container(
                                  margin:
                                      const EdgeInsets.only(left: 5, top: 6),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            "${itemsModel.itemTistand}",
                                            style: GoogleFonts.roboto(
                                                color: Myisellcolors.hvit70,
                                                fontSize: 13),
                                          ),
                                          const MyCircleSeparator(),
                                          Text(
                                            "${itemsModel.boatModellar}",
                                            style: GoogleFonts.roboto(
                                                color: Myisellcolors.hvit70,
                                                fontSize: 13),
                                          ),
                                          const MyCircleSeparator(),
                                          Text(
                                            "${itemsModel.boatlengdeFot} fot",
                                            style: GoogleFonts.roboto(
                                                color: Myisellcolors.hvit70,
                                                fontSize: 13),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            "${itemsModel.boatDrivstoff}",
                                            style: GoogleFonts.roboto(
                                                color: Myisellcolors.hvit70,
                                                fontSize: 13),
                                          ),
                                          const MyCircleSeparator(),
                                          Text(
                                            "${itemsModel.boatFartiknop} knop",
                                            style: GoogleFonts.roboto(
                                                color: Myisellcolors.hvit70,
                                                fontSize: 13),
                                          ),
                                          const MyCircleSeparator(),
                                          Text(
                                            "${itemsModel.boatbreddeCm} cm bredde",
                                            style: GoogleFonts.roboto(
                                                color: Myisellcolors.hvit70,
                                                fontSize: 13),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                )
                              : const SizedBox(),
                          const Spacer(),

                          itemsModel.itemKat == 1
                              ? Container(
                                  margin: const EdgeInsets.only(left: 5),
                                  child: Row(
                                    children: [
                                      Text(
                                        "${itemsModel.itemTistand}",
                                        style: GoogleFonts.roboto(
                                            color: Myisellcolors.hvit70,
                                            fontSize: 13),
                                      ),
                                      itemsModel.itemMerke!.isNotEmpty
                                          ? const MyCircleSeparator()
                                          : const SizedBox(),
                                      itemsModel.itemKat == 1 &&
                                              itemsModel.itemMerke!.isNotEmpty
                                          ? Text(
                                              "${itemsModel.itemMerke}",
                                              style: GoogleFonts.roboto(
                                                  color: Myisellcolors.hvit70,
                                                  fontSize: 13),
                                            )
                                          : const SizedBox(),
                                      itemsModel.salgLeie!.isNotEmpty
                                          ? const MyCircleSeparator()
                                          : const SizedBox(),
                                      itemsModel.itemKat == 1 &&
                                              itemsModel.salgLeie!.isNotEmpty
                                          ? Text(
                                              "${itemsModel.salgLeie}",
                                              style: GoogleFonts.roboto(
                                                  color: Myisellcolors.hvit70,
                                                  fontSize: 13),
                                            )
                                          : const SizedBox(),
                                    ],
                                  ),
                                )
                              : const SizedBox(),
                          itemsModel.itemKat == 8
                              ? Container(
                                  margin: const EdgeInsets.only(left: 5),
                                  child: Row(
                                    children: [
                                      Text(
                                        "${itemsModel.itemTistand}",
                                        style: GoogleFonts.roboto(
                                            color: Myisellcolors.hvit70,
                                            fontSize: 13),
                                      ),
                                      const MyCircleSeparator(),
                                      Text(
                                        "Kategori: ${itemsModel.bokKategori}",
                                        style: GoogleFonts.roboto(
                                            color: Myisellcolors.hvit70,
                                            fontSize: 13),
                                      )
                                    ],
                                  ),
                                )
                              : const SizedBox(),
                          itemsModel.itemKat == 9
                              ? Container(
                                  margin: const EdgeInsets.only(left: 5),
                                  child: Row(
                                    children: [
                                      Text(
                                        "${itemsModel.itemTistand}",
                                        style: GoogleFonts.roboto(
                                            color: Myisellcolors.hvit70,
                                            fontSize: 13),
                                      ),
                                      itemsModel.itemMerke!.isNotEmpty
                                          ? const MyCircleSeparator()
                                          : const SizedBox(),
                                      itemsModel.itemMerke!.isNotEmpty
                                          ? Text(
                                              "${itemsModel.itemMerke}",
                                              style: GoogleFonts.roboto(
                                                  color: Myisellcolors.hvit70,
                                                  fontSize: 13),
                                            )
                                          : const SizedBox()
                                    ],
                                  ),
                                )
                              : const SizedBox(),
                          itemsModel.itemKat == 10
                              ? Container(
                                  margin: const EdgeInsets.only(left: 5),
                                  child: Row(
                                    children: [
                                      Text(
                                        "${itemsModel.itemTistand}",
                                        style: GoogleFonts.roboto(
                                            color: Myisellcolors.hvit70,
                                            fontSize: 13),
                                      ),
                                      itemsModel.itemMerke!.isNotEmpty
                                          ? const MyCircleSeparator()
                                          : const SizedBox(),
                                      itemsModel.itemMerke!.isNotEmpty
                                          ? Text(
                                              "${itemsModel.itemMerke}",
                                              style: GoogleFonts.roboto(
                                                  color: Myisellcolors.hvit70,
                                                  fontSize: 13),
                                            )
                                          : const SizedBox()
                                    ],
                                  ),
                                )
                              : const SizedBox(),
                          itemsModel.itemKat == 11
                              ? Container(
                                  margin: const EdgeInsets.only(left: 5),
                                  child: Row(
                                    children: [
                                      Text(
                                        "${itemsModel.itemTistand}",
                                        style: GoogleFonts.roboto(
                                            color: Myisellcolors.hvit70,
                                            fontSize: 13),
                                      ),
                                      itemsModel.itemMerke!.isNotEmpty
                                          ? const MyCircleSeparator()
                                          : const SizedBox(),
                                      itemsModel.itemMerke!.isNotEmpty
                                          ? Text(
                                              "${itemsModel.itemMerke}",
                                              style: GoogleFonts.roboto(
                                                  color: Myisellcolors.hvit70,
                                                  fontSize: 13),
                                            )
                                          : const SizedBox()
                                    ],
                                  ),
                                )
                              : const SizedBox(),
                          //const Spacer(),
                          itemsModel.itemKat == 6
                              ? Container(
                                  margin: const EdgeInsets.only(left: 5),
                                  child: Row(
                                    children: [
                                      Text(
                                        "${itemsModel.itemTistand}",
                                        style: GoogleFonts.roboto(
                                            color: Myisellcolors.hvit70,
                                            fontSize: 13),
                                      ),
                                      itemsModel.sykkelType!.isNotEmpty
                                          ? const MyCircleSeparator()
                                          : const SizedBox(),
                                      itemsModel.itemKat == 6 &&
                                              itemsModel.sykkelType!.isNotEmpty
                                          ? Text(
                                              "${itemsModel.sykkelType}",
                                              style: GoogleFonts.roboto(
                                                  color: Myisellcolors.hvit70,
                                                  fontSize: 13),
                                            )
                                          : const SizedBox(),
                                      itemsModel.salgLeie!.isNotEmpty
                                          ? const MyCircleSeparator()
                                          : const SizedBox(),
                                      itemsModel.itemKat == 1 &&
                                              itemsModel.salgLeie!.isNotEmpty
                                          ? Text(
                                              "${itemsModel.salgLeie}",
                                              style: GoogleFonts.roboto(
                                                  color: Myisellcolors.hvit70,
                                                  fontSize: 13),
                                            )
                                          : const SizedBox(),
                                    ],
                                  ),
                                )
                              : const SizedBox(),
                          itemsModel.itemKat == 2
                              ? Container(
                                  margin: const EdgeInsets.only(left: 5),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                "${itemsModel.salgLeie}",
                                                style: GoogleFonts.roboto(
                                                    color: Myisellcolors.hvit70,
                                                    fontSize: 12),
                                              ),
                                              const MyCircleSeparator(),
                                              Text(
                                                itemsModel
                                                        .itemSelger!.isNotEmpty
                                                    ? itemsModel.itemSelger!
                                                    : "Privat",
                                                style: GoogleFonts.roboto(
                                                    color: Myisellcolors.hvit70,
                                                    fontSize: 12),
                                              ),
                                              const MyCircleSeparator(),
                                              Text(
                                                "${itemsModel.boligEieform}",
                                                style: GoogleFonts.roboto(
                                                    color: Myisellcolors.hvit70,
                                                    fontSize: 11),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "${itemsModel.primaarRom} m\u00B2",
                                            style: GoogleFonts.roboto(
                                                color: Myisellcolors.hvit70,
                                                fontSize: 11),
                                          ),
                                          const MyCircleSeparator(),
                                          Text(
                                            "${itemsModel.antallSoverom}+${itemsModel.antallStuer} rom",
                                            style: GoogleFonts.roboto(
                                                color: Myisellcolors.hvit70,
                                                fontSize: 12),
                                          ),
                                          const MyCircleSeparator(),
                                          Text(
                                            "${itemsModel.boligByggar}",
                                            style: GoogleFonts.roboto(
                                                color: Myisellcolors.hvit70,
                                                fontSize: 11),
                                          ),
                                          // Text(
                                          //   "${itemsModel.boligType}",
                                          //   style: GoogleFonts.roboto(
                                          //       color: Myisellcolors.hvit70,
                                          //       fontSize: 11),
                                          // ),
                                          // const MyCircleSeparator(),
                                          // Text(
                                          //   "${itemsModel.boligByggar}",
                                          //   style: GoogleFonts.roboto(
                                          //       color: Myisellcolors.hvit70,
                                          //       fontSize: 13),
                                          // ),
                                        ],
                                      ),
                                      const SizedBox(height: 5)
                                    ],
                                  ),
                                )
                              : const SizedBox(),

                          itemsModel.itemKat == 3
                              ? Container(
                                  margin: const EdgeInsets.only(left: 5),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          // Text(
                                          //   "${itemsModel.salgLeie}",
                                          //   style: GoogleFonts.roboto(
                                          //       color: Myisellcolors.hvit70,
                                          //       fontSize: 13),
                                          // ),
                                          // itemsModel.salgLeie!.isNotEmpty
                                          //     ? const MyCircleSeparator()
                                          //     : const SizedBox(),
                                          Text(
                                            itemsModel.itemSelger!.isNotEmpty
                                                ? itemsModel.itemSelger!
                                                : "Privat",
                                            style: GoogleFonts.roboto(
                                                color: Myisellcolors.hvit70,
                                                fontSize: 11),
                                          ),
                                          const MyCircleSeparator(),
                                          Text(
                                            "${itemsModel.carGirkasse}",
                                            style: GoogleFonts.roboto(
                                                color: Myisellcolors.hvit70,
                                                fontSize: 11),
                                          ),
                                          const MyCircleSeparator(),
                                          Text(
                                            "${itemsModel.carEffekt} hk",
                                            style: GoogleFonts.roboto(
                                                color: Myisellcolors.hvit70,
                                                fontSize: 11),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "${itemsModel.carModellar}",
                                            style: GoogleFonts.roboto(
                                                color: Myisellcolors.hvit70,
                                                fontSize: 11),
                                          ),
                                          const MyCircleSeparator(),
                                          Text(
                                            "${itemsModel.carKilometer} km",
                                            style: GoogleFonts.roboto(
                                                color: Myisellcolors.hvit70,
                                                fontSize: 11),
                                          ),
                                          const MyCircleSeparator(),
                                          Text(
                                            "${itemsModel.carDrivstoff}",
                                            style: GoogleFonts.roboto(
                                                color: Myisellcolors.hvit70,
                                                fontSize: 11),
                                          ),
                                          // const MyCircleSeparator(),
                                          // Text(
                                          //   "${itemsModel.carMerke}",
                                          //   style: GoogleFonts.roboto(
                                          //       color: Myisellcolors.hvit70,
                                          //       fontSize: 13),
                                          // ),
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              : const SizedBox(),

                          const Spacer(),
                          SizedBox(
                            width: Get.width / 1.63,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(left: 5),
                                  child: Text(
                                    itemsModel.itemKat == 7
                                        ? formattedDate
                                        : "$itempris NOk",
                                    style: GoogleFonts.baloo2(
                                        fontSize: 13,
                                        color: Myisellcolors.hvit70),
                                  ),
                                ),
                                const Spacer(),
                                Container(
                                  padding: EdgeInsets.only(left: 0),
                                  child: Text(
                                    "${itemsModel.itemBy}",
                                    style: GoogleFonts.roboto(
                                        fontSize: 13,
                                        color: Myisellcolors.hvit70),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                : Column(
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
                                  itemsModel.itemIamge?.split(',');

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
                                  "${AppLink.imageitems}/${imagePaths?[0]}";

                              return CachedNetworkImage(
                                fit: BoxFit.cover,
                                width: constraints.maxWidth,
                                height: constraints.maxHeight,
                                imageUrl: firstImagePath,
                              );
                              // Hero(
                              //   tag: "${itemsModel?.itemId}",
                              //   child: CachedNetworkImage(
                              //     fit: BoxFit.cover,
                              //     width: constraints.maxWidth,
                              //     height: constraints.maxHeight,
                              //     imageUrl: firstImagePath,
                              //   ),
                              // );
                            },
                          ),
                        ),
                      )),
                      Container(
                        margin: const EdgeInsets.only(
                            bottom: 10, left: 6, right: 5, top: 4),
                        child: Text(
                          "${itemsModel.itemBeskrivelse}",
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.roboto(
                              fontSize: 13,
                              color: Myisellcolors.hvit,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(left: 6),
                            child: Text(
                              "${itemsModel.itemBy}",
                              style: GoogleFonts.roboto(
                                  fontSize: 13, color: Myisellcolors.hvit70),
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
                                  fontSize: 13, color: Myisellcolors.hvit70),
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
                  height:
                      (itemsModel.itemKat == 1 &&
                                  homePageControllerImp.showRelevant1.value ==
                                      false) ||
                              (itemsModel.itemKat == 2 &&
                                  homePageControllerImp.showRelevant1.value ==
                                      false) ||
                              (itemsModel.itemKat == 3 &&
                                  homePageControllerImp.showRelevant1.value ==
                                      false) ||
                              (itemsModel.itemKat == 4 &&
                                  homePageControllerImp.showRelevant1.value ==
                                      false) ||
                              (itemsModel.itemKat == 5 &&
                                  homePageControllerImp.showRelevant1.value ==
                                      false) ||
                              (itemsModel.itemKat == 6 &&
                                  homePageControllerImp.showRelevant1.value ==
                                      false) ||
                              (itemsModel.itemKat == 7 &&
                                  homePageControllerImp.showRelevant1.value ==
                                      false) ||
                              (itemsModel.itemKat == 8 &&
                                  homePageControllerImp.showRelevant1.value ==
                                      false) ||
                              (homePageControllerImp.showRelevant1.value ==
                                      false &&
                                  itemsModel.itemKat == 9) ||
                              (homePageControllerImp.showRelevant1.value ==
                                      false &&
                                  itemsModel.itemKat == 10) ||
                              (homePageControllerImp.showRelevant1.value ==
                                      false &&
                                  itemsModel.itemKat == 11)
                          ? 25
                          : 30,
                  padding: EdgeInsets.zero,
                  margin: EdgeInsets.only(
                    top: 5,
                    right: (itemsModel.itemKat == 1 &&
                                homePageControllerImp.showRelevant1.value ==
                                    false) ||
                            (itemsModel.itemKat == 2 &&
                                homePageControllerImp.showRelevant1.value ==
                                    false) ||
                            (itemsModel.itemKat == 3 &&
                                homePageControllerImp.showRelevant1.value ==
                                    false) ||
                            (itemsModel.itemKat == 4 &&
                                homePageControllerImp.showRelevant1.value ==
                                    false) ||
                            (itemsModel.itemKat == 5 &&
                                homePageControllerImp.showRelevant1.value ==
                                    false) ||
                            (itemsModel.itemKat == 6 &&
                                homePageControllerImp.showRelevant1.value ==
                                    false) ||
                            (itemsModel.itemKat == 7 &&
                                homePageControllerImp.showRelevant1.value ==
                                    false) ||
                            (itemsModel.itemKat == 8 &&
                                homePageControllerImp.showRelevant1.value ==
                                    false) ||
                            (homePageControllerImp.showRelevant1.value ==
                                    false &&
                                itemsModel.itemKat == 9) ||
                            (homePageControllerImp.showRelevant1.value ==
                                    false &&
                                itemsModel.itemKat == 10) ||
                            (homePageControllerImp.showRelevant1.value ==
                                    false &&
                                itemsModel.itemKat == 11) ||
                            (itemsModel.itemLikt == 0)
                        ? 0
                        : 5,
                  ),
                  decoration: BoxDecoration(
                    border:
                        (itemsModel.itemKat == 1 &&
                                    homePageControllerImp.showRelevant1.value ==
                                        false) ||
                                (itemsModel.itemKat == 2 &&
                                    homePageControllerImp.showRelevant1.value ==
                                        false) ||
                                (itemsModel.itemKat == 3 &&
                                    homePageControllerImp.showRelevant1.value ==
                                        false) ||
                                (itemsModel.itemKat == 4 &&
                                    homePageControllerImp.showRelevant1.value ==
                                        false) ||
                                (itemsModel.itemKat == 5 &&
                                    homePageControllerImp.showRelevant1.value ==
                                        false) ||
                                (itemsModel.itemKat == 6 &&
                                    homePageControllerImp.showRelevant1.value ==
                                        false) ||
                                (itemsModel.itemKat == 7 &&
                                    homePageControllerImp.showRelevant1.value ==
                                        false) ||
                                (itemsModel.itemKat == 8 &&
                                    homePageControllerImp.showRelevant1.value ==
                                        false) ||
                                (homePageControllerImp.showRelevant1.value ==
                                        false &&
                                    itemsModel.itemKat == 9) ||
                                (homePageControllerImp.showRelevant1.value ==
                                        false &&
                                    itemsModel.itemKat == 10) ||
                                (homePageControllerImp.showRelevant1.value ==
                                        false &&
                                    itemsModel.itemKat == 11) ||
                                (itemsModel.itemLikt == 0)
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
            )
          ],
        ),
      ),
    );
  }
}
