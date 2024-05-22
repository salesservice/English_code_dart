import 'package:flutter/material.dart';
import 'package:flutter_isell_new/controller/best_items/best_items.dart';
import 'package:flutter_isell_new/controller/items/electronics_controller.dart';
import 'package:flutter_isell_new/controller/stories/stories_controller.dart';
import 'package:flutter_isell_new/core/classes/handling_data_view.dart';
import 'package:flutter_isell_new/core/constants/sellx_colors.dart';
import 'package:flutter_isell_new/data/model/items_modell.dart';
import 'package:flutter_isell_new/views/screens/items/item_lists/best_items_list.dart';
import 'package:flutter_isell_new/views/screens/stories/storiene.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ElektronikkHoved extends StatefulWidget {
  const ElektronikkHoved({Key? key}) : super(key: key);

  @override
  _BilerHovedState createState() => _BilerHovedState();
}

class _BilerHovedState extends State<ElektronikkHoved> {
  int currentIndex = 0;
  final PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        currentIndex = _pageController.page?.round() ?? 0;
      });
    });
  }

  bool isBMWDataLoaded = false;
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    ElektronikkControllerImp elektronikkControllerImp =
        Get.put(ElektronikkControllerImp());
    BestitemsCarControllerImp bestitemsCarControllerImp =
        Get.put(BestitemsCarControllerImp());
    final List<dynamic> data =
        bestitemsCarControllerImp.besteitemselektronikkdata;

    Get.put(StoriControllerImp());

    return GetBuilder<StoriControllerImp>(
      builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: GetBuilder<ElektronikkControllerImp>(
            builder: (controller) => Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      const Padding(
                          padding: EdgeInsets.only(top: 0), child: Storiene()),
                      Stack(
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
                                  controller: _pageController,
                                  itemCount: data.length,
                                  itemBuilder: (context, index) {
                                    return BestitemList(
                                      itemsModel:
                                          ItemsModel.fromJson(data[index]),
                                    );
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
                                data.length,
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
                      Container(
                        margin:
                            const EdgeInsets.only(left: 10, right: 10, top: 15),
                        height: 45,
                        child: ListView.separated(
                          separatorBuilder: (context, index) {
                            return const SizedBox(
                              width: 10,
                            );
                          },
                          scrollDirection: Axis.horizontal,
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                elektronikkControllerImp.toggleCategory(index);
                              },
                              child: Container(
                                padding:
                                    const EdgeInsets.only(left: 20, right: 20),
                                decoration: BoxDecoration(
                                    color: Myisellcolors.appbar,
                                    border: Border.all(
                                        color: Myisellcolors.hoved,
                                        width: elektronikkControllerImp
                                                    .selectedIndex ==
                                                index
                                            ? 1.5
                                            : 0.5),
                                    borderRadius: BorderRadius.circular(7)),
                                child: Center(
                                  child: Text(
                                    elektronikkControllerImp
                                        .elektronikktype[index],
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.roboto(
                                        color: Myisellcolors.hvit,
                                        fontSize: 15),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      elektronikkControllerImp.selectedIndex != -1 &&
                              elektronikkControllerImp
                                  .getListAtselectedindex()
                                  .isNotEmpty
                          ? Container(
                              padding: const EdgeInsets.only(
                                  left: 10, top: 15, bottom: 0),
                              child: Row(
                                children: [
                                  Text(
                                    elektronikkControllerImp.buildRelevantName(
                                        elektronikkControllerImp.selectedIndex),
                                    style: GoogleFonts.baloo2(
                                      fontSize: 20,
                                      color: Myisellcolors.hvit,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : Container(),
                      elektronikkControllerImp.selectedIndex != -1
                          ? Container(
                              padding: const EdgeInsets.only(left: 6, top: 10),
                              child: MediaQuery.removePadding(
                                removeTop: true,
                                removeBottom: true,
                                context: context,
                                child:
                                    elektronikkControllerImp.buildRelevantView(
                                        elektronikkControllerImp.selectedIndex),
                              ),
                            )
                          : const SizedBox(),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
