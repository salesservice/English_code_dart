import 'package:flutter/material.dart';
import 'package:flutter_isell_new/controller/best_items/best_items.dart';
import 'package:flutter_isell_new/controller/items/cars_controller.dart';
import 'package:flutter_isell_new/controller/stories/stories_controller.dart';
import 'package:flutter_isell_new/core/classes/handling_data_view.dart';
import 'package:flutter_isell_new/core/constants/sellx_colors.dart';
import 'package:flutter_isell_new/data/model/items_modell.dart';
import 'package:flutter_isell_new/views/screens/home/cars_elevant/audi.dart';
import 'package:flutter_isell_new/views/screens/home/cars_elevant/bmw.dart';
import 'package:flutter_isell_new/views/screens/home/cars_elevant/ford.dart';
import 'package:flutter_isell_new/views/screens/home/cars_elevant/mazda.dart';
import 'package:flutter_isell_new/views/screens/home/cars_elevant/mercedec.dart';
import 'package:flutter_isell_new/views/screens/home/cars_elevant/porsche.dart';
import 'package:flutter_isell_new/views/screens/home/cars_elevant/teslarelevant.dart';
import 'package:flutter_isell_new/views/screens/home/cars_elevant/toyota.dart';
import 'package:flutter_isell_new/views/screens/home/cars_elevant/volvo.dart';
import 'package:flutter_isell_new/views/screens/home/cars_elevant/vw.dart';
import 'package:flutter_isell_new/views/screens/items/item_lists/best_items_list.dart';
import 'package:flutter_isell_new/views/screens/stories/storiene.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class BilerHoved extends StatefulWidget {
  const BilerHoved({Key? key}) : super(key: key);

  @override
  _BilerHovedState createState() => _BilerHovedState();
}

class _BilerHovedState extends State<BilerHoved> {
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

  // List app = [
  //   "assets/images/apple.jpeg",
  //   "assets/images/apple.jpeg",
  //   "assets/images/apple.jpeg"
  // ];

  @override
  Widget build(BuildContext context) {
    CarsControllerImp bilcontroller = Get.put(CarsControllerImp());
    BestitemsCarControllerImp bestitemsCarControllerImp =
        Get.put(BestitemsCarControllerImp());
    final List<dynamic> data = bestitemsCarControllerImp.bestecarsdata;

    Get.put(StoriControllerImp());

    return GetBuilder<CarsControllerImp>(
      builder: (controller) => HandlingDataView(
        statusRequest: controller.statusRequest,
        widget: Stack(
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
                                  itemsModel: ItemsModel.fromJson(data[index]),
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
                    margin: const EdgeInsets.only(left: 10, right: 10, top: 15),
                    height: 90,
                    child: ListView.separated(
                      separatorBuilder: (context, index) {
                        return const SizedBox(width: 10);
                      },
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return InkWell(
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () {
                            if (selectedIndex == index) {
                              setState(() {
                                selectedIndex = -1;
                              });
                            } else {
                              switch (index) {
                                case 0:
                                  bilcontroller.getbmwmerke();
                                  break;
                                case 1:
                                  bilcontroller.getaudimerke();
                                  break;
                                case 2:
                                  bilcontroller.getteslamerke();
                                  break;
                                case 3:
                                  bilcontroller.getmercedecmerke();
                                  break;
                                case 4:
                                  bilcontroller.getvwmerke();
                                  break;
                                case 5:
                                  bilcontroller.getporschemerke();
                                  break;
                                case 6:
                                  bilcontroller.getvolvomerke();
                                  break;
                                case 7:
                                  bilcontroller.getfordmerke();
                                  break;
                                case 8:
                                  bilcontroller.gettoyotamerke();
                                  break;
                                case 9:
                                  bilcontroller.getmazdamerke();
                                  break;
                                default:
                                  break;
                              }
                              setState(() {
                                selectedIndex = index;
                              });
                            }
                          },
                          child: Container(
                            width: 90,
                            decoration: BoxDecoration(
                              color: Myisellcolors.appbar,
                              border: Border.all(
                                color: selectedIndex == index
                                    ? Myisellcolors.hoved
                                    : Myisellcolors.hoved,
                                width: selectedIndex == index ? 2 : 0.5,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              widthFactor: 60,
                              heightFactor: 60,
                              child: Image.asset(
                                bilcontroller.bilmerke[index],
                                height: 60,
                                width: 60,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  selectedIndex != -1
                      ? Container(
                          padding: const EdgeInsets.only(
                              left: 10, top: 15, bottom: 0),
                          child: Row(
                            children: [
                              Text(
                                _getRelevantTitle(selectedIndex),
                                style: GoogleFonts.baloo2(
                                    fontSize: 20, color: Myisellcolors.hvit),
                              ),
                            ],
                          ),
                        )
                      : const SizedBox(),
                  selectedIndex != -1
                      ? Container(
                          padding: const EdgeInsets.only(left: 6, top: 10),
                          child: MediaQuery.removePadding(
                            removeTop: true,
                            removeBottom: true,
                            context: context,
                            child: _buildRelevantView(selectedIndex),
                          ),
                        )
                      : const SizedBox(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Widget _buildRelevantView(int selectedIndex) {
    switch (selectedIndex) {
      case 0:
        return const RelevantBMW();
      case 1:
        return const RelevantAUDI();
      case 2:
        return const RelevantTESLA();
      case 3:
        return const RelevantMERCEDEC();
      case 4:
        return const RelevantVW();
      case 5:
        return const RelevantPORSCHE();
      case 6:
        return const RelevantVOLVO();
      case 7:
        return const RelevantFORD();
      case 8:
        return const RelevantTOYOTA();
      case 9:
        return const RelevantMAZDA();
      default:
        return const SizedBox();
    }
  }

  String _getRelevantTitle(int selectedIndex) {
    switch (selectedIndex) {
      case 0:
        return "Relevant BMW";
      case 1:
        return "Relevant AUDI";
      case 2:
        return "Relevant TESLA";
      case 3:
        return "Relevant MERCEDES";
      case 4:
        return "Relevant VOLKSWAGEN";
      case 5:
        return "Relevant PORSCHE";
      case 6:
        return "Relevant VOLVO";
      case 7:
        return "Relevant FORD";
      case 8:
        return "Relevant TOYOTA";
      case 9:
        return "Relevant MAZDA";
      default:
        return "";
    }
  }
}
