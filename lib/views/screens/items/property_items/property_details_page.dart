import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_isell_new/controller/favorite/favorite_controller.dart';
import 'package:flutter_isell_new/controller/favorite/my_favorite_controller.dart';
import 'package:flutter_isell_new/controller/itemdeatails_controller.dart';
import 'package:flutter_isell_new/controller/stories/stories_controller.dart';
import 'package:flutter_isell_new/core/constants/sellx_colors.dart';
import 'package:flutter_isell_new/sellx_link_api.dart';
import 'package:flutter_isell_new/views/screens/items/property_items/address_information.dart';
import 'package:flutter_isell_new/views/screens/items/property_items/facilities.dart';
import 'package:flutter_isell_new/views/screens/items/property_items/facilities_rent.dart';
import 'package:flutter_isell_new/views/screens/items/property_items/general_property_info.dart';
import 'package:flutter_isell_new/views/screens/items/property_items/housing_association.dart';
import 'package:flutter_isell_new/views/screens/items/property_items/price_data_property.dart';
import 'package:flutter_isell_new/views/screens/items/property_items/viewing_house.dart';
import 'package:flutter_isell_new/views/widget/custom_drawer.dart';
import 'package:flutter_isell_new/views/widget/my_divador.dart';
import 'package:flutter_isell_new/views/widget/sellx_%20buttons.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class ItemDetailsEiendom extends StatelessWidget {
  const ItemDetailsEiendom({super.key});

  @override
  Widget build(BuildContext context) {
    ItemDetailsControllerImp controller = Get.put(ItemDetailsControllerImp());
    Get.put(StoriControllerImp());

    int eiendompris = controller.itemsModel.itemPris!;
    int omkostninger = controller.itemsModel.boligOmkostninger!;
    int fellesgjed = controller.itemsModel.andelFellesgjeld!;
    int totalpriseiendom = eiendompris + omkostninger + fellesgjed;
    String totalpriseiendomformated =
        NumberFormat.decimalPattern().format(totalpriseiendom);
    List<dynamic> eiendomdatavaiable = [
      "${controller.itemsModel.boligType}",
      controller.itemsModel.boligEieform,
      "${controller.itemsModel.antallSoverom}",
      "${controller.itemsModel.boligByggar}",
      "${controller.itemsModel.boligEnergikarakter}",
    ];

    int findNonEmptyIndex(List<dynamic> list, int targetIndex) {
      int countNonEmpty = 0;
      for (int i = 0; i < list.length; i++) {
        if (list[i] != null && list[i] != '' && list[i] != '0') {
          if (countNonEmpty == targetIndex) {
            return i;
          }
          countNonEmpty++;
        }
      }
      return -1;
    }

    FavoritController favoritController = Get.put(FavoritController());
    Get.put(MyFavoritController());

    final PageController pageController = PageController();
    pageController.addListener(() {
      controller.updateSelectedIndex(pageController.page?.round() ?? 0);
    });
    List<String>? imagePaths = controller.itemsModel.itemIamge?.split(',');

    return Scaffold(
      backgroundColor: Myisellcolors.home,
      appBar: AppBar(
        backgroundColor: Myisellcolors.home,
        iconTheme: const IconThemeData(color: Myisellcolors.hvit),
        elevation: 0,
        actions: [
          // SizedBox(
          //   width: 40,
          //   child: GetBuilder<FavoritController>(
          //     builder: (favcontroller) => Container(
          //       padding: const EdgeInsets.only(top: 5),
          //       child: IconButton(
          //         highlightColor: Colors.transparent,
          //         focusColor: Colors.transparent,
          //         hoverColor: Colors.transparent,
          //         splashColor: Colors.transparent,
          //         onPressed: () {
          //           favcontroller.toggleFavorite(favcontroller, controller);
          //         },
          //         icon: Icon(
          //           favcontroller.isFavorite[controller.itemsModel.itemId] == 1
          //               ? Icons.favorite
          //               : Icons.favorite_outline,
          //           color: Myisellcolors.hoved,
          //           size: 27,
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
          SizedBox(
            width: 40,
            child: GetBuilder<FavoritController>(
              builder: (favcontroller) => Container(
                padding: const EdgeInsets.only(top: 5),
                child: IconButton(
                  highlightColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  onPressed: () {
                    favcontroller.toggleFavorite(favcontroller, controller);
                  },
                  icon: Icon(
                    favcontroller.isFavorite[controller.itemsModel.itemId] == 1
                        ? Icons.favorite
                        : Icons.favorite_outline,
                    color: Myisellcolors.hoved,
                    size: 27,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Container(
              padding: const EdgeInsets.only(right: 10),
              child: const Icon(
                Icons.ios_share_rounded,
                color: Myisellcolors.hoved,
                size: 27,
              ))
        ],
      ),
      body: ListView(
        children: [
          // Stack(
          //   children: [
          //     FullScreenWidget(
          //       disposeLevel: DisposeLevel.Low,
          //       backgroundColor: Myisellcolors.hoved,
          //       backgroundIsTransparent: true,
          //       child: SizedBox(
          //         height: 230,
          //         // decoration: BoxDecoration(
          //         //   //color: Myisellcolors.home,
          //         //   border: Border.all(color: Myisellcolors.home),
          //         // ),
          //         child: Hero(
          //             transitionOnUserGestures: true,
          //             tag: "${controller.itemsModel.itemId}",
          //             child: PageView.builder(
          //               itemCount: itemDetailsControllerImp
          //                       .itemsModel?.itemIamge
          //                       ?.split(',')
          //                       ?.length ??
          //                   0,
          //               itemBuilder: (BuildContext context, int index) {
          //                 List<String>? imagePaths = itemDetailsControllerImp
          //                     .itemsModel?.itemIamge
          //                     ?.split(',');

          //                 if (imagePaths == null ||
          //                     index >= imagePaths.length) {
          //                   // Handle the case where imagePaths is null or index is out of bounds
          //                   return Container();
          //                 }

          //                 String myImg =
          //                     "${AppLink.imageitems}/${imagePaths[index]}";
          //                 return Padding(
          //                   padding: const EdgeInsets.all(8.0),
          //                   child: PhotoViewGallery.builder(
          //                     backgroundDecoration: const BoxDecoration(
          //                       color: Myisellcolors.picbg,
          //                     ),
          //                     itemCount: imagePaths.length,
          //                     pageController:
          //                         PageController(initialPage: index),
          //                     builder: (BuildContext context, int index) {
          //                       return PhotoViewGalleryPageOptions(
          //                         imageProvider: NetworkImage(
          //                           myImg, // Use the constructed URL with the base path
          //                           scale: 2.0,
          //                         ),
          //                       );
          //                     },
          //                   ),
          //                 );
          //               },
          //             )),
          //       ),
          //     ),
          //   ],
          // ),
          Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: 230,
                    margin: const EdgeInsets.only(left: 0, right: 0, bottom: 0),
                    decoration: BoxDecoration(
                      color: Myisellcolors.picbg,
                      border:
                          Border.all(color: Myisellcolors.picbg, width: 0.5),
                    ),
                    child: PageView.builder(
                      controller: pageController,
                      itemCount:
                          controller.itemsModel.itemIamge?.split(',').length ??
                              0,
                      itemBuilder: (BuildContext context, int index) {
                        List<String>? imagePaths =
                            controller.itemsModel.itemIamge?.split(',');

                        if (imagePaths == null || index >= imagePaths.length) {
                          return Container();
                        }

                        String myImg =
                            "${AppLink.imageitems}/${imagePaths[index]}";

                        return Padding(
                          padding: const EdgeInsets.all(0),
                          child: GestureDetector(
                            onTap: () {
                              showModalBottomSheet(
                                barrierColor: Myisellcolors.picbg,
                                backgroundColor: Colors.transparent,
                                context: context,
                                isScrollControlled: true,
                                builder: (BuildContext context) {
                                  PageController pageController =
                                      PageController(initialPage: index);
                                  return PhotoViewGallery.builder(
                                    backgroundDecoration: const BoxDecoration(
                                      color: Colors.transparent,
                                    ),
                                    itemCount: imagePaths.length,
                                    scrollPhysics:
                                        const BouncingScrollPhysics(),
                                    builder:
                                        (BuildContext context, int pageIndex) {
                                      return PhotoViewGalleryPageOptions(
                                        imageProvider: NetworkImage(
                                          "${AppLink.imageitems}/${imagePaths[pageIndex]}",
                                          scale: 2.0,
                                        ),
                                      );
                                    },
                                    pageController: pageController,
                                    onPageChanged: (pageIndex) {},
                                  );
                                },
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(myImg),
                                  fit: BoxFit.contain,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Positioned(
                    top: 10,
                    right: 10,
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.7),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Obx(() {
                        return Text(
                          "${controller.selectedImageIndex.value + 1}/${controller.itemsModel.itemIamge?.split(',').length}",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                          ),
                        );
                      }),
                    ),
                  ),
                ],
              ),
              imagePaths!.length != 1 && imagePaths.isNotEmpty
                  ? SizedBox(
                      height: 100,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.itemsModel.itemIamge
                                ?.split(',')
                                .length ??
                            0,
                        itemBuilder: (BuildContext context, int index) {
                          List<String>? imagePaths =
                              controller.itemsModel.itemIamge?.split(',');

                          if (imagePaths == null ||
                              index >= imagePaths.length) {
                            return Container();
                          }

                          String myImg =
                              "${AppLink.imageitems}/${imagePaths[index]}";

                          return Padding(
                            padding: const EdgeInsets.only(
                                left: 5, right: 5, top: 8, bottom: 5),
                            child: GestureDetector(
                              onTap: () {
                                controller.updateSelectedIndex(index);
                                pageController.jumpToPage(index);
                              },
                              child: Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(myImg),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  : const SizedBox()
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              controller.itemsModel.itemName!.isNotEmpty
                  ? Container(
                      margin: const EdgeInsets.only(left: 8, top: 10, right: 8),
                      child: Text(
                        controller.itemsModel.itemName!,
                        overflow: TextOverflow.clip,
                        style: GoogleFonts.roboto(
                          color: Myisellcolors.hoved,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    )
                  : Container(),
              Container(
                padding: const EdgeInsets.only(left: 8, right: 8, top: 10),
                child: Text(
                  controller.itemsModel.itemBeskrivelse!,
                  style: GoogleFonts.roboto(
                      color: Myisellcolors.hvit, fontSize: 15, height: 1.4),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Container(
                padding: const EdgeInsets.only(
                    left: 6, right: 8, top: 8, bottom: 15),
                child: RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Totalpris ',
                        style: GoogleFonts.roboto(
                          textStyle: const TextStyle(
                            fontSize: 18,
                            color: Myisellcolors.hvit70,
                            inherit: false,
                          ),
                        ),
                      ),
                      TextSpan(
                        text: '$totalpriseiendomformated NOK',
                        style: GoogleFonts.roboto(
                          textStyle: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              inherit: false,
                              color: Myisellcolors.hvit),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 8, right: 8, bottom: 13),
                child: RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Pris på lån ',
                        style: GoogleFonts.roboto(
                          textStyle: const TextStyle(
                            fontSize: 15,
                            color: Myisellcolors.hvit70,
                            inherit: false,
                          ),
                        ),
                      ),
                      TextSpan(
                        text: 'fra 11000 kr/mnd',
                        style: GoogleFonts.roboto(
                          textStyle: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                              inherit: false),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 5, bottom: 10, right: 5),
                child: InkWell(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.pin_drop_outlined,
                            color: Myisellcolors.hoved,
                            size: 17,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            "${controller.itemsModel.itemBy}, ${controller.itemsModel.itemPostn}",
                            style: GoogleFonts.roboto(
                                color: Myisellcolors.hoved,
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      controller.itemsModel.boligLokalOmrade!.isNotEmpty
                          ? Container(
                              padding: const EdgeInsets.only(left: 5),
                              child: Text(
                                "(${controller.itemsModel.boligLokalOmrade})",
                                overflow: TextOverflow.clip,
                                style: GoogleFonts.roboto(
                                  color: Myisellcolors.hoved,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15,
                                ),
                              ),
                            )
                          : Container(),
                      const Spacer(),
                    ],
                  ),
                ),
              ),
              "${controller.itemsModel.itemLikt!}" != "0"
                  ? Container(
                      padding: const EdgeInsets.only(left: 5, bottom: 10),
                      child: Text(
                        "${controller.itemsModel.itemLikt!} som likte eiendommen",
                        overflow: TextOverflow.clip,
                        style: GoogleFonts.roboto(
                          color: Myisellcolors.hvit70,
                          fontSize: 15,
                        ),
                      ),
                    )
                  : const SizedBox(),
              Container(
                padding: const EdgeInsets.only(left: 8, right: 8),
                height: Get.height / 8.9,
                child: ListView.separated(
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      width: 10,
                    );
                  },
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    int nonEmptyIndex =
                        findNonEmptyIndex(eiendomdatavaiable, index);
                    if (nonEmptyIndex != -1) {
                      return Container(
                        padding: const EdgeInsets.only(left: 8),
                        width: 110,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Myisellcolors.hvit70, width: 0.6),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.only(top: 5),
                              child: Text(
                                controller.eiendomdata[nonEmptyIndex],
                                style: GoogleFonts.roboto(
                                  color: Myisellcolors.hvit70,
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(top: 9, bottom: 1),
                              width: 27,
                              child: Image.asset(
                                controller.eiendomdatapic[nonEmptyIndex],
                                color: Myisellcolors.hvit,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(
                                top: eiendomdatavaiable[nonEmptyIndex] ==
                                        "Garasje/Parkering"
                                    ? 10
                                    : 8,
                              ),
                              child: Text(
                                eiendomdatavaiable[nonEmptyIndex],
                                style: GoogleFonts.roboto(
                                  fontSize: eiendomdatavaiable[nonEmptyIndex] ==
                                          "Garasje/Parkering"
                                      ? 11
                                      : 13,
                                  color: Myisellcolors.hvit,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    } else {
                      return Container();
                    }
                  },
                  itemCount: eiendomdatavaiable
                      .where(
                          (item) => item != null && item != '' && item != '0')
                      .length,
                ),
              ),
            ],
          ),
          const MyDivador(),
          Container(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: Text(
              "Pris informasjon",
              style: GoogleFonts.roboto(
                  color: Myisellcolors.hvit,
                  fontSize: 20,
                  fontWeight: FontWeight.w500),
            ),
          ),
          PrisEiendomdata(),
          const MyDivador(),
          controller.itemsModel.omkostningerInkluderer!.isNotEmpty ||
                  controller.itemsModel.fellesKostnaderinkluderer!.isNotEmpty
              ? Column(
                  children: [
                    CustomClickableRow(
                      name: "Prisbeskrivlse",
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 80,
                            decoration: const BoxDecoration(
                                color: Myisellcolors.appbar,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10))),
                            padding: const EdgeInsets.only(left: 14, right: 5),
                            child: Row(
                              children: [
                                Text(
                                  "Prisbeskrivelse",
                                  style: GoogleFonts.roboto(
                                    color: Myisellcolors.hvit,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const Spacer(),
                                IconButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon: const Icon(
                                    Icons.close,
                                    color: Myisellcolors.hvit,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: SingleChildScrollView(
                              physics: const ScrollPhysics(),
                              child: Container(
                                padding: const EdgeInsets.only(
                                    top: 15, left: 10, right: 10, bottom: 40),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    controller.itemsModel
                                            .omkostningerInkluderer!.isNotEmpty
                                        ? Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Omkostninger",
                                                style: GoogleFonts.roboto(
                                                    color: Myisellcolors.hvit,
                                                    fontSize: 22,
                                                    height: 1.5),
                                              ),
                                              Text(
                                                controller.itemsModel
                                                    .omkostningerInkluderer!,
                                                textAlign: TextAlign.start,
                                                style: GoogleFonts.roboto(
                                                    color: Myisellcolors.hvit,
                                                    fontSize: 17,
                                                    height: 1.5),
                                              ),
                                            ],
                                          )
                                        : const SizedBox(),
                                    SizedBox(
                                      height: controller
                                              .itemsModel
                                              .omkostningerInkluderer!
                                              .isNotEmpty
                                          ? 50
                                          : 0,
                                    ),
                                    controller
                                            .itemsModel
                                            .fellesKostnaderinkluderer!
                                            .isNotEmpty
                                        ? Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Felleskostnader",
                                                style: GoogleFonts.roboto(
                                                    color: Myisellcolors.hvit,
                                                    fontSize: 22,
                                                    height: 1.5),
                                              ),
                                              Text(
                                                controller.itemsModel
                                                    .fellesKostnaderinkluderer!,
                                                textAlign: TextAlign.start,
                                                style: GoogleFonts.roboto(
                                                    color: Myisellcolors.hvit,
                                                    fontSize: 17,
                                                    height: 1.5),
                                              ),
                                            ],
                                          )
                                        : const SizedBox(),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: 50,
                            color: Myisellcolors.appbar,
                          )
                        ],
                      ),
                    ),
                    const MyDivador(),
                  ],
                )
              : const SizedBox(),
          Container(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              controller.itemsModel.salgLeie == "Til leie"
                  ? "Generelle informasjon"
                  : "Areal informasjon",
              style: GoogleFonts.roboto(
                  color: Myisellcolors.hvit,
                  fontSize: 20,
                  fontWeight: FontWeight.w500),
            ),
          ),
          GenerellEiendomdata(),
          const MyDivador(),
          controller.itemsModel.boligArealbeskribelse!.isNotEmpty
              ? Column(
                  children: [
                    CustomClickableRow(
                      name: "Arealbeskrivelse",
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 80,
                            decoration: const BoxDecoration(
                                color: Myisellcolors.appbar,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10))),
                            padding: const EdgeInsets.only(left: 14, right: 5),
                            child: Row(
                              children: [
                                Text(
                                  "Arealbeskrivelse",
                                  style: GoogleFonts.roboto(
                                    color: Myisellcolors.hvit,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const Spacer(),
                                IconButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon: const Icon(
                                    Icons.close,
                                    color: Myisellcolors.hvit,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: SingleChildScrollView(
                              physics: const ScrollPhysics(),
                              child: Container(
                                padding: const EdgeInsets.only(
                                    top: 15, left: 10, right: 10, bottom: 40),
                                child: Text(
                                  controller.itemsModel.boligArealbeskribelse!,
                                  textAlign: TextAlign.start,
                                  style: GoogleFonts.roboto(
                                      color: Myisellcolors.hvit,
                                      fontSize: 20,
                                      height: 1.5),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: 50,
                            color: Myisellcolors.appbar,
                          ),
                        ],
                      ),
                    ),
                    const MyDivador(),
                  ],
                )
              : const SizedBox(),
          controller.itemsModel.salgLeie != "Til leie"
              ? Container(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    "Adresse informasjon",
                    style: GoogleFonts.roboto(
                        color: Myisellcolors.hvit,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                )
              : const SizedBox(),
          AdresseEiendomdata(),
          controller.itemsModel.boligAdkomst!.isNotEmpty
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const MyDivador(),
                    Container(
                      padding: const EdgeInsets.only(left: 8, right: 8, top: 0),
                      child: Text(
                        "Adkomst",
                        style: GoogleFonts.roboto(
                            color: Myisellcolors.hvit,
                            fontSize: 22,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    Container(
                      padding:
                          const EdgeInsets.only(left: 8, right: 8, bottom: 30),
                      child: Text(
                        "${controller.itemsModel.boligAdkomst}",
                        style: GoogleFonts.roboto(
                            color: Myisellcolors.hvit, fontSize: 16),
                      ),
                    ),
                  ],
                )
              : const SizedBox(),
          controller.itemsModel.boligBeliggenhet!.isNotEmpty
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(left: 8, right: 8),
                      child: Text(
                        "Beliggenhet",
                        style: GoogleFonts.roboto(
                            color: Myisellcolors.hvit,
                            fontSize: 22,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    Container(
                      padding:
                          const EdgeInsets.only(left: 8, right: 8, bottom: 30),
                      child: Text(
                        "${controller.itemsModel.boligBeliggenhet}",
                        style: GoogleFonts.roboto(
                            color: Myisellcolors.hvit, fontSize: 16),
                      ),
                    ),
                  ],
                )
              : const SizedBox(),
          controller.itemsModel.boligFasiliteter!.isNotEmpty &&
                      controller.itemsModel.boligFasiliteter != "0" ||
                  controller.itemsModel.fasiliteterLeie!.isNotEmpty &&
                      controller.itemsModel.fasiliteterLeie != "0"
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding:
                          const EdgeInsets.only(left: 8, right: 8, top: 10),
                      child: Text(
                        "Fasiliteter",
                        style: GoogleFonts.roboto(
                            color: Myisellcolors.hvit,
                            fontSize: 22,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    Eiendomfasilitet(),
                    EiendomfasilitetLeie()
                  ],
                )
              : Container(),

          controller.itemsModel.salgLeie == "Til leie"
              ? const SizedBox()
              : const MyDivador(),
          BorettslagetEiendomdata(),
          controller.itemsModel.boligUrlLink!.isNotEmpty
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding:
                          const EdgeInsets.only(left: 8, right: 8, top: 30),
                      child: Text(
                        "Eindommens URL link:",
                        style: GoogleFonts.roboto(
                          color: Myisellcolors.hvit,
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Container(
                      padding:
                          const EdgeInsets.only(left: 8, right: 8, top: 10),
                      child: Text(
                        "${controller.itemsModel.boligUrlLink}",
                        maxLines: 10,
                        style: GoogleFonts.roboto(
                          color: Myisellcolors.hvit,
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                )
              : const SizedBox(),

          controller.itemsModel.boligBeskrivelse!.isNotEmpty
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const MyDivador(),
                    CustomClickableRow(
                      name: "Eindommens beskrivelse",
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 80,
                            decoration: const BoxDecoration(
                                color: Myisellcolors.appbar,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10))),
                            padding: const EdgeInsets.only(left: 14, right: 5),
                            child: Row(
                              children: [
                                Text(
                                  "Eindommens beskrivelse",
                                  style: GoogleFonts.roboto(
                                    color: Myisellcolors.hvit,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const Spacer(),
                                IconButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon: const Icon(
                                    Icons.close,
                                    color: Myisellcolors.hvit,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: SingleChildScrollView(
                              physics: const ScrollPhysics(),
                              child: Container(
                                padding: const EdgeInsets.only(
                                    top: 15, left: 10, right: 10, bottom: 40),
                                child: Text(
                                  controller.itemsModel.boligBeskrivelse!,
                                  style: GoogleFonts.roboto(
                                      color: Myisellcolors.hvit, fontSize: 20),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: 50,
                            color: Myisellcolors.appbar,
                          )
                        ],
                      ),
                    ),
                    const MyDivador(),
                  ],
                )
              : const SizedBox(),

          controller.itemsModel.inkludertiLeie!.isNotEmpty
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding:
                          const EdgeInsets.only(left: 8, right: 8, bottom: 10),
                      child: Text(
                        "Inkludert i husleie",
                        style: GoogleFonts.roboto(
                            color: Myisellcolors.hvit,
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    Container(
                      padding:
                          const EdgeInsets.only(left: 8, right: 8, bottom: 35),
                      child: Text(
                        "${controller.itemsModel.inkludertiLeie}",
                        style: GoogleFonts.roboto(
                            color: Myisellcolors.hvit, fontSize: 16),
                      ),
                    ),
                  ],
                )
              : const SizedBox(),
          controller.itemsModel.boligTilleggsinfo!.isNotEmpty
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding:
                          const EdgeInsets.only(left: 8, right: 8, bottom: 10),
                      child: Text(
                        "Tilleggsopplysninger",
                        style: GoogleFonts.roboto(
                            color: Myisellcolors.hvit,
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    Container(
                      padding:
                          const EdgeInsets.only(left: 8, right: 8, bottom: 35),
                      child: Text(
                        "${controller.itemsModel.boligTilleggsinfo}",
                        style: GoogleFonts.roboto(
                            color: Myisellcolors.hvit, fontSize: 16),
                      ),
                    ),
                  ],
                )
              : const SizedBox(),
          controller.itemsModel.visningDato!.isNotEmpty ||
                  controller.itemsModel.fraKlokke!.isNotEmpty ||
                  controller.itemsModel.tilKlokke!.isNotEmpty ||
                  controller.itemsModel.visningMerknad!.isNotEmpty
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(left: 8, right: 8),
                      child: Text(
                        "Visnings informasjon",
                        style: GoogleFonts.roboto(
                            color: Myisellcolors.hvit,
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(bottom: 40),
                      child: VisningEiendomdata(),
                    ),
                  ],
                )
              : const SizedBox(),
          Container(
            padding: const EdgeInsets.only(left: 7, top: 0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Myisellcolors.hoved)),
                  child: CircleAvatar(
                      radius: 20,
                      backgroundColor: Myisellcolors.appbar,
                      child: controller.itemsModel.userImage!.isNotEmpty
                          ? ClipOval(
                              child: CachedNetworkImage(
                                fit: BoxFit.fill,
                                imageBuilder: (context, imageProvider) =>
                                    PhotoView(
                                  minScale: 0.1,
                                  maxScale: 0.1,
                                  disableGestures: true,
                                  imageProvider: imageProvider,
                                  filterQuality: FilterQuality.high,
                                ),
                                imageUrl:
                                    "${AppLink.imageuser}/${controller.itemsModel.userImage}",
                              ),
                            )
                          : const Icon(
                              Icons.person,
                              color: Myisellcolors.hvit70,
                              size: 25,
                            )),
                ),
                const SizedBox(
                  width: 10,
                ),
                controller.itemsModel.itemSelger!.isNotEmpty
                    ? Text(
                        controller.itemsModel.itemSelger!,
                        style: GoogleFonts.roboto(
                          color: Myisellcolors.hvit,
                          fontSize: 23,
                        ),
                      )
                    : Text(
                        controller.itemsModel.userFname!,
                        style: GoogleFonts.roboto(
                          color: Myisellcolors.hvit,
                          fontSize: 23,
                        ),
                      ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.only(left: 8, right: 8, top: 10),
                child: Text(
                  "Kontaktperson",
                  style: GoogleFonts.roboto(
                    color: Myisellcolors.hvit,
                    fontSize: 16,
                  ),
                ),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.only(left: 8, right: 8, top: 10),
                child: controller.itemsModel.kontaktPerson!.isNotEmpty
                    ? Text(
                        controller.itemsModel.kontaktPerson!,
                        style: GoogleFonts.roboto(
                          color: Myisellcolors.hvit,
                          fontSize: 16,
                        ),
                      )
                    : Text(
                        controller.itemsModel.userFname!,
                        style: GoogleFonts.roboto(
                          color: Myisellcolors.hvit,
                          fontSize: 16,
                        ),
                      ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.only(left: 8, right: 8, top: 10),
                child: Text(
                  "Vurdering",
                  style: GoogleFonts.roboto(
                    color: Myisellcolors.hvit,
                    fontSize: 16,
                  ),
                ),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.only(left: 8, right: 8, top: 10),
                child: Text(
                  "11 vurderinger (*****)",
                  style: GoogleFonts.roboto(
                    color: Myisellcolors.hvit,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.only(left: 8, right: 8, top: 10),
                child: Text(
                  "Telefon",
                  style: GoogleFonts.roboto(
                    color: Myisellcolors.hvit,
                    fontSize: 16,
                  ),
                ),
              ),
              const Spacer(),
              "${controller.itemsModel.boligTelefon}" == "0"
                  ? Container(
                      padding:
                          const EdgeInsets.only(left: 8, right: 8, top: 10),
                      child: Text(
                        "+47 ${controller.itemsModel.userPhone!}",
                        style: GoogleFonts.roboto(
                          color: Myisellcolors.hoved,
                          fontSize: 16,
                        ),
                      ),
                    )
                  : Container(
                      padding:
                          const EdgeInsets.only(left: 8, right: 8, top: 10),
                      child: Text(
                        "+47 ${controller.itemsModel.boligTelefon!}",
                        style: GoogleFonts.roboto(
                          color: Myisellcolors.hoved,
                          fontSize: 16,
                        ),
                      ),
                    )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.only(left: 8, right: 8, top: 10),
                child: Text(
                  "Anonnsens kode",
                  style: GoogleFonts.roboto(
                    color: Myisellcolors.hvit,
                    fontSize: 16,
                  ),
                ),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.only(left: 8, right: 8, top: 10),
                child: Text(
                  "${controller.itemsModel.itemId}",
                  style: GoogleFonts.roboto(
                    color: Myisellcolors.hvit,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.only(left: 8, right: 8, top: 10),
                child: Text(
                  "Anonnsen opprettet",
                  style: GoogleFonts.roboto(
                    color: Myisellcolors.hvit,
                    fontSize: 16,
                  ),
                ),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.only(left: 8, right: 8, top: 10),
                child: Text(
                  controller.itemsModel.itemDato!,
                  style: GoogleFonts.roboto(
                    color: Myisellcolors.hvit,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          "${controller.itemsModel.boligTelefon}" != "0"
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IsellButtons(
                      size: Size(Get.width / 2.2, Get.height / 17),
                      name: "Ring",
                      onPresset: () {},
                      alignmen: Alignment.center,
                      borderradius: 10,
                      fontsize: 17,
                      bgcolor: Myisellcolors.hoved,
                      icon: Icons.phone,
                      iconsize: 19.0,
                      widthbetweeniconandtext: Get.width / 30,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    IsellButtons(
                      size: Size(Get.width / 2.2, Get.height / 17),
                      name: "Melding",
                      onPresset: () {},
                      alignmen: Alignment.center,
                      borderradius: 10,
                      fontsize: 17,
                      bgcolor: Myisellcolors.hoved,
                      icon: Icons.mail_outline,
                      iconsize: 19.0,
                      widthbetweeniconandtext: Get.width / 30,
                    ),
                  ],
                )
              : IsellButtons(
                  size: Size(Get.width / 1.5, Get.height / 20),
                  name: "Melding",
                  onPresset: () {},
                  alignmen: Alignment.center,
                  borderradius: 10,
                  fontsize: 17,
                  bgcolor: Myisellcolors.hoved,
                ),
          const MyDivador(),
          Container(
            padding: const EdgeInsets.only(left: 8, right: 8, bottom: 5),
            child: Text(
              "${controller.itemsModel.itemGata!}, ${controller.itemsModel.itemPostn} ${controller.itemsModel.itemBy}",
              style: GoogleFonts.roboto(
                color: Myisellcolors.hvit,
                fontSize: 16,
              ),
            ),
          ),
          Container(
            height: 200,
            margin: const EdgeInsets.only(left: 8, right: 8, top: 10),
            decoration: BoxDecoration(
                border: Border.all(color: Myisellcolors.hoved),
                borderRadius: BorderRadius.circular(10)),
          ),
          InkWell(
            child: Container(
              padding: const EdgeInsets.only(left: 8, right: 8, top: 15),
              child: Text(
                "Rapporter svindel/feil i annonsen",
                style: GoogleFonts.roboto(
                  color: Myisellcolors.hoved,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          const MyDivador(),
          Container(
            padding: const EdgeInsets.only(left: 8, right: 8, bottom: 5),
            child: Text(
              "Lignende eiendommer",
              style: GoogleFonts.roboto(
                color: Myisellcolors.hvit,
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
