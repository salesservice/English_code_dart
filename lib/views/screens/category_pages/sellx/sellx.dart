import 'package:flutter/material.dart';
import 'package:flutter_isell_new/controller/items/sellx_controller.dart';
import 'package:flutter_isell_new/core/constants/sellx_colors.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SellxHoved extends StatelessWidget {
  const SellxHoved({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SellxControllerImp());
    return GetBuilder<SellxControllerImp>(
      builder: (controller) => Container(
        padding: const EdgeInsets.only(),
        color: Myisellcolors.home,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MediaQuery.removePadding(
              removeTop: true,
              removeBottom: true,
              context: context,
              child: ListView(
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    padding: const EdgeInsets.only(left: 10, top: 5, bottom: 5),
                    child: Text(
                      "Populære Kategorier",
                      style: GoogleFonts.baloo2(
                          fontSize: 20, color: Myisellcolors.hvit),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 10, right: 10),
                    height: 152,
                    child: ListView.separated(
                      padding: const EdgeInsets.only(left: 10),
                      separatorBuilder: (context, index) => const SizedBox(
                        width: 10,
                      ),
                      shrinkWrap: true,
                      itemCount: controller.kimage.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Stack(
                          children: [
                            InkWell(
                              onTap: () {
                                controller.toggleCategory(index);
                              },
                              child: Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: controller.kimage[index],
                                          fit: BoxFit.cover),
                                      border: Border.all(
                                          width:
                                              controller.selectedIndex == index
                                                  ? 2
                                                  : 0,
                                          color: Myisellcolors.hoved),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(5),
                                        topRight: Radius.circular(5),
                                      ),
                                    ),
                                    height: 100,
                                    width: 140,
                                  ),
                                  Container(
                                    height: 38,
                                    width: 140,
                                    decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.only(
                                          bottomRight: Radius.circular(5),
                                          bottomLeft: Radius.circular(5)),
                                      color: Myisellcolors.home,
                                      border: Border.all(
                                          width:
                                              controller.selectedIndex == index
                                                  ? 2
                                                  : 0,
                                          color: Myisellcolors.hoved),
                                    ),
                                    child: Stack(
                                      children: [
                                        Center(
                                          child: Text(
                                            "${controller.kate[index]}",
                                            style: GoogleFonts.baloo2(
                                                fontSize: 17,
                                                color: Myisellcolors.hvit),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  // Container(
                  //   padding: const EdgeInsets.only(left: 10, top: 10),
                  //   child: const Wrap(
                  //     spacing: 7.5,
                  //     runSpacing: 8,
                  //     children: [
                  //       Popularknapp(
                  //         text: "Adidas",
                  //       ),
                  //       Popularknapp(
                  //         text: "Nike",
                  //       ),
                  //       Popularknapp(
                  //         text: "Apple",
                  //       ),
                  //       Popularknapp(
                  //         text: "Gucci",
                  //       ),
                  //       Popularknapp(
                  //         text: "Ikea",
                  //       ),
                  //       Popularknapp(
                  //         text: "Lego",
                  //       ),
                  //       Popularknapp(
                  //         text: "Zara",
                  //       ),
                  //       Popularknapp(
                  //         text: "Samsung",
                  //       ),
                  //       Popularknapp(
                  //         text: "Louis Vuitton",
                  //       ),
                  //       Popularknapp(
                  //         text: "Prada",
                  //       ),
                  //       Popularknapp(
                  //         text: "Rolex",
                  //       ),
                  //       Popularknapp(
                  //         text: "Mercedes",
                  //       ),
                  //       Popularknapp(
                  //         text: "Playstation",
                  //       ),
                  //       Popularknapp(
                  //         text: "H&M",
                  //       ),
                  //       Popularknapp(
                  //         text: "Kicks",
                  //       ),
                  //       Popularknapp(
                  //         text: "Tesla",
                  //       ),
                  //       Popularknapp(
                  //         text: "Sony",
                  //       ),
                  //     ],
                  //   ),
                  // ),
                ],
              ),
            ),
            controller.selectedIndex != -1 &&
                    controller.getListAtSelectedIndex().isNotEmpty
                ? Container(
                    padding:
                        const EdgeInsets.only(left: 10, top: 15, bottom: 0),
                    child: Row(
                      children: [
                        Text(
                          controller
                              .buildRelevantName(controller.selectedIndex),
                          style: GoogleFonts.baloo2(
                            fontSize: 20,
                            color: Myisellcolors.hvit,
                          ),
                        ),
                      ],
                    ),
                  )
                : Container(),
            controller.selectedIndex != -1
                ? Container(
                    padding: const EdgeInsets.only(left: 6, top: 10),
                    child: MediaQuery.removePadding(
                      removeTop: true,
                      removeBottom: true,
                      context: context,
                      child: controller
                          .buildRelevantView(controller.selectedIndex),
                    ),
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
