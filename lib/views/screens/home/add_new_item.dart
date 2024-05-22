import 'package:flutter/material.dart';
import 'package:flutter_isell_new/controller/edit_view_items/view_items_controller.dart';
import 'package:flutter_isell_new/core/constants/sellx_route_names.dart';
import 'package:flutter_isell_new/views/screens/home/navbar.dart';
import 'package:flutter_isell_new/views/screens/items/item_lists/mine_items_list.dart';
import 'package:flutter_isell_new/views/widget/sellx_%20buttons.dart';
import 'package:flutter_isell_new/views/widget/user_image.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';

import '../../../controller/home_page_controller.dart';
import '../../../core/constants/sellx_colors.dart';

class AddNewItem extends StatefulWidget {
  const AddNewItem({Key? key}) : super(key: key);

  @override
  _LeggtilAnonseState createState() => _LeggtilAnonseState();
}

class _LeggtilAnonseState extends State<AddNewItem> {
  int _currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    Get.put(HomePageControllerImp());
    ViewAnnonseController viewAnnonseController =
        Get.put(ViewAnnonseController());
    return Scaffold(
      backgroundColor: Myisellcolors.home,
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
          )),
        ),
        toolbarHeight: 65,
        backgroundColor: Myisellcolors.home,
        title: Container(
          alignment: const Alignment(-0.999999, 0),
          child: Container(
            padding: const EdgeInsets.only(bottom: 1),
            child: Text(
              "Legg til en annonse",
              style:
                  GoogleFonts.baloo2(fontSize: 19, color: Myisellcolors.hvit),
            ),
          ),
        ),
      ),
      endDrawer: const NavBar(),
      body: Stack(
        children: [
          ListView(
            children: [
              StickyHeader(
                header: Container(
                  color: Myisellcolors.home,
                  padding: EdgeInsets.only(
                      left: Get.width / 4,
                      right: Get.width / 4,
                      top: 15,
                      bottom: 10),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            _currentPageIndex = 0;
                          });
                        },
                        child: Column(
                          children: [
                            Text(
                              "Aktive",
                              style: GoogleFonts.baloo2(
                                fontSize: 19,
                                color: _currentPageIndex == 0
                                    ? Myisellcolors.hoved
                                    : Myisellcolors.hvit70,
                              ),
                            ),
                            _currentPageIndex == 0
                                ? Container(
                                    height: 3,
                                    width: 50,
                                    decoration: const BoxDecoration(
                                        color: Myisellcolors.hoved),
                                  )
                                : const SizedBox()
                          ],
                        ),
                      ),
                      const Spacer(),
                      InkWell(
                        onTap: () {
                          setState(() {
                            _currentPageIndex = 1;
                          });
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Påbegynte",
                              style: GoogleFonts.baloo2(
                                fontSize: 19,
                                color: _currentPageIndex == 1
                                    ? Myisellcolors.hoved
                                    : Myisellcolors.hvit70,
                              ),
                            ),
                            _currentPageIndex == 1
                                ? Container(
                                    height: 3,
                                    width: 85,
                                    decoration: const BoxDecoration(
                                        color: Myisellcolors.hoved),
                                  )
                                : const SizedBox()
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                content: Stack(
                  children: [
                    _currentPageIndex == 0
                        ? aktiveannonser()
                        : papegynteannonser(),
                  ],
                ),
              )
            ],
          ),
          IsellButtons(
            size: Size(Get.width / 1.7, Get.width / 7),
            widthbetweeniconandtext: 8.0,
            icon: Icons.add,
            iconsize: 24.0,
            name: "  Legg til ny annonse",
            onPresset: () {
              Get.toNamed(AppRouter.velgkategori);
            },
            alignmen: const Alignment(0, 0.9),
            borderradius: 30,
            fontsize: 15,
            bgcolor: Myisellcolors.hoved,
          ),
        ],
      ),
    );
  }
}

Widget aktiveannonser() => GetBuilder<ViewAnnonseController>(
      builder: (controller) => Container(
        padding: const EdgeInsets.only(left: 7, right: 7, bottom: 100),
        child: GridView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: controller.data.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 10,
            mainAxisSpacing: 3,
            crossAxisCount: 1,
            childAspectRatio: 2.1,
          ),
          itemBuilder: (context, index) {
            return MineItemsList(itemsModel: controller.data[index]);
          },
        ),
      ),
    );

Widget papegynteannonser() => Container(
      color: Myisellcolors.blak,
    );
