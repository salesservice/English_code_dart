import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_isell_new/controller/favorite/favorite_controller.dart';
import 'package:flutter_isell_new/controller/favorite/my_favorite_controller.dart';
import 'package:flutter_isell_new/controller/home_page_controller.dart';
import 'package:flutter_isell_new/controller/items_controller.dart';
import 'package:flutter_isell_new/core/constants/sellx_colors.dart';
import 'package:flutter_isell_new/core/constants/sellx_route_names.dart';
import 'package:flutter_isell_new/data/model/items_modell.dart';
import 'package:flutter_isell_new/sellx_link_api.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class MyFAvorittCustomList extends GetView<ItemControllerImp> {
  final ItemsModel itemsModel;

  const MyFAvorittCustomList({super.key, required this.itemsModel});

  @override
  Widget build(BuildContext context) {
    MyFavoritController myFavoritController = Get.put(MyFavoritController());
    String dateCreate = itemsModel.itemDato!;
    DateTime parsedDate = DateTime.parse(dateCreate);
    DateFormat outputFormat = DateFormat("dd MMM yyyy");
    String formattedDate = outputFormat.format(parsedDate);
    String itempris = NumberFormat.decimalPattern().format(itemsModel.itemPris);

    FavoritController favcontroller = Get.put(FavoritController());
    HomePageControllerImp homePageControllerImp =
        Get.put(HomePageControllerImp());
    //Get.put(ItemControllerImp());
    return InkWell(
      onTap: () {
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
        //controller.goToItemPageDetails(itemsModel);
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
                            itemsModel.itemIamge?.split(',');

                        if (imagePaths == null || imagePaths.isEmpty) {
                          // Handle the case where imagePaths is null or empty
                          return Container(); // or some default widget
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
                  margin: EdgeInsets.only(
                      bottom:
                          favcontroller.showRelevant1.value == false ? 5 : 10,
                      left: 6,
                      right: 5,
                      top: 4),
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
                child: IconButton(
                  onPressed: () {
                    showDialog(
                      barrierColor: const Color.fromARGB(210, 3, 9, 19),
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          backgroundColor: Myisellcolors.appbar,
                          title: Text("Bekreft sletting",
                              style: GoogleFonts.baloo2(
                                  color: Myisellcolors.hvit)),
                          content: Text(
                              "Er du sikker på at du vil fjerne denne favoritten?",
                              style: GoogleFonts.baloo2(
                                  color: Myisellcolors.hvit)),
                          actions: [
                            TextButton(
                              child: Text("Nei",
                                  style: GoogleFonts.baloo2(
                                      color: Colors.blue, fontSize: 20)),
                              onPressed: () {
                                Navigator.of(context).pop();
                                print(itemsModel.favorittUserid);
                              },
                            ),
                            TextButton(
                              child: Text("Ja",
                                  style: GoogleFonts.baloo2(
                                      color: Colors.red, fontSize: 20)),
                              onPressed: () {
                                if (controller.isFavorite[itemsModel.itemId] ==
                                    1) {
                                  controller.setFavorite(itemsModel.itemId, 0);
                                  controller.removeFavoritt(itemsModel.itemId);
                                  itemsModel.itemLikt =
                                      itemsModel.itemLikt! - 1;
                                  controller.itemlikt(
                                      itemsModel.itemLikt, itemsModel.itemId);
                                }
                                myFavoritController
                                    .deleteFavoritt(itemsModel.favorittId);
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                  icon: const Icon(
                    Icons.delete,
                    color: Myisellcolors.hoved,
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
