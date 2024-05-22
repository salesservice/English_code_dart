import 'package:flutter/material.dart';
import 'package:flutter_isell_new/controller/best_items/best_items.dart';
import 'package:flutter_isell_new/controller/favorite/favorite_controller.dart';
import 'package:flutter_isell_new/controller/favorite/my_favorite_controller.dart';
import 'package:flutter_isell_new/controller/home_page_controller.dart';
import 'package:flutter_isell_new/core/classes/handling_data_view.dart';
import 'package:flutter_isell_new/data/model/items_modell.dart';
import 'package:flutter_isell_new/views/screens/items/item_lists/best_items_list.dart';
import 'package:flutter_isell_new/views/screens/items/item_lists/last_viewd_items_list.dart';
import 'package:flutter_isell_new/views/widget/user_image.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/constants/sellx_colors.dart';
import '../../../core/constants/sellx_images.dart';
import '../../widget/popular_brands.dart';
import '../../widget/sellx_ buttons.dart';
import 'navbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomePageControllerImp homePageControllerImp;
  FavoritController favoritController = Get.put(FavoritController());
  MyFavoritController myFavoritController = Get.put(MyFavoritController());
  late BestitemsCarControllerImp bestitemsCarControllerImp;
  late PageController pageController;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    homePageControllerImp = Get.put(HomePageControllerImp());
    favoritController = Get.put(FavoritController());
    myFavoritController = Get.put(MyFavoritController());
    bestitemsCarControllerImp = Get.put(BestitemsCarControllerImp());
    pageController = PageController();
    pageController.addListener(() {
      setState(() {
        currentIndex = pageController.page!.round();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<dynamic> data = bestitemsCarControllerImp.bestallitems;

    String setning = "${homePageControllerImp.userfname}";
    List<String> ord = setning.split(" ");

    Get.put(HomePageControllerImp());

    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          actions: [
            Builder(
              builder: (context) => IconButton(
                icon: const Icon(
                  Icons.menu_rounded,
                  size: 35,
                  color: Myisellcolors.hoved,
                ),
                padding: const EdgeInsets.only(right: 25, top: 5),
                onPressed: () => Scaffold.of(context).openEndDrawer(),
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              ),
            ),
          ],
          leadingWidth: 57,
          leading: Container(
            padding: const EdgeInsets.only(left: 15, bottom: 5),
            child: const InkWell(
              child: UserImage(
                iconsize: 25,
                radius: 20,
              ),
            ),
          ),
          toolbarHeight: 65,
          backgroundColor: Myisellcolors.home,
          title: Container(
            alignment: const Alignment(-0.999999, 0),
            child: Container(
              padding: const EdgeInsets.only(bottom: 1),
              child: Text(
                "Hei ${ord[0]}!",
                style:
                    GoogleFonts.baloo2(fontSize: 19, color: Myisellcolors.hvit),
              ),
            ),
          ),
        ),
        endDrawer: const NavBar(),
        backgroundColor: Myisellcolors.home,
        body: GetBuilder<HomePageControllerImp>(
          builder: (controller) => SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  padding: const EdgeInsets.only(left: 10, top: 10, bottom: 5),
                  child: Text(
                    "Dagens beste",
                    style: GoogleFonts.baloo2(
                        fontSize: 20, color: Myisellcolors.hvit),
                  ),
                ),
                Container(
                  color: Myisellcolors.home,
                  child: Stack(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 10, right: 10),
                        decoration: BoxDecoration(
                          border: Border.all(
                              width: 0.5, color: Myisellcolors.hoved),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: SizedBox(
                            height: Get.height / 3.5,
                            child: PageView.builder(
                              controller: pageController,
                              itemCount:
                                  bestitemsCarControllerImp.bestallitems.length,
                              itemBuilder: (context, index) {
                                final List<dynamic> data =
                                    bestitemsCarControllerImp.bestallitems;
                                favoritController
                                        .isFavorite[data[index]['item_id']] =
                                    data[index]['favoritt'];
                                return BestitemList(
                                  itemsModel: ItemsModel.fromJson(data[index]),
                                );
                              },
                              onPageChanged: (index) {
                                // Update currentIndex when page changes
                                currentIndex = index;
                              },
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 5,
                        left: 0,
                        right: 0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            bestitemsCarControllerImp.bestallitems.length,
                            (index) {
                              return AnimatedContainer(
                                duration: const Duration(milliseconds: 400),
                                margin: const EdgeInsets.only(right: 4),
                                width: currentIndex == index ? 20 : 8,
                                height: 8,
                                decoration: BoxDecoration(
                                  color: currentIndex == index
                                      ? Myisellcolors.hoved
                                      : Myisellcolors.hvit70,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: currentIndex == index
                                        ? Myisellcolors.hoved
                                        : Myisellcolors.hvit70,
                                    width: 1,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.5),
                                      blurRadius:
                                          currentIndex == index ? 5.0 : 0.0,
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  padding: const EdgeInsets.only(left: 10, top: 10),
                  child: Text(
                    "Populære merker",
                    style: GoogleFonts.baloo2(
                        fontSize: 20, color: Myisellcolors.hvit),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 10, bottom: 10, left: 10),
                  child: const Wrap(
                    spacing: 7.5,
                    runSpacing: 8,
                    children: [
                      Popularknapp(
                        text: "Adidas",
                      ),
                      Popularknapp(
                        text: "Nike",
                      ),
                      Popularknapp(
                        text: "Apple",
                      ),
                      Popularknapp(
                        text: "Gucci",
                      ),
                      Popularknapp(
                        text: "Ikea",
                      ),
                      Popularknapp(
                        text: "Lego",
                      ),
                      Popularknapp(
                        text: "Zara",
                      ),
                      Popularknapp(
                        text: "Samsung",
                      ),
                      Popularknapp(
                        text: "Louis Vuitton",
                      ),
                      Popularknapp(
                        text: "Prada",
                      ),
                      Popularknapp(
                        text: "Rolex",
                      ),
                      Popularknapp(
                        text: "Mercedes",
                      ),
                      Popularknapp(
                        text: "Playstation",
                      ),
                      Popularknapp(
                        text: "H&M",
                      ),
                      Popularknapp(
                        text: "Kicks",
                      ),
                      Popularknapp(
                        text: "Tesla",
                      ),
                      Popularknapp(
                        text: "Sony",
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: Get.width / 40, bottom: 5),
                      child: Text(
                        "Sett på sist",
                        style: GoogleFonts.baloo2(
                            fontSize: 20, color: Myisellcolors.hvit),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                          left: Get.width / 70, right: Get.width / 70),
                      height: Get.height / 3.5,
                      child: GetBuilder<HomePageControllerImp>(
                        builder: (controller) {
                          return HandlingDataView(
                            statusRequest: controller.statusRequest,
                            widget: GridView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: controller.lastViewed.length,
                              physics: const ScrollPhysics(),
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisSpacing: 0,
                                mainAxisSpacing: 0,
                                crossAxisCount: 1,
                                childAspectRatio: 1.2,
                              ),
                              itemBuilder: (context, index) {
                                final Map<String, dynamic> itemData =
                                    controller.lastViewed[index];
                                final ItemsModel itemModel =
                                    ItemsModel.fromJson(itemData);

                                final favoriteItem = myFavoritController.data
                                    .firstWhereOrNull((item) =>
                                        item.itemId == itemModel.itemId);

                                if (favoriteItem != null) {
                                  favoritController
                                          .isFavorite[itemModel.itemId] =
                                      favoriteItem.favoritt;
                                }

                                return SettPaSistItems(itemsModel: itemModel);
                              },
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      padding: const EdgeInsets.only(left: 12, top: 10),
                      child: Text(
                        "Nye anonnser i nærheten",
                        style: GoogleFonts.baloo2(
                            fontSize: 20, color: Myisellcolors.hvit),
                      ),
                    ),
                    Container(
                      margin:
                          const EdgeInsets.only(left: 10, right: 10, top: 10),
                      height: 180,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Myisellcolors.hoved),
                      ),
                      child: Column(
                        children: [
                          const Image(
                            image: AssetImage(ImageAsset.onboardinglast),
                            width: 100,
                            fit: BoxFit.cover,
                          ),
                          const Spacer(),
                          IsellButtons(
                            size: const Size(410, 50),
                            name: "Nye annonser i nærheten av deg",
                            onPresset: () {},
                            alignmen: Alignment.topCenter,
                            borderradius: 2,
                            fontsize: 15,
                            bgcolor: Myisellcolors.hoved,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
