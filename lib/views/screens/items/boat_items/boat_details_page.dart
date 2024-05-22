import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_isell_new/controller/favorite/favorite_controller.dart';
import 'package:flutter_isell_new/controller/itemdeatails_controller.dart';
import 'package:flutter_isell_new/controller/stories/stories_controller.dart';
import 'package:flutter_isell_new/core/constants/sellx_colors.dart';
import 'package:flutter_isell_new/sellx_link_api.dart';
import 'package:flutter_isell_new/views/screens/items/boat_items/essential_boat_details.dart';
import 'package:flutter_isell_new/views/widget/custom_drawer.dart';
import 'package:flutter_isell_new/views/widget/my_divador.dart';
import 'package:flutter_isell_new/views/widget/sellx_%20buttons.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class ItemDetailsBoat extends StatelessWidget {
  const ItemDetailsBoat({super.key});

  @override
  Widget build(BuildContext context) {
    ItemDetailsControllerImp controller = Get.put(ItemDetailsControllerImp());
    Get.put(StoriControllerImp());

    int totalpris = controller.itemsModel.itemPris!;
    String totalprisfromated = NumberFormat.decimalPattern().format(totalpris);
    List<dynamic> boatdatavaiable = [
      "${controller.itemsModel.boatMotortype}",
      "${controller.itemsModel.boatlengdeFot} fot",
      controller.itemsModel.boatDrivstoff,
      "${controller.itemsModel.boatModellar}",
      "${controller.itemsModel.boatHk} hk",
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

    final PageController pageController = PageController();
    pageController.addListener(() {
      controller.updateSelectedIndex(pageController.page?.round() ?? 0);
    });
    List<String>? imagePaths = controller.itemsModel.itemIamge?.split(',');

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
                        return controller.itemsModel.itemIamge!.isNotEmpty &&
                                imagePaths.isNotEmpty
                            ? Padding(
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
                                          backgroundDecoration:
                                              const BoxDecoration(
                                            color: Colors.transparent,
                                          ),
                                          itemCount: imagePaths.length,
                                          scrollPhysics:
                                              const BouncingScrollPhysics(),
                                          builder: (BuildContext context,
                                              int pageIndex) {
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
                              )
                            : Center(
                                child: Image.asset(
                                  "assets/images/logoen-removebg.png",
                                  fit: BoxFit.contain,
                                  width: 100,
                                  height: 100,
                                ),
                              );
                      },
                    ),
                  ),
                  controller.itemsModel.itemIamge!.isNotEmpty &&
                          imagePaths!.length != 1
                      ? Positioned(
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
                        )
                      : SizedBox()
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
              controller.itemsModel.boatMerke!.isNotEmpty &&
                      controller.itemsModel.boatModell!.isNotEmpty
                  ? Container(
                      margin: const EdgeInsets.only(left: 8, top: 10, right: 8),
                      child: Text(
                        "${controller.itemsModel.boatMerke!} ${controller.itemsModel.boatModell!.isNotEmpty ? '(${controller.itemsModel.boatModell})' : ''} ",
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
                        text: '$totalprisfromated NOK',
                        style: GoogleFonts.roboto(
                          textStyle: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
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
                      const Spacer(),
                      "${controller.itemsModel.itemLikt!}" != "0"
                          ? Text(
                              "${controller.itemsModel.itemLikt!} som likte varen",
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
              "${controller.itemsModel.boatMotortype}".isNotEmpty &&
                      "${controller.itemsModel.boatlengdeFot} fot".isNotEmpty &&
                      controller.itemsModel.boatDrivstoff!.isNotEmpty &&
                      "${controller.itemsModel.boatModellar}".isNotEmpty &&
                      "${controller.itemsModel.boatHk} hk".isNotEmpty
                  ? Container(
                      padding: const EdgeInsets.only(left: 8, right: 8),
                      height: Get.height / 8.9,
                      child: ListView.separated(
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            width: boatdatavaiable[index] != null &&
                                    boatdatavaiable[index] != "0 hk" &&
                                    boatdatavaiable[index] != "" &&
                                    boatdatavaiable[index] != "0" &&
                                    boatdatavaiable[index] != "hk" &&
                                    boatdatavaiable[index] != "0 hk"
                                ? 10
                                : 0,
                          );
                        },
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          int nonEmptyIndex =
                              findNonEmptyIndex(boatdatavaiable, index);
                          if (nonEmptyIndex != -1 &&
                              boatdatavaiable[nonEmptyIndex] != "0 hk" &&
                              boatdatavaiable[nonEmptyIndex] != "0" &&
                              boatdatavaiable[nonEmptyIndex] != "0 fot" &&
                              boatdatavaiable[nonEmptyIndex] != null &&
                              boatdatavaiable[index] != "0 hk" &&
                              boatdatavaiable[index] != "fot" &&
                              boatdatavaiable[index] != "Elektrisitet") {
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
                                      controller.boatdata[nonEmptyIndex],
                                      style: GoogleFonts.roboto(
                                        color: Myisellcolors.hvit70,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.only(
                                        top: 9, bottom: 1),
                                    width: 27,
                                    child: Image.asset(
                                      controller.boatdatapic[nonEmptyIndex],
                                      color: Myisellcolors.hvit,
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.only(top: 8),
                                    child: Text(
                                      boatdatavaiable[nonEmptyIndex],
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
                            return const SizedBox();
                          }
                        },
                        itemCount: boatdatavaiable.length,
                      ),
                    )
                  : const SizedBox()
            ],
          ),
          const MyDivador(),
          Container(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              "Essensielle Data",
              style: GoogleFonts.roboto(
                  color: Myisellcolors.hvit,
                  fontSize: 20,
                  fontWeight: FontWeight.w500),
            ),
          ),
          EssensielleBoatdata(),
          const MyDivador(),
          controller.itemsModel.boatUtstyr!.isNotEmpty
              ? CustomClickableRow(
                  name: "Utstyr",
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
                              "Utstyr",
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
                              controller.itemsModel.boatUtstyr!,
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
                )
              : const SizedBox(),
          controller.itemsModel.boatUtstyr!.isNotEmpty
              ? const MyDivador()
              : const SizedBox(),
          controller.itemsModel.boatBeskrivevlse!.isNotEmpty
              ? CustomClickableRow(
                  name: "Beskrivelse",
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
                              "Beskrivelse",
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
                              controller.itemsModel.boatBeskrivevlse!,
                              style: GoogleFonts.roboto(
                                  color: Myisellcolors.hvit, fontSize: 20),
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
                )
              : const SizedBox(),
          controller.itemsModel.boatBeskrivevlse!.isNotEmpty
              ? const MyDivador()
              : const SizedBox(),
          controller.itemsModel.boatVideo!.isNotEmpty
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(left: 10, bottom: 10),
                      child: Text(
                        "Video URL",
                        style: GoogleFonts.roboto(
                            color: Myisellcolors.hvit,
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    Container(
                      padding:
                          const EdgeInsets.only(left: 10, bottom: 0, right: 10),
                      child: Text(
                        "${controller.itemsModel.boatVideo}",
                        maxLines: 10,
                        style: GoogleFonts.roboto(
                          color: Myisellcolors.hvit,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    const MyDivador()
                  ],
                )
              : const SizedBox(),
          controller.itemsModel.boatBeliggenhet!.isNotEmpty
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(left: 10, bottom: 10),
                      child: Text(
                        "Beliggenhet/Marina",
                        style: GoogleFonts.roboto(
                            color: Myisellcolors.hvit,
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    Container(
                      padding:
                          const EdgeInsets.only(left: 10, bottom: 0, right: 10),
                      child: Text(
                        "${controller.itemsModel.boatBeliggenhet}",
                        maxLines: 10,
                        style: GoogleFonts.roboto(
                          color: Myisellcolors.hvit,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    const MyDivador()
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
              "${controller.itemsModel.itemTelefon}" == "0"
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
          "${controller.itemsModel.itemTelefon}" != "0"
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
              "Lignende Kjøretøy",
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
