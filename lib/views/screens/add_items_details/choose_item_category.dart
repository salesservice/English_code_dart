import 'package:flutter/material.dart';
import 'package:flutter_isell_new/controller/home_page_controller.dart';
import 'package:flutter_isell_new/core/constants/sellx_colors.dart';
import 'package:flutter_isell_new/core/constants/sellx_route_names.dart';
import 'package:flutter_isell_new/data/model/category_model.dart';
import 'package:flutter_isell_new/views/screens/home/navbar.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sticky_headers/sticky_headers.dart';

class ChooseCategory extends StatelessWidget {
  const ChooseCategory({super.key});
  @override
  Widget build(BuildContext context) {
    HomePageControllerImp homePageControllerImp =
        Get.put(HomePageControllerImp());
    return Scaffold(
      backgroundColor: Myisellcolors.home,
      appBar: AppBar(
        elevation: 0,
        iconTheme: const IconThemeData(color: Myisellcolors.hvit),
        actions: [
          Builder(
            builder: (context) => IconButton(
              icon: const Icon(
                Icons.menu_rounded,
                size: 30,
                color: Myisellcolors.hvit,
              ),
              padding: const EdgeInsets.only(right: 20, top: 5),
              onPressed: () => Scaffold.of(context).openEndDrawer(),
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            ),
          ),
        ],
        toolbarHeight: 65,
        backgroundColor: Myisellcolors.home,
        title: Container(
          alignment: Alignment.centerLeft,
          child: Text(
            "Velg kategori",
            style: GoogleFonts.baloo2(fontSize: 20, color: Myisellcolors.hvit),
          ),
        ),
      ),
      endDrawer: const NavBar(),
      body: ListView(
        children: [
          StickyHeader(
            header: Container(
              width: Get.width,
              color: Myisellcolors.home,
              padding: const EdgeInsets.only(left: 21, top: 10, bottom: 10),
              child: Text(
                "Velg kategorien som passer best med\ndin annonse",
                maxLines: 2,
                style:
                    GoogleFonts.baloo2(color: Myisellcolors.hvit, fontSize: 23),
              ),
            ),
            content: Container(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: GridView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: homePageControllerImp.kategorier.length,
                physics: const ScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 4,
                  crossAxisCount: 1,
                  childAspectRatio: 3.2,
                ),
                itemBuilder: (context, index) {
                  return ChooseCategoryList(
                    i: index,
                    kategorierModell: KategoriModell.fromJson(
                        homePageControllerImp.kategorier.elementAt(index)),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ChooseCategoryList extends GetView<HomePageControllerImp> {
  final KategoriModell kategorierModell;
  final int? i;
  const ChooseCategoryList(
      {super.key, required this.kategorierModell, required this.i});

  @override
  Widget build(BuildContext context) {
    List katpic = [
      "assets/images/logoen-removebg.png",
      "assets/images/kathus1.png",
      "assets/images/katcar1.png",
      "assets/images/katboat1.png",
      "assets/images/katmc1.png",
      "assets/images/katsykkel1.png",
      "assets/images/katjobb1.png",
      "assets/images/katboker1.png",
      "assets/images/katmobler1.png",
      "assets/images/katelektronik1.png",
      "assets/images/katklar1.png"
    ];
    List kattext = [
      "Legg til alt annet som ikke passer inn i en spesifikk kategori.",
      "Legg til eiendommer til salgs eller utleie.",
      "Legg til biler som du ønsker å selge eller leie ut.",
      "Legg til båter og maritimt utstyr for salg eller utleie.",
      "Legg til motorsykler og tilbehør som du vil selge.",
      "Legg til sykler for salg eller utleie.",
      "Legg til stillingsannonser for ledige jobber.",
      "Legg til bøker du ønsker å selge eller bytte.",
      "Legg til møbler og interiørprodukter for salg eller utleie.",
      "Legg til elektronikk og gadgets for salg eller utleie.",
      "Legg til klær og tilbehør for salg eller utleie."
    ];
    Get.put(HomePageControllerImp());

    return InkWell(
      // onTap: () {
      //   controller.gotoitems(controller.kategorier, i!,
      //       kategorierModell.kategoriId!, kategorierModell.kategoriName!);
      // },
      onTap: () {
        kategorierModell.kategoriName == "Sellx"
            ? Get.toNamed(AppRouter.sellxannonse)
            : kategorierModell.kategoriName == "Eiendom"
                ? Get.toNamed(AppRouter.eiendomannonse)
                : kategorierModell.kategoriName == "Biler"
                    ? Get.toNamed(AppRouter.bilerannonse)
                    : kategorierModell.kategoriName == "Båter"
                        ? Get.toNamed(AppRouter.baterannonse)
                        : kategorierModell.kategoriName == "Motorsykler"
                            ? Get.toNamed(AppRouter.mcannonse)
                            : kategorierModell.kategoriName == "Sykler"
                                ? Get.toNamed(AppRouter.syklerannonse)
                                : kategorierModell.kategoriName == "Jobber"
                                    ? Get.toNamed(AppRouter.jobberannonse)
                                    : kategorierModell.kategoriName == "Bøker"
                                        ? Get.toNamed(AppRouter.bokerannonse)
                                        : kategorierModell.kategoriName ==
                                                "Møbler"
                                            ? Get.toNamed(
                                                AppRouter.moblerannonse)
                                            : kategorierModell.kategoriName ==
                                                    "Elektronikk"
                                                ? Get.toNamed(AppRouter
                                                    .elektronikkannonse)
                                                : Get.toNamed(
                                                    AppRouter.klarannonse);
      },
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: const BorderSide(width: 0.3, color: Myisellcolors.hoved)),
        elevation: 10,
        color: Myisellcolors.appbar,
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 10, bottom: 10, left: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${kategorierModell.kategoriName}",
                    style: GoogleFonts.baloo2(
                        color: Myisellcolors.hoved, fontSize: 23),
                  ),
                  //const Spacer(),
                  Expanded(
                    child: Container(
                      width: 250,
                      padding: const EdgeInsets.only(right: 10),
                      child: Row(
                        children: [
                          Flexible(
                            child: Text(
                              kattext[i!],
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.baloo2(
                                color: Myisellcolors.hvit70,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Container(
              padding: EdgeInsets.only(
                  top: 8,
                  right: katpic[i!] == "assets/images/logoen-removebg.png"
                      ? 0
                      : 18),
              child: Padding(
                padding: katpic[i!] == "assets/images/logoen-removebg.png"
                    ? EdgeInsets.only(right: Get.width / 45)
                    : const EdgeInsets.only(left: 0),
                child: Image.asset(katpic[i!],
                    width: katpic[i!] == "assets/images/logoen-removebg.png"
                        ? 70
                        : katpic[i!] == "assets/images/kathus1.png"
                            ? 60
                            : katpic[i!] == "assets/images/katcar1.png"
                                ? 60
                                : katpic[i!] == "assets/images/kathus1.png"
                                    ? 60
                                    : katpic[i!] == "assets/images/katboat1.png"
                                        ? 65
                                        : katpic[i!] ==
                                                "assets/images/katmc1.png"
                                            ? 69
                                            : katpic[i!] ==
                                                    "assets/images/katsykkel1.png"
                                                ? 69
                                                : katpic[i!] ==
                                                        "assets/images/katjobb1.png"
                                                    ? 60
                                                    : katpic[i!] ==
                                                            "assets/images/kathus1.png"
                                                        ? 60
                                                        : katpic[i!] ==
                                                                "assets/images/katboker1.png"
                                                            ? 60
                                                            : katpic[i!] ==
                                                                    "assets/images/katmobler1.png"
                                                                ? 60
                                                                : katpic[i!] ==
                                                                        "assets/images/katelektronik1.png"
                                                                    ? 60
                                                                    : 60),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
