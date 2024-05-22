import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_isell_new/controller/favorite/favorite_controller.dart';
import 'package:flutter_isell_new/controller/favorite/my_favorite_controller.dart';
import 'package:flutter_isell_new/controller/home_page_controller.dart';
import 'package:flutter_isell_new/core/classes/handling_data_view.dart';
import 'package:flutter_isell_new/core/constants/sellx_colors.dart';
import 'package:flutter_isell_new/views/screens/home/home_relevant/search_favorite_relevant.dart';
import 'package:flutter_isell_new/views/screens/home/navbar.dart';
import 'package:flutter_isell_new/views/screens/items/item_lists/my_favorite_custom_list.dart';
import 'package:flutter_isell_new/views/widget/sellx_text_filed.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Favoritter extends GetView<HomePageControllerImp> {
  const Favoritter({super.key});

  @override
  Widget build(BuildContext context) {
    // Get.put(MyFavoritController());
    FavoritController favoritController = Get.put(FavoritController());
    // Get.put(InnloggingControllerImp());
    // Get.put(UserControllerImp());
    // HomePageControllerImp homePageControllerImp =
    // Get.put(HomePageControllerImp());
    MyFavoritController myFavoritController = Get.put(MyFavoritController());
    return Scaffold(
      backgroundColor: Myisellcolors.home,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Myisellcolors.hvit),
        // elevation: 0,
        actions: [
          Builder(
            builder: (context) => IconButton(
              icon: const Icon(
                Icons.menu_rounded,
                size: 30,
                color: Myisellcolors.hvit,
              ),
              padding: const EdgeInsets.only(right: 20, top: 5),
              onPressed: () => Scaffold.of(context).openEndDrawer(),
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            ),
          ),
        ],
        toolbarHeight: 65,
        backgroundColor: Myisellcolors.home,
        title: Container(
          alignment: Alignment.centerLeft,
          child: Text(
            "Favoritter",
            style: GoogleFonts.baloo2(fontSize: 20, color: Myisellcolors.hvit),
          ),
        ),
      ),
      endDrawer: const NavBar(),
      body: ListView(
        children: [
          buildsearch(context),
          GetBuilder<HomePageControllerImp>(
            builder: (controller) => HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: controller.isSearch
                  ? Column(
                      children: [
                        // Row(
                        //   children: [
                        //     Container(
                        //       padding: const EdgeInsets.only(left: 10),
                        //       child: Text(
                        //         "Rusltater som treffer:",
                        //         style: GoogleFonts.roboto(
                        //             fontSize: 18, color: Myisellcolors.hvit),
                        //       ),
                        //     ),
                        //     const Spacer(),
                        //     IconButton(
                        //       splashColor: Colors.transparent,
                        //       focusColor: Colors.transparent,
                        //       hoverColor: Colors.transparent,
                        //       disabledColor: Colors.transparent,
                        //       highlightColor: Colors.transparent,
                        //       onPressed: () {
                        //         controller.showRelevant1.value =
                        //             !controller.showRelevant1.value;
                        //       },
                        //       icon: Obx(() => controller.getIcon()),
                        //     ),
                        //   ],
                        // ),
                        MediaQuery.removePadding(
                            context: context,
                            removeTop: true,
                            child: Container(
                                padding:
                                    const EdgeInsets.only(left: 5, right: 5),
                                child: const SearchRelevantfavoritter())),
                      ],
                    )
                  : GetBuilder<MyFavoritController>(
                      builder: (controller) => Container(
                        padding: const EdgeInsets.only(left: 7, right: 7),
                        child: GridView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: myFavoritController.data.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2, childAspectRatio: 0.8),
                          itemBuilder: (context, index) {
                            favoritController.isFavorite[
                                    myFavoritController.data[index].itemId] =
                                myFavoritController.data[index].favoritt;
                            return MyFAvorittCustomList(
                              itemsModel: myFavoritController.data[index],
                            );
                          },
                        ),
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget buildsearch(context) => GetBuilder<HomePageControllerImp>(
      builder: (controller) => IsellTextField(
        textInputAction: TextInputAction.search,
        con: controller.search,
        onchanged: (val) {
          controller.checksearchFavoritter(val);
          // List<String> filteredSuggestions = suggestionList
          //     .where((suggestion) => suggestion
          //         .toLowerCase()
          //         .contains(val.toLowerCase()))
          //     .toList();

          controller.showClearIcon.value = val.isNotEmpty;
          val.isNotEmpty
              ? controller.onSearchFavoritter()
              : controller.searchFavorittData();
        },

        icon: Obx(() => controller.showClearIcon.value
            ? IconButton(
                icon: const Icon(
                  Icons.clear,
                  color: Myisellcolors.hvit70,
                  size: 19,
                ),
                onPressed: () {
                  controller.clearSearch();
                  controller.checksearchFavoritter('');
                },
              )
            : const SizedBox()),
        piconontap: () {
          controller.onSearchFavoritter();
        },

        ontap: () {
          // showSearch(
          //     context: context,
          //     delegate: CustomSearchDdelegate());
        },
        onsubmitted: (val) {
          val.isNotEmpty ? controller.onSearchFavoritter() : none();
        },
        picon: (Icons.search),
        iconcolor: Myisellcolors.hvit70,
        //color: Myisellcolors.hvit70,
        paddingcontainer:
            const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
        cursorColor: Myisellcolors.hvit,
        contentpadding: const EdgeInsets.only(bottom: 1, left: 15, top: 1),
        height: 18,
        width: 1,
        borderR: 10,
        borderwidth: 1,
        txtcolor: Myisellcolors.hvit,
        hinttxt: "Søk i favoritter",
        hinttxtcolor: Myisellcolors.hvit70,
        obs: false,
        // txttype: TextInputType.go,
        fontsizehinttext: 15,
        bordersidecolor: Myisellcolors.hoved,
      ),
    );
