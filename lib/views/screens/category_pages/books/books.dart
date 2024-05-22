import 'package:flutter/material.dart';
import 'package:flutter_isell_new/controller/best_items/best_items.dart';
import 'package:flutter_isell_new/controller/items/books_controller.dart';
import 'package:flutter_isell_new/controller/stories/stories_controller.dart';
import 'package:flutter_isell_new/core/classes/handling_data_view.dart';
import 'package:flutter_isell_new/core/constants/sellx_colors.dart';
import 'package:flutter_isell_new/data/model/items_modell.dart';
import 'package:flutter_isell_new/views/screens/items/item_lists/best_items_list.dart';
import 'package:flutter_isell_new/views/screens/stories/storiene.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class BokerHoved extends StatefulWidget {
  const BokerHoved({Key? key}) : super(key: key);

  @override
  _BilerHovedState createState() => _BilerHovedState();
}

class _BilerHovedState extends State<BokerHoved> {
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
    BooksControllerImp bokerControllerImp = Get.put(BooksControllerImp());
    BestitemsCarControllerImp bestitemsCarControllerImp =
        Get.put(BestitemsCarControllerImp());
    final List<dynamic> data = bestitemsCarControllerImp.besteitemsbokerdata;

    Get.put(StoriControllerImp());

    return GetBuilder<StoriControllerImp>(
      builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: GetBuilder<BooksControllerImp>(
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
                          itemCount: 4,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                bokerControllerImp.toggleCategory(index);
                              },
                              child: Container(
                                padding:
                                    const EdgeInsets.only(left: 10, right: 10),
                                decoration: BoxDecoration(
                                    color: Myisellcolors.appbar,
                                    border: Border.all(
                                        color: Myisellcolors.hoved,
                                        width:
                                            bokerControllerImp.selectedIndex ==
                                                    index
                                                ? 1.5
                                                : 0.5),
                                    borderRadius: BorderRadius.circular(7)),
                                child: Center(
                                  child: Text(
                                    bokerControllerImp.boktype[index],
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
                      bokerControllerImp.selectedIndex != -1 &&
                              bokerControllerImp
                                  .getListAtselectedindex()
                                  .isNotEmpty
                          ? Container(
                              padding: const EdgeInsets.only(
                                  left: 10, top: 15, bottom: 0),
                              child: Row(
                                children: [
                                  Text(
                                    bokerControllerImp.buildRelevantName(
                                        bokerControllerImp.selectedIndex),
                                    style: GoogleFonts.baloo2(
                                      fontSize: 20,
                                      color: Myisellcolors.hvit,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : Container(),
                      bokerControllerImp.selectedIndex != -1
                          ? Container(
                              padding: const EdgeInsets.only(left: 6, top: 10),
                              child: MediaQuery.removePadding(
                                removeTop: true,
                                removeBottom: true,
                                context: context,
                                child: bokerControllerImp.buildRelevantView(
                                    bokerControllerImp.selectedIndex),
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
