import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_isell_new/controller/home_page_controller.dart';
import 'package:flutter_isell_new/core/constants/sellx_colors.dart';
import 'package:flutter_isell_new/views/widget/sellx_text_filed.dart';
import 'package:flutter_isell_new/views/widget/user_image.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SliveAppBar extends GetView<HomePageControllerImp> {
  final dynamic text;

  const SliveAppBar({Key? key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      floating: true,
      pinned: true,
      actions: [
        Builder(
          builder: (context) => Container(
            padding: EdgeInsets.zero,
            margin: EdgeInsets.zero,
            //color: Myisellcolors.home,
            child: IconButton(
              icon: const Icon(
                Icons.menu_rounded,
                size: 35,
                color: Myisellcolors.hoved,
              ),
              padding: EdgeInsets.only(right: Get.width / 25, top: 5),
              onPressed: () => Scaffold.of(context).openEndDrawer(),
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            ),
          ),
        ),
      ],
      leadingWidth: 57,
      leading: Container(
        width: 50,
        padding: const EdgeInsets.only(left: 15, bottom: 5),
        child: const InkWell(
            child: UserImage(
          iconsize: 25,
          radius: 20,
        )),
      ),
      toolbarHeight: 65,
      backgroundColor: Myisellcolors.home,
      expandedHeight: 125,
      flexibleSpace: FlexibleSpaceBar(
        stretchModes: const [StretchMode.zoomBackground],
        titlePadding: EdgeInsets.zero,
        collapseMode: CollapseMode.pin,
        background: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(2.0, Get.height / 7.79, 0, 2.0),
              child: SizedBox(
                height: 62.0,
                width: double.infinity,
                child: Row(
                  children: [
                    Expanded(
                      child: IsellTextField(
                        textInputAction: TextInputAction.search,
                        con: controller.search,
                        onchanged: (val) {
                          controller.checksearch(val);
                          // List<String> filteredSuggestions = suggestionList
                          //     .where((suggestion) => suggestion
                          //         .toLowerCase()
                          //         .contains(val.toLowerCase()))
                          //     .toList();

                          controller.showClearIcon.value = val.isNotEmpty;
                          val.isNotEmpty
                              ? controller.onSearchitems()
                              : controller.searchData();
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
                        paddingcontainer: const EdgeInsets.only(
                            left: 10, right: 10, top: 10, bottom: 10),
                        cursorColor: Myisellcolors.hvit,
                        contentpadding:
                            const EdgeInsets.only(bottom: 1, left: 15, top: 1),
                        height: 18,
                        width: 1,
                        borderR: 10,
                        borderwidth: 1,
                        txtcolor: Myisellcolors.hvit,
                        hinttxt: "Hva leter du etter?",
                        hinttxtcolor: Myisellcolors.hvit70,
                        obs: false,
                        // txttype: TextInputType.go,
                        fontsizehinttext: 15,
                        bordersidecolor: Myisellcolors.hoved,
                      ),
                    ),
                    InkWell(
                      child: Container(
                        width: 46,
                        height: 40,
                        margin: const EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                            color: Myisellcolors.hoved,
                            borderRadius: BorderRadius.circular(9)),
                        child: IconButton(
                          padding: const EdgeInsets.only(bottom: 0.1, top: 3),
                          icon: const Icon(
                            Icons.tune_rounded,
                            color: Myisellcolors.blak,
                            size: 28,
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Expanded(
            //   child: Container(
            //     //  height: Get.height,
            //     child: ListView.builder(
            //       shrinkWrap: true,
            //       scrollDirection: Axis.vertical,
            //       itemCount: suggestionList.length,
            //       itemBuilder: (context, index) {
            //         final suggestion = suggestionList[index];
            //         return ListTile(
            //           title: Text(
            //             suggestion,
            //             style: GoogleFonts.roboto(color: Myisellcolors.hvit),
            //           ),
            //           onTap: () {
            //             // Handle suggestion selection
            //             controller.search!.text = suggestion;
            //             controller.onSearchitems();
            //           },
            //         );
            //       },
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
      title: Container(
        padding: EdgeInsets.zero,
        margin: EdgeInsets.zero,
        // color: Myisellcolors.home,
        height: 65,
        width: double.infinity,
        alignment: const Alignment(-0.999999, 0),
        child: Container(
          padding: EdgeInsets.zero,
          child: Text(
            text,
            style: GoogleFonts.baloo2(fontSize: 19, color: Myisellcolors.hvit),
          ),
        ),
      ),
    );
  }

  Widget showicon(context) => IconButton(
      onPressed: () {},
      icon: controller.isSearch == true
          ? Icon(
              Icons.clear,
              color: Myisellcolors.hvit70,
              size: 19,
            )
          : SizedBox());
}
