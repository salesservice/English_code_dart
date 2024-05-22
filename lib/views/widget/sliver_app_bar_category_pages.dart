import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_isell_new/controller/items_controller.dart';
import 'package:flutter_isell_new/core/constants/sellx_colors.dart';
import 'package:flutter_isell_new/views/screens/items/category_items.dart';
import 'package:flutter_isell_new/views/widget/sellx_text_filed.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sticky_headers/sticky_headers.dart';

class SliveAppBar2 extends StatelessWidget {
  const SliveAppBar2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(ItemControllerImp());
    return SliverAppBar(
      automaticallyImplyLeading: false,
      floating: true,
      pinned: true,
      actions: [
        Builder(
          builder: (context) => Container(
            color: Colors.transparent,
            height: 60,
            child: IconButton(
              icon: const Icon(
                Icons.menu_rounded,
                size: 35,
                color: Myisellcolors.hoved,
              ),
              padding: const EdgeInsets.only(right: 25, top: 0),
              onPressed: () => Scaffold.of(context).openEndDrawer(),
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            ),
          ),
        ),
      ],
      leadingWidth: Get.width / 1.13,
      leading: GetBuilder<ItemControllerImp>(
        builder: (controller) {
          return Container(
            margin: const EdgeInsets.only(top: 5, bottom: 5, left: 5),
            color: Colors.transparent,
            child: IsellTextField(
              textInputAction: TextInputAction.search,
              con: controller.search,
              onchanged: (val) {
                controller.checksearch(val);

                controller.showClearIcon.value = val.isNotEmpty;
                val.isNotEmpty
                    ? controller.onSearchitems()
                    : controller.searchDataItems(controller.kategoriid);
              },
              icon: Obx(() => controller.showClearIcon.value
                  ? IconButton(
                      icon: const Icon(
                        Icons.clear,
                        color: Myisellcolors.hvit70,
                        size: 18,
                      ),
                      onPressed: () {
                        controller.clearSearch();
                        controller.checksearch('');
                      },
                    )
                  : const SizedBox()),
              piconontap: () {
                controller.onSearchitems();
              },

              ontap: () {
                // showSearch(
                //     context: context,
                //     delegate: CustomSearchDdelegate());
              },
              onsubmitted: (val) {
                val.isNotEmpty ? controller.onSearchitems() : none();
              },
              picon: (Icons.search),
              iconcolor: Myisellcolors.hvit70,
              //color: Myisellcolors.hvit70,
              paddingcontainer: EdgeInsets.only(
                  left: Get.width / 30,
                  right: Get.width / 20,
                  top: Get.width / 40,
                  bottom: Get.width / 40),
              cursorColor: Myisellcolors.hvit,
              contentpadding:
                  const EdgeInsets.only(bottom: 1, left: 15, top: 1),
              height: 18,
              width: 1,
              borderR: 10,
              borderwidth: 1,
              txtcolor: Myisellcolors.hvit,
              hinttxt: "Søk i hele ${controller.katname} markedet",
              hinttxtcolor: Myisellcolors.hvit70,
              obs: false,
              // txttype: TextInputType.go,
              fontsizehinttext: 14,
              bordersidecolor: Myisellcolors.hoved,
            ),
          );
        },
      ),
      toolbarHeight: 70,
      backgroundColor: Myisellcolors.home,
      expandedHeight: 145,
      flexibleSpace: FlexibleSpaceBar(
        stretchModes: const [StretchMode.zoomBackground],
        titlePadding: EdgeInsets.zero,
        collapseMode: CollapseMode.pin,
        background: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Spacer(),
            Padding(
              padding: const EdgeInsets.fromLTRB(2.0, 5, 0, 0.0),
              child: Column(
                children: [
                  StickyHeader(
                    header: Row(
                      children: [
                        GetBuilder<ItemControllerImp>(
                          builder: (controller) => Container(
                            padding: const EdgeInsets.only(bottom: 0, left: 10),
                            color: Myisellcolors.home,
                            child: Text(
                              "${controller.katname}",
                              style: GoogleFonts.baloo2(
                                  fontSize: 20, color: Myisellcolors.hvit),
                            ),
                          ),
                        ),
                        const Spacer(),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.tune_rounded,
                            color: Myisellcolors.hvit,
                            size: 24,
                          ),
                        ),

                        // IconButton(
                        //   onPressed: () {
                        //     showModalBottomSheet(
                        //       context: context,
                        //       builder: (context) => FilterOptions(),
                        //     );
                        //   },
                        //   icon: const Icon(
                        //     Icons.tune_rounded,
                        //     color: Myisellcolors.hvit,
                        //     size: 24,
                        //   ),
                        // ),
                      ],
                    ),
                    content: Container(
                      margin: const EdgeInsets.only(right: 10, top: 0),
                      height: 40,
                      child: const KategoriTem(),
                    ),
                  )
                  // Row(
                  //   children: [
                  //     GetBuilder<ItemControllerImp>(
                  //       builder: (controller) => Container(
                  //         padding: const EdgeInsets.only(bottom: 0, left: 10),
                  //         color: Myisellcolors.home,
                  //         child: Text(
                  //           "${controller.katname}",
                  //           style: GoogleFonts.baloo2(
                  //               fontSize: 20, color: Myisellcolors.hvit),
                  //         ),
                  //       ),
                  //     ),
                  //     const Spacer(),
                  //     IconButton(
                  //       onPressed: () {},
                  //       icon: const Icon(
                  //         Icons.tune_rounded,
                  //         color: Myisellcolors.hvit,
                  //         size: 24,
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  // Container(
                  //   margin: const EdgeInsets.only(right: 10, top: 0),
                  //   height: 40,
                  //   child: const KategoriTem(),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
