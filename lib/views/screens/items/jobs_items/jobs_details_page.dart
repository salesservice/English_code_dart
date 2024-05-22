import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_isell_new/controller/favorite/favorite_controller.dart';
import 'package:flutter_isell_new/controller/itemdeatails_controller.dart';
import 'package:flutter_isell_new/controller/stories/stories_controller.dart';
import 'package:flutter_isell_new/core/constants/sellx_colors.dart';
import 'package:flutter_isell_new/sellx_link_api.dart';
import 'package:flutter_isell_new/views/screens/items/jobs_items/cantact_job_data.dart';
import 'package:flutter_isell_new/views/widget/custom_drawer.dart';
import 'package:flutter_isell_new/views/widget/my_divador.dart';
import 'package:flutter_isell_new/views/widget/sellx_%20buttons.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

import 'essential_jobs_details.dart';

class ItemDetailsJobb extends StatelessWidget {
  const ItemDetailsJobb({super.key});

  @override
  Widget build(BuildContext context) {
    ItemDetailsControllerImp controller = Get.put(ItemDetailsControllerImp());
    Get.put(StoriControllerImp());

    // int eiendompris = controller.itemsModel.itemPris!;
    // int omkostninger = controller.itemsModel.omregnetAvgift!;
    // int fellesgjed = controller.itemsModel.andelFellesgjeld!;
    // int totalpriseiendom = eiendompris + omkostninger + fellesgjed;
    // String totalpriseiendomformated =
    //     NumberFormat.decimalPattern().format(totalpriseiendom);
    List<dynamic> jobbdatavaiable = [
      "${controller.itemsModel.jobbAnsettelsesform}",
      "${controller.itemsModel.jobbSektor}",
      "${controller.itemsModel.jobbFirma}",
      "${controller.itemsModel.jobbAntllstillinger}",
      "${controller.itemsModel.jobbFrist}",
    ];

    final PageController pageController = PageController();
    pageController.addListener(() {
      controller.updateSelectedIndex(pageController.page?.round() ?? 0);
    });
    List<String>? imagePaths = controller.itemsModel.itemIamge?.split(',');

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

    return Scaffold(
      backgroundColor: Myisellcolors.home,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Myisellcolors.hvit),
        backgroundColor: Myisellcolors.home,
        elevation: 0,
        actions: [
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
                          color: Myisellcolors.hvit,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    )
                  : const SizedBox(),
              Container(
                padding: const EdgeInsets.only(left: 8, right: 8, top: 10),
                child: Text(
                  controller.itemsModel.itemBeskrivelse!,
                  style: GoogleFonts.roboto(
                      color: Myisellcolors.hvit, fontSize: 15, height: 1.4),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Container(
                padding: const EdgeInsets.only(left: 5, bottom: 20, right: 5),
                child: InkWell(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.pin_drop_outlined,
                            color: Myisellcolors.hoved,
                            size: 17,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          controller.itemsModel.itemBy!.isNotEmpty &&
                                  controller.itemsModel.itemPostn!.isNotEmpty
                              ? Text(
                                  "${controller.itemsModel.itemBy}${controller.itemsModel.itemPostn}",
                                  style: GoogleFonts.roboto(
                                      color: Myisellcolors.hoved,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                )
                              : const SizedBox()
                        ],
                      ),
                      const Spacer(),
                      "${controller.itemsModel.itemLikt!}" != "0"
                          ? Text(
                              "${controller.itemsModel.itemLikt!} ${controller.itemsModel.itemLikt! == 1 ? "interesset" : "interessete"} i stllingen",
                              overflow: TextOverflow.clip,
                              style: GoogleFonts.roboto(
                                color: Myisellcolors.hvit70,
                                fontSize: 15,
                              ),
                            )
                          : const SizedBox()
                    ],
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 8, right: 8),
                height: Get.height / 8.9,
                child: ListView.separated(
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      width: jobbdatavaiable[index] != null &&
                              jobbdatavaiable[index] != "0 hk" &&
                              jobbdatavaiable[index] != "" &&
                              jobbdatavaiable[index] != "0" &&
                              jobbdatavaiable[index] != "hk"
                          ? 10
                          : 10,
                    );
                  },
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    int nonEmptyIndex =
                        findNonEmptyIndex(jobbdatavaiable, index);
                    if (nonEmptyIndex != -1 &&
                        jobbdatavaiable[nonEmptyIndex] != "0 hk" &&
                        jobbdatavaiable[nonEmptyIndex] != "0" &&
                        jobbdatavaiable[nonEmptyIndex] != "" &&
                        jobbdatavaiable[nonEmptyIndex] != null) {
                      return Container(
                        padding: const EdgeInsets.only(left: 8, right: 20),
                        //  width: 125,
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
                                controller.jobbdata[nonEmptyIndex],
                                style: GoogleFonts.roboto(
                                  color: Myisellcolors.hvit70,
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(top: 9, bottom: 1),
                              width: 27,
                              child: Image.asset(
                                controller.jobbdatapic[nonEmptyIndex],
                                color: Myisellcolors.hvit,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(top: 8),
                              child: Text(
                                jobbdatavaiable[nonEmptyIndex],
                                style: GoogleFonts.roboto(
                                  fontSize: 13,
                                  color: Myisellcolors.hvit,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    } else {
                      return SizedBox();
                    }
                  },
                  itemCount: jobbdatavaiable.length,
                ),
              ),
            ],
          ),
          const MyDivador(),
          Container(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: Text(
              "Stillings informasjon",
              style: GoogleFonts.roboto(
                  color: Myisellcolors.hvit,
                  fontSize: 20,
                  fontWeight: FontWeight.w500),
            ),
          ),
          Jobbdata(),
          const MyDivador(),
          controller.itemsModel.jobbBeskrivelse!.isNotEmpty
              ? Column(
                  children: [
                    CustomClickableRow(
                      name: "Stillingsbeskrivelse",
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
                                  "Stillingsbeskrivelse",
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
                                    Text(
                                      controller.itemsModel.jobbBeskrivelse!,
                                      textAlign: TextAlign.start,
                                      style: GoogleFonts.roboto(
                                          color: Myisellcolors.hvit,
                                          fontSize: 17,
                                          height: 1.5),
                                    )
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
              "Kontakt informasjon",
              style: GoogleFonts.roboto(
                  color: Myisellcolors.hvit,
                  fontSize: 20,
                  fontWeight: FontWeight.w500),
            ),
          ),
          JobbKontaktdata(),
          const MyDivador(),
          controller.itemsModel.jobbOmarbeidsgiver!.isNotEmpty
              ? Column(
                  children: [
                    CustomClickableRow(
                      name: "Arbeidsgiveren",
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
                                  "Arbeidsgiveren",
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
                                  controller.itemsModel.jobbOmarbeidsgiver!,
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
                Text(
                  controller.itemsModel.jobbFirma!,
                  style: GoogleFonts.roboto(
                    color: Myisellcolors.hvit,
                    fontSize: 23,
                  ),
                )
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
                  "Hjemmeside",
                  style: GoogleFonts.roboto(
                    color: Myisellcolors.hvit,
                    fontSize: 16,
                  ),
                ),
              ),
              const Spacer(),
              Container(
                  padding: const EdgeInsets.only(left: 8, right: 8, top: 10),
                  child: InkWell(
                    child: Text(
                      controller.itemsModel.jobbHjemmeside!,
                      style: GoogleFonts.roboto(
                        color: Myisellcolors.hoved,
                        fontSize: 16,
                      ),
                    ),
                  )),
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
              "${controller.itemsModel.itemTelefon}" == "0"
                  ? Container(
                      padding:
                          const EdgeInsets.only(left: 8, right: 8, top: 10),
                      child: Text(
                        "+47 ${controller.itemsModel.jobbTelefonkontaktpers!}",
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
                        "+47 ${controller.itemsModel.itemTelefon!}",
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
          "${controller.itemsModel.itemTelefon}" != "0" ||
                  "${controller.itemsModel.jobbTelefonkontaktpers}" != "0"
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
                      size: Size(
                          "${controller.itemsModel.itemTelefon}" != "0"
                              ? Get.width / 2.05
                              : Get.width / 1.1,
                          "${controller.itemsModel.itemTelefon}" != "0"
                              ? Get.height / 17
                              : Get.height / 17),
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
                  size: Size(
                      "${controller.itemsModel.itemTelefon}" != "0"
                          ? Get.width / 2.05
                          : Get.width / 1.05,
                      "${controller.itemsModel.itemTelefon}" != "0"
                          ? Get.height / 17
                          : Get.height / 17),
                  name: "Melding",
                  onPresset: () {},
                  alignmen: Alignment.center,
                  borderradius: 10,
                  fontsize: 17,
                  bgcolor: Myisellcolors.hoved,
                ),
          const SizedBox(
            height: 10,
          ),
          controller.itemsModel.jobbSoknad!.isNotEmpty
              ? Container(
                  margin: const EdgeInsets.only(left: 8, right: 8),
                  child: IsellButtons(
                    size: const Size(410, 50),
                    name: "Send søknad",
                    onPresset: () {},
                    alignmen: Alignment.center,
                    borderradius: 10,
                    fontsize: 17,
                    bgcolor: Myisellcolors.hoved,
                  ),
                )
              : const SizedBox(),
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
