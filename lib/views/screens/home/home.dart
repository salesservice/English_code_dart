import 'package:flutter/material.dart';
import 'package:flutter_isell_new/views/screens/home/home_relevant/home_items_relevant.dart';
import 'package:flutter_isell_new/views/screens/home/home_relevant/search_relevant.dart';
import 'package:flutter_isell_new/views/widget/sliver_app_bar_home.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../controller/home_page_controller.dart';
import '../../../core/classes/handling_data_view.dart';
import '../../../core/constants/sellx_colors.dart';
import 'categories.dart';
import 'navbar.dart';

class MyHeader extends StatefulWidget {
  const MyHeader({super.key});

  @override
  State<MyHeader> createState() => _MyHeaderState();
}

String greeting() {
  var hour = DateTime.now().hour;
  if (hour < 12) {
    return 'God Morgen';
  }
  if (hour < 17) {
    return 'God Ettermiddag';
  }
  if (hour < 23) {
    return 'God Kveld';
  }
  return 'God natt';
}

class _MyHeaderState extends State<MyHeader> {
  @override
  Widget build(BuildContext context) {
    // Get.put(FavoritController());
    // Get.put(HomePageControllerImp());
    // Get.put(ItemControllerImp);
    // Get.put(MyFavoritController());
    HomePageControllerImp homePageControllerImp =
        Get.put(HomePageControllerImp());

    return Scrollbar(
      radius: const Radius.circular(8),
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.endContained,
        floatingActionButton: FloatingActionButton.small(
          heroTag: "herotag1",
          elevation: 2,
          backgroundColor: Myisellcolors.hoved,
          foregroundColor: Colors.white,
          splashColor: Colors.transparent,
          onPressed: () {
            homePageControllerImp.showRelevant1.value =
                !homePageControllerImp.showRelevant1.value;
          },
          child: Obx(() => homePageControllerImp.getIcon()),
        ),
        backgroundColor: Myisellcolors.home,
        body: CustomScrollView(
          scrollDirection: Axis.vertical,
          slivers: <Widget>[
            SliveAppBar(
              text: greeting(),
            ),
            SliverPersistentHeader(
              delegate: _HederSliver(),
              pinned: true,
              floating: false,
            ),

            buildHome(context),
            //allitemswidget(context)
          ],
        ),
        endDrawer: const NavBar(),
      ),
    );
  }
}

class _HederSliver extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final percent = shrinkOffset / minExtent;
    return AnimatedSwitcher(
      reverseDuration: kTabScrollDuration,
      duration: kTabScrollDuration,
      switchInCurve: Curves.easeIn,
      child: percent > 1
          ? Container(
              color: Myisellcolors.home,
              child: const KategoriHead(),
            )
          : Container(
              margin: const EdgeInsets.only(left: 10, right: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Myisellcolors.home,
                border: Border.all(color: Myisellcolors.hoved),
              ),
            ),
    );
  }

  @override
  double get maxExtent => 90;

  @override
  double get minExtent => 43;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}

Widget buildHome(context) => SliverToBoxAdapter(
      child: GetBuilder<HomePageControllerImp>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: controller.isSearch
              ? Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            "Rusltater som treffer:",
                            style: GoogleFonts.roboto(
                                fontSize: 18, color: Myisellcolors.hvit),
                          ),
                        ),
                        const Spacer(),
                        IconButton(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          disabledColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onPressed: () {
                            controller.showRelevant1.value =
                                !controller.showRelevant1.value;
                          },
                          icon: Obx(() => controller.getIcon()),
                        ),
                      ],
                    ),
                    MediaQuery.removePadding(
                      context: context,
                      removeTop: true,
                      child: Container(
                        padding: const EdgeInsets.only(left: 5, right: 5),
                        child: const SearchRelevant(),
                      ),
                    ),
                  ],
                )
              : Container(
                  //height: MediaQuery.sizeOf(context).height,
                  padding: const EdgeInsets.only(top: 8),
                  color: Myisellcolors.home,
                  child: Column(
                    children: [
                      MediaQuery.removePadding(
                        removeTop: true,
                        context: context,
                        child: ListView(
                          shrinkWrap: true,
                          physics: const ScrollPhysics(),
                          children: [
                            const SizedBox(
                              height: 5,
                            ),
                            Container(
                              alignment: Alignment.topLeft,
                              padding:
                                  const EdgeInsets.only(left: 11, bottom: 0),
                              child: Text(
                                "Kategorier",
                                style: GoogleFonts.baloo2(
                                    fontSize: 20, color: Myisellcolors.hvit),
                              ),
                            ),
                            Container(
                                margin:
                                    const EdgeInsets.only(top: 18, right: 8),
                                padding: const EdgeInsets.only(bottom: 20),
                                height: 115,
                                child: const Kategorier()),
                            Container(
                              padding: const EdgeInsets.only(
                                  left: 12, bottom: 15, top: 0),
                              child: Row(
                                children: [
                                  Text(
                                    "Relevant for deg",
                                    style: GoogleFonts.baloo2(
                                        fontSize: 20,
                                        color: Myisellcolors.hvit),
                                  ),
                                  const Spacer(),
                                  // IconButton(
                                  //   splashColor: Colors.transparent,
                                  //   focusColor: Colors.transparent,
                                  //   hoverColor: Colors.transparent,
                                  //   disabledColor: Colors.transparent,
                                  //   highlightColor: Colors.transparent,
                                  //   onPressed: () {
                                  //     controller.showRelevant1.value =
                                  //         !controller.showRelevant1.value;
                                  //   },
                                  //   icon: Obx(() => controller.getIcon()),
                                  // ),
                                ],
                              ),
                            ),
                            Container(
                                padding:
                                    const EdgeInsets.only(left: 5, right: 5),
                                child: const HomeRelevant())
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
