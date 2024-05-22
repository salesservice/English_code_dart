import 'package:flutter/material.dart';
import 'package:flutter_isell_new/controller/favorite/favorite_controller.dart';
import 'package:flutter_isell_new/controller/home_page_controller.dart';
import 'package:flutter_isell_new/controller/items_controller.dart';
import 'package:flutter_isell_new/controller/stories/stories_controller.dart';
import 'package:flutter_isell_new/views/screens/category_pages/bicycles/bicycles.dart';
import 'package:flutter_isell_new/views/screens/category_pages/boats/boat.dart';
import 'package:flutter_isell_new/views/screens/category_pages/books/books.dart';
import 'package:flutter_isell_new/views/screens/category_pages/cars/cars.dart';
import 'package:flutter_isell_new/views/screens/category_pages/clothes/clothes.dart';
import 'package:flutter_isell_new/views/screens/category_pages/electronics/electronics.dart';
import 'package:flutter_isell_new/views/screens/category_pages/furniture/furniture.dart';
import 'package:flutter_isell_new/views/screens/category_pages/jobs/jobs.dart';
import 'package:flutter_isell_new/views/screens/category_pages/motorcycles/motocycles.dart';
import 'package:flutter_isell_new/views/screens/category_pages/property/property.dart';
import 'package:flutter_isell_new/views/screens/category_pages/sellx/sellx.dart';
import 'package:flutter_isell_new/views/screens/home/home_relevant/items_inside_categories_relevant.dart';
import 'package:flutter_isell_new/views/screens/home/navbar.dart';
import 'package:flutter_isell_new/views/widget/sliver_app_bar_category_pages.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/classes/handling_data_view.dart';
import '../../../core/constants/sellx_colors.dart';
import '../home/home_relevant/item_search_relevant.dart';

class Items extends StatefulWidget {
  const Items({
    super.key,
  });

  @override
  State<Items> createState() => _Items();
}

class _Items extends State<Items> {
  @override
  Widget build(BuildContext context) {
    Get.put(ItemControllerImp());
    Get.put(StoriControllerImp());
    FavoritController favoritController = Get.put(FavoritController());

    return GetBuilder<HomePageControllerImp>(
        builder: (controller) => Scrollbar(
              radius: const Radius.circular(8),
              child: Scaffold(
                backgroundColor: Myisellcolors.home,
                body: CustomScrollView(
                  scrollDirection: Axis.vertical,
                  slivers: <Widget>[const SliveAppBar2(), buildHome(context)],
                ),
                endDrawer: const NavBar(),
                floatingActionButtonLocation:
                    FloatingActionButtonLocation.endContained,
                floatingActionButton: FloatingActionButton.small(
                  heroTag: "herotag2",
                  elevation: 2,
                  backgroundColor: Myisellcolors.hoved,
                  foregroundColor: Colors.white,
                  splashColor: Colors.transparent,
                  onPressed: () {
                    favoritController.showRelevant1.value =
                        !favoritController.showRelevant1.value;
                  },
                  child: Obx(() => favoritController.getIcon()),
                ),
              ),
            ));
  }
}

Widget buildHome(context) => SliverToBoxAdapter(
      child: Stack(
        children: [
          GetBuilder<ItemControllerImp>(
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
                                padding:
                                    const EdgeInsets.only(left: 5, right: 5),
                                child: const ItemsSearchRelevant())),
                      ],
                    )
                  : Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                            padding: const EdgeInsets.only(top: 10),
                            child: controller.katname == "Sellx"
                                ? const SellxHoved()
                                : controller.katname == "Eiendom"
                                    ? const EiendomHoved()
                                    : controller.katname == "Biler"
                                        ? const BilerHoved()
                                        : controller.katname == "Båter"
                                            ? const BoatHoved()
                                            : controller.katname ==
                                                    "Motorsykler"
                                                ? const MCHoved()
                                                : controller.katname == "Sykler"
                                                    ? const SyklerHoved()
                                                    : controller.katname ==
                                                            "Bøker"
                                                        ? const BokerHoved()
                                                        : controller.katname ==
                                                                "Jobber"
                                                            ? const JobbHoved()
                                                            : controller.katname ==
                                                                    "Møbler"
                                                                ? const MoblerHoved()
                                                                : controller.katname ==
                                                                        "Elektronikk"
                                                                    ? const ElektronikkHoved()
                                                                    : const KlarHoved()),
                        Container(
                          padding: const EdgeInsets.only(
                              left: 10, top: 15, bottom: 10),
                          child: Row(
                            children: [
                              Text(
                                "Relevant for deg",
                                style: GoogleFonts.baloo2(
                                    fontSize: 20, color: Myisellcolors.hvit),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 6),
                          child: MediaQuery.removePadding(
                              removeTop: true,
                              context: context,
                              child: const Relevant()),
                        ),
                      ],
                    ),
            ),
          ),
        ],
      ),
    );
