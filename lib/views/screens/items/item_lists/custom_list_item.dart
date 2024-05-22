import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_isell_new/controller/favorite/favorite_controller.dart';
import 'package:flutter_isell_new/controller/home_page_controller.dart';
import 'package:flutter_isell_new/controller/items_controller.dart';
import 'package:flutter_isell_new/core/classes/handling_data_view.dart';
import 'package:flutter_isell_new/core/classes/statusrequest.dart';
import 'package:flutter_isell_new/core/constants/sellx_colors.dart';
import 'package:flutter_isell_new/data/model/items_modell.dart';
import 'package:flutter_isell_new/sellx_link_api.dart';
import 'package:flutter_isell_new/views/widget/my_circle_separator.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class CustomListItem extends StatefulWidget {
  final ItemsModel itemsModel;

  const CustomListItem({Key? key, required this.itemsModel}) : super(key: key);

  @override
  _CustomListItemState createState() => _CustomListItemState();
}

class _CustomListItemState extends State<CustomListItem> {
  late FavoritController favcontroller;
  late HomePageControllerImp homePageControllerImp;
  late ItemControllerImp itemControllerImp;

  @override
  void initState() {
    super.initState();
    favcontroller = Get.put(FavoritController());
    homePageControllerImp = Get.put(HomePageControllerImp());
    itemControllerImp = Get.put(ItemControllerImp());
  }

  @override
  Widget build(BuildContext context) {
    String dateCreate = widget.itemsModel.itemDato!;
    DateTime parsedDate = DateTime.parse(dateCreate);
    DateFormat outputFormat = DateFormat("dd MMM yyyy");
    String formattedDate = outputFormat.format(parsedDate);
    String itempris =
        NumberFormat.decimalPattern().format(widget.itemsModel.itemPris);

    return InkWell(
        onTap: () {
          favcontroller.isFavorite[widget.itemsModel.itemId];
          //favcontroller.statusRequest;
          //favcontroller.update();
          // favcontroller.isFavorite[widget.itemsModel.itemId] =
          //     widget.itemsModel.favoritt;

          widget.itemsModel.itemSett = widget.itemsModel.itemSett! + 1;
          homePageControllerImp.itemsett(
              widget.itemsModel.itemSett, widget.itemsModel.itemId);
          itemControllerImp.goToItemPageDetails(widget.itemsModel);
          Map<String, dynamic> itemMap = widget.itemsModel.toJson();
          homePageControllerImp.addToLastViewed(itemMap);
        },
        child: Card(
            shape: RoundedRectangleBorder(
              side: const BorderSide(color: Myisellcolors.hoved, width: 0.4),
              borderRadius: BorderRadius.circular(5),
            ),
            color: Myisellcolors.home,
            child: Stack(children: [
              (widget.itemsModel.itemKat == 1 &&
                          favcontroller.showRelevant1.value == false) ||
                      (favcontroller.showRelevant1.value == false &&
                          widget.itemsModel.itemKat == 4) ||
                      (favcontroller.showRelevant1.value == false &&
                          widget.itemsModel.itemKat == 5) ||
                      (favcontroller.showRelevant1.value == false &&
                          widget.itemsModel.itemKat == 6) ||
                      (favcontroller.showRelevant1.value == false &&
                          widget.itemsModel.itemKat == 7) ||
                      (favcontroller.showRelevant1.value == false &&
                          widget.itemsModel.itemKat == 8) ||
                      (favcontroller.showRelevant1.value == false &&
                          widget.itemsModel.itemKat == 9) ||
                      (favcontroller.showRelevant1.value == false &&
                          widget.itemsModel.itemKat == 10) ||
                      (favcontroller.showRelevant1.value == false &&
                          widget.itemsModel.itemKat == 11)
                  ? Row(children: [
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
                                  widget.itemsModel.itemIamge?.split(',');

                              // Check if imagePaths is null or empty
                              if (widget.itemsModel.itemIamge == null ||
                                  widget.itemsModel.itemIamge!.isEmpty) {
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

                      // Added SizedBox as a placeholder when conditions are not met
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 160,
                              padding: const EdgeInsets.only(
                                  bottom: 0, left: 6, right: 5, top: 4),
                              child: Text(
                                "${widget.itemsModel.itemMerke}".isNotEmpty
                                    ? "${widget.itemsModel.itemMerke}"
                                    : "${widget.itemsModel.mcMerke}".isNotEmpty
                                        ? "${widget.itemsModel.mcMerke}"
                                        : "${widget.itemsModel.boatMerke}"
                                                .isNotEmpty
                                            ? "${widget.itemsModel.boatMerke}"
                                            : "${widget.itemsModel.jobbAnsettelsesform}"
                                                    .isNotEmpty
                                                ? "${widget.itemsModel.jobbAnsettelsesform}"
                                                : "${widget.itemsModel.carMerke}"
                                                        .isNotEmpty
                                                    ? "${widget.itemsModel.carMerke}"
                                                    : "${widget.itemsModel.boligType}"
                                                            .isNotEmpty
                                                        ? "${widget.itemsModel.boligType}"
                                                        : "${widget.itemsModel.itemName}",
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
                                "${widget.itemsModel.itemBeskrivelse}",
                                maxLines: (widget.itemsModel.itemKat == 1 &&
                                            favcontroller.showRelevant1.value ==
                                                false) ||
                                        (widget.itemsModel.itemKat == 4 &&
                                            favcontroller.showRelevant1.value ==
                                                false) ||
                                        (widget.itemsModel.itemKat == 5 &&
                                            favcontroller.showRelevant1.value ==
                                                false) ||
                                        (widget.itemsModel.itemKat == 6 &&
                                            favcontroller.showRelevant1.value ==
                                                false) ||
                                        (widget.itemsModel.itemKat == 7 &&
                                            favcontroller.showRelevant1.value ==
                                                false) ||
                                        (widget.itemsModel.itemKat == 8 &&
                                            favcontroller.showRelevant1.value ==
                                                false) ||
                                        (favcontroller.showRelevant1.value ==
                                                false &&
                                            widget.itemsModel.itemKat == 9) ||
                                        (favcontroller.showRelevant1.value ==
                                                false &&
                                            widget.itemsModel.itemKat == 10) ||
                                        (favcontroller.showRelevant1.value ==
                                                false &&
                                            widget.itemsModel.itemKat == 11)
                                    ? 2
                                    : 1,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.roboto(
                                    fontSize: 13,
                                    color: Myisellcolors.hvit,
                                    height: 1.2,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            widget.itemsModel.itemKat == 7
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
                                              "${widget.itemsModel.jobbFirma}",
                                              style: GoogleFonts.roboto(
                                                  color: Myisellcolors.hvit70,
                                                  fontSize: 11),
                                            ),
                                            const MyCircleSeparator(),
                                            Text(
                                              "${widget.itemsModel.jobbSektor}",
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
                                              "${widget.itemsModel.jobbAnsettelsesform}",
                                              style: GoogleFonts.roboto(
                                                  color: Myisellcolors.hvit70,
                                                  fontSize: 11),
                                            ),
                                            const MyCircleSeparator(),
                                            widget.itemsModel
                                                        .jobbAntllstillinger !=
                                                    0
                                                ? Row(
                                                    children: [
                                                      Text(
                                                        "${widget.itemsModel.jobbAntllstillinger} ${widget.itemsModel.jobbAntllstillinger!.isEqual(1) ? "Stilling" : "Stillinger"}",
                                                        style:
                                                            GoogleFonts.roboto(
                                                                color:
                                                                    Myisellcolors
                                                                        .hvit70,
                                                                fontSize: 11),
                                                      ),
                                                      const MyCircleSeparator(),
                                                    ],
                                                  )
                                                : const SizedBox(),
                                            Text(
                                              "${widget.itemsModel.jobbFrist}",
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

                            widget.itemsModel.itemKat == 5
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
                                              "${widget.itemsModel.mcKilometerstand} km",
                                              style: GoogleFonts.roboto(
                                                  color: Myisellcolors.hvit70,
                                                  fontSize: 13),
                                            ),
                                            const MyCircleSeparator(),
                                            Text(
                                              "${widget.itemsModel.mcModellar}",
                                              style: GoogleFonts.roboto(
                                                  color: Myisellcolors.hvit70,
                                                  fontSize: 13),
                                            ),
                                            const MyCircleSeparator(),
                                            Text(
                                              "${widget.itemsModel.mcDrivstoff}",
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
                                              "${widget.itemsModel.mcType}",
                                              style: GoogleFonts.roboto(
                                                  color: Myisellcolors.hvit70,
                                                  fontSize: 13),
                                            ),
                                            const MyCircleSeparator(),
                                            // Text(
                                            //   "${itemsModel.mcMerke}",
                                            //   style: GoogleFonts.roboto(
                                            //       color: Myisellcolors.hvit70,
                                            //       fontSize: 13),
                                            // ),
                                            // const MyCircleSeparator(),
                                            Text(
                                              widget.itemsModel.itemSelger!
                                                      .isNotEmpty
                                                  ? widget
                                                      .itemsModel.itemSelger!
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
                            widget.itemsModel.itemKat == 4
                                ? Container(
                                    margin:
                                        const EdgeInsets.only(left: 5, top: 6),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "${widget.itemsModel.itemTistand}",
                                              style: GoogleFonts.roboto(
                                                  color: Myisellcolors.hvit70,
                                                  fontSize: 12),
                                            ),
                                            // itemsModel.itemTistand!.isNotEmpty
                                            //     ? const MyCircleSeparator()
                                            //     : const SizedBox(),
                                            widget.itemsModel.boatType!
                                                    .isNotEmpty
                                                ? Row(
                                                    children: [
                                                      const MyCircleSeparator(),
                                                      Text(
                                                        "${widget.itemsModel.boatType}",
                                                        style:
                                                            GoogleFonts.roboto(
                                                                color:
                                                                    Myisellcolors
                                                                        .hvit70,
                                                                fontSize: 12),
                                                      ),
                                                    ],
                                                  )
                                                : const SizedBox(),
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
                                              "${widget.itemsModel.boatDrivstoff}",
                                              style: GoogleFonts.roboto(
                                                  color: Myisellcolors.hvit70,
                                                  fontSize: 12),
                                            ),
                                            widget.itemsModel.boatDrivstoff!
                                                    .isNotEmpty
                                                ? const MyCircleSeparator()
                                                : const SizedBox(),
                                            Text(
                                              "${widget.itemsModel.boatbreddeCm} cm br.",
                                              style: GoogleFonts.roboto(
                                                  color: Myisellcolors.hvit70,
                                                  fontSize: 12),
                                            ),
                                            widget.itemsModel.boatlengdeFot != 0
                                                ? Row(
                                                    children: [
                                                      const MyCircleSeparator(),
                                                      Text(
                                                        "${widget.itemsModel.boatlengdeFot} fot",
                                                        style:
                                                            GoogleFonts.roboto(
                                                                color:
                                                                    Myisellcolors
                                                                        .hvit70,
                                                                fontSize: 12),
                                                      ),
                                                    ],
                                                  )
                                                : const SizedBox(),
                                          ],
                                        )
                                      ],
                                    ),
                                  )
                                : const SizedBox(),
                            const Spacer(),

                            widget.itemsModel.itemKat == 1
                                ? Container(
                                    margin: const EdgeInsets.only(left: 5),
                                    child: Row(
                                      children: [
                                        Text(
                                          "${widget.itemsModel.itemTistand}",
                                          style: GoogleFonts.roboto(
                                              color: Myisellcolors.hvit70,
                                              fontSize: 13),
                                        ),
                                        widget.itemsModel.itemMerke!.isNotEmpty
                                            ? const MyCircleSeparator()
                                            : const SizedBox(),
                                        widget.itemsModel.itemKat == 1 &&
                                                widget.itemsModel.itemMerke!
                                                    .isNotEmpty
                                            ? Text(
                                                "${widget.itemsModel.itemMerke}",
                                                style: GoogleFonts.roboto(
                                                    color: Myisellcolors.hvit70,
                                                    fontSize: 13),
                                              )
                                            : const SizedBox(),
                                        widget.itemsModel.salgLeie!.isNotEmpty
                                            ? const MyCircleSeparator()
                                            : const SizedBox(),
                                        widget.itemsModel.itemKat == 1 &&
                                                widget.itemsModel.salgLeie!
                                                    .isNotEmpty
                                            ? Text(
                                                "${widget.itemsModel.salgLeie}",
                                                style: GoogleFonts.roboto(
                                                    color: Myisellcolors.hvit70,
                                                    fontSize: 13),
                                              )
                                            : const SizedBox(),
                                      ],
                                    ),
                                  )
                                : const SizedBox(),
                            widget.itemsModel.itemKat == 8
                                ? Container(
                                    margin: const EdgeInsets.only(left: 5),
                                    child: Row(
                                      children: [
                                        Text(
                                          "${widget.itemsModel.itemTistand}",
                                          style: GoogleFonts.roboto(
                                              color: Myisellcolors.hvit70,
                                              fontSize: 13),
                                        ),
                                        const MyCircleSeparator(),
                                        Text(
                                          "Kategori: ${widget.itemsModel.bokKategori}",
                                          style: GoogleFonts.roboto(
                                              color: Myisellcolors.hvit70,
                                              fontSize: 13),
                                        )
                                      ],
                                    ),
                                  )
                                : const SizedBox(),
                            widget.itemsModel.itemKat == 9
                                ? Container(
                                    margin: const EdgeInsets.only(left: 5),
                                    child: Row(
                                      children: [
                                        Text(
                                          "${widget.itemsModel.itemTistand}",
                                          style: GoogleFonts.roboto(
                                              color: Myisellcolors.hvit70,
                                              fontSize: 13),
                                        ),
                                        widget.itemsModel.itemMerke!.isNotEmpty
                                            ? const MyCircleSeparator()
                                            : const SizedBox(),
                                        widget.itemsModel.itemMerke!.isNotEmpty
                                            ? Text(
                                                "${widget.itemsModel.itemMerke}",
                                                style: GoogleFonts.roboto(
                                                    color: Myisellcolors.hvit70,
                                                    fontSize: 13),
                                              )
                                            : const SizedBox()
                                      ],
                                    ),
                                  )
                                : const SizedBox(),
                            widget.itemsModel.itemKat == 10
                                ? Container(
                                    margin: const EdgeInsets.only(left: 5),
                                    child: Row(
                                      children: [
                                        Text(
                                          "${widget.itemsModel.itemTistand}",
                                          style: GoogleFonts.roboto(
                                              color: Myisellcolors.hvit70,
                                              fontSize: 13),
                                        ),
                                        widget.itemsModel.itemMerke!.isNotEmpty
                                            ? const MyCircleSeparator()
                                            : const SizedBox(),
                                        widget.itemsModel.itemMerke!.isNotEmpty
                                            ? Text(
                                                "${widget.itemsModel.itemMerke}",
                                                style: GoogleFonts.roboto(
                                                    color: Myisellcolors.hvit70,
                                                    fontSize: 13),
                                              )
                                            : const SizedBox()
                                      ],
                                    ),
                                  )
                                : const SizedBox(),
                            widget.itemsModel.itemKat == 11
                                ? Container(
                                    margin: const EdgeInsets.only(left: 5),
                                    child: Row(
                                      children: [
                                        Text(
                                          "${widget.itemsModel.itemTistand}",
                                          style: GoogleFonts.roboto(
                                              color: Myisellcolors.hvit70,
                                              fontSize: 13),
                                        ),
                                        widget.itemsModel.itemMerke!.isNotEmpty
                                            ? const MyCircleSeparator()
                                            : const SizedBox(),
                                        widget.itemsModel.itemMerke!.isNotEmpty
                                            ? Text(
                                                "${widget.itemsModel.itemMerke}",
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
                            widget.itemsModel.itemKat == 6
                                ? Container(
                                    margin: const EdgeInsets.only(left: 5),
                                    child: Row(
                                      children: [
                                        Text(
                                          "${widget.itemsModel.itemTistand}",
                                          style: GoogleFonts.roboto(
                                              color: Myisellcolors.hvit70,
                                              fontSize: 13),
                                        ),
                                        widget.itemsModel.sykkelType!.isNotEmpty
                                            ? const MyCircleSeparator()
                                            : const SizedBox(),
                                        widget.itemsModel.itemKat == 6 &&
                                                widget.itemsModel.sykkelType!
                                                    .isNotEmpty
                                            ? Text(
                                                "${widget.itemsModel.sykkelType}",
                                                style: GoogleFonts.roboto(
                                                    color: Myisellcolors.hvit70,
                                                    fontSize: 13),
                                              )
                                            : const SizedBox(),
                                        widget.itemsModel.salgLeie!.isNotEmpty
                                            ? const MyCircleSeparator()
                                            : const SizedBox(),
                                        widget.itemsModel.itemKat == 6 &&
                                                widget.itemsModel.salgLeie!
                                                    .isNotEmpty
                                            ? Text(
                                                "${widget.itemsModel.salgLeie}",
                                                style: GoogleFonts.roboto(
                                                    color: Myisellcolors.hvit70,
                                                    fontSize: 13),
                                              )
                                            : const SizedBox(),
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
                                        widget.itemsModel.itemKat == 7
                                            ? formattedDate
                                            : "$itempris NOK",
                                        style: GoogleFonts.baloo2(
                                            fontSize: 13,
                                            color: Myisellcolors.hvit70),
                                      ),
                                    ),
                                    const Spacer(),
                                    Container(
                                      margin: const EdgeInsets.only(left: 6),
                                      child: Text(
                                        "${widget.itemsModel.itemBy}",
                                        style: GoogleFonts.roboto(
                                            fontSize: 13,
                                            color: Myisellcolors.hvit70),
                                      ),
                                    ),
                                  ],
                                ))
                          ])
                    ])
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
                                      widget.itemsModel.itemIamge?.split(',');

                                  if (widget.itemsModel.itemIamge == null ||
                                      widget.itemsModel.itemIamge!.isEmpty) {
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
                            margin: EdgeInsets.only(
                                bottom:
                                    favcontroller.showRelevant1.value == false
                                        ? 5
                                        : 10,
                                left: 6,
                                right: 5,
                                top: 4),
                            child: Text(
                              "${widget.itemsModel.itemBeskrivelse}",
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.roboto(
                                  fontSize: 13,
                                  color: Myisellcolors.hvit,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          (widget.itemsModel.itemKat == 2 &&
                                  favcontroller.showRelevant1.value == false)
                              ? Container(
                                  margin: const EdgeInsets.only(left: 5),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                "${widget.itemsModel.salgLeie}",
                                                style: GoogleFonts.roboto(
                                                    color: Myisellcolors.hvit70,
                                                    fontSize: 13),
                                              ),
                                              const MyCircleSeparator(),
                                              Text(
                                                widget.itemsModel.itemSelger!
                                                        .isNotEmpty
                                                    ? widget
                                                        .itemsModel.itemSelger!
                                                    : "Privat",
                                                style: GoogleFonts.roboto(
                                                    color: Myisellcolors.hvit70,
                                                    fontSize: 13),
                                              ),
                                              const MyCircleSeparator(),
                                              Text(
                                                "${widget.itemsModel.boligEieform}",
                                                style: GoogleFonts.roboto(
                                                    color: Myisellcolors.hvit70,
                                                    fontSize: 13),
                                              ),
                                            ],
                                          ),
                                          const Spacer(),
                                          Container(
                                            padding: const EdgeInsets.only(
                                                left: 6,
                                                right: 6,
                                                top: 5,
                                                bottom: 5),
                                            child: Text(
                                              formattedDate,
                                              style: GoogleFonts.roboto(
                                                  color: Myisellcolors.hvit70,
                                                  fontSize: 13),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "${widget.itemsModel.primaarRom} m\u00B2",
                                            style: GoogleFonts.roboto(
                                                color: Myisellcolors.hvit70,
                                                fontSize: 13),
                                          ),
                                          const MyCircleSeparator(),
                                          Text(
                                            "${widget.itemsModel.antallSoverom} rom",
                                            style: GoogleFonts.roboto(
                                                color: Myisellcolors.hvit70,
                                                fontSize: 13),
                                          ),
                                          const MyCircleSeparator(),
                                          Text(
                                            "${widget.itemsModel.boligType}",
                                            style: GoogleFonts.roboto(
                                                color: Myisellcolors.hvit70,
                                                fontSize: 13),
                                          ),
                                          const MyCircleSeparator(),
                                          Text(
                                            "${widget.itemsModel.boligByggar}",
                                            style: GoogleFonts.roboto(
                                                color: Myisellcolors.hvit70,
                                                fontSize: 13),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 5)
                                    ],
                                  ),
                                )
                              : const SizedBox(),
                          widget.itemsModel.itemKat == 3 &&
                                  favcontroller.showRelevant1.value == false
                              ? Container(
                                  margin: const EdgeInsets.only(left: 5),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                "${widget.itemsModel.salgLeie}",
                                                style: GoogleFonts.roboto(
                                                    color: Myisellcolors.hvit70,
                                                    fontSize: 13),
                                              ),
                                              const MyCircleSeparator(),
                                              Text(
                                                widget.itemsModel.itemSelger!
                                                        .isNotEmpty
                                                    ? widget
                                                        .itemsModel.itemSelger!
                                                    : "Privat",
                                                style: GoogleFonts.roboto(
                                                    color: Myisellcolors.hvit70,
                                                    fontSize: 13),
                                              ),
                                            ],
                                          ),
                                          const Spacer(),
                                          Container(
                                            padding: const EdgeInsets.only(
                                                left: 6,
                                                right: 6,
                                                top: 5,
                                                bottom: 5),
                                            child: Text(
                                              formattedDate,
                                              style: GoogleFonts.roboto(
                                                  color: Myisellcolors.hvit70,
                                                  fontSize: 13),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 5),
                                      Row(
                                        children: [
                                          widget.itemsModel.carModellar!
                                                  .isNotEmpty
                                              ? Row(
                                                  children: [
                                                    Text(
                                                      "${widget.itemsModel.carModellar}",
                                                      style: GoogleFonts.roboto(
                                                          color: Myisellcolors
                                                              .hvit70,
                                                          fontSize: 13),
                                                    ),
                                                    const MyCircleSeparator(),
                                                  ],
                                                )
                                              : const SizedBox(),
                                          "${widget.itemsModel.carKilometer}"
                                                  .isNotEmpty
                                              ? Row(
                                                  children: [
                                                    Text(
                                                      "${widget.itemsModel.carKilometer} km",
                                                      style: GoogleFonts.roboto(
                                                          color: Myisellcolors
                                                              .hvit70,
                                                          fontSize: 13),
                                                    ),
                                                    widget
                                                            .itemsModel
                                                            .carDrivstoff!
                                                            .isNotEmpty
                                                        ? const MyCircleSeparator()
                                                        : const SizedBox()
                                                  ],
                                                )
                                              : const SizedBox(),
                                          // Text(
                                          //   "${itemsModel.carMerke}",
                                          //   style: GoogleFonts.roboto(
                                          //       color: Myisellcolors.hvit70,
                                          //       fontSize: 13),
                                          // ),
                                          // const MyCircleSeparator(),
                                          widget.itemsModel.carDrivstoff!
                                                  .isNotEmpty
                                              ? Row(
                                                  children: [
                                                    Text(
                                                      "${widget.itemsModel.carDrivstoff}",
                                                      style: GoogleFonts.roboto(
                                                          color: Myisellcolors
                                                              .hvit70,
                                                          fontSize: 13),
                                                    ),
                                                    const MyCircleSeparator(),
                                                  ],
                                                )
                                              : const SizedBox(),
                                          widget.itemsModel.carGirkasse!
                                                  .isNotEmpty
                                              ? Row(
                                                  children: [
                                                    Text(
                                                      "${widget.itemsModel.carGirkasse}",
                                                      style: GoogleFonts.roboto(
                                                          color: Myisellcolors
                                                              .hvit70,
                                                          fontSize: 13),
                                                    ),
                                                    const MyCircleSeparator(),
                                                  ],
                                                )
                                              : const SizedBox(),
                                          widget.itemsModel.carEffekt!
                                                  .isNotEmpty
                                              ? Text(
                                                  "${widget.itemsModel.carEffekt} hk",
                                                  style: GoogleFonts.roboto(
                                                      color:
                                                          Myisellcolors.hvit70,
                                                      fontSize: 13),
                                                )
                                              : const SizedBox()
                                        ],
                                      ),
                                      const SizedBox(height: 5)
                                    ],
                                  ),
                                )
                              : const SizedBox(),
                          Row(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(left: 6),
                                child: Text(
                                  "${widget.itemsModel.itemBy}",
                                  style: GoogleFonts.roboto(
                                      fontSize: 13,
                                      color: Myisellcolors.hvit70),
                                ),
                              ),
                              const Spacer(),
                              Container(
                                margin: const EdgeInsets.only(right: 6),
                                child: Text(
                                  widget.itemsModel.itemKat == 7
                                      ? formattedDate
                                      : "$itempris NOK",
                                  style: GoogleFonts.baloo2(
                                      fontSize: 13,
                                      color: Myisellcolors.hvit70),
                                ),
                              ),
                            ],
                          ),
                        ]),
              GetBuilder<FavoritController>(
                builder: (controller) => Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    height: (widget.itemsModel.itemKat == 1 &&
                                controller.showRelevant1.value == false) ||
                            (widget.itemsModel.itemKat == 4 &&
                                controller.showRelevant1.value == false) ||
                            (widget.itemsModel.itemKat == 5 &&
                                controller.showRelevant1.value == false) ||
                            (widget.itemsModel.itemKat == 6 &&
                                controller.showRelevant1.value == false) ||
                            (widget.itemsModel.itemKat == 7 &&
                                controller.showRelevant1.value == false) ||
                            (widget.itemsModel.itemKat == 8 &&
                                controller.showRelevant1.value == false) ||
                            (controller.showRelevant1.value == false &&
                                widget.itemsModel.itemKat == 9) ||
                            (controller.showRelevant1.value == false &&
                                widget.itemsModel.itemKat == 10) ||
                            (controller.showRelevant1.value == false &&
                                widget.itemsModel.itemKat == 11)
                        ? 25
                        : 30,
                    padding: EdgeInsets.zero,
                    margin: EdgeInsets.only(
                      top: 5,
                      right: (widget.itemsModel.itemKat == 1 &&
                                  controller.showRelevant1.value == false) ||
                              (widget.itemsModel.itemKat == 4 &&
                                  controller.showRelevant1.value == false) ||
                              (widget.itemsModel.itemKat == 5 &&
                                  controller.showRelevant1.value == false) ||
                              (widget.itemsModel.itemKat == 6 &&
                                  controller.showRelevant1.value == false) ||
                              (widget.itemsModel.itemKat == 7 &&
                                  controller.showRelevant1.value == false) ||
                              (widget.itemsModel.itemKat == 8 &&
                                  controller.showRelevant1.value == false) ||
                              (controller.showRelevant1.value == false &&
                                  widget.itemsModel.itemKat == 9) ||
                              (controller.showRelevant1.value == false &&
                                  widget.itemsModel.itemKat == 10) ||
                              (controller.showRelevant1.value == false &&
                                  widget.itemsModel.itemKat == 11) ||
                              (widget.itemsModel.itemLikt == 0)
                          ? 0
                          : 5,
                    ),
                    decoration: BoxDecoration(
                      border: (widget.itemsModel.itemKat == 1 &&
                                  controller.showRelevant1.value == false) ||
                              (widget.itemsModel.itemKat == 4 &&
                                  controller.showRelevant1.value == false) ||
                              (widget.itemsModel.itemKat == 5 &&
                                  controller.showRelevant1.value == false) ||
                              (widget.itemsModel.itemKat == 6 &&
                                  controller.showRelevant1.value == false) ||
                              (widget.itemsModel.itemKat == 7 &&
                                  controller.showRelevant1.value == false) ||
                              (widget.itemsModel.itemKat == 8 &&
                                  controller.showRelevant1.value == false) ||
                              (controller.showRelevant1.value == false &&
                                  widget.itemsModel.itemKat == 9) ||
                              (controller.showRelevant1.value == false &&
                                  widget.itemsModel.itemKat == 10) ||
                              (controller.showRelevant1.value == false &&
                                  widget.itemsModel.itemKat == 11) ||
                              (widget.itemsModel.itemLikt == 0)
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
                            (widget.itemsModel.itemKat == 1 &&
                                        controller.showRelevant1.value ==
                                            false) ||
                                    (widget.itemsModel.itemKat == 4 &&
                                        controller.showRelevant1.value ==
                                            false) ||
                                    (widget.itemsModel.itemKat == 5 &&
                                        controller.showRelevant1.value ==
                                            false) ||
                                    (widget.itemsModel.itemKat == 6 &&
                                        controller.showRelevant1.value ==
                                            false) ||
                                    (widget.itemsModel.itemKat == 7 &&
                                        controller.showRelevant1.value ==
                                            false) ||
                                    (widget.itemsModel.itemKat == 8 &&
                                        controller.showRelevant1.value ==
                                            false) ||
                                    (controller.showRelevant1.value == false &&
                                        widget.itemsModel.itemKat == 9) ||
                                    (controller.showRelevant1.value == false &&
                                        widget.itemsModel.itemKat == 10) ||
                                    (controller.showRelevant1.value == false &&
                                        widget.itemsModel.itemKat == 11) ||
                                    (widget.itemsModel.itemLikt == 0)
                                ? ""
                                : "${widget.itemsModel.itemLikt}",
                            style: GoogleFonts.roboto(
                              color: Myisellcolors.hoved,
                              fontSize: 18,
                            ),
                            textAlign: TextAlign.start,
                          ),
                        ),
                        HandlingDataView(
                          statusRequest: StatusRequest.none,
                          widget: IconButton(
                            splashColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            disabledColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            padding: EdgeInsets.zero,
                            // onPressed: () async {
                            //   if (controller
                            //           .isFavorite[widget.itemsModel.itemId] ==
                            //       1) {
                            //     controller.setFavorite(
                            //         widget.itemsModel.itemId, 0);
                            //     await controller
                            //         .removeFavoritt(widget.itemsModel.itemId);
                            //     widget.itemsModel.itemLikt =
                            //         widget.itemsModel.itemLikt! - 1;
                            //     controller.itemlikt(widget.itemsModel.itemLikt,
                            //         widget.itemsModel.itemId);
                            //   } else {
                            //     controller.setFavorite(
                            //         widget.itemsModel.itemId, 1);
                            //     await controller
                            //         .addFavoritt(widget.itemsModel.itemId);
                            //     widget.itemsModel.itemLikt =
                            //         widget.itemsModel.itemLikt! + 1;
                            //     controller.itemlikt(widget.itemsModel.itemLikt,
                            //         widget.itemsModel.itemId);
                            //   }
                            // },

                            onPressed: () {
                              if (controller
                                      .isFavorite[widget.itemsModel.itemId] ==
                                  1) {
                                controller.setFavorite(
                                    widget.itemsModel.itemId, 0);
                                controller
                                    .removeFavoritt(widget.itemsModel.itemId);
                                widget.itemsModel.itemLikt =
                                    widget.itemsModel.itemLikt! - 1;
                                controller.itemlikt(widget.itemsModel.itemLikt,
                                    widget.itemsModel.itemId);
                              } else {
                                controller.setFavorite(
                                    widget.itemsModel.itemId, 1);
                                controller
                                    .addFavoritt(widget.itemsModel.itemId);
                                widget.itemsModel.itemLikt =
                                    widget.itemsModel.itemLikt! + 1;
                                controller.itemlikt(widget.itemsModel.itemLikt,
                                    widget.itemsModel.itemId);
                              }
                              controller.isFavorite[widget.itemsModel.itemId];
                            },
                            icon: Icon(
                              controller.isFavorite[widget.itemsModel.itemId] ==
                                      1
                                  ? Icons.favorite
                                  : Icons.favorite_outline,
                              color: Myisellcolors.hoved,
                              size: 25,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ])));
  }
}
