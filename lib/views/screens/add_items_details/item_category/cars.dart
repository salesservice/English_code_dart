import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_isell_new/controller/add_items/car_items_controller.dart';
import 'package:flutter_isell_new/core/classes/handling_data_view.dart';
import 'package:flutter_isell_new/core/constants/sellx_colors.dart';
import 'package:flutter_isell_new/core/functions/upload_file.dart';
import 'package:flutter_isell_new/core/functions/validate_input.dart';
import 'package:flutter_isell_new/views/screens/add_items_details/item_category/car_brands.dart';
import 'package:flutter_isell_new/views/screens/home/navbar.dart';
import 'package:flutter_isell_new/views/widget/sellx_%20buttons.dart';
import 'package:flutter_isell_new/views/widget/sellx_text_filed.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class BilerAnnonse extends StatelessWidget {
  const BilerAnnonse({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> drivstoff = [
      "Bensin",
      "Diesel",
      "Gass",
      "Elektrisitet",
      "Elektrisitet + bensin",
      "Elektrisitet + diesel",
      "Gass + bensin",
      "Gass + diesel",
      "Hydrogen"
    ];
    List<String> hjuldrifttype = [
      "Forhjulsdrift",
      "Bakhjulsdrift",
      "Firehjulsdrift",
    ];

    List<String> typesengen = [
      "Dobbeltseng",
      "Enkeltseng",
      "Fransk sengløsning",
      "Tversgående seng"
    ];

    List<String> karosseritype = [
      "Cabriolet",
      "Coupe",
      "Flerbruksbil",
      "Kasse",
      "Kombi 3-dørs",
      "Kombi 5-dørs",
      "Pickup",
      "SUV/Offroad",
      "Sedan",
      "Stasjonsvogn",
      "Andre"
    ];
    List<String> avgiftklassetype = [
      "Kombinertbil",
      "Lett lastebil",
      "Minibuss",
      "Personbil",
      "Varebil",
      "Andre"
    ];
    List<String> girkassetype = [
      "Automat",
      "Manuelt",
    ];

    List<String> listgarantitype = [
      "Nybilgaranti",
      "Gammelbilgaranti fra forhandler",
    ];

    List<String> tilsant = [
      "Ny",
      "Brukt",
    ];

    List<String> hartilsandsrapport = [
      "Ja",
      "Nei",
    ];

    List<String> harbilgaranti = [
      "Ja",
      "Nei",
    ];

    List<String> bobilgaranti = [
      "Resterende ny bobilgaranti",
      "Resterende brukt bobilgaranti",
    ];

    AddBilAnnonseController controller = Get.put(AddBilAnnonseController());
    controller.VelgAnnonseType(controller.annonsetype!);

    return Form(
      key: controller.gkBilerannonse,
      child: Scaffold(
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
              "Biler",
              style:
                  GoogleFonts.baloo2(fontSize: 20, color: Myisellcolors.hvit),
            ),
          ),
        ),
        endDrawer: const NavBar(),
        body: GetBuilder<AddBilAnnonseController>(
          builder: (controller) => HandlingDataRequest(
            statusRequest: controller.statusRequest,
            widget: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        height: Get.height / 4.2,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Myisellcolors.hoved, width: 0.4),
                        ),
                        child: Stack(
                          children: [
                            SizedBox(
                              height: 200,
                              child: PageView.builder(
                                itemCount: controller.imagenames.length,
                                controller: controller.pageController,
                                onPageChanged: (index) {
                                  controller.updateCounter();
                                },
                                itemBuilder: (context, index) {
                                  File? image = controller.imagenames[index];
                                  return Center(
                                    child: image != null
                                        ? Image.file(image)
                                        : Container(),
                                  );
                                },
                              ),
                            ),
                            Positioned(
                              bottom: 10.0,
                              left: 16.0,
                              child: Obx(() {
                                // Check if there are any images
                                if (controller.totalImages.value == 0) {
                                  return const Text(
                                    "0/0",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.0,
                                    ),
                                  );
                                } else {
                                  // Display the current index and total images
                                  return Text(
                                    "${controller.currentIndex.value + 1}/${controller.totalImages.value}",
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.0,
                                    ),
                                  );
                                }
                              }),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        left: Get.width / 1.5,
                        top: Get.width / 2.3,
                        child: InkWell(
                          hoverColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          onTap: () {
                            imageUploadCamera();
                          },
                          child: const CircleAvatar(
                            radius: 28,
                            backgroundColor: Myisellcolors.hoved,
                            child: Icon(
                              Icons.camera_enhance,
                              color: Myisellcolors.home,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: Get.width / 1.2,
                        top: Get.width / 2.3,
                        child: InkWell(
                          hoverColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          onTap: () {
                            controller.chooseImages();
                          },
                          child: const CircleAvatar(
                            radius: 28,
                            backgroundColor: Myisellcolors.hoved,
                            child: Icon(
                              Icons.camera,
                              color: Myisellcolors.home,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        top: Get.height / 22, left: Get.height / 50),
                    child: Text(
                      "Ønsker du å:",
                      style: GoogleFonts.baloo2(
                          color: Myisellcolors.hvit, fontSize: 18),
                    ),
                  ),
                  SizedBox(height: Get.height / 40),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Spacer(),
                          InkWell(
                            onTap: () {
                              controller.VelgAnnonseType("Selge");
                            },
                            child: Container(
                              height: Get.height / 21,
                              width: Get.width / 2.3,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                    color: controller.annonsetype == "Selge"
                                        ? Myisellcolors.hoved
                                        : Myisellcolors.hvit70),
                              ),
                              child: Center(
                                child: Text(
                                  "Selge",
                                  style: GoogleFonts.roboto(
                                      fontSize: 16,
                                      color: controller.annonsetype == "Selge"
                                          ? Myisellcolors.hoved
                                          : Myisellcolors.hvit70),
                                ),
                              ),
                            ),
                          ),
                          const Spacer(),
                          InkWell(
                            onTap: () {
                              controller.VelgAnnonseType("Leie ut");
                            },
                            child: Container(
                              height: Get.height / 21,
                              width: Get.width / 2.3,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                    color: controller.annonsetype == "Leie ut"
                                        ? Myisellcolors.hoved
                                        : Myisellcolors.hvit70),
                              ),
                              child: Center(
                                child: Text(
                                  "Leie ut",
                                  style: GoogleFonts.roboto(
                                      fontSize: 16,
                                      color: controller.annonsetype == "Leie ut"
                                          ? Myisellcolors.hoved
                                          : Myisellcolors.hvit70),
                                ),
                              ),
                            ),
                          ),
                          const Spacer()
                        ],
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        top: Get.height / 40, left: Get.height / 50),
                    child: Text(
                      "Kjøretøyets type:",
                      style: GoogleFonts.baloo2(
                          color: Myisellcolors.hvit, fontSize: 18),
                    ),
                  ),
                  SizedBox(height: Get.height / 40),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Spacer(),
                          InkWell(
                            onTap: () {
                              controller.VelgBilType("Personbil");
                            },
                            child: Container(
                              height: Get.height / 21,
                              width: Get.width / 2.3,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                    color: controller.biltype == "Personbil"
                                        ? Myisellcolors.hoved
                                        : Myisellcolors.hvit70),
                              ),
                              child: Center(
                                child: Text(
                                  "Personbil",
                                  style: GoogleFonts.roboto(
                                      fontSize: 16,
                                      color: controller.biltype == "Personbil"
                                          ? Myisellcolors.hoved
                                          : Myisellcolors.hvit70),
                                ),
                              ),
                            ),
                          ),
                          const Spacer(),
                          InkWell(
                            onTap: () {
                              controller.VelgBilType("Campingvogn");
                            },
                            child: Container(
                              height: Get.height / 21,
                              width: Get.width / 2.3,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                    color: controller.biltype == "Campingvogn"
                                        ? Myisellcolors.hoved
                                        : Myisellcolors.hvit70),
                              ),
                              child: Center(
                                child: Text(
                                  "Campingvogn",
                                  style: GoogleFonts.roboto(
                                      fontSize: 16,
                                      color: controller.biltype == "Campingvogn"
                                          ? Myisellcolors.hoved
                                          : Myisellcolors.hvit70),
                                ),
                              ),
                            ),
                          ),
                          const Spacer()
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.only(
                            top: Get.height / 55, left: Get.width / 22),
                        child: InkWell(
                          onTap: () {
                            controller.VelgBilType("Bobil");
                          },
                          child: Container(
                            height: Get.height / 21,
                            width: Get.width / 2.3,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                  color: controller.biltype == "Bobil"
                                      ? Myisellcolors.hoved
                                      : Myisellcolors.hvit70),
                            ),
                            child: Center(
                              child: Text(
                                "Bobil",
                                style: GoogleFonts.roboto(
                                    fontSize: 16,
                                    color: controller.biltype == "Bobil"
                                        ? Myisellcolors.hoved
                                        : Myisellcolors.hvit70),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 30, left: 15, right: 10),
                    child: Text(
                      "Fyll inn informasjonen nedenfor som passer til din annonse. Feltene merket med * er påkrevde.",
                      style: GoogleFonts.baloo2(
                          color: Myisellcolors.hvit, fontSize: 18),
                    ),
                  ),
                  controller.biltype == "Personbil"
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(
                                  top: 20, left: 15, right: 10),
                              child: Text(
                                "Kjøretøyets generell informasjon:",
                                style: GoogleFonts.baloo2(
                                    color: Myisellcolors.hvit,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(
                                  top: 25, left: 16, right: 16),
                              child: DropdownButtonHideUnderline(
                                child: ButtonTheme(
                                  alignedDropdown: true,
                                  child: DropdownButtonFormField(
                                    dropdownColor: Myisellcolors.appbar,
                                    decoration: InputDecoration(
                                        label: Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: Text(
                                            'Bilen står i',
                                            style: GoogleFonts.mandali(
                                                color: Myisellcolors.hoved,
                                                fontSize: 19),
                                          ),
                                        ),
                                        focusedErrorBorder:
                                            const OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(5)),
                                                borderSide: BorderSide(
                                                    color:
                                                        Myisellcolors.hoved)),
                                        errorBorder: const OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5)),
                                            borderSide: BorderSide(
                                                color: Myisellcolors.hoved)),
                                        // contentPadding: const EdgeInsets.only(
                                        //     right: 8, left: 1, top: 20, bottom: 20),
                                        enabledBorder: const OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5)),
                                          borderSide: BorderSide(
                                              color: Myisellcolors.hoved,
                                              width: 1),
                                        ),
                                        fillColor: Myisellcolors.home,
                                        focusedBorder: const OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5)),
                                          borderSide: BorderSide(
                                              color: Myisellcolors.hoved,
                                              width: 1),
                                        ),
                                        border: const OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(5),
                                          ),
                                        ),
                                        filled: true),
                                    // value: controller.bilenstari[0],

                                    validator: (value) {
                                      if (value == null) {
                                        return 'Hvor er bilen står parkert';
                                      } else {
                                        return null;
                                      }
                                    },
                                    // onSaved: (newValue) {
                                    // controller.carstar!.value == newValue;
                                    // },
                                    icon: const Icon(
                                      Icons.keyboard_arrow_down_sharp,
                                      size: (28),
                                      color: Myisellcolors.hoved,
                                    ),
                                    hint: const Text('Kjøretøyets står i *',
                                        style: TextStyle(
                                            color: Myisellcolors.hvit70,
                                            fontSize: 15)),
                                    items: controller.bilenstari.map(
                                      (e) {
                                        return DropdownMenuItem(
                                          value: e,
                                          child: Text(
                                            e,
                                            style: GoogleFonts.roboto(
                                                color: Myisellcolors.hvit70),
                                          ),
                                        );
                                      },
                                    ).toList(),

                                    onChanged: (value) {
                                      // controller.carstari.value =
                                      //     value as String;
                                      // controller.carstar!.text = value;
                                      controller.onChangedCarStari(value);
                                      controller.update();
                                    },
                                  ),
                                ),
                              ),
                            ),
                            IsellTextField(
                              con: controller.carregnummer,
                              maxlines: null,
                              focusNode: FocusNode(),
                              paddingcontainer: const EdgeInsets.only(
                                  left: 16, right: 16, top: 25),
                              fontsizehinttext: 12,
                              validater: (val) {
                                return validInput(val!, 0, 100, "");
                              },
                              hinttxt:
                                  "Reg.nummer må fylles ut for biler registrert før 1981",
                              hinttxtcolor: Myisellcolors.hvit70,
                              contentpadding:
                                  const EdgeInsets.fromLTRB(30, 20, 30, 20),
                              txtcolor: Myisellcolors.hvit70,
                              txttype: TextInputType.multiline,
                              onSav: (value) {},
                              height: 22,
                              width: 1,
                              cursorColor: Myisellcolors.hvit70,
                              borderR: 5,
                              borderwidth: 1,
                              bordersidecolor: Myisellcolors.hoved,
                              obs: false,
                              label: Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  'Registreringsnummer *',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.mandali(
                                      color: Myisellcolors.hoved, fontSize: 19),
                                ),
                              ),
                              float: FloatingLabelBehavior.always,
                            ),
                            IsellTextField(
                              con: controller.carchassis,
                              maxlines: null,
                              focusNode: FocusNode(),
                              paddingcontainer: const EdgeInsets.only(
                                  left: 16, right: 16, top: 25),
                              fontsizehinttext: 13,
                              validater: (val) {
                                return validInput(val!, 17, 50, "");
                              },
                              hinttxt:
                                  "Står på første side i vogkortet eller vegvesen.no",
                              hinttxtcolor: Myisellcolors.hvit70,
                              contentpadding:
                                  const EdgeInsets.fromLTRB(30, 20, 30, 20),
                              txtcolor: Myisellcolors.hvit70,
                              txttype: TextInputType.multiline,
                              onSav: (value) {},
                              height: 22,
                              width: 1,
                              cursorColor: Myisellcolors.hvit70,
                              borderR: 5,
                              borderwidth: 1,
                              bordersidecolor: Myisellcolors.hoved,
                              obs: false,
                              label: Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  'Chassisnummer *',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.mandali(
                                      color: Myisellcolors.hoved, fontSize: 19),
                                ),
                              ),
                              float: FloatingLabelBehavior.always,
                            ),
                            Container(
                              padding: const EdgeInsets.only(
                                  top: 25, left: 16, right: 16),
                              child: DropdownButtonHideUnderline(
                                child: ButtonTheme(
                                  alignedDropdown: true,
                                  child: DropdownButtonFormField(
                                    dropdownColor: Myisellcolors.appbar,
                                    decoration: InputDecoration(
                                        label: Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: Text(
                                            'Tilstand',
                                            style: GoogleFonts.mandali(
                                                color: Myisellcolors.hoved,
                                                fontSize: 19),
                                          ),
                                        ),
                                        focusedErrorBorder:
                                            const OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(5)),
                                                borderSide: BorderSide(
                                                    color:
                                                        Myisellcolors.hoved)),
                                        errorBorder: const OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5)),
                                            borderSide: BorderSide(
                                                color: Myisellcolors.hoved)),
                                        // contentPadding: const EdgeInsets.only(
                                        //     right: 8, left: 1, top: 20, bottom: 20),
                                        enabledBorder: const OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5)),
                                          borderSide: BorderSide(
                                              color: Myisellcolors.hoved,
                                              width: 1),
                                        ),
                                        fillColor: Myisellcolors.home,
                                        focusedBorder: const OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5)),
                                          borderSide: BorderSide(
                                              color: Myisellcolors.hoved,
                                              width: 1),
                                        ),
                                        border: const OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(5),
                                          ),
                                        ),
                                        filled: true),
                                    validator: (value) {
                                      if (value == null) {
                                        return 'Du må velge Kjøretøyets tilstand';
                                      } else {
                                        return null;
                                      }
                                    },
                                    // onSaved: (newValue) {
                                    //   controller.itemtistand!.value == newValue;
                                    // },
                                    icon: const Icon(
                                      Icons.keyboard_arrow_down_sharp,
                                      size: (28),
                                      color: Myisellcolors.hoved,
                                    ),
                                    hint: const Text('Kjøretøyets tilstand *',
                                        style: TextStyle(
                                            color: Myisellcolors.hvit70,
                                            fontSize: 15)),
                                    items: tilsant.map(
                                      (e) {
                                        return DropdownMenuItem(
                                          value: e,
                                          child: Text(
                                            e,
                                            style: GoogleFonts.roboto(
                                                color: Myisellcolors.hvit70),
                                          ),
                                        );
                                      },
                                    ).toList(),
                                    onChanged: (value) {
                                      controller.tilstandbil.value =
                                          value as String;
                                      controller.cartilstand!.text = value;
                                      controller.gkBilerannonse.currentState
                                          ?.validate();
                                    },
                                  ),
                                ),
                              ),
                            ),
                            IsellTextField(
                              con: controller.carmodellar,
                              maxlines: null,
                              focusNode: FocusNode(),
                              paddingcontainer: const EdgeInsets.only(
                                  left: 16, right: 16, top: 25),
                              fontsizehinttext: 14.5,
                              validater: (val) {
                                return validInput(val!, 4, 4, "");
                              },
                              hinttxt: "F.eks. 2022",
                              hinttxtcolor: Myisellcolors.hvit70,
                              contentpadding:
                                  const EdgeInsets.fromLTRB(30, 20, 30, 20),
                              txtcolor: Myisellcolors.hvit70,
                              txttype: TextInputType.number,
                              onSav: (value) {},
                              height: 22,
                              width: 1,
                              cursorColor: Myisellcolors.hvit70,
                              borderR: 5,
                              borderwidth: 1,
                              bordersidecolor: Myisellcolors.hoved,
                              obs: false,
                              label: Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  'Modellår',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.mandali(
                                      color: Myisellcolors.hoved, fontSize: 19),
                                ),
                              ),
                              float: FloatingLabelBehavior.always,
                            ),
                            const BilMerke(),
                            IsellTextField(
                              maxlines: null,
                              focusNode: FocusNode(),
                              paddingcontainer: const EdgeInsets.only(
                                  left: 16, right: 16, top: 25),
                              fontsizehinttext: 13,
                              validater: (val) {
                                return validInput(val!, 0, 100, "");
                              },
                              hinttxt: "Skriv en kort overskrift til annonsen",
                              hinttxtcolor: Myisellcolors.hvit70,
                              contentpadding:
                                  const EdgeInsets.fromLTRB(30, 20, 30, 20),
                              txtcolor: Myisellcolors.hvit70,
                              txttype: TextInputType.multiline,
                              onSav: (value) {},
                              height: 22,
                              width: 1,
                              cursorColor: Myisellcolors.hvit70,
                              borderR: 5,
                              borderwidth: 1,
                              bordersidecolor: Myisellcolors.hoved,
                              con: controller.overskrift,
                              obs: false,
                              label: Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  'Overskrift *',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.mandali(
                                      color: Myisellcolors.hoved, fontSize: 19),
                                ),
                              ),
                              float: FloatingLabelBehavior.always,
                            ),
                            Container(
                              margin: const EdgeInsets.only(
                                  top: 6, left: 16.5, right: 12),
                              child: Text(
                                "Maks 100 tegn. Her kan du beskrive bilmodellen eller kjøretøyet kort, for eks. JWC 1.6-218 ALL4 eller E220d 4M All-terrain.",
                                style: GoogleFonts.roboto(
                                    color: Myisellcolors.hvit70, fontSize: 12),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(
                                  top: 15, left: 16, right: 16),
                              child: DropdownButtonHideUnderline(
                                child: ButtonTheme(
                                  alignedDropdown: true,
                                  child: DropdownButtonFormField(
                                    dropdownColor: Myisellcolors.appbar,
                                    decoration: InputDecoration(
                                        label: Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: Text(
                                            'Drivstoff',
                                            style: GoogleFonts.mandali(
                                                color: Myisellcolors.hoved,
                                                fontSize: 19),
                                          ),
                                        ),
                                        focusedErrorBorder:
                                            const OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(5)),
                                                borderSide: BorderSide(
                                                    color:
                                                        Myisellcolors.hoved)),
                                        errorBorder: const OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5)),
                                            borderSide: BorderSide(
                                                color: Myisellcolors.hoved)),
                                        // contentPadding: const EdgeInsets.only(
                                        //     right: 8, left: 1, top: 20, bottom: 20),
                                        enabledBorder: const OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5)),
                                          borderSide: BorderSide(
                                              color: Myisellcolors.hoved,
                                              width: 1),
                                        ),
                                        fillColor: Myisellcolors.home,
                                        focusedBorder: const OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5)),
                                          borderSide: BorderSide(
                                              color: Myisellcolors.hoved,
                                              width: 1),
                                        ),
                                        border: const OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(5),
                                          ),
                                        ),
                                        filled: true),
                                    validator: (value) {
                                      if (value == null) {
                                        return 'Du må velge drivstoff type';
                                      } else {
                                        return null;
                                      }
                                    },
                                    // onSaved: (newValue) {
                                    //   controller.itemtistand!.value == newValue;
                                    // },
                                    icon: const Icon(
                                      Icons.keyboard_arrow_down_sharp,
                                      size: (28),
                                      color: Myisellcolors.hoved,
                                    ),
                                    hint: const Text('Drivstoff *',
                                        style: TextStyle(
                                            color: Myisellcolors.hvit70,
                                            fontSize: 15)),
                                    items: drivstoff.map(
                                      (e) {
                                        return DropdownMenuItem(
                                          value: e,
                                          child: Text(
                                            e,
                                            style: GoogleFonts.roboto(
                                                color: Myisellcolors.hvit70),
                                          ),
                                        );
                                      },
                                    ).toList(),
                                    onChanged: (value) {
                                      controller.cardrivstoffet.value =
                                          value as String;
                                      controller.cardrivstoff!.text = value;
                                      controller.gkBilerannonse.currentState
                                          ?.validate();
                                    },
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(
                                  top: 20, left: 15, right: 10),
                              child: Text(
                                "Teknisk informasjon:",
                                style: GoogleFonts.baloo2(
                                    color: Myisellcolors.hvit,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            IsellTextField(
                              con: controller.carsylindervolum,
                              maxlines: null,
                              focusNode: FocusNode(),
                              paddingcontainer: const EdgeInsets.only(
                                  left: 16, right: 16, top: 25),
                              fontsizehinttext: 13,
                              // validater: (val) {
                              //   return validInput(val!, 0, 50, "");
                              // },
                              hinttxt: "Sylindervolum i liter",
                              hinttxtcolor: Myisellcolors.hvit70,
                              contentpadding:
                                  const EdgeInsets.fromLTRB(30, 20, 30, 20),
                              txtcolor: Myisellcolors.hvit70,
                              txttype: TextInputType.number,
                              onSav: (value) {},
                              height: 22,
                              width: 1,
                              cursorColor: Myisellcolors.hvit70,
                              borderR: 5,
                              borderwidth: 1,
                              bordersidecolor: Myisellcolors.hoved,
                              obs: false,
                              label: Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  'Sylindervolum',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.mandali(
                                      color: Myisellcolors.hoved, fontSize: 19),
                                ),
                              ),
                              float: FloatingLabelBehavior.always,
                            ),
                            Container(
                              margin: const EdgeInsets.only(
                                  top: 6, left: 16.5, right: 12),
                              child: Text(
                                "Dette kan du finne i vogokortet under Motor/drivverk.\nFor eks. 2600 cm\u00b3 = 2.6 L",
                                style: GoogleFonts.roboto(
                                    color: Myisellcolors.hvit70, fontSize: 12),
                              ),
                            ),
                            IsellTextField(
                              con: controller.careffekt,
                              maxlines: null,
                              focusNode: FocusNode(),
                              paddingcontainer: const EdgeInsets.only(
                                  left: 16, right: 16, top: 25),
                              fontsizehinttext: 13,
                              // validater: (val) {
                              //   return validInput(val!, 0, 50, "");
                              // },
                              hinttxt: "Effekt i hk",
                              hinttxtcolor: Myisellcolors.hvit70,
                              contentpadding:
                                  const EdgeInsets.fromLTRB(30, 20, 30, 20),
                              txtcolor: Myisellcolors.hvit70,
                              txttype: TextInputType.number,
                              onSav: (value) {},
                              height: 22,
                              width: 1,
                              cursorColor: Myisellcolors.hvit70,
                              borderR: 5,
                              borderwidth: 1,
                              bordersidecolor: Myisellcolors.hoved,
                              obs: false,
                              label: Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  'Hestekrefter',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.mandali(
                                      color: Myisellcolors.hoved, fontSize: 19),
                                ),
                              ),
                              float: FloatingLabelBehavior.always,
                            ),
                            controller.annonsetype == "Selge"
                                ? Container(
                                    padding: const EdgeInsets.only(
                                        top: 15, left: 16, right: 16),
                                    child: DropdownButtonHideUnderline(
                                      child: ButtonTheme(
                                        alignedDropdown: true,
                                        child: DropdownButtonFormField(
                                          dropdownColor: Myisellcolors.appbar,
                                          decoration: InputDecoration(
                                              label: Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 10),
                                                child: Text(
                                                  'Trimmet?',
                                                  style: GoogleFonts.mandali(
                                                      color:
                                                          Myisellcolors.hoved,
                                                      fontSize: 19),
                                                ),
                                              ),
                                              focusedErrorBorder:
                                                  const OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.all(Radius
                                                              .circular(5)),
                                                      borderSide: BorderSide(
                                                          color: Myisellcolors
                                                              .hoved)),
                                              errorBorder:
                                                  const OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius
                                                                  .circular(5)),
                                                      borderSide: BorderSide(
                                                          color: Myisellcolors
                                                              .hoved)),
                                              // contentPadding: const EdgeInsets.only(
                                              //     right: 8, left: 1, top: 20, bottom: 20),
                                              enabledBorder:
                                                  const OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(5)),
                                                borderSide: BorderSide(
                                                    color: Myisellcolors.hoved,
                                                    width: 1),
                                              ),
                                              fillColor: Myisellcolors.home,
                                              focusedBorder:
                                                  const OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(5)),
                                                borderSide: BorderSide(
                                                    color: Myisellcolors.hoved,
                                                    width: 1),
                                              ),
                                              border: const OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(5),
                                                ),
                                              ),
                                              filled: true),
                                          // validator: (value) {
                                          //   if (value == null) {
                                          //     return 'Du må velge drivstoff type';
                                          //   } else {
                                          //     return null;
                                          //   }
                                          // },
                                          onSaved: (newValue) {
                                            controller.cartrimmet!.text ==
                                                newValue;
                                          },

                                          icon: const Icon(
                                            Icons.keyboard_arrow_down_sharp,
                                            size: (28),
                                            color: Myisellcolors.hoved,
                                          ),
                                          hint: const Text(
                                              'Har eller er bilens motor vært trimmet?',
                                              style: TextStyle(
                                                  color: Myisellcolors.hvit70,
                                                  fontSize: 14)),

                                          items: controller.trimmet.map(
                                            (e) {
                                              return DropdownMenuItem(
                                                value: e,
                                                child: Text(
                                                  e,
                                                  style: GoogleFonts.roboto(
                                                      color:
                                                          Myisellcolors.hvit70),
                                                ),
                                              );
                                            },
                                          ).toList(),
                                          onChanged:
                                              controller.onChangedCallback,
                                        ),
                                      ),
                                    ),
                                  )
                                : const SizedBox(),
                            Container(
                              margin: const EdgeInsets.only(
                                  top: 6, left: 16.5, right: 12),
                              child: Text(
                                "Dersom motoren har vært eller er mekanisk eller elektronisk justert for større effekt eller flere hestekrefter, må du oppgi dette",
                                style: GoogleFonts.roboto(
                                    color: Myisellcolors.hvit70, fontSize: 12),
                              ),
                            ),
                            controller.cartrimmet!.text == "Ja"
                                ? IsellTextField(
                                    con: controller.whytrimmet,
                                    maxlines: null,
                                    focusNode: FocusNode(),
                                    paddingcontainer: const EdgeInsets.only(
                                        left: 16, right: 16, top: 25),
                                    fontsizehinttext: 13,
                                    // validater: (val) {
                                    //   return validInput(val!, 0, 50, "");
                                    // },
                                    hinttxt: "Hvordan er motoren justert?",
                                    hinttxtcolor: Myisellcolors.hvit70,
                                    contentpadding: const EdgeInsets.fromLTRB(
                                        30, 20, 30, 20),
                                    txtcolor: Myisellcolors.hvit70,
                                    txttype: TextInputType.name,
                                    onSav: (value) {},
                                    height: 22,
                                    width: 1,
                                    cursorColor: Myisellcolors.hvit70,
                                    borderR: 5,
                                    borderwidth: 1,
                                    bordersidecolor: Myisellcolors.hoved,
                                    obs: false,
                                    label: Container(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: Text(
                                        'Hvordan da?',
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.mandali(
                                            color: Myisellcolors.hoved,
                                            fontSize: 19),
                                      ),
                                    ),
                                    float: FloatingLabelBehavior.always,
                                  )
                                : const SizedBox(),
                            IsellTextField(
                              con: controller.carco2utslipp,
                              maxlines: null,
                              focusNode: FocusNode(),
                              paddingcontainer: const EdgeInsets.only(
                                  left: 16, right: 16, top: 25),
                              fontsizehinttext: 13,
                              // validater: (val) {
                              //   return validInput(val!, 0, 50, "");
                              // },
                              hinttxt:
                                  "Se vognkortet under Prøveresultater/miljøklasse",
                              hinttxtcolor: Myisellcolors.hvit70,
                              contentpadding:
                                  const EdgeInsets.fromLTRB(30, 20, 30, 20),
                              txtcolor: Myisellcolors.hvit70,
                              txttype: TextInputType.number,
                              onSav: (value) {},
                              height: 22,
                              width: 1,
                              cursorColor: Myisellcolors.hvit70,
                              borderR: 5,
                              borderwidth: 1,
                              bordersidecolor: Myisellcolors.hoved,
                              obs: false,
                              label: Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  'CO\u2082-utslipp i g/km',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.mandali(
                                      color: Myisellcolors.hoved, fontSize: 19),
                                ),
                              ),
                              float: FloatingLabelBehavior.always,
                            ),
                            IsellTextField(
                              con: controller.carbattericp,
                              maxlines: null,
                              focusNode: FocusNode(),
                              paddingcontainer: const EdgeInsets.only(
                                  left: 16, right: 16, top: 25),
                              fontsizehinttext: 13,
                              // validater: (val) {
                              //   return validInput(val!, 0, 50, "");
                              // },
                              hinttxt: "Batterikapasitet i kWh",
                              hinttxtcolor: Myisellcolors.hvit70,
                              contentpadding:
                                  const EdgeInsets.fromLTRB(30, 20, 30, 20),
                              txtcolor: Myisellcolors.hvit70,
                              txttype: TextInputType.number,
                              onSav: (value) {},
                              height: 22,
                              width: 1,
                              cursorColor: Myisellcolors.hvit70,
                              borderR: 5,
                              borderwidth: 1,
                              bordersidecolor: Myisellcolors.hoved,
                              obs: false,
                              label: Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  'Batterikapasitet',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.mandali(
                                      color: Myisellcolors.hoved, fontSize: 19),
                                ),
                              ),
                              float: FloatingLabelBehavior.always,
                            ),
                            IsellTextField(
                              con: controller.carrekkevidde,
                              maxlines: null,
                              focusNode: FocusNode(),
                              paddingcontainer: const EdgeInsets.only(
                                  left: 16, right: 16, top: 25),
                              fontsizehinttext: 13,
                              // validater: (val) {
                              //   return validInput(val!, 0, 50, "");
                              // },
                              hinttxt: "Elektrisk rekkevidde fra produsenten",
                              hinttxtcolor: Myisellcolors.hvit70,
                              contentpadding:
                                  const EdgeInsets.fromLTRB(30, 20, 30, 20),
                              txtcolor: Myisellcolors.hvit70,
                              txttype: TextInputType.number,
                              onSav: (value) {},
                              height: 22,
                              width: 1,
                              cursorColor: Myisellcolors.hvit70,
                              borderR: 5,
                              borderwidth: 1,
                              bordersidecolor: Myisellcolors.hoved,
                              obs: false,
                              label: Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  'Rekkevidde i km',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.mandali(
                                      color: Myisellcolors.hoved, fontSize: 19),
                                ),
                              ),
                              float: FloatingLabelBehavior.always,
                            ),
                            Container(
                              padding: const EdgeInsets.only(
                                  top: 15, left: 16, right: 16),
                              child: DropdownButtonHideUnderline(
                                child: ButtonTheme(
                                  alignedDropdown: true,
                                  child: DropdownButtonFormField(
                                    dropdownColor: Myisellcolors.appbar,
                                    decoration: InputDecoration(
                                        label: Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: Text(
                                            'Girkasse',
                                            style: GoogleFonts.mandali(
                                                color: Myisellcolors.hoved,
                                                fontSize: 19),
                                          ),
                                        ),
                                        focusedErrorBorder:
                                            const OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(5)),
                                                borderSide: BorderSide(
                                                    color:
                                                        Myisellcolors.hoved)),
                                        errorBorder: const OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5)),
                                            borderSide: BorderSide(
                                                color: Myisellcolors.hoved)),
                                        // contentPadding: const EdgeInsets.only(
                                        //     right: 8, left: 1, top: 20, bottom: 20),
                                        enabledBorder: const OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5)),
                                          borderSide: BorderSide(
                                              color: Myisellcolors.hoved,
                                              width: 1),
                                        ),
                                        fillColor: Myisellcolors.home,
                                        focusedBorder: const OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5)),
                                          borderSide: BorderSide(
                                              color: Myisellcolors.hoved,
                                              width: 1),
                                        ),
                                        border: const OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(5),
                                          ),
                                        ),
                                        filled: true),
                                    validator: (value) {
                                      if (value == null) {
                                        return 'Du må velge girkasse type';
                                      } else {
                                        return null;
                                      }
                                    },
                                    // onSaved: (newValue) {
                                    //   controller.itemtistand!.value == newValue;
                                    // },
                                    icon: const Icon(
                                      Icons.keyboard_arrow_down_sharp,
                                      size: (28),
                                      color: Myisellcolors.hoved,
                                    ),
                                    hint: const Text('Girkasse *',
                                        style: TextStyle(
                                            color: Myisellcolors.hvit70,
                                            fontSize: 15)),
                                    items: girkassetype.map(
                                      (e) {
                                        return DropdownMenuItem(
                                          value: e,
                                          child: Text(
                                            e,
                                            style: GoogleFonts.roboto(
                                                color: Myisellcolors.hvit70),
                                          ),
                                        );
                                      },
                                    ).toList(),
                                    onChanged: (value) {
                                      controller.gircassecar.value =
                                          value as String;
                                      controller.cargirkasse!.text = value;
                                      controller.gkBilerannonse.currentState
                                          ?.validate();
                                    },
                                  ),
                                ),
                              ),
                            ),
                            IsellTextField(
                              con: controller.cargirbetegnelse,
                              maxlines: null,
                              focusNode: FocusNode(),
                              paddingcontainer: const EdgeInsets.only(
                                  left: 16, right: 16, top: 25),
                              fontsizehinttext: 13,
                              // validater: (val) {
                              //   return validInput(val!, 0, 50, "");
                              // },
                              hinttxt:
                                  "For eks. Manuell 6 gir eller steptronic..",
                              hinttxtcolor: Myisellcolors.hvit70,
                              contentpadding:
                                  const EdgeInsets.fromLTRB(30, 20, 30, 20),
                              txtcolor: Myisellcolors.hvit70,
                              txttype: TextInputType.text,
                              onSav: (value) {},
                              height: 22,
                              width: 1,
                              cursorColor: Myisellcolors.hvit70,
                              borderR: 5,
                              borderwidth: 1,
                              bordersidecolor: Myisellcolors.hoved,
                              obs: false,
                              label: Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  'Girkassebetegnelse',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.mandali(
                                      color: Myisellcolors.hoved, fontSize: 19),
                                ),
                              ),
                              float: FloatingLabelBehavior.always,
                            ),
                            Container(
                              padding: const EdgeInsets.only(
                                  top: 15, left: 16, right: 16),
                              child: DropdownButtonHideUnderline(
                                child: ButtonTheme(
                                  alignedDropdown: true,
                                  child: DropdownButtonFormField(
                                    dropdownColor: Myisellcolors.appbar,
                                    decoration: InputDecoration(
                                        label: Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: Text(
                                            'Hjuldrift',
                                            style: GoogleFonts.mandali(
                                                color: Myisellcolors.hoved,
                                                fontSize: 19),
                                          ),
                                        ),
                                        alignLabelWithHint: true,
                                        focusedErrorBorder:
                                            const OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(5)),
                                                borderSide: BorderSide(
                                                    color:
                                                        Myisellcolors.hoved)),
                                        errorBorder: const OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5)),
                                            borderSide: BorderSide(
                                                color: Myisellcolors.hoved)),
                                        // contentPadding: const EdgeInsets.only(
                                        //     right: 8, left: 1, top: 20, bottom: 20),
                                        enabledBorder: const OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5)),
                                          borderSide: BorderSide(
                                              color: Myisellcolors.hoved,
                                              width: 1),
                                        ),
                                        fillColor: Myisellcolors.home,
                                        focusedBorder: const OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5)),
                                          borderSide: BorderSide(
                                              color: Myisellcolors.hoved,
                                              width: 1),
                                        ),
                                        border: const OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(5),
                                          ),
                                        ),
                                        filled: true),
                                    // validator: (value) {
                                    //   if (value == null) {
                                    //     return 'Du må velge drivstoff type';
                                    //   } else {
                                    //     return null;
                                    //   }
                                    // },
                                    // onSaved: (newValue) {
                                    //   controller.itemtistand!.value == newValue;
                                    // },
                                    icon: const Icon(
                                      Icons.keyboard_arrow_down_sharp,
                                      size: (28),
                                      color: Myisellcolors.hoved,
                                    ),
                                    hint: const Text('Hjuldrift',
                                        style: TextStyle(
                                            color: Myisellcolors.hvit70,
                                            fontSize: 15)),
                                    items: hjuldrifttype.map(
                                      (e) {
                                        return DropdownMenuItem(
                                          value: e,
                                          child: Text(
                                            e,
                                            style: GoogleFonts.roboto(
                                                color: Myisellcolors.hvit70),
                                          ),
                                        );
                                      },
                                    ).toList(),
                                    onChanged: (value) {
                                      controller.hjuledrift.value =
                                          value as String;
                                      controller.carhjuledrift!.text = value;
                                      controller.gkBilerannonse.currentState
                                          ?.validate();
                                    },
                                  ),
                                ),
                              ),
                            ),
                            IsellTextField(
                              con: controller.carhjuledriftbetegnese,
                              maxlines: null,
                              focusNode: FocusNode(),
                              paddingcontainer: const EdgeInsets.only(
                                  left: 16, right: 16, top: 25),
                              fontsizehinttext: 13,
                              // validater: (val) {
                              //   return validInput(val!, 0, 200, "");
                              // },
                              hinttxt: "Eks. xDrive eller 4MOTION",
                              hinttxtcolor: Myisellcolors.hvit70,
                              contentpadding:
                                  const EdgeInsets.fromLTRB(30, 20, 30, 20),
                              txtcolor: Myisellcolors.hvit70,
                              txttype: TextInputType.streetAddress,
                              onSav: (value) {},
                              height: 22,
                              width: 1,
                              cursorColor: Myisellcolors.hvit70,
                              borderR: 5,
                              borderwidth: 1,
                              bordersidecolor: Myisellcolors.hoved,
                              obs: false,
                              label: Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  'Hjuldriftbetegnelse',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.mandali(
                                      color: Myisellcolors.hoved, fontSize: 19),
                                ),
                              ),
                              float: FloatingLabelBehavior.always,
                            ),
                            Container(
                              margin: const EdgeInsets.only(
                                  top: 20, left: 15, right: 10),
                              child: Text(
                                "Kjøretøyets spesifikk informasjon:",
                                style: GoogleFonts.baloo2(
                                    color: Myisellcolors.hvit,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(
                                  top: 15, left: 16, right: 16),
                              child: DropdownButtonHideUnderline(
                                child: ButtonTheme(
                                  alignedDropdown: true,
                                  child: DropdownButtonFormField(
                                    dropdownColor: Myisellcolors.appbar,
                                    decoration: InputDecoration(
                                        label: Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: Text(
                                            'Karosseritype',
                                            style: GoogleFonts.mandali(
                                                color: Myisellcolors.hoved,
                                                fontSize: 19),
                                          ),
                                        ),
                                        //alignLabelWithHint: true,
                                        focusedErrorBorder:
                                            const OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(5)),
                                                borderSide: BorderSide(
                                                    color:
                                                        Myisellcolors.hoved)),
                                        errorBorder: const OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5)),
                                            borderSide: BorderSide(
                                                color: Myisellcolors.hoved)),
                                        // contentPadding: const EdgeInsets.only(
                                        //     right: 8, left: 1, top: 20, bottom: 20),
                                        enabledBorder: const OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5)),
                                          borderSide: BorderSide(
                                              color: Myisellcolors.hoved,
                                              width: 1),
                                        ),
                                        fillColor: Myisellcolors.home,
                                        focusedBorder: const OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5)),
                                          borderSide: BorderSide(
                                              color: Myisellcolors.hoved,
                                              width: 1),
                                        ),
                                        border: const OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(5),
                                          ),
                                        ),
                                        filled: true),
                                    validator: (value) {
                                      if (value == null) {
                                        return 'Du må velge Karosseritype';
                                      } else {
                                        return null;
                                      }
                                    },
                                    // onSaved: (newValue) {
                                    //   controller.itemtistand!.value == newValue;
                                    // },
                                    icon: const Icon(
                                      Icons.keyboard_arrow_down_sharp,
                                      size: (28),
                                      color: Myisellcolors.hoved,
                                    ),
                                    hint: const Text('Karosseritype *',
                                        style: TextStyle(
                                            color: Myisellcolors.hvit70,
                                            fontSize: 15)),
                                    items: karosseritype.map(
                                      (e) {
                                        return DropdownMenuItem(
                                          value: e,
                                          child: Text(
                                            e,
                                            style: GoogleFonts.roboto(
                                                color: Myisellcolors.hvit70),
                                          ),
                                        );
                                      },
                                    ).toList(),
                                    onChanged: (value) {
                                      controller.karosseri.value =
                                          value as String;
                                      controller.karosseritype!.text = value;
                                      controller.gkBilerannonse.currentState
                                          ?.validate();
                                    },
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(
                                  top: 25, left: 16, right: 16),
                              child: DropdownButtonHideUnderline(
                                child: ButtonTheme(
                                  alignedDropdown: true,
                                  child: DropdownButtonFormField(
                                    dropdownColor: Myisellcolors.appbar,
                                    decoration: InputDecoration(
                                        label: Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: Text(
                                            'Avgiftsklasse',
                                            style: GoogleFonts.mandali(
                                                color: Myisellcolors.hoved,
                                                fontSize: 19),
                                          ),
                                        ),
                                        focusedErrorBorder:
                                            const OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(5)),
                                                borderSide: BorderSide(
                                                    color:
                                                        Myisellcolors.hoved)),
                                        errorBorder: const OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5)),
                                            borderSide: BorderSide(
                                                color: Myisellcolors.hoved)),
                                        // contentPadding: const EdgeInsets.only(
                                        //     right: 8, left: 1, top: 20, bottom: 20),
                                        enabledBorder: const OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5)),
                                          borderSide: BorderSide(
                                              color: Myisellcolors.hoved,
                                              width: 1),
                                        ),
                                        fillColor: Myisellcolors.home,
                                        focusedBorder: const OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5)),
                                          borderSide: BorderSide(
                                              color: Myisellcolors.hoved,
                                              width: 1),
                                        ),
                                        border: const OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(5),
                                          ),
                                        ),
                                        filled: true),
                                    validator: (value) {
                                      if (value == null) {
                                        return 'Du må velge Avgiftsklasse';
                                      } else {
                                        return null;
                                      }
                                    },
                                    // onSaved: (newValue) {
                                    //   controller.itemtistand!.value == newValue;
                                    // },
                                    icon: const Icon(
                                      Icons.keyboard_arrow_down_sharp,
                                      size: (28),
                                      color: Myisellcolors.hoved,
                                    ),
                                    hint: const Text('Avgiftsklasse *',
                                        style: TextStyle(
                                            color: Myisellcolors.hvit70,
                                            fontSize: 15)),
                                    items: avgiftklassetype.map(
                                      (e) {
                                        return DropdownMenuItem(
                                          value: e,
                                          child: Text(
                                            e,
                                            style: GoogleFonts.roboto(
                                                color: Myisellcolors.hvit70),
                                          ),
                                        );
                                      },
                                    ).toList(),
                                    onChanged: (value) {
                                      controller.avgiftklassen.value =
                                          value as String;
                                      controller.avgiftklasse!.text = value;
                                      controller.gkBilerannonse.currentState
                                          ?.validate();
                                    },
                                  ),
                                ),
                              ),
                            ),
                            IsellTextField(
                              con: controller.antallseter,
                              maxlines: null,
                              focusNode: FocusNode(),
                              paddingcontainer: const EdgeInsets.only(
                                  left: 16, right: 16, top: 25),
                              fontsizehinttext: 13,
                              validater: (val) {
                                return validInput(val!, 0, 20, "");
                              },
                              hinttxt: "Total antall seter",
                              hinttxtcolor: Myisellcolors.hvit70,
                              contentpadding:
                                  const EdgeInsets.fromLTRB(30, 20, 30, 20),
                              txtcolor: Myisellcolors.hvit70,
                              txttype: TextInputType.number,
                              onSav: (value) {},
                              height: 22,
                              width: 1,
                              cursorColor: Myisellcolors.hvit70,
                              borderR: 5,
                              borderwidth: 1,
                              bordersidecolor: Myisellcolors.hoved,
                              obs: false,
                              label: Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  'Antall seter',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.mandali(
                                      color: Myisellcolors.hoved, fontSize: 19),
                                ),
                              ),
                              float: FloatingLabelBehavior.always,
                            ),
                            IsellTextField(
                              con: controller.antalldor,
                              maxlines: null,
                              focusNode: FocusNode(),
                              paddingcontainer: const EdgeInsets.only(
                                  left: 16, right: 16, top: 25),
                              fontsizehinttext: 13,
                              validater: (val) {
                                return validInput(val!, 0, 20, "");
                              },
                              hinttxt: "Total antall dører",
                              hinttxtcolor: Myisellcolors.hvit70,
                              contentpadding:
                                  const EdgeInsets.fromLTRB(30, 20, 30, 20),
                              txtcolor: Myisellcolors.hvit70,
                              txttype: TextInputType.number,
                              onSav: (value) {},
                              height: 22,
                              width: 1,
                              cursorColor: Myisellcolors.hvit70,
                              borderR: 5,
                              borderwidth: 1,
                              bordersidecolor: Myisellcolors.hoved,
                              obs: false,
                              label: Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  'Antall dører',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.mandali(
                                      color: Myisellcolors.hoved, fontSize: 19),
                                ),
                              ),
                              float: FloatingLabelBehavior.always,
                            ),
                            IsellTextField(
                              con: controller.bagasjeromvolum,
                              maxlines: null,
                              focusNode: FocusNode(),
                              paddingcontainer: const EdgeInsets.only(
                                  left: 16, right: 16, top: 25),
                              fontsizehinttext: 13,
                              // validater: (val) {
                              //   return validInput(val!, 0, 20, "");
                              // },
                              hinttxt: "Bagasjeromvolum i liter",
                              hinttxtcolor: Myisellcolors.hvit70,
                              contentpadding:
                                  const EdgeInsets.fromLTRB(30, 20, 30, 20),
                              txtcolor: Myisellcolors.hvit70,
                              txttype: TextInputType.number,
                              onSav: (value) {},
                              height: 22,
                              width: 1,
                              cursorColor: Myisellcolors.hvit70,
                              borderR: 5,
                              borderwidth: 1,
                              bordersidecolor: Myisellcolors.hoved,
                              obs: false,
                              label: Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  'Bagasjeromvolum',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.mandali(
                                      color: Myisellcolors.hoved, fontSize: 19),
                                ),
                              ),
                              float: FloatingLabelBehavior.always,
                            ),
                            IsellTextField(
                              con: controller.biltotalvekt,
                              maxlines: null,
                              focusNode: FocusNode(),
                              paddingcontainer: const EdgeInsets.only(
                                  left: 16, right: 16, top: 25),
                              fontsizehinttext: 13,
                              // validater: (val) {
                              //   return validInput(val!, 0, 20, "");
                              // },
                              hinttxt: "Bilens egenvekt i kg",
                              hinttxtcolor: Myisellcolors.hvit70,
                              contentpadding:
                                  const EdgeInsets.fromLTRB(30, 20, 30, 20),
                              txtcolor: Myisellcolors.hvit70,
                              txttype: TextInputType.number,
                              onSav: (value) {},
                              height: 22,
                              width: 1,
                              cursorColor: Myisellcolors.hvit70,
                              borderR: 5,
                              borderwidth: 1,
                              bordersidecolor: Myisellcolors.hoved,
                              obs: false,
                              label: Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  'Vekt i kg',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.mandali(
                                      color: Myisellcolors.hoved, fontSize: 19),
                                ),
                              ),
                              float: FloatingLabelBehavior.always,
                            ),
                            IsellTextField(
                              con: controller.makstilhengervekt,
                              maxlines: null,
                              focusNode: FocusNode(),
                              paddingcontainer: const EdgeInsets.only(
                                  left: 16, right: 16, top: 25),
                              fontsizehinttext: 13,
                              // validater: (val) {
                              //   return validInput(val!, 0, 20, "");
                              // },
                              hinttxt: "Maks tilhengervekt i kg",
                              hinttxtcolor: Myisellcolors.hvit70,
                              contentpadding:
                                  const EdgeInsets.fromLTRB(30, 20, 30, 20),
                              txtcolor: Myisellcolors.hvit70,
                              txttype: TextInputType.number,
                              onSav: (value) {},
                              height: 22,
                              width: 1,
                              cursorColor: Myisellcolors.hvit70,
                              borderR: 5,
                              borderwidth: 1,
                              bordersidecolor: Myisellcolors.hoved,
                              obs: false,
                              label: Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  'Tilhengervekt i kg',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.mandali(
                                      color: Myisellcolors.hoved, fontSize: 19),
                                ),
                              ),
                              float: FloatingLabelBehavior.always,
                            ),
                            IsellTextField(
                              con: controller.carfarge,
                              maxlines: null,
                              focusNode: FocusNode(),
                              paddingcontainer: const EdgeInsets.only(
                                  left: 16, right: 16, top: 25),
                              fontsizehinttext: 13,
                              validater: (val) {
                                return validInput(val!, 0, 50, "");
                              },
                              hinttxt:
                                  "Bilens hovedfarge, F.eks. Beige, Blå, Grå, Hvit..",
                              hinttxtcolor: Myisellcolors.hvit70,
                              contentpadding:
                                  const EdgeInsets.fromLTRB(30, 20, 30, 20),
                              txtcolor: Myisellcolors.hvit70,
                              txttype: TextInputType.number,
                              onSav: (value) {},
                              height: 22,
                              width: 1,
                              cursorColor: Myisellcolors.hvit70,
                              borderR: 5,
                              borderwidth: 1,
                              bordersidecolor: Myisellcolors.hoved,
                              obs: false,
                              label: Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  'Hovedfarge',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.mandali(
                                      color: Myisellcolors.hoved, fontSize: 19),
                                ),
                              ),
                              float: FloatingLabelBehavior.always,
                            ),
                            IsellTextField(
                              con: controller.fargebeskrivelse,
                              maxlines: null,
                              focusNode: FocusNode(),
                              paddingcontainer: const EdgeInsets.only(
                                  left: 16, right: 16, top: 25),
                              fontsizehinttext: 13,
                              // validater: (val) {
                              //   return validInput(val!, 0, 50, "");
                              // },
                              hinttxt:
                                  "Beskriv bilens farge. F.eks. Mørk Blå, Hvit Perle..",
                              hinttxtcolor: Myisellcolors.hvit70,
                              contentpadding:
                                  const EdgeInsets.fromLTRB(30, 25, 30, 25),
                              txtcolor: Myisellcolors.hvit70,
                              txttype: TextInputType.number,
                              onSav: (value) {},
                              height: 22,
                              width: 1,
                              cursorColor: Myisellcolors.hvit70,
                              borderR: 5,
                              borderwidth: 1,
                              bordersidecolor: Myisellcolors.hoved,
                              obs: false,
                              label: Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  'Fargebeskrivelse',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.mandali(
                                      color: Myisellcolors.hoved, fontSize: 19),
                                ),
                              ),
                              float: FloatingLabelBehavior.always,
                            ),
                            IsellTextField(
                              con: controller.interiorfarge,
                              maxlines: null,
                              focusNode: FocusNode(),
                              paddingcontainer: const EdgeInsets.only(
                                  left: 16, right: 16, top: 25),
                              fontsizehinttext: 13,
                              // validater: (val) {
                              //   return validInput(val!, 0, 50, "");
                              // },
                              hinttxt: "F.eks. Beige Skinn, Brun Alkantara..",
                              hinttxtcolor: Myisellcolors.hvit70,
                              contentpadding:
                                  const EdgeInsets.fromLTRB(30, 20, 30, 20),
                              txtcolor: Myisellcolors.hvit70,
                              txttype: TextInputType.number,
                              onSav: (value) {},
                              height: 22,
                              width: 1,
                              cursorColor: Myisellcolors.hvit70,
                              borderR: 5,
                              borderwidth: 1,
                              bordersidecolor: Myisellcolors.hoved,
                              obs: false,
                              label: Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  'Ineriørfarge',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.mandali(
                                      color: Myisellcolors.hoved, fontSize: 19),
                                ),
                              ),
                              float: FloatingLabelBehavior.always,
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  left: Get.width / 25,
                                  right: Get.width / 25,
                                  top: Get.height / 37),
                              child: TextFormField(
                                maxLines:
                                    controller.carutstyr!.text.contains(', ')
                                        ? null
                                        : 1,
                                readOnly: true,
                                controller: controller.carutstyr,
                                cursorColor: Myisellcolors.hoved,
                                onTap: () {
                                  FocusScope.of(context).unfocus();
                                  controller.showDropdownBilutstyr(context);
                                },
                                decoration: InputDecoration(
                                  suffixIcon: const Icon(
                                    Icons.keyboard_arrow_down_sharp,
                                    size: (28),
                                    color: Myisellcolors.hoved,
                                  ),
                                  // focusColor: Myisellcolors.hoved,
                                  filled: true,
                                  fillColor: Myisellcolors.hvit,
                                  hintText: "Utstyr",
                                  hintStyle: GoogleFonts.roboto(
                                      color: Myisellcolors.blak),
                                  // contentPadding:
                                  //     EdgeInsets.only(left: Get.width / 14.6),
                                  border: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                    width: 1,
                                    color: Myisellcolors.hoved,
                                  )),
                                  focusedErrorBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          width: 1,
                                          color: Myisellcolors.hoved,
                                          style: BorderStyle.solid),
                                      borderRadius: BorderRadius.circular(5)),
                                  disabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          width: 1,
                                          color: Myisellcolors.hoved,
                                          style: BorderStyle.solid),
                                      borderRadius: BorderRadius.circular(5)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          width: 1,
                                          color: Myisellcolors.hoved,
                                          style: BorderStyle.solid),
                                      borderRadius: BorderRadius.circular(5)),
                                  errorBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          width: 1,
                                          color: Myisellcolors.hoved,
                                          style: BorderStyle.solid),
                                      borderRadius: BorderRadius.circular(5)),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        width: 1,
                                        color: Myisellcolors.hoved,
                                        style: BorderStyle.solid),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(
                                  top: 20, left: 15, right: 10),
                              child: Text(
                                "Kjøretøyets historikk:",
                                style: GoogleFonts.baloo2(
                                    color: Myisellcolors.hvit,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            IsellTextField(
                              con: controller.carkilometer,
                              maxlines: null,
                              focusNode: FocusNode(),
                              paddingcontainer: const EdgeInsets.only(
                                  left: 16, right: 16, top: 25),
                              fontsizehinttext: 13,
                              validater: (val) {
                                return validInput(val!, 0, 50, "");
                              },
                              hinttxt:
                                  "Totale kjørelengde i km. F.eks 1200 km. Ikke i mil",
                              hinttxtcolor: Myisellcolors.hvit70,
                              contentpadding:
                                  const EdgeInsets.fromLTRB(30, 20, 30, 20),
                              txtcolor: Myisellcolors.hvit70,
                              txttype: TextInputType.number,
                              onSav: (value) {},
                              height: 22,
                              width: 1,
                              cursorColor: Myisellcolors.hvit70,
                              borderR: 5,
                              borderwidth: 1,
                              bordersidecolor: Myisellcolors.hoved,
                              obs: false,
                              label: Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  'Kilometerstand',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.mandali(
                                      color: Myisellcolors.hoved, fontSize: 19),
                                ),
                              ),
                              float: FloatingLabelBehavior.always,
                            ),
                            controller.annonsetype == "Selge"
                                ? Column(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.only(
                                            top: 25, left: 16, right: 16),
                                        child: DropdownButtonHideUnderline(
                                          child: ButtonTheme(
                                            alignedDropdown: true,
                                            child: DropdownButtonFormField(
                                              dropdownColor:
                                                  Myisellcolors.appbar,
                                              decoration: InputDecoration(
                                                  label: Container(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        horizontal: 10),
                                                    child: Text(
                                                      'Kjente feil?',
                                                      style:
                                                          GoogleFonts.mandali(
                                                              color:
                                                                  Myisellcolors
                                                                      .hoved,
                                                              fontSize: 19),
                                                    ),
                                                  ),
                                                  focusedErrorBorder:
                                                      const OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius.circular(
                                                                      5)),
                                                          borderSide: BorderSide(
                                                              color: Myisellcolors
                                                                  .hoved)),
                                                  errorBorder:
                                                      const OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius.circular(
                                                                      5)),
                                                          borderSide: BorderSide(
                                                              color:
                                                                  Myisellcolors
                                                                      .hoved)),
                                                  // contentPadding: const EdgeInsets.only(
                                                  //     right: 8, left: 1, top: 20, bottom: 20),
                                                  enabledBorder:
                                                      const OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(5)),
                                                    borderSide: BorderSide(
                                                        color:
                                                            Myisellcolors.hoved,
                                                        width: 1),
                                                  ),
                                                  fillColor: Myisellcolors.home,
                                                  focusedBorder:
                                                      const OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(5)),
                                                    borderSide: BorderSide(
                                                        color:
                                                            Myisellcolors.hoved,
                                                        width: 1),
                                                  ),
                                                  border: const OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                      Radius.circular(5),
                                                    ),
                                                  ),
                                                  filled: true),
                                              // validator: (value) {
                                              //   if (value == null) {
                                              //     return 'Du må velge drivstoff type';
                                              //   } else {
                                              //     return null;
                                              //   }
                                              // },
                                              onSaved: (newValue) {
                                                controller.carfeil!.text ==
                                                    newValue;
                                              },

                                              icon: const Icon(
                                                Icons.keyboard_arrow_down_sharp,
                                                size: (28),
                                                color: Myisellcolors.hoved,
                                              ),
                                              hint: const Text(
                                                  'Har bilen kjente feil eller synlige skader?',
                                                  style: TextStyle(
                                                      color:
                                                          Myisellcolors.hvit70,
                                                      fontSize: 14)),

                                              items: controller.feilibil.map(
                                                (e) {
                                                  return DropdownMenuItem(
                                                    value: e,
                                                    child: Text(
                                                      e,
                                                      style: GoogleFonts.roboto(
                                                          color: Myisellcolors
                                                              .hvit70),
                                                    ),
                                                  );
                                                },
                                              ).toList(),
                                              onChanged:
                                                  controller.onChangedCarfeil,
                                            ),
                                          ),
                                        ),
                                      ),
                                      controller.carfeil!.text == "Ja"
                                          ? Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                IsellTextField(
                                                  con: controller.hvafeil,
                                                  maxlines: null,
                                                  focusNode: FocusNode(),
                                                  paddingcontainer:
                                                      const EdgeInsets.only(
                                                          left: 16,
                                                          right: 16,
                                                          top: 16),
                                                  fontsizehinttext: 13,
                                                  // validater: (val) {
                                                  //   return validInput(val!, 0, 50, "");
                                                  // },
                                                  hinttxt:
                                                      "Hva er feil med bilen?",
                                                  hinttxtcolor:
                                                      Myisellcolors.hvit70,
                                                  contentpadding:
                                                      const EdgeInsets.fromLTRB(
                                                          30, 25, 30, 25),
                                                  txtcolor:
                                                      Myisellcolors.hvit70,
                                                  txttype: TextInputType.name,
                                                  onSav: (value) {},
                                                  height: 22,
                                                  width: 1,
                                                  cursorColor:
                                                      Myisellcolors.hvit70,
                                                  borderR: 5,
                                                  borderwidth: 1,
                                                  bordersidecolor:
                                                      Myisellcolors.hoved,
                                                  obs: false,
                                                  label: Container(
                                                    margin: const EdgeInsets
                                                        .symmetric(
                                                        horizontal: 10),
                                                    child: Text(
                                                      'Hva da?',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style:
                                                          GoogleFonts.mandali(
                                                              color:
                                                                  Myisellcolors
                                                                      .hoved,
                                                              fontSize: 19),
                                                    ),
                                                  ),
                                                  float: FloatingLabelBehavior
                                                      .always,
                                                ),
                                                Container(
                                                  margin: const EdgeInsets.only(
                                                      top: 6,
                                                      left: 16.5,
                                                      right: 12),
                                                  child: Text(
                                                    "Rust, bulker, steinsprut du kjenner til, og som kjøperen bør vite om når de kjøper bilen",
                                                    style: GoogleFonts.roboto(
                                                        color: Myisellcolors
                                                            .hvit70,
                                                        fontSize: 12),
                                                  ),
                                                ),
                                              ],
                                            )
                                          : const SizedBox(),
                                    ],
                                  )
                                : const SizedBox(),
                            controller.annonsetype == "Selge"
                                ? Column(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.only(
                                            top: 25, left: 16, right: 16),
                                        child: DropdownButtonHideUnderline(
                                          child: ButtonTheme(
                                            alignedDropdown: true,
                                            child: DropdownButtonFormField(
                                              dropdownColor:
                                                  Myisellcolors.appbar,
                                              decoration: InputDecoration(
                                                  label: Container(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        horizontal: 10),
                                                    child: Text(
                                                      'Store reparasjoner?',
                                                      style:
                                                          GoogleFonts.mandali(
                                                              color:
                                                                  Myisellcolors
                                                                      .hoved,
                                                              fontSize: 19),
                                                    ),
                                                  ),
                                                  focusedErrorBorder:
                                                      const OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius.circular(
                                                                      5)),
                                                          borderSide: BorderSide(
                                                              color: Myisellcolors
                                                                  .hoved)),
                                                  errorBorder:
                                                      const OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius.circular(
                                                                      5)),
                                                          borderSide: BorderSide(
                                                              color:
                                                                  Myisellcolors
                                                                      .hoved)),
                                                  // contentPadding: const EdgeInsets.only(
                                                  //     right: 8, left: 1, top: 20, bottom: 20),
                                                  enabledBorder:
                                                      const OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(5)),
                                                    borderSide: BorderSide(
                                                        color:
                                                            Myisellcolors.hoved,
                                                        width: 1),
                                                  ),
                                                  fillColor: Myisellcolors.home,
                                                  focusedBorder:
                                                      const OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(5)),
                                                    borderSide: BorderSide(
                                                        color:
                                                            Myisellcolors.hoved,
                                                        width: 1),
                                                  ),
                                                  border: const OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                      Radius.circular(5),
                                                    ),
                                                  ),
                                                  filled: true),
                                              // validator: (value) {
                                              //   if (value == null) {
                                              //     return 'Du må velge drivstoff type';
                                              //   } else {
                                              //     return null;
                                              //   }
                                              // },
                                              onSaved: (newValue) {
                                                controller
                                                        .carreparasjon!.text ==
                                                    newValue;
                                              },

                                              icon: const Icon(
                                                Icons.keyboard_arrow_down_sharp,
                                                size: (28),
                                                color: Myisellcolors.hoved,
                                              ),
                                              hint: const Text(
                                                  'Har bilen vært reparert?',
                                                  style: TextStyle(
                                                      color:
                                                          Myisellcolors.hvit70,
                                                      fontSize: 14)),

                                              items:
                                                  controller.reparasjonibil.map(
                                                (e) {
                                                  return DropdownMenuItem(
                                                    value: e,
                                                    child: Text(
                                                      e,
                                                      style: GoogleFonts.roboto(
                                                          color: Myisellcolors
                                                              .hvit70),
                                                    ),
                                                  );
                                                },
                                              ).toList(),
                                              onChanged: controller
                                                  .onChangedCarreparasjon,
                                            ),
                                          ),
                                        ),
                                      ),
                                      controller.carreparasjon!.text == "Ja"
                                          ? Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                IsellTextField(
                                                  con: controller.hvareparasjon,
                                                  maxlines: null,
                                                  focusNode: FocusNode(),
                                                  paddingcontainer:
                                                      const EdgeInsets.only(
                                                          left: 16,
                                                          right: 16,
                                                          top: 16),
                                                  fontsizehinttext: 13,
                                                  // validater: (val) {
                                                  //   return validInput(val!, 0, 50, "");
                                                  // },
                                                  hinttxt: "Hva var reparert?",
                                                  hinttxtcolor:
                                                      Myisellcolors.hvit70,
                                                  contentpadding:
                                                      const EdgeInsets.fromLTRB(
                                                          30, 25, 30, 25),
                                                  txtcolor:
                                                      Myisellcolors.hvit70,
                                                  txttype: TextInputType.name,
                                                  onSav: (value) {},
                                                  height: 22,
                                                  width: 1,
                                                  cursorColor:
                                                      Myisellcolors.hvit70,
                                                  borderR: 5,
                                                  borderwidth: 1,
                                                  bordersidecolor:
                                                      Myisellcolors.hoved,
                                                  obs: false,
                                                  label: Container(
                                                    margin: const EdgeInsets
                                                        .symmetric(
                                                        horizontal: 10),
                                                    child: Text(
                                                      'Hva da?',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style:
                                                          GoogleFonts.mandali(
                                                              color:
                                                                  Myisellcolors
                                                                      .hoved,
                                                              fontSize: 19),
                                                    ),
                                                  ),
                                                  float: FloatingLabelBehavior
                                                      .always,
                                                ),
                                                Container(
                                                  margin: const EdgeInsets.only(
                                                      top: 6,
                                                      left: 16.5,
                                                      right: 12),
                                                  child: Text(
                                                    "For eks. reparasjon etter kollisjon eller andre store tilstander",
                                                    style: GoogleFonts.roboto(
                                                        color: Myisellcolors
                                                            .hvit70,
                                                        fontSize: 12),
                                                  ),
                                                ),
                                              ],
                                            )
                                          : const SizedBox(),
                                    ],
                                  )
                                : const SizedBox(),
                            IsellTextField(
                              con: controller.forstegangsreg,
                              maxlines: null,
                              focusNode: FocusNode(),
                              paddingcontainer: const EdgeInsets.only(
                                  left: 16, right: 16, top: 25),
                              fontsizehinttext: 14.5,
                              // validater: (val) {
                              //   return validInput(val!, 0, 200, "");
                              // },
                              hinttxt: "Eks. 07.02.2024",
                              hinttxtcolor: Myisellcolors.hvit70,
                              contentpadding:
                                  const EdgeInsets.fromLTRB(30, 20, 30, 20),
                              txtcolor: Myisellcolors.hvit70,
                              txttype: TextInputType.datetime,
                              onSav: (value) {},
                              height: 22,
                              width: 1,
                              cursorColor: Myisellcolors.hvit70,
                              borderR: 5,
                              borderwidth: 1,
                              bordersidecolor: Myisellcolors.hoved,
                              obs: false,
                              label: Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  'Førstegangsregistrert',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.mandali(
                                      color: Myisellcolors.hoved, fontSize: 19),
                                ),
                              ),
                              float: FloatingLabelBehavior.always,
                            ),
                            IsellTextField(
                              con: controller.antalleiere,
                              maxlines: null,
                              focusNode: FocusNode(),
                              paddingcontainer: const EdgeInsets.only(
                                  left: 16, right: 16, top: 25),
                              fontsizehinttext: 14.5,
                              // validater: (val) {
                              //   return validInput(val!, 0, 200, "");
                              // },
                              hinttxt: "Total antall eiere",
                              hinttxtcolor: Myisellcolors.hvit70,
                              contentpadding:
                                  const EdgeInsets.fromLTRB(30, 20, 30, 20),
                              txtcolor: Myisellcolors.hvit70,
                              txttype: TextInputType.number,
                              onSav: (value) {},
                              height: 22,
                              width: 1,
                              cursorColor: Myisellcolors.hvit70,
                              borderR: 5,
                              borderwidth: 1,
                              bordersidecolor: Myisellcolors.hoved,
                              obs: false,
                              label: Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  'Antall eiere',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.mandali(
                                      color: Myisellcolors.hoved, fontSize: 19),
                                ),
                              ),
                              float: FloatingLabelBehavior.always,
                            ),
                            controller.annonsetype == "Selge"
                                ? IsellTextField(
                                    con: controller.sistecareu,
                                    maxlines: null,
                                    focusNode: FocusNode(),
                                    paddingcontainer: const EdgeInsets.only(
                                        left: 16, right: 16, top: 25),
                                    fontsizehinttext: 14.5,
                                    // validater: (val) {
                                    //   return validInput(val!, 0, 200, "");
                                    // },
                                    hinttxt: "Eks. 07.02.2021",
                                    hinttxtcolor: Myisellcolors.hvit70,
                                    contentpadding: const EdgeInsets.fromLTRB(
                                        30, 20, 30, 20),
                                    txtcolor: Myisellcolors.hvit70,
                                    txttype: TextInputType.datetime,
                                    onSav: (value) {},
                                    height: 22,
                                    width: 1,
                                    cursorColor: Myisellcolors.hvit70,
                                    borderR: 5,
                                    borderwidth: 1,
                                    bordersidecolor: Myisellcolors.hoved,
                                    obs: false,
                                    label: Container(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: Text(
                                        'Sist EU-godkjent',
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.mandali(
                                            color: Myisellcolors.hoved,
                                            fontSize: 19),
                                      ),
                                    ),
                                    float: FloatingLabelBehavior.always,
                                  )
                                : const SizedBox(),
                            controller.annonsetype == "Selge"
                                ? IsellTextField(
                                    con: controller.nesteeufrist,
                                    maxlines: null,
                                    focusNode: FocusNode(),
                                    paddingcontainer: const EdgeInsets.only(
                                        left: 16, right: 16, top: 25),
                                    fontsizehinttext: 14.5,
                                    // validater: (val) {
                                    //   return validInput(val!, 0, 200, "");
                                    // },
                                    hinttxt: "Eks. 07.02.2025",
                                    hinttxtcolor: Myisellcolors.hvit70,
                                    contentpadding: const EdgeInsets.fromLTRB(
                                        30, 20, 30, 20),
                                    txtcolor: Myisellcolors.hvit70,
                                    txttype: TextInputType.datetime,
                                    onSav: (value) {},
                                    height: 22,
                                    width: 1,
                                    cursorColor: Myisellcolors.hvit70,
                                    borderR: 5,
                                    borderwidth: 1,
                                    bordersidecolor: Myisellcolors.hoved,
                                    obs: false,
                                    label: Container(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: Text(
                                        'Neste frist for EU-kontroll',
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.mandali(
                                            color: Myisellcolors.hoved,
                                            fontSize: 19),
                                      ),
                                    ),
                                    float: FloatingLabelBehavior.always,
                                  )
                                : const SizedBox(),
                            controller.annonsetype == "Selge"
                                ? Container(
                                    padding: const EdgeInsets.only(
                                        top: 25, left: 16, right: 16),
                                    child: DropdownButtonHideUnderline(
                                      child: ButtonTheme(
                                        alignedDropdown: true,
                                        child: DropdownButtonFormField(
                                          dropdownColor: Myisellcolors.appbar,
                                          decoration: InputDecoration(
                                              label: Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 10),
                                                child: Text(
                                                  'Garantitype',
                                                  style: GoogleFonts.mandali(
                                                      color:
                                                          Myisellcolors.hoved,
                                                      fontSize: 19),
                                                ),
                                              ),
                                              focusedErrorBorder:
                                                  const OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.all(Radius
                                                              .circular(5)),
                                                      borderSide: BorderSide(
                                                          color: Myisellcolors
                                                              .hoved)),
                                              errorBorder:
                                                  const OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius
                                                                  .circular(5)),
                                                      borderSide: BorderSide(
                                                          color: Myisellcolors
                                                              .hoved)),
                                              // contentPadding: const EdgeInsets.only(
                                              //     right: 8, left: 1, top: 20, bottom: 20),
                                              enabledBorder:
                                                  const OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(5)),
                                                borderSide: BorderSide(
                                                    color: Myisellcolors.hoved,
                                                    width: 1),
                                              ),
                                              fillColor: Myisellcolors.home,
                                              focusedBorder:
                                                  const OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(5)),
                                                borderSide: BorderSide(
                                                    color: Myisellcolors.hoved,
                                                    width: 1),
                                              ),
                                              border: const OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(5),
                                                ),
                                              ),
                                              filled: true),
                                          // validator: (value) {
                                          //   if (value == null) {
                                          //     return 'Du må velge Karosseritype';
                                          //   } else {
                                          //     return null;
                                          //   }
                                          // },
                                          // onSaved: (newValue) {
                                          //   controller.itemtistand!.value == newValue;
                                          // },
                                          icon: const Icon(
                                            Icons.keyboard_arrow_down_sharp,
                                            size: (28),
                                            color: Myisellcolors.hoved,
                                          ),
                                          hint: const Text('Garantitype',
                                              style: TextStyle(
                                                  color: Myisellcolors.hvit70,
                                                  fontSize: 15)),
                                          items: listgarantitype.map(
                                            (e) {
                                              return DropdownMenuItem(
                                                value: e,
                                                child: Text(
                                                  e,
                                                  style: GoogleFonts.roboto(
                                                      color:
                                                          Myisellcolors.hvit70),
                                                ),
                                              );
                                            },
                                          ).toList(),
                                          onChanged: (value) {
                                            controller.typegarantibil.value =
                                                value as String;
                                            controller.garantitype!.text =
                                                value;
                                          },
                                        ),
                                      ),
                                    ),
                                  )
                                : const SizedBox(),
                            IsellTextField(
                              con: controller.linkvideo,
                              maxlines: null,
                              focusNode: FocusNode(),
                              paddingcontainer: const EdgeInsets.only(
                                  left: 16, right: 16, top: 25),
                              fontsizehinttext: 13,
                              // validater: (val) {
                              //   return validInput(val!, 0, 200, "");
                              // },
                              hinttxt: "Link til video på YouTube for eksampel",
                              hinttxtcolor: Myisellcolors.hvit70,
                              contentpadding:
                                  const EdgeInsets.fromLTRB(30, 20, 30, 20),
                              txtcolor: Myisellcolors.hvit70,
                              txttype: TextInputType.text,
                              onSav: (value) {},
                              height: 22,
                              width: 1,
                              cursorColor: Myisellcolors.hvit70,
                              borderR: 5,
                              borderwidth: 1,
                              bordersidecolor: Myisellcolors.hoved,
                              obs: false,
                              label: Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  'Video',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.mandali(
                                      color: Myisellcolors.hoved, fontSize: 19),
                                ),
                              ),
                              float: FloatingLabelBehavior.always,
                            ),
                            IsellTextField(
                              con: controller.carbeskrivelse,
                              maxlines: null,
                              focusNode: FocusNode(),
                              paddingcontainer: const EdgeInsets.only(
                                  left: 16, right: 16, top: 25),
                              fontsizehinttext: 14.5,
                              // validater: (val) {
                              //   return validInput(val!, 0, 200, "");
                              // },
                              hinttxt: "Skriv en beskrivelse av bilen",
                              hinttxtcolor: Myisellcolors.hvit70,
                              contentpadding:
                                  const EdgeInsets.fromLTRB(30, 40, 30, 40),
                              txtcolor: Myisellcolors.hvit70,
                              txttype: TextInputType.text,
                              onSav: (value) {},
                              height: 22,
                              width: 1,
                              cursorColor: Myisellcolors.hvit70,
                              borderR: 5,
                              borderwidth: 1,
                              bordersidecolor: Myisellcolors.hoved,
                              obs: false,
                              label: Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  'Bilbeskrivelse',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.mandali(
                                      color: Myisellcolors.hoved, fontSize: 19),
                                ),
                              ),
                              float: FloatingLabelBehavior.always,
                            ),
                            Container(
                              margin: const EdgeInsets.only(
                                  top: 20, left: 15, right: 10),
                              child: Text(
                                controller.annonsetype == "Selge"
                                    ? "Kjøretøyets pris informasjon:"
                                    : "Kjøretøyets pris og leie informasjon:",
                                style: GoogleFonts.baloo2(
                                    color: Myisellcolors.hvit,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            controller.annonsetype == "Selge"
                                ? Column(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.only(
                                            top: 15, left: 16, right: 16),
                                        child: DropdownButtonHideUnderline(
                                          child: ButtonTheme(
                                            alignedDropdown: true,
                                            child: DropdownButtonFormField(
                                              enableFeedback: true,
                                              dropdownColor:
                                                  Myisellcolors.appbar,
                                              decoration: InputDecoration(
                                                  label: Container(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        horizontal: 10),
                                                    child: Text(
                                                      'Fritak fra omreg.?',
                                                      style:
                                                          GoogleFonts.mandali(
                                                              color:
                                                                  Myisellcolors
                                                                      .hoved,
                                                              fontSize: 19),
                                                    ),
                                                  ),
                                                  focusedErrorBorder:
                                                      const OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius.circular(
                                                                      5)),
                                                          borderSide: BorderSide(
                                                              color: Myisellcolors
                                                                  .hoved)),
                                                  errorBorder:
                                                      const OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius.circular(
                                                                      5)),
                                                          borderSide: BorderSide(
                                                              color:
                                                                  Myisellcolors
                                                                      .hoved)),
                                                  // contentPadding: const EdgeInsets.only(
                                                  //     right: 8, left: 1, top: 20, bottom: 20),
                                                  enabledBorder:
                                                      const OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(5)),
                                                    borderSide: BorderSide(
                                                        color:
                                                            Myisellcolors.hoved,
                                                        width: 1),
                                                  ),
                                                  fillColor: Myisellcolors.home,
                                                  focusedBorder:
                                                      const OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(5)),
                                                    borderSide: BorderSide(
                                                        color:
                                                            Myisellcolors.hoved,
                                                        width: 1),
                                                  ),
                                                  border: const OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                      Radius.circular(5),
                                                    ),
                                                  ),
                                                  filled: true),
                                              // validator: (value) {
                                              //   if (value == null) {
                                              //     return 'Du må velge drivstoff type';
                                              //   } else {
                                              //     return null;
                                              //   }
                                              // },
                                              onSaved: (newValue) {
                                                controller.fritakfracaromreg!
                                                        .text ==
                                                    newValue;
                                              },
                                              icon: const Icon(
                                                Icons.keyboard_arrow_down_sharp,
                                                size: (28),
                                                color: Myisellcolors.hoved,
                                              ),
                                              hint: const Text(
                                                  'Fritak fra omregistreringsavgit?',
                                                  style: TextStyle(
                                                      color:
                                                          Myisellcolors.hvit70,
                                                      fontSize: 14)),
                                              items: controller.fritak.map(
                                                (e) {
                                                  return DropdownMenuItem(
                                                    value: e,
                                                    child: Text(
                                                      e,
                                                      style: GoogleFonts.roboto(
                                                          color: Myisellcolors
                                                              .hvit70),
                                                    ),
                                                  );
                                                },
                                              ).toList(),
                                              onChanged: (value) {
                                                controller
                                                    .onChangedCaromregFritak(
                                                        value);

                                                if (controller
                                                        .fritakfracaromreg!
                                                        .text ==
                                                    "Ja") {
                                                  controller.omregnetavgift!
                                                      .text = "";
                                                  controller.updateTotalPrice();
                                                  controller.updateUI();
                                                }
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                      controller.fritakfracaromreg!.text ==
                                              "Nei"
                                          ? Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                IsellTextField(
                                                  con:
                                                      controller.omregnetavgift,
                                                  maxlines: null,
                                                  focusNode: FocusNode(),
                                                  paddingcontainer:
                                                      const EdgeInsets.only(
                                                          left: 16,
                                                          right: 16,
                                                          top: 16),
                                                  fontsizehinttext: 13,
                                                  validater: (val) {
                                                    return validInput(
                                                        val!, 0, 50, "");
                                                  },
                                                  onchanged: (p0) {
                                                    controller
                                                        .updateTotalPrice();
                                                    controller.updateUI();
                                                  },
                                                  hinttxt:
                                                      "Hva er omregistreringsavgit i kr",
                                                  hinttxtcolor:
                                                      Myisellcolors.hvit70,
                                                  contentpadding:
                                                      const EdgeInsets.fromLTRB(
                                                          30, 20, 30, 20),
                                                  txtcolor:
                                                      Myisellcolors.hvit70,
                                                  txttype: TextInputType.name,
                                                  onSav: (value) {},
                                                  height: 22,
                                                  width: 1,
                                                  cursorColor:
                                                      Myisellcolors.hvit70,
                                                  borderR: 5,
                                                  borderwidth: 1,
                                                  bordersidecolor:
                                                      Myisellcolors.hoved,
                                                  obs: false,
                                                  label: Container(
                                                    margin: const EdgeInsets
                                                        .symmetric(
                                                        horizontal: 10),
                                                    child: Text(
                                                      'Omregistreringsavgit',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style:
                                                          GoogleFonts.mandali(
                                                              color:
                                                                  Myisellcolors
                                                                      .hoved,
                                                              fontSize: 19),
                                                    ),
                                                  ),
                                                  float: FloatingLabelBehavior
                                                      .always,
                                                ),
                                                Container(
                                                  margin: const EdgeInsets.only(
                                                      top: 6,
                                                      left: 16.5,
                                                      right: 12),
                                                  child: Text(
                                                    "Som selger er du ansvarlig for at omregistreringsavgiten er riktig",
                                                    style: GoogleFonts.roboto(
                                                        color: Myisellcolors
                                                            .hvit70,
                                                        fontSize: 12),
                                                  ),
                                                ),
                                              ],
                                            )
                                          : const SizedBox(),
                                    ],
                                  )
                                : const SizedBox(),
                            controller.annonsetype == "Selge"
                                ? IsellTextField(
                                    con: controller.pris,
                                    maxlines: null,
                                    focusNode: FocusNode(),
                                    paddingcontainer: const EdgeInsets.only(
                                        left: 16, right: 16, top: 16),
                                    fontsizehinttext: 13,
                                    validater: (val) {
                                      return validInput(val!, 0, 50, "");
                                    },
                                    hinttxt: "Salgspris - eks. omregistrering",
                                    hinttxtcolor: Myisellcolors.hvit70,
                                    contentpadding: const EdgeInsets.fromLTRB(
                                        30, 20, 30, 20),
                                    txtcolor: Myisellcolors.hvit70,
                                    txttype: TextInputType.name,
                                    onchanged: (p0) {
                                      controller.updateTotalPrice();
                                      controller.updateUI();
                                    },
                                    height: 22,
                                    width: 1,
                                    cursorColor: Myisellcolors.hvit70,
                                    borderR: 5,
                                    borderwidth: 1,
                                    bordersidecolor: Myisellcolors.hoved,
                                    obs: false,
                                    label: Container(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: Text(
                                        'Salgspris',
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.mandali(
                                            color: Myisellcolors.hoved,
                                            fontSize: 19),
                                      ),
                                    ),
                                    float: FloatingLabelBehavior.always,
                                  )
                                : const SizedBox(),
                            controller.annonsetype == "Selge"
                                ? Obx(
                                    () => Container(
                                      margin: const EdgeInsets.only(
                                          top: 15, left: 17, right: 10),
                                      child: Text(
                                        "Totalpris blir: ${controller.formatTotalPrice(controller.totalpris.value)} kr",
                                        style: GoogleFonts.baloo2(
                                          color: Myisellcolors.hvit,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                  )
                                : const SizedBox(),
                            controller.annonsetype == "Selge"
                                ? Column(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.only(
                                            top: 15, left: 16, right: 16),
                                        child: DropdownButtonHideUnderline(
                                          child: ButtonTheme(
                                            alignedDropdown: true,
                                            child: DropdownButtonFormField(
                                                enableFeedback: true,
                                                dropdownColor:
                                                    Myisellcolors.appbar,
                                                decoration: InputDecoration(
                                                    label: Container(
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          horizontal: 10),
                                                      child: Text(
                                                        'Har gjeld/heftelse?',
                                                        style:
                                                            GoogleFonts.mandali(
                                                                color:
                                                                    Myisellcolors
                                                                        .hoved,
                                                                fontSize: 19),
                                                      ),
                                                    ),
                                                    focusedErrorBorder: const OutlineInputBorder(
                                                        borderRadius: BorderRadius.all(
                                                            Radius.circular(5)),
                                                        borderSide: BorderSide(
                                                            color: Myisellcolors
                                                                .hoved)),
                                                    errorBorder: const OutlineInputBorder(
                                                        borderRadius: BorderRadius.all(
                                                            Radius.circular(5)),
                                                        borderSide: BorderSide(
                                                            color: Myisellcolors
                                                                .hoved)),
                                                    // contentPadding: const EdgeInsets.only(
                                                    //     right: 8, left: 1, top: 20, bottom: 20),
                                                    enabledBorder:
                                                        const OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  5)),
                                                      borderSide: BorderSide(
                                                          color: Myisellcolors
                                                              .hoved,
                                                          width: 1),
                                                    ),
                                                    fillColor:
                                                        Myisellcolors.home,
                                                    focusedBorder:
                                                        const OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  5)),
                                                      borderSide: BorderSide(
                                                          color: Myisellcolors
                                                              .hoved,
                                                          width: 1),
                                                    ),
                                                    border:
                                                        const OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                        Radius.circular(5),
                                                      ),
                                                    ),
                                                    filled: true),
                                                // validator: (value) {
                                                //   if (value == null) {
                                                //     return 'Du må velge drivstoff type';
                                                //   } else {
                                                //     return null;
                                                //   }
                                                // },
                                                onSaved: (newValue) {
                                                  controller.fritakfracaromreg!
                                                          .text ==
                                                      newValue;
                                                },
                                                icon: const Icon(
                                                  Icons
                                                      .keyboard_arrow_down_sharp,
                                                  size: (28),
                                                  color: Myisellcolors.hoved,
                                                ),
                                                hint: const Text(
                                                    'Har bilen gjeld eller heftelse?',
                                                    style:
                                                        TextStyle(color: Myisellcolors.hvit70, fontSize: 14)),
                                                items: controller.gjeld.map(
                                                  (e) {
                                                    return DropdownMenuItem(
                                                      value: e,
                                                      child: Text(
                                                        e,
                                                        style: GoogleFonts.roboto(
                                                            color: Myisellcolors
                                                                .hvit70),
                                                      ),
                                                    );
                                                  },
                                                ).toList(),
                                                onChanged: controller.onChangedCarGjeld),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(
                                            top: 6, left: 16.5, right: 12),
                                        child: Text(
                                          "En heftelse kan være at du er skyldig en årsavgift eller at bilen er pantsatt i et lån",
                                          style: GoogleFonts.roboto(
                                              color: Myisellcolors.hvit70,
                                              fontSize: 12),
                                        ),
                                      ),
                                      controller.cargjeld!.text == "Ja"
                                          ? Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                IsellTextField(
                                                  con: controller.hvagjeld,
                                                  maxlines: null,
                                                  focusNode: FocusNode(),
                                                  paddingcontainer:
                                                      const EdgeInsets.only(
                                                          left: 16,
                                                          right: 16,
                                                          top: 16),
                                                  fontsizehinttext: 13,
                                                  // validater: (val) {
                                                  //   return validInput(val!, 0, 50, "");
                                                  // },
                                                  onchanged: (p0) {
                                                    controller
                                                        .updateTotalPrice();
                                                    controller.updateUI();
                                                  },
                                                  hinttxt:
                                                      "Hvilke gjeld eller heftelse har bilen",
                                                  hinttxtcolor:
                                                      Myisellcolors.hvit70,
                                                  contentpadding:
                                                      const EdgeInsets.fromLTRB(
                                                          30, 25, 30, 25),
                                                  txtcolor:
                                                      Myisellcolors.hvit70,
                                                  txttype: TextInputType.name,
                                                  onSav: (value) {},
                                                  height: 22,
                                                  width: 1,
                                                  cursorColor:
                                                      Myisellcolors.hvit70,
                                                  borderR: 5,
                                                  borderwidth: 1,
                                                  bordersidecolor:
                                                      Myisellcolors.hoved,
                                                  obs: false,
                                                  label: Container(
                                                    margin: const EdgeInsets
                                                        .symmetric(
                                                        horizontal: 10),
                                                    child: Text(
                                                      'Gjeld/Heftelse',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style:
                                                          GoogleFonts.mandali(
                                                              color:
                                                                  Myisellcolors
                                                                      .hoved,
                                                              fontSize: 19),
                                                    ),
                                                  ),
                                                  float: FloatingLabelBehavior
                                                      .always,
                                                ),
                                              ],
                                            )
                                          : const SizedBox(),
                                    ],
                                  )
                                : const SizedBox(),
                            controller.annonsetype == "Leie ut"
                                ? IsellTextField(
                                    con: controller.startleiecar,
                                    maxlines: null,
                                    focusNode: FocusNode(),
                                    paddingcontainer: const EdgeInsets.only(
                                        left: 16, right: 16, top: 25),
                                    fontsizehinttext: 13,
                                    validater: (val) {
                                      return validInput(val!, 0, 20, "");
                                    },
                                    hinttxt: "Innskudd i NOK",
                                    hinttxtcolor: Myisellcolors.hvit70,
                                    contentpadding: const EdgeInsets.fromLTRB(
                                        30, 20, 30, 20),
                                    txtcolor: Myisellcolors.hvit70,
                                    txttype: TextInputType.number,
                                    onSav: (value) {},
                                    height: 22,
                                    width: 1,
                                    cursorColor: Myisellcolors.hvit70,
                                    borderR: 5,
                                    borderwidth: 1,
                                    bordersidecolor: Myisellcolors.hoved,
                                    obs: false,
                                    label: Container(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: Text(
                                        'Startleie *',
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.mandali(
                                            color: Myisellcolors.hoved,
                                            fontSize: 19),
                                      ),
                                    ),
                                    float: FloatingLabelBehavior.always,
                                  )
                                : const SizedBox(),
                            controller.annonsetype == "Leie ut"
                                ? IsellTextField(
                                    con: controller.manedsbelopcar,
                                    maxlines: null,
                                    focusNode: FocusNode(),
                                    paddingcontainer: const EdgeInsets.only(
                                        left: 16, right: 16, top: 25),
                                    fontsizehinttext: 13,
                                    validater: (val) {
                                      return validInput(val!, 0, 20, "");
                                    },
                                    hinttxt: "Månedsbeløp i NOK",
                                    hinttxtcolor: Myisellcolors.hvit70,
                                    contentpadding: const EdgeInsets.fromLTRB(
                                        30, 20, 30, 20),
                                    txtcolor: Myisellcolors.hvit70,
                                    txttype: TextInputType.number,
                                    onSav: (value) {},
                                    height: 22,
                                    width: 1,
                                    cursorColor: Myisellcolors.hvit70,
                                    borderR: 5,
                                    borderwidth: 1,
                                    bordersidecolor: Myisellcolors.hoved,
                                    obs: false,
                                    label: Container(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: Text(
                                        'Månedsbeløp *',
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.mandali(
                                            color: Myisellcolors.hoved,
                                            fontSize: 19),
                                      ),
                                    ),
                                    float: FloatingLabelBehavior.always,
                                  )
                                : const SizedBox(),
                            controller.annonsetype == "Leie ut"
                                ? IsellTextField(
                                    con: controller.gjenvarendekjoredistanse,
                                    maxlines: null,
                                    focusNode: FocusNode(),
                                    paddingcontainer: const EdgeInsets.only(
                                        left: 16, right: 16, top: 25),
                                    fontsizehinttext: 13,
                                    // validater: (val) {
                                    //   return validInput(val!, 0, 20, "");
                                    // },
                                    hinttxt: "Gjenværende kjøredistanse",
                                    hinttxtcolor: Myisellcolors.hvit70,
                                    contentpadding: const EdgeInsets.fromLTRB(
                                        30, 20, 30, 20),
                                    txtcolor: Myisellcolors.hvit70,
                                    txttype: TextInputType.number,
                                    onSav: (value) {},
                                    height: 22,
                                    width: 1,
                                    cursorColor: Myisellcolors.hvit70,
                                    borderR: 5,
                                    borderwidth: 1,
                                    bordersidecolor: Myisellcolors.hoved,
                                    obs: false,
                                    label: Container(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: Text(
                                        'Gjenværende kjøredistanse',
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.mandali(
                                            color: Myisellcolors.hoved,
                                            fontSize: 19),
                                      ),
                                    ),
                                    float: FloatingLabelBehavior.always,
                                  )
                                : const SizedBox(),
                            controller.annonsetype == "Leie ut"
                                ? IsellTextField(
                                    con: controller.debitorskiftegebyrikr,
                                    maxlines: null,
                                    focusNode: FocusNode(),
                                    paddingcontainer: const EdgeInsets.only(
                                        left: 16, right: 16, top: 25),
                                    fontsizehinttext: 13,
                                    // validater: (val) {
                                    //   return validInput(val!, 0, 20, "");
                                    // },
                                    hinttxt: "Debitorskifte - gebyr i NOK",
                                    hinttxtcolor: Myisellcolors.hvit70,
                                    contentpadding: const EdgeInsets.fromLTRB(
                                        30, 20, 30, 20),
                                    txtcolor: Myisellcolors.hvit70,
                                    txttype: TextInputType.number,
                                    onSav: (value) {},
                                    height: 22,
                                    width: 1,
                                    cursorColor: Myisellcolors.hvit70,
                                    borderR: 5,
                                    borderwidth: 1,
                                    bordersidecolor: Myisellcolors.hoved,
                                    obs: false,
                                    label: Container(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: Text(
                                        'Debitorskifte',
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.mandali(
                                            color: Myisellcolors.hoved,
                                            fontSize: 19),
                                      ),
                                    ),
                                    float: FloatingLabelBehavior.always,
                                  )
                                : const SizedBox(),
                            controller.annonsetype == "Leie ut"
                                ? IsellTextField(
                                    con: controller.avtalensutlopsdato,
                                    maxlines: null,
                                    focusNode: FocusNode(),
                                    paddingcontainer: const EdgeInsets.only(
                                        left: 16, right: 16, top: 25),
                                    fontsizehinttext: 13,
                                    // validater: (val) {
                                    //   return validInput(val!, 0, 20, "");
                                    // },
                                    hinttxt: "Avtalens utløpsdato",
                                    hinttxtcolor: Myisellcolors.hvit70,
                                    contentpadding: const EdgeInsets.fromLTRB(
                                        30, 20, 30, 20),
                                    txtcolor: Myisellcolors.hvit70,
                                    txttype: TextInputType.text,
                                    onSav: (value) {},
                                    height: 22,
                                    width: 1,
                                    cursorColor: Myisellcolors.hvit70,
                                    borderR: 5,
                                    borderwidth: 1,
                                    bordersidecolor: Myisellcolors.hoved,
                                    obs: false,
                                    label: Container(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: Text(
                                        'Avtalens utløpsdato',
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.mandali(
                                            color: Myisellcolors.hoved,
                                            fontSize: 19),
                                      ),
                                    ),
                                    float: FloatingLabelBehavior.always,
                                  )
                                : const SizedBox(),
                            controller.annonsetype == "Leie ut"
                                ? IsellTextField(
                                    con: controller
                                        .antallmonedertilavtalenutloper,
                                    maxlines: null,
                                    focusNode: FocusNode(),
                                    paddingcontainer: const EdgeInsets.only(
                                        left: 16, right: 16, top: 25),
                                    fontsizehinttext: 13,
                                    // validater: (val) {
                                    //   return validInput(val!, 0, 20, "");
                                    // },
                                    hinttxt:
                                        "Antall måneder til avtalen utløper",
                                    hinttxtcolor: Myisellcolors.hvit70,
                                    contentpadding: const EdgeInsets.fromLTRB(
                                        30, 20, 30, 20),
                                    txtcolor: Myisellcolors.hvit70,
                                    txttype: TextInputType.number,
                                    onSav: (value) {},
                                    height: 22,
                                    width: 1,
                                    cursorColor: Myisellcolors.hvit70,
                                    borderR: 5,
                                    borderwidth: 1,
                                    bordersidecolor: Myisellcolors.hoved,
                                    obs: false,
                                    label: Container(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: Text(
                                        'Total ant. måneder',
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.mandali(
                                            color: Myisellcolors.hoved,
                                            fontSize: 19),
                                      ),
                                    ),
                                    float: FloatingLabelBehavior.always,
                                  )
                                : const SizedBox(),
                            controller.annonsetype == "Leie ut"
                                ? IsellTextField(
                                    con: controller.leieselskap,
                                    maxlines: null,
                                    focusNode: FocusNode(),
                                    paddingcontainer: const EdgeInsets.only(
                                        left: 16, right: 16, top: 25),
                                    fontsizehinttext: 13,
                                    // validater: (val) {
                                    //   return validInput(val!, 0, 20, "");
                                    // },
                                    hinttxt: "Utleieselskap",
                                    hinttxtcolor: Myisellcolors.hvit70,
                                    contentpadding: const EdgeInsets.fromLTRB(
                                        30, 20, 30, 20),
                                    txtcolor: Myisellcolors.hvit70,
                                    txttype: TextInputType.text,
                                    onSav: (value) {},
                                    height: 22,
                                    width: 1,
                                    cursorColor: Myisellcolors.hvit70,
                                    borderR: 5,
                                    borderwidth: 1,
                                    bordersidecolor: Myisellcolors.hoved,
                                    obs: false,
                                    label: Container(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: Text(
                                        'Utleieselskap',
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.mandali(
                                            color: Myisellcolors.hoved,
                                            fontSize: 19),
                                      ),
                                    ),
                                    float: FloatingLabelBehavior.always,
                                  )
                                : const SizedBox(),
                            controller.annonsetype == "Leie ut"
                                ? IsellTextField(
                                    con: controller.stedforlevering,
                                    maxlines: null,
                                    focusNode: FocusNode(),
                                    paddingcontainer: const EdgeInsets.only(
                                        left: 16, right: 16, top: 25),
                                    fontsizehinttext: 13,
                                    // validater: (val) {
                                    //   return validInput(val!, 0, 20, "");
                                    // },
                                    hinttxt:
                                        "Stedet for levering av kjøretøyet",
                                    hinttxtcolor: Myisellcolors.hvit70,
                                    contentpadding: const EdgeInsets.fromLTRB(
                                        30, 20, 30, 20),
                                    txtcolor: Myisellcolors.hvit70,
                                    txttype: TextInputType.text,
                                    onSav: (value) {},
                                    height: 22,
                                    width: 1,
                                    cursorColor: Myisellcolors.hvit70,
                                    borderR: 5,
                                    borderwidth: 1,
                                    bordersidecolor: Myisellcolors.hoved,
                                    obs: false,
                                    label: Container(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: Text(
                                        'Sted for levering',
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.mandali(
                                            color: Myisellcolors.hoved,
                                            fontSize: 19),
                                      ),
                                    ),
                                    float: FloatingLabelBehavior.always,
                                  )
                                : const SizedBox(),
                            Container(
                              margin: const EdgeInsets.only(
                                  top: 20, left: 15, right: 10),
                              child: Text(
                                "Adresse og kontakt informasjon:",
                                style: GoogleFonts.baloo2(
                                    color: Myisellcolors.hvit, fontSize: 18),
                              ),
                            ),
                            IsellTextField(
                              con: controller.land,
                              maxlines: null,
                              focusNode: FocusNode(),
                              paddingcontainer: const EdgeInsets.only(
                                  left: 16, right: 16, top: 25),
                              fontsizehinttext: 14.5,
                              validater: (val) {
                                return validInput(val!, 0, 20, "");
                              },
                              hinttxt: "F.eks. Norge",
                              hinttxtcolor: Myisellcolors.hvit70,
                              contentpadding:
                                  const EdgeInsets.fromLTRB(30, 20, 30, 20),
                              txtcolor: Myisellcolors.hvit70,
                              txttype: TextInputType.streetAddress,
                              onSav: (value) {},
                              height: 22,
                              width: 1,
                              cursorColor: Myisellcolors.hvit70,
                              borderR: 5,
                              borderwidth: 1,
                              bordersidecolor: Myisellcolors.hoved,
                              obs: false,
                              label: Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  'Land *',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.mandali(
                                      color: Myisellcolors.hoved, fontSize: 19),
                                ),
                              ),
                              float: FloatingLabelBehavior.always,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: Get.width / 2,
                                  child: IsellTextField(
                                    con: controller.postnummer,
                                    maxlines: null,
                                    focusNode: FocusNode(),
                                    paddingcontainer: const EdgeInsets.only(
                                        left: 16, right: 6, top: 25),
                                    fontsizehinttext: 14.5,
                                    validater: (val) {
                                      return validInput(val!, 0, 50, "");
                                    },
                                    hinttxt: "Postnummer",
                                    hinttxtcolor: Myisellcolors.hvit70,
                                    contentpadding: const EdgeInsets.fromLTRB(
                                        30, 20, 30, 20),
                                    txtcolor: Myisellcolors.hvit70,
                                    txttype: TextInputType.number,
                                    onSav: (value) {},
                                    height: 22,
                                    width: 1,
                                    cursorColor: Myisellcolors.hvit70,
                                    borderR: 5,
                                    borderwidth: 1,
                                    bordersidecolor: Myisellcolors.hoved,
                                    obs: false,
                                    label: Container(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: Text(
                                        'Postnr. *',
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.mandali(
                                            color: Myisellcolors.hoved,
                                            fontSize: 19),
                                      ),
                                    ),
                                    float: FloatingLabelBehavior.always,
                                  ),
                                ),
                                SizedBox(
                                  width: Get.width / 2,
                                  child: IsellTextField(
                                    con: controller.poststed,
                                    maxlines: null,
                                    focusNode: FocusNode(),
                                    paddingcontainer: const EdgeInsets.only(
                                        left: 6, right: 16, top: 25),
                                    fontsizehinttext: 14.5,
                                    validater: (val) {
                                      return validInput(val!, 0, 50, "");
                                    },
                                    hinttxt: "Poststed",
                                    hinttxtcolor: Myisellcolors.hvit70,
                                    contentpadding: const EdgeInsets.fromLTRB(
                                        30, 20, 30, 20),
                                    txtcolor: Myisellcolors.hvit70,
                                    txttype: TextInputType.text,
                                    onSav: (value) {},
                                    height: 22,
                                    width: 1,
                                    cursorColor: Myisellcolors.hvit70,
                                    borderR: 5,
                                    borderwidth: 1,
                                    bordersidecolor: Myisellcolors.hoved,
                                    obs: false,
                                    label: Container(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: Text(
                                        'Poststed *',
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.mandali(
                                            color: Myisellcolors.hoved,
                                            fontSize: 19),
                                      ),
                                    ),
                                    float: FloatingLabelBehavior.always,
                                  ),
                                ),
                              ],
                            ),
                            IsellTextField(
                              con: controller.gateadresse,
                              maxlines: null,
                              focusNode: FocusNode(),
                              paddingcontainer: const EdgeInsets.only(
                                  left: 16, right: 16, top: 25),
                              fontsizehinttext: 14.5,
                              // validater: (val) {
                              //   return validInput(val!, 0, 200, "");
                              // },
                              hinttxt: "Eks. Årstadveien 25",
                              hinttxtcolor: Myisellcolors.hvit70,
                              contentpadding:
                                  const EdgeInsets.fromLTRB(30, 20, 30, 20),
                              txtcolor: Myisellcolors.hvit70,
                              txttype: TextInputType.streetAddress,
                              onSav: (value) {},
                              height: 22,
                              width: 1,
                              cursorColor: Myisellcolors.hvit70,
                              borderR: 5,
                              borderwidth: 1,
                              bordersidecolor: Myisellcolors.hoved,
                              obs: false,
                              label: Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  'Gateadresse',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.mandali(
                                      color: Myisellcolors.hoved, fontSize: 19),
                                ),
                              ),
                              float: FloatingLabelBehavior.always,
                            ),
                            IsellTextField(
                              con: controller.telefonnummer,
                              maxlines: null,
                              focusNode: FocusNode(),
                              paddingcontainer: const EdgeInsets.only(
                                  left: 16, right: 16, top: 25),
                              fontsizehinttext: 13,
                              validater: (val) {},
                              hinttxt: "Nummer å bli kontatet på ang. annonsen",
                              hinttxtcolor: Myisellcolors.hvit70,
                              contentpadding:
                                  const EdgeInsets.fromLTRB(30, 20, 30, 20),
                              txtcolor: Myisellcolors.hvit70,
                              txttype: TextInputType.name,
                              onSav: (value) {},
                              height: 22,
                              width: 1,
                              cursorColor: Myisellcolors.hvit70,
                              borderR: 5,
                              borderwidth: 1,
                              bordersidecolor: Myisellcolors.hoved,
                              obs: false,
                              label: Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  'Telefonnummer',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.mandali(
                                      color: Myisellcolors.hoved, fontSize: 19),
                                ),
                              ),
                              float: FloatingLabelBehavior.always,
                            ),
                            IsellTextField(
                              con: controller.itemselger,
                              maxlines: null,
                              focusNode: FocusNode(),
                              paddingcontainer: const EdgeInsets.only(
                                  left: 16, right: 16, top: 25),
                              fontsizehinttext: 12,
                              validater: (val) {},
                              hinttxt: "Navnet til selskapet",
                              hinttxtcolor: Myisellcolors.hvit70,
                              contentpadding:
                                  const EdgeInsets.fromLTRB(30, 20, 30, 20),
                              txtcolor: Myisellcolors.hvit70,
                              txttype: TextInputType.name,
                              onSav: (value) {},
                              height: 22,
                              width: 1,
                              cursorColor: Myisellcolors.hvit70,
                              borderR: 5,
                              borderwidth: 1,
                              bordersidecolor: Myisellcolors.hoved,
                              obs: false,
                              label: Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  'Selskapsnavn',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.mandali(
                                      color: Myisellcolors.hoved, fontSize: 19),
                                ),
                              ),
                              float: FloatingLabelBehavior.always,
                            ),
                            IsellTextField(
                              con: controller.kontaktperson,
                              maxlines: null,
                              focusNode: FocusNode(),
                              paddingcontainer: const EdgeInsets.only(
                                  left: 16, right: 16, top: 25),
                              fontsizehinttext: 12,
                              validater: (val) {},
                              hinttxt:
                                  "Navnet til kontakt person angående sp. om kjøretøyet",
                              hinttxtcolor: Myisellcolors.hvit70,
                              contentpadding:
                                  const EdgeInsets.fromLTRB(30, 20, 30, 20),
                              txtcolor: Myisellcolors.hvit70,
                              txttype: TextInputType.name,
                              onSav: (value) {},
                              height: 22,
                              width: 1,
                              cursorColor: Myisellcolors.hvit70,
                              borderR: 5,
                              borderwidth: 1,
                              bordersidecolor: Myisellcolors.hoved,
                              obs: false,
                              label: Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  'Kontaktperson',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.mandali(
                                      color: Myisellcolors.hoved, fontSize: 19),
                                ),
                              ),
                              float: FloatingLabelBehavior.always,
                            ),
                            Container(
                              padding:
                                  const EdgeInsets.only(top: 20, bottom: 10),
                              child: IsellButtons(
                                  size:
                                      Size(Get.width / 1.079, Get.height / 16),
                                  name: "Legg til ny annonsem",
                                  onPresset: () {
                                    if (controller.gkBilerannonse.currentState!
                                        .validate()) {
                                      controller.addBilerAnnonseData();
                                    } else {
                                      Get.snackbar(
                                        "OBS!",
                                        "Fyll opp obligatoriske felter markert med *",
                                        backgroundColor: Colors.red,
                                        colorText: Colors.white,
                                      );
                                      Future.delayed(Duration.zero, () {
                                        controller.clicked = true;
                                        controller.update();
                                      });
                                    }
                                  },
                                  alignmen: Alignment.center,
                                  borderradius: 5,
                                  fontsize: 16,
                                  bgcolor: Myisellcolors.hoved),
                            ),
                            const SizedBox(height: 40),
                          ],
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(
                                  top: 20, left: 15, right: 10),
                              child: Text(
                                "Kjøretøyets generell informasjon:",
                                style: GoogleFonts.baloo2(
                                    color: Myisellcolors.hvit,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            IsellTextField(
                              maxlines: null,
                              focusNode: FocusNode(),
                              paddingcontainer: const EdgeInsets.only(
                                  left: 16, right: 16, top: 25),
                              fontsizehinttext: 13,
                              validater: (val) {
                                return validInput(val!, 0, 100, "");
                              },
                              hinttxt: "Skriv en kort overskrift til annonsen",
                              hinttxtcolor: Myisellcolors.hvit70,
                              contentpadding:
                                  const EdgeInsets.fromLTRB(30, 20, 30, 20),
                              txtcolor: Myisellcolors.hvit70,
                              txttype: TextInputType.multiline,
                              onSav: (value) {},
                              height: 22,
                              width: 1,
                              cursorColor: Myisellcolors.hvit70,
                              borderR: 5,
                              borderwidth: 1,
                              bordersidecolor: Myisellcolors.hoved,
                              con: controller.overskrift,
                              obs: false,
                              label: Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  'Overskrift *',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.mandali(
                                      color: Myisellcolors.hoved, fontSize: 19),
                                ),
                              ),
                              float: FloatingLabelBehavior.always,
                            ),
                            Container(
                              padding: const EdgeInsets.only(
                                  top: 25, left: 16, right: 16),
                              child: DropdownButtonHideUnderline(
                                child: ButtonTheme(
                                  alignedDropdown: true,
                                  child: DropdownButtonFormField(
                                    dropdownColor: Myisellcolors.appbar,
                                    decoration: const InputDecoration(
                                        focusedErrorBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5)),
                                            borderSide: BorderSide(
                                                color: Myisellcolors.hoved)),
                                        errorBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5)),
                                            borderSide: BorderSide(
                                                color: Myisellcolors.hoved)),
                                        // contentPadding: const EdgeInsets.only(
                                        //     right: 8, left: 1, top: 20, bottom: 20),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5)),
                                          borderSide: BorderSide(
                                              color: Myisellcolors.hoved,
                                              width: 1),
                                        ),
                                        fillColor: Myisellcolors.home,
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5)),
                                          borderSide: BorderSide(
                                              color: Myisellcolors.hoved,
                                              width: 1),
                                        ),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(5),
                                          ),
                                        ),
                                        filled: true),
                                    // value: controller.bilenstari[0],

                                    validator: (value) {
                                      if (value == null) {
                                        return 'Hvor er kjøretøet står parkert';
                                      } else {
                                        return null;
                                      }
                                    },
                                    // onSaved: (newValue) {
                                    // controller.carstar!.value == newValue;
                                    // },
                                    icon: const Icon(
                                      Icons.keyboard_arrow_down_sharp,
                                      size: (28),
                                      color: Myisellcolors.hoved,
                                    ),
                                    hint: const Text('Kjøretøyets står i *',
                                        style: TextStyle(
                                            color: Myisellcolors.hvit70,
                                            fontSize: 13)),
                                    items: controller.bilenstari.map(
                                      (e) {
                                        return DropdownMenuItem(
                                          value: e,
                                          child: Text(
                                            e,
                                            style: GoogleFonts.roboto(
                                                color: Myisellcolors.hvit70),
                                          ),
                                        );
                                      },
                                    ).toList(),

                                    onChanged: (value) {
                                      // controller.carstari.value =
                                      //     value as String;
                                      // controller.carstar!.text = value;
                                      controller.onChangedCarStari(value);
                                      controller.update();
                                    },
                                  ),
                                ),
                              ),
                            ),
                            controller.biltype == "Bobil"
                                ? IsellTextField(
                                    con: controller.carregnummer,
                                    maxlines: null,
                                    focusNode: FocusNode(),
                                    paddingcontainer: const EdgeInsets.only(
                                        left: 16, right: 16, top: 25),
                                    fontsizehinttext: 12,
                                    validater: (val) {
                                      return validInput(val!, 0, 100, "");
                                    },
                                    hinttxt:
                                        "Registreringsnummer eller understellsnummer",
                                    hinttxtcolor: Myisellcolors.hvit70,
                                    contentpadding: const EdgeInsets.fromLTRB(
                                        30, 20, 30, 20),
                                    txtcolor: Myisellcolors.hvit70,
                                    txttype: TextInputType.multiline,
                                    onSav: (value) {},
                                    height: 22,
                                    width: 1,
                                    cursorColor: Myisellcolors.hvit70,
                                    borderR: 5,
                                    borderwidth: 1,
                                    bordersidecolor: Myisellcolors.hoved,
                                    obs: false,
                                    label: Container(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: Text(
                                        'Registreringsnummer *',
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.mandali(
                                            color: Myisellcolors.hoved,
                                            fontSize: 19),
                                      ),
                                    ),
                                    float: FloatingLabelBehavior.always,
                                  )
                                : const SizedBox(),
                            controller.biltype == "Bobil"
                                ? IsellTextField(
                                    con: controller.carchassis,
                                    maxlines: null,
                                    focusNode: FocusNode(),
                                    paddingcontainer: const EdgeInsets.only(
                                        left: 16, right: 16, top: 25),
                                    fontsizehinttext: 13,
                                    validater: (val) {
                                      return validInput(val!, 17, 50, "");
                                    },
                                    hinttxt:
                                        "Står på første side i vogkortet eller vegvesen.no",
                                    hinttxtcolor: Myisellcolors.hvit70,
                                    contentpadding: const EdgeInsets.fromLTRB(
                                        30, 20, 30, 20),
                                    txtcolor: Myisellcolors.hvit70,
                                    txttype: TextInputType.multiline,
                                    onSav: (value) {},
                                    height: 22,
                                    width: 1,
                                    cursorColor: Myisellcolors.hvit70,
                                    borderR: 5,
                                    borderwidth: 1,
                                    bordersidecolor: Myisellcolors.hoved,
                                    obs: false,
                                    label: Container(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: Text(
                                        'Chassisnummer *',
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.mandali(
                                            color: Myisellcolors.hoved,
                                            fontSize: 19),
                                      ),
                                    ),
                                    float: FloatingLabelBehavior.always,
                                  )
                                : const SizedBox(),
                            IsellTextField(
                              con: controller.carmodellar,
                              maxlines: null,
                              focusNode: FocusNode(),
                              paddingcontainer: const EdgeInsets.only(
                                  left: 16, right: 16, top: 25),
                              fontsizehinttext: 13,
                              validater: (val) {
                                return validInput(val!, 4, 4, "");
                              },
                              hinttxt: "F.eks. 2022",
                              hinttxtcolor: Myisellcolors.hvit70,
                              contentpadding:
                                  const EdgeInsets.fromLTRB(30, 20, 30, 20),
                              txtcolor: Myisellcolors.hvit70,
                              txttype: TextInputType.number,
                              onSav: (value) {},
                              height: 22,
                              width: 1,
                              cursorColor: Myisellcolors.hvit70,
                              borderR: 5,
                              borderwidth: 1,
                              bordersidecolor: Myisellcolors.hoved,
                              obs: false,
                              label: Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  'Modellår *',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.mandali(
                                      color: Myisellcolors.hoved, fontSize: 19),
                                ),
                              ),
                              float: FloatingLabelBehavior.always,
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  left: Get.width / 25,
                                  right: Get.width / 25,
                                  top: Get.height / 37),
                              child: TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Du må velge merke';
                                  }
                                  return null;
                                },
                                onChanged: (value) {
                                  controller.gkBilerannonse.currentState
                                      ?.validate();
                                },
                                readOnly: true,
                                controller: controller.carmerke,
                                cursorColor: Myisellcolors.hoved,
                                onTap: () {
                                  FocusScope.of(context).unfocus();
                                  controller.showDropdownBoBilemerke(context);
                                  controller.carmodell!.text = "";
                                  controller.update();
                                },
                                decoration: InputDecoration(
                                  suffixIcon: const Icon(
                                    Icons.keyboard_arrow_down_sharp,
                                    size: (28),
                                    color: Myisellcolors.hoved,
                                  ),
                                  // focusColor: Myisellcolors.hoved,
                                  filled: true,
                                  fillColor: Myisellcolors.hvit,
                                  hintText: controller.biltype == "Campingvogn"
                                      ? "Campingvogn merke"
                                      : "Bobil merke",
                                  hintStyle: GoogleFonts.roboto(
                                      color: Myisellcolors.blak),
                                  // contentPadding:
                                  //     EdgeInsets.only(left: Get.width / 14.6),
                                  border: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                    width: 1,
                                    color: Myisellcolors.hoved,
                                  )),
                                  focusedErrorBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          width: 1,
                                          color: Myisellcolors.hoved,
                                          style: BorderStyle.solid),
                                      borderRadius: BorderRadius.circular(5)),
                                  disabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          width: 1,
                                          color: Myisellcolors.hoved,
                                          style: BorderStyle.solid),
                                      borderRadius: BorderRadius.circular(5)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          width: 1,
                                          color: Myisellcolors.hoved,
                                          style: BorderStyle.solid),
                                      borderRadius: BorderRadius.circular(5)),
                                  errorBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          width: 1,
                                          color: Myisellcolors.hoved,
                                          style: BorderStyle.solid),
                                      borderRadius: BorderRadius.circular(5)),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        width: 1,
                                        color: Myisellcolors.hoved,
                                        style: BorderStyle.solid),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                              ),
                            ),
                            IsellTextField(
                              con: controller.carmodell,
                              maxlines: null,
                              focusNode: FocusNode(),
                              paddingcontainer: const EdgeInsets.only(
                                  left: 16, right: 16, top: 25),
                              fontsizehinttext: 13,
                              // validater: (val) {
                              //   return validInput(val!, 4, 4, "");
                              // },
                              hinttxt: controller.biltype == "Campingvogn"
                                  ? "Campingvogn modell"
                                  : "Bobil modell",
                              hinttxtcolor: Myisellcolors.hvit70,
                              contentpadding:
                                  const EdgeInsets.fromLTRB(30, 20, 30, 20),
                              txtcolor: Myisellcolors.hvit70,
                              txttype: TextInputType.text,
                              onSav: (value) {},
                              height: 22,
                              width: 1,
                              cursorColor: Myisellcolors.hvit70,
                              borderR: 5,
                              borderwidth: 1,
                              bordersidecolor: Myisellcolors.hoved,
                              obs: false,
                              label: Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  'Modell',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.mandali(
                                      color: Myisellcolors.hoved, fontSize: 19),
                                ),
                              ),
                              float: FloatingLabelBehavior.always,
                            ),
                            controller.biltype == "Bobil"
                                ? Container(
                                    padding: const EdgeInsets.only(
                                        top: 15, left: 16, right: 16),
                                    child: DropdownButtonHideUnderline(
                                      child: ButtonTheme(
                                        alignedDropdown: true,
                                        child: DropdownButtonFormField(
                                          dropdownColor: Myisellcolors.appbar,
                                          decoration: const InputDecoration(
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  5)),
                                                      borderSide: BorderSide(
                                                          color: Myisellcolors
                                                              .hoved)),
                                              errorBorder: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(5)),
                                                  borderSide: BorderSide(
                                                      color:
                                                          Myisellcolors.hoved)),
                                              // contentPadding: const EdgeInsets.only(
                                              //     right: 8, left: 1, top: 20, bottom: 20),
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(5)),
                                                borderSide: BorderSide(
                                                    color: Myisellcolors.hoved,
                                                    width: 1),
                                              ),
                                              fillColor: Myisellcolors.home,
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(5)),
                                                borderSide: BorderSide(
                                                    color: Myisellcolors.hoved,
                                                    width: 1),
                                              ),
                                              border: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(5),
                                                ),
                                              ),
                                              filled: true),
                                          validator: (value) {
                                            if (value == null) {
                                              return 'Du må velge drivstoff type';
                                            } else {
                                              return null;
                                            }
                                          },
                                          // onSaved: (newValue) {
                                          //   controller.itemtistand!.value == newValue;
                                          // },
                                          icon: const Icon(
                                            Icons.keyboard_arrow_down_sharp,
                                            size: (28),
                                            color: Myisellcolors.hoved,
                                          ),
                                          hint: const Text('Drivstoff *',
                                              style: TextStyle(
                                                  color: Myisellcolors.hvit70,
                                                  fontSize: 15)),
                                          items: drivstoff.map(
                                            (e) {
                                              return DropdownMenuItem(
                                                value: e,
                                                child: Text(
                                                  e,
                                                  style: GoogleFonts.roboto(
                                                      color:
                                                          Myisellcolors.hvit70),
                                                ),
                                              );
                                            },
                                          ).toList(),
                                          onChanged: (value) {
                                            controller.cardrivstoffet.value =
                                                value as String;
                                            controller.cardrivstoff!.text =
                                                value;
                                            controller
                                                .gkBilerannonse.currentState
                                                ?.validate();
                                          },
                                        ),
                                      ),
                                    ),
                                  )
                                : const SizedBox(),
                            controller.biltype == "Bobil"
                                ? Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      IsellTextField(
                                        con: controller.carsylindervolum,
                                        maxlines: null,
                                        focusNode: FocusNode(),
                                        paddingcontainer: const EdgeInsets.only(
                                            left: 16, right: 16, top: 25),
                                        fontsizehinttext: 13,
                                        validater: (val) {
                                          return validInput(val!, 0, 50, "");
                                        },
                                        hinttxt: "Sylindervolum i liter",
                                        hinttxtcolor: Myisellcolors.hvit70,
                                        contentpadding:
                                            const EdgeInsets.fromLTRB(
                                                30, 20, 30, 20),
                                        txtcolor: Myisellcolors.hvit70,
                                        txttype: TextInputType.number,
                                        onSav: (value) {},
                                        height: 22,
                                        width: 1,
                                        cursorColor: Myisellcolors.hvit70,
                                        borderR: 5,
                                        borderwidth: 1,
                                        bordersidecolor: Myisellcolors.hoved,
                                        obs: false,
                                        label: Container(
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: Text(
                                            'Sylindervolum *',
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.mandali(
                                                color: Myisellcolors.hoved,
                                                fontSize: 19),
                                          ),
                                        ),
                                        float: FloatingLabelBehavior.always,
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(
                                            top: 6, left: 16.5, right: 12),
                                        child: Text(
                                          "Dette kan du finne i vogokortet under Motor/drivverk.\nFor eks. 2600 cm\u00b3 = 2.6 L",
                                          style: GoogleFonts.roboto(
                                              color: Myisellcolors.hvit70,
                                              fontSize: 12),
                                        ),
                                      ),
                                    ],
                                  )
                                : const SizedBox(),
                            controller.biltype == "Bobil"
                                ? IsellTextField(
                                    con: controller.careffekt,
                                    maxlines: null,
                                    focusNode: FocusNode(),
                                    paddingcontainer: const EdgeInsets.only(
                                        left: 16, right: 16, top: 25),
                                    fontsizehinttext: 13,
                                    // validater: (val) {
                                    //   return validInput(val!, 0, 50, "");
                                    // },
                                    hinttxt: "Effekt i hk",
                                    hinttxtcolor: Myisellcolors.hvit70,
                                    contentpadding: const EdgeInsets.fromLTRB(
                                        30, 20, 30, 20),
                                    txtcolor: Myisellcolors.hvit70,
                                    txttype: TextInputType.number,
                                    onSav: (value) {},
                                    height: 22,
                                    width: 1,
                                    cursorColor: Myisellcolors.hvit70,
                                    borderR: 5,
                                    borderwidth: 1,
                                    bordersidecolor: Myisellcolors.hoved,
                                    obs: false,
                                    label: Container(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: Text(
                                        'Hestekrefter',
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.mandali(
                                            color: Myisellcolors.hoved,
                                            fontSize: 19),
                                      ),
                                    ),
                                    float: FloatingLabelBehavior.always,
                                  )
                                : const SizedBox(),
                            controller.biltype == "Bobil"
                                ? Container(
                                    padding: const EdgeInsets.only(
                                        top: 15, left: 16, right: 16),
                                    child: DropdownButtonHideUnderline(
                                      child: ButtonTheme(
                                        alignedDropdown: true,
                                        child: DropdownButtonFormField(
                                          dropdownColor: Myisellcolors.appbar,
                                          decoration: InputDecoration(
                                              label: Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 10),
                                                child: Text(
                                                  'Girkasse *',
                                                  style: GoogleFonts.mandali(
                                                      color:
                                                          Myisellcolors.hoved,
                                                      fontSize: 19),
                                                ),
                                              ),
                                              floatingLabelBehavior:
                                                  FloatingLabelBehavior.auto,
                                              focusedErrorBorder:
                                                  const OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  5)),
                                                      borderSide: BorderSide(
                                                          color: Myisellcolors
                                                              .hoved)),
                                              errorBorder: const OutlineInputBorder(
                                                  borderRadius: BorderRadius
                                                      .all(Radius.circular(5)),
                                                  borderSide: BorderSide(
                                                      color:
                                                          Myisellcolors.hoved)),
                                              // contentPadding: const EdgeInsets.only(
                                              //     right: 8, left: 1, top: 20, bottom: 20),
                                              enabledBorder:
                                                  const OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(5)),
                                                borderSide: BorderSide(
                                                    color: Myisellcolors.hoved,
                                                    width: 1),
                                              ),
                                              fillColor: Myisellcolors.home,
                                              focusedBorder:
                                                  const OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(5)),
                                                borderSide: BorderSide(
                                                    color: Myisellcolors.hoved,
                                                    width: 1),
                                              ),
                                              border: const OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(5),
                                                ),
                                              ),
                                              filled: true),
                                          validator: (value) {
                                            if (value == null) {
                                              return 'Du må velge girkasse type';
                                            } else {
                                              return null;
                                            }
                                          },
                                          // onSaved: (newValue) {
                                          //   controller.itemtistand!.value == newValue;
                                          // },
                                          icon: const Icon(
                                            Icons.keyboard_arrow_down_sharp,
                                            size: (28),
                                            color: Myisellcolors.hoved,
                                          ),
                                          hint: const Text('Girkasse *',
                                              style: TextStyle(
                                                  color: Myisellcolors.hvit70,
                                                  fontSize: 15)),
                                          items: girkassetype.map(
                                            (e) {
                                              return DropdownMenuItem(
                                                value: e,
                                                child: Text(
                                                  e,
                                                  style: GoogleFonts.roboto(
                                                      color:
                                                          Myisellcolors.hvit70),
                                                ),
                                              );
                                            },
                                          ).toList(),
                                          onChanged: (value) {
                                            controller.gircassecar.value =
                                                value as String;
                                            controller.cargirkasse!.text =
                                                value;
                                            controller
                                                .gkBilerannonse.currentState
                                                ?.validate();
                                          },
                                        ),
                                      ),
                                    ),
                                  )
                                : const SizedBox(),
                            controller.biltype == "Bobil"
                                ? Container(
                                    padding: const EdgeInsets.only(
                                        top: 15, left: 16, right: 16),
                                    child: DropdownButtonHideUnderline(
                                      child: ButtonTheme(
                                        alignedDropdown: true,
                                        child: DropdownButtonFormField(
                                          dropdownColor: Myisellcolors.appbar,
                                          decoration: InputDecoration(
                                              label: Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 10),
                                                child: Text(
                                                  'Hjuldrift *',
                                                  style: GoogleFonts.mandali(
                                                      color:
                                                          Myisellcolors.hoved,
                                                      fontSize: 19),
                                                ),
                                              ),
                                              floatingLabelBehavior:
                                                  FloatingLabelBehavior.auto,
                                              focusedErrorBorder:
                                                  const OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  5)),
                                                      borderSide: BorderSide(
                                                          color: Myisellcolors
                                                              .hoved)),
                                              errorBorder: const OutlineInputBorder(
                                                  borderRadius: BorderRadius
                                                      .all(Radius.circular(5)),
                                                  borderSide: BorderSide(
                                                      color:
                                                          Myisellcolors.hoved)),
                                              // contentPadding: const EdgeInsets.only(
                                              //     right: 8, left: 1, top: 20, bottom: 20),
                                              enabledBorder:
                                                  const OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(5)),
                                                borderSide: BorderSide(
                                                    color: Myisellcolors.hoved,
                                                    width: 1),
                                              ),
                                              fillColor: Myisellcolors.home,
                                              focusedBorder:
                                                  const OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(5)),
                                                borderSide: BorderSide(
                                                    color: Myisellcolors.hoved,
                                                    width: 1),
                                              ),
                                              border: const OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(5),
                                                ),
                                              ),
                                              filled: true),
                                          // validator: (value) {
                                          //   if (value == null) {
                                          //     return 'Du må velge drivstoff type';
                                          //   } else {
                                          //     return null;
                                          //   }
                                          // },
                                          // onSaved: (newValue) {
                                          //   controller.itemtistand!.value == newValue;
                                          // },
                                          icon: const Icon(
                                            Icons.keyboard_arrow_down_sharp,
                                            size: (28),
                                            color: Myisellcolors.hoved,
                                          ),
                                          hint: const Text('Hjuldrift',
                                              style: TextStyle(
                                                  color: Myisellcolors.hvit70,
                                                  fontSize: 15)),
                                          items: hjuldrifttype.map(
                                            (e) {
                                              return DropdownMenuItem(
                                                value: e,
                                                child: Text(
                                                  e,
                                                  style: GoogleFonts.roboto(
                                                      color:
                                                          Myisellcolors.hvit70),
                                                ),
                                              );
                                            },
                                          ).toList(),
                                          onChanged: (value) {
                                            controller.hjuledrift.value =
                                                value as String;
                                            controller.carhjuledrift!.text =
                                                value;
                                            controller
                                                .gkBilerannonse.currentState
                                                ?.validate();
                                          },
                                        ),
                                      ),
                                    ),
                                  )
                                : const SizedBox(),
                            IsellTextField(
                              con: controller.bilsoveplasser,
                              maxlines: null,
                              focusNode: FocusNode(),
                              paddingcontainer: const EdgeInsets.only(
                                  left: 16, right: 16, top: 25),
                              fontsizehinttext: 13,
                              validater: (val) {
                                return validInput(val!, 1, 100, "");
                              },
                              hinttxt: "Antall soveplasser",
                              hinttxtcolor: Myisellcolors.hvit70,
                              contentpadding:
                                  const EdgeInsets.fromLTRB(30, 20, 30, 20),
                              txtcolor: Myisellcolors.hvit70,
                              txttype: TextInputType.number,
                              onSav: (value) {},
                              height: 22,
                              width: 1,
                              cursorColor: Myisellcolors.hvit70,
                              borderR: 5,
                              borderwidth: 1,
                              bordersidecolor: Myisellcolors.hoved,
                              obs: false,
                              label: Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  'Soveplasser *',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.mandali(
                                      color: Myisellcolors.hoved, fontSize: 19),
                                ),
                              ),
                              float: FloatingLabelBehavior.always,
                            ),
                            controller.biltype == "Bobil"
                                ? Container(
                                    padding: const EdgeInsets.only(
                                        top: 15, left: 16, right: 16),
                                    child: DropdownButtonHideUnderline(
                                      child: ButtonTheme(
                                        alignedDropdown: true,
                                        child: DropdownButtonFormField(
                                          dropdownColor: Myisellcolors.appbar,
                                          decoration: InputDecoration(
                                              label: Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 10),
                                                child: Text(
                                                  'Type seng *',
                                                  style: GoogleFonts.mandali(
                                                      color:
                                                          Myisellcolors.hoved,
                                                      fontSize: 19),
                                                ),
                                              ),
                                              floatingLabelBehavior:
                                                  FloatingLabelBehavior.auto,
                                              focusedErrorBorder:
                                                  const OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  5)),
                                                      borderSide: BorderSide(
                                                          color: Myisellcolors
                                                              .hoved)),
                                              errorBorder: const OutlineInputBorder(
                                                  borderRadius: BorderRadius
                                                      .all(Radius.circular(5)),
                                                  borderSide: BorderSide(
                                                      color:
                                                          Myisellcolors.hoved)),
                                              // contentPadding: const EdgeInsets.only(
                                              //     right: 8, left: 1, top: 20, bottom: 20),
                                              enabledBorder:
                                                  const OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(5)),
                                                borderSide: BorderSide(
                                                    color: Myisellcolors.hoved,
                                                    width: 1),
                                              ),
                                              fillColor: Myisellcolors.home,
                                              focusedBorder:
                                                  const OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(5)),
                                                borderSide: BorderSide(
                                                    color: Myisellcolors.hoved,
                                                    width: 1),
                                              ),
                                              border: const OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(5),
                                                ),
                                              ),
                                              filled: true),
                                          // validator: (value) {
                                          //   if (value == null) {
                                          //     return 'Du må velge drivstoff type';
                                          //   } else {
                                          //     return null;
                                          //   }
                                          // },
                                          // onSaved: (newValue) {
                                          //   controller.itemtistand!.value == newValue;
                                          // },
                                          icon: const Icon(
                                            Icons.keyboard_arrow_down_sharp,
                                            size: (28),
                                            color: Myisellcolors.hoved,
                                          ),
                                          hint: const Text('Sengtype',
                                              style: TextStyle(
                                                  color: Myisellcolors.hvit70,
                                                  fontSize: 15)),
                                          items: typesengen.map(
                                            (e) {
                                              return DropdownMenuItem(
                                                value: e,
                                                child: Text(
                                                  e,
                                                  style: GoogleFonts.roboto(
                                                      color:
                                                          Myisellcolors.hvit70),
                                                ),
                                              );
                                            },
                                          ).toList(),
                                          onChanged: (value) {
                                            controller.sengtypen.value =
                                                value as String;
                                            controller.sengtype!.text = value;
                                            controller
                                                .gkBilerannonse.currentState
                                                ?.validate();
                                          },
                                        ),
                                      ),
                                    ),
                                  )
                                : const SizedBox(),
                            controller.biltype == "Bobil"
                                ? IsellTextField(
                                    con: controller.antallseter,
                                    maxlines: null,
                                    focusNode: FocusNode(),
                                    paddingcontainer: const EdgeInsets.only(
                                        left: 16, right: 16, top: 25),
                                    fontsizehinttext: 13,
                                    validater: (val) {
                                      return validInput(val!, 1, 100, "");
                                    },
                                    hinttxt: "Antall sitteplasser",
                                    hinttxtcolor: Myisellcolors.hvit70,
                                    contentpadding: const EdgeInsets.fromLTRB(
                                        30, 20, 30, 20),
                                    txtcolor: Myisellcolors.hvit70,
                                    txttype: TextInputType.number,
                                    onSav: (value) {},
                                    height: 22,
                                    width: 1,
                                    cursorColor: Myisellcolors.hvit70,
                                    borderR: 5,
                                    borderwidth: 1,
                                    bordersidecolor: Myisellcolors.hoved,
                                    obs: false,
                                    label: Container(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: Text(
                                        "Sitteplasser",
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.mandali(
                                            color: Myisellcolors.hoved,
                                            fontSize: 19),
                                      ),
                                    ),
                                    float: FloatingLabelBehavior.always,
                                  )
                                : const SizedBox(),
                            IsellTextField(
                              con: controller.egenvektkg,
                              maxlines: null,
                              focusNode: FocusNode(),
                              paddingcontainer: const EdgeInsets.only(
                                  left: 16, right: 16, top: 25),
                              fontsizehinttext: 13,
                              validater: (val) {
                                return validInput(val!, 1, 100, "");
                              },
                              hinttxt: "Kjøretøyets egenvekt i kg",
                              hinttxtcolor: Myisellcolors.hvit70,
                              contentpadding:
                                  const EdgeInsets.fromLTRB(30, 20, 30, 20),
                              txtcolor: Myisellcolors.hvit70,
                              txttype: TextInputType.number,
                              onSav: (value) {},
                              height: 22,
                              width: 1,
                              cursorColor: Myisellcolors.hvit70,
                              borderR: 5,
                              borderwidth: 1,
                              bordersidecolor: Myisellcolors.hoved,
                              obs: false,
                              label: Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  'Egenvekt *',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.mandali(
                                      color: Myisellcolors.hoved, fontSize: 19),
                                ),
                              ),
                              float: FloatingLabelBehavior.always,
                            ),
                            IsellTextField(
                              con: controller.biltotalvekt,
                              maxlines: null,
                              focusNode: FocusNode(),
                              paddingcontainer: const EdgeInsets.only(
                                  left: 16, right: 16, top: 25),
                              fontsizehinttext: 13,
                              validater: (val) {
                                return validInput(val!, 1, 100, "");
                              },
                              hinttxt: "Kjøretøyets total i kg",
                              hinttxtcolor: Myisellcolors.hvit70,
                              contentpadding:
                                  const EdgeInsets.fromLTRB(30, 20, 30, 20),
                              txtcolor: Myisellcolors.hvit70,
                              txttype: TextInputType.number,
                              onSav: (value) {},
                              height: 22,
                              width: 1,
                              cursorColor: Myisellcolors.hvit70,
                              borderR: 5,
                              borderwidth: 1,
                              bordersidecolor: Myisellcolors.hoved,
                              obs: false,
                              label: Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  'Totalvekt *',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.mandali(
                                      color: Myisellcolors.hoved, fontSize: 19),
                                ),
                              ),
                              float: FloatingLabelBehavior.always,
                            ),
                            IsellTextField(
                              con: controller.biltotallengde,
                              maxlines: null,
                              focusNode: FocusNode(),
                              paddingcontainer: const EdgeInsets.only(
                                  left: 16, right: 16, top: 25),
                              fontsizehinttext: 13,
                              validater: (val) {
                                return controller.biltype == "Bobil"
                                    ? validInput(val!, 1, 100, "")
                                    : null;
                              },
                              hinttxt: "Kjøretøyets totallengde i cm",
                              hinttxtcolor: Myisellcolors.hvit70,
                              contentpadding:
                                  const EdgeInsets.fromLTRB(30, 20, 30, 20),
                              txtcolor: Myisellcolors.hvit70,
                              txttype: TextInputType.number,
                              onSav: (value) {},
                              height: 22,
                              width: 1,
                              cursorColor: Myisellcolors.hvit70,
                              borderR: 5,
                              borderwidth: 1,
                              bordersidecolor: Myisellcolors.hoved,
                              obs: false,
                              label: Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  controller.biltype == "Bobil"
                                      ? 'Totallengde *'
                                      : "Totallengde",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.mandali(
                                      color: Myisellcolors.hoved, fontSize: 19),
                                ),
                              ),
                              float: FloatingLabelBehavior.always,
                            ),
                            IsellTextField(
                              con: controller.bilinnvendiglengde,
                              maxlines: null,
                              focusNode: FocusNode(),
                              paddingcontainer: const EdgeInsets.only(
                                  left: 16, right: 16, top: 25),
                              fontsizehinttext: 13,
                              // validater: (val) {
                              //   return validInput(val!, 1, 100, "");
                              // },
                              hinttxt: "Kjøretøyets innvendig lengde i cm",
                              hinttxtcolor: Myisellcolors.hvit70,
                              contentpadding:
                                  const EdgeInsets.fromLTRB(30, 20, 30, 20),
                              txtcolor: Myisellcolors.hvit70,
                              txttype: TextInputType.number,
                              onSav: (value) {},
                              height: 22,
                              width: 1,
                              cursorColor: Myisellcolors.hvit70,
                              borderR: 5,
                              borderwidth: 1,
                              bordersidecolor: Myisellcolors.hoved,
                              obs: false,
                              label: Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  'Innvendig lengde',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.mandali(
                                      color: Myisellcolors.hoved, fontSize: 19),
                                ),
                              ),
                              float: FloatingLabelBehavior.always,
                            ),
                            IsellTextField(
                              con: controller.bilbredde,
                              maxlines: null,
                              focusNode: FocusNode(),
                              paddingcontainer: const EdgeInsets.only(
                                  left: 16, right: 16, top: 25),
                              fontsizehinttext: 13,
                              // validater: (val) {
                              //   return validInput(val!, 1, 100, "");
                              // },
                              hinttxt: "Kjøretøyets bredde i cm",
                              hinttxtcolor: Myisellcolors.hvit70,
                              contentpadding:
                                  const EdgeInsets.fromLTRB(30, 20, 30, 20),
                              txtcolor: Myisellcolors.hvit70,
                              txttype: TextInputType.number,
                              onSav: (value) {},
                              height: 22,
                              width: 1,
                              cursorColor: Myisellcolors.hvit70,
                              borderR: 5,
                              borderwidth: 1,
                              bordersidecolor: Myisellcolors.hoved,
                              obs: false,
                              label: Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  'Bredde',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.mandali(
                                      color: Myisellcolors.hoved, fontSize: 19),
                                ),
                              ),
                              float: FloatingLabelBehavior.always,
                            ),
                            IsellTextField(
                              con: controller.carfarge,
                              maxlines: null,
                              focusNode: FocusNode(),
                              paddingcontainer: const EdgeInsets.only(
                                  left: 16, right: 16, top: 25),
                              fontsizehinttext: 13,
                              // validater: (val) {
                              //   return validInput(val!, 1, 100, "");
                              // },
                              hinttxt: "Kjøretøyets farge",
                              hinttxtcolor: Myisellcolors.hvit70,
                              contentpadding:
                                  const EdgeInsets.fromLTRB(30, 20, 30, 20),
                              txtcolor: Myisellcolors.hvit70,
                              txttype: TextInputType.number,
                              onSav: (value) {},
                              height: 22,
                              width: 1,
                              cursorColor: Myisellcolors.hvit70,
                              borderR: 5,
                              borderwidth: 1,
                              bordersidecolor: Myisellcolors.hoved,
                              obs: false,
                              label: Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  'Farge',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.mandali(
                                      color: Myisellcolors.hoved, fontSize: 19),
                                ),
                              ),
                              float: FloatingLabelBehavior.always,
                            ),
                            IsellTextField(
                              con: controller.fargebeskrivelse,
                              maxlines: null,
                              focusNode: FocusNode(),
                              paddingcontainer: const EdgeInsets.only(
                                  left: 16, right: 16, top: 25),
                              fontsizehinttext: 13,
                              // validater: (val) {
                              //   return validInput(val!, 1, 100, "");
                              // },
                              hinttxt: "Farge beskrivelse",
                              hinttxtcolor: Myisellcolors.hvit70,
                              contentpadding:
                                  const EdgeInsets.fromLTRB(30, 30, 30, 30),
                              txtcolor: Myisellcolors.hvit70,
                              txttype: TextInputType.number,
                              onSav: (value) {},
                              height: 22,
                              width: 1,
                              cursorColor: Myisellcolors.hvit70,
                              borderR: 5,
                              borderwidth: 1,
                              bordersidecolor: Myisellcolors.hoved,
                              obs: false,
                              label: Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  'Farge beskrivelse',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.mandali(
                                      color: Myisellcolors.hoved, fontSize: 19),
                                ),
                              ),
                              float: FloatingLabelBehavior.always,
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  left: Get.width / 25,
                                  right: Get.width / 25,
                                  top: Get.height / 37),
                              child: TextFormField(
                                maxLines:
                                    controller.carutstyr!.text.contains(', ')
                                        ? null
                                        : 1,
                                readOnly: true,
                                controller: controller.carutstyr,
                                cursorColor: Myisellcolors.hoved,
                                onTap: () {
                                  FocusScope.of(context).unfocus();
                                  controller.biltype == "Campingvogn"
                                      ? controller
                                          .showDropdownCampingvognutstyr(
                                              context)
                                      : controller
                                          .showDropdownBobilutstyr(context);
                                },
                                decoration: InputDecoration(
                                  suffixIcon: const Icon(
                                    Icons.keyboard_arrow_down_sharp,
                                    size: (28),
                                    color: Myisellcolors.hoved,
                                  ),
                                  // focusColor: Myisellcolors.hoved,
                                  filled: true,
                                  fillColor: Myisellcolors.hvit,
                                  hintText: controller.biltype == "Bobil"
                                      ? "Bobil Utstyr"
                                      : "Campingvogn utstyr",
                                  hintStyle: GoogleFonts.roboto(
                                      color: Myisellcolors.blak),
                                  // contentPadding:
                                  //     EdgeInsets.only(left: Get.width / 14.6),
                                  border: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                    width: 1,
                                    color: Myisellcolors.hoved,
                                  )),
                                  focusedErrorBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          width: 1,
                                          color: Myisellcolors.hoved,
                                          style: BorderStyle.solid),
                                      borderRadius: BorderRadius.circular(5)),
                                  disabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          width: 1,
                                          color: Myisellcolors.hoved,
                                          style: BorderStyle.solid),
                                      borderRadius: BorderRadius.circular(5)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          width: 1,
                                          color: Myisellcolors.hoved,
                                          style: BorderStyle.solid),
                                      borderRadius: BorderRadius.circular(5)),
                                  errorBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          width: 1,
                                          color: Myisellcolors.hoved,
                                          style: BorderStyle.solid),
                                      borderRadius: BorderRadius.circular(5)),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        width: 1,
                                        color: Myisellcolors.hoved,
                                        style: BorderStyle.solid),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(
                                  top: 25, left: 16, right: 16),
                              child: DropdownButtonHideUnderline(
                                child: ButtonTheme(
                                  alignedDropdown: true,
                                  child: DropdownButtonFormField(
                                    dropdownColor: Myisellcolors.appbar,
                                    decoration: InputDecoration(
                                        label: Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: Text(
                                            'Tilstand *',
                                            style: GoogleFonts.mandali(
                                                color: Myisellcolors.hoved,
                                                fontSize: 19),
                                          ),
                                        ),
                                        floatingLabelBehavior:
                                            FloatingLabelBehavior.auto,
                                        focusedErrorBorder:
                                            const OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(5)),
                                                borderSide: BorderSide(
                                                    color:
                                                        Myisellcolors.hoved)),
                                        errorBorder: const OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5)),
                                            borderSide: BorderSide(
                                                color: Myisellcolors.hoved)),
                                        // contentPadding: const EdgeInsets.only(
                                        //     right: 8, left: 1, top: 20, bottom: 20),
                                        enabledBorder: const OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5)),
                                          borderSide: BorderSide(
                                              color: Myisellcolors.hoved,
                                              width: 1),
                                        ),
                                        fillColor: Myisellcolors.home,
                                        focusedBorder: const OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5)),
                                          borderSide: BorderSide(
                                              color: Myisellcolors.hoved,
                                              width: 1),
                                        ),
                                        border: const OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(5),
                                          ),
                                        ),
                                        filled: true),
                                    validator: (value) {
                                      if (value == null) {
                                        return 'Du må velge Kjøretøyets tilstand';
                                      } else {
                                        return null;
                                      }
                                    },
                                    // onSaved: (newValue) {
                                    //   controller.itemtistand!.value == newValue;
                                    // },
                                    icon: const Icon(
                                      Icons.keyboard_arrow_down_sharp,
                                      size: (28),
                                      color: Myisellcolors.hoved,
                                    ),
                                    hint: const Text('Kjøretøyets tilstand *',
                                        style: TextStyle(
                                            color: Myisellcolors.hvit70,
                                            fontSize: 15)),
                                    items: tilsant.map(
                                      (e) {
                                        return DropdownMenuItem(
                                          value: e,
                                          child: Text(
                                            e,
                                            style: GoogleFonts.roboto(
                                                color: Myisellcolors.hvit70),
                                          ),
                                        );
                                      },
                                    ).toList(),
                                    onChanged: (value) {
                                      controller.tilstandbil.value =
                                          value as String;
                                      controller.cartilstand!.text = value;
                                      controller.gkBilerannonse.currentState
                                          ?.validate();
                                    },
                                  ),
                                ),
                              ),
                            ),
                            IsellTextField(
                              con: controller.carkilometer,
                              maxlines: null,
                              focusNode: FocusNode(),
                              paddingcontainer: const EdgeInsets.only(
                                  left: 16, right: 16, top: 25),
                              fontsizehinttext: 13,
                              // validater: (val) {
                              //   return validInput(val!, 1, 100, "");
                              // },
                              hinttxt: "Kilometerstand",
                              hinttxtcolor: Myisellcolors.hvit70,
                              contentpadding:
                                  const EdgeInsets.fromLTRB(30, 20, 30, 20),
                              txtcolor: Myisellcolors.hvit70,
                              txttype: TextInputType.number,
                              onSav: (value) {},
                              height: 22,
                              width: 1,
                              cursorColor: Myisellcolors.hvit70,
                              borderR: 5,
                              borderwidth: 1,
                              bordersidecolor: Myisellcolors.hoved,
                              obs: false,
                              label: Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  'Kilometerstand',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.mandali(
                                      color: Myisellcolors.hoved, fontSize: 19),
                                ),
                              ),
                              float: FloatingLabelBehavior.always,
                            ),
                            IsellTextField(
                              con: controller.antalleiere,
                              maxlines: null,
                              focusNode: FocusNode(),
                              paddingcontainer: const EdgeInsets.only(
                                  left: 16, right: 16, top: 25),
                              fontsizehinttext: 13,
                              // validater: (val) {
                              //   return validInput(val!, 1, 100, "");
                              // },
                              hinttxt: "Antall eiere",
                              hinttxtcolor: Myisellcolors.hvit70,
                              contentpadding:
                                  const EdgeInsets.fromLTRB(30, 20, 30, 20),
                              txtcolor: Myisellcolors.hvit70,
                              txttype: TextInputType.number,
                              onSav: (value) {},
                              height: 22,
                              width: 1,
                              cursorColor: Myisellcolors.hvit70,
                              borderR: 5,
                              borderwidth: 1,
                              bordersidecolor: Myisellcolors.hoved,
                              obs: false,
                              label: Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  'Antall eiere',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.mandali(
                                      color: Myisellcolors.hoved, fontSize: 19),
                                ),
                              ),
                              float: FloatingLabelBehavior.always,
                            ),
                            IsellTextField(
                              con: controller.forstegangsreg,
                              maxlines: null,
                              focusNode: FocusNode(),
                              paddingcontainer: const EdgeInsets.only(
                                  left: 16, right: 16, top: 25),
                              fontsizehinttext: 13,
                              // validater: (val) {
                              //   return validInput(val!, 1, 100, "");
                              // },
                              hinttxt: "Førstegangsregistrert",
                              hinttxtcolor: Myisellcolors.hvit70,
                              contentpadding:
                                  const EdgeInsets.fromLTRB(30, 20, 30, 20),
                              txtcolor: Myisellcolors.hvit70,
                              txttype: TextInputType.text,
                              onSav: (value) {},
                              height: 22,
                              width: 1,
                              cursorColor: Myisellcolors.hvit70,
                              borderR: 5,
                              borderwidth: 1,
                              bordersidecolor: Myisellcolors.hoved,
                              obs: false,
                              label: Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  'Førstegangsregistrert',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.mandali(
                                      color: Myisellcolors.hoved, fontSize: 19),
                                ),
                              ),
                              float: FloatingLabelBehavior.always,
                            ),
                            controller.biltype == "Bobil"
                                ? Container(
                                    padding: const EdgeInsets.only(
                                        top: 25, left: 16, right: 16),
                                    child: DropdownButtonHideUnderline(
                                      child: ButtonTheme(
                                        alignedDropdown: true,
                                        child: DropdownButtonFormField(
                                          dropdownColor: Myisellcolors.appbar,
                                          decoration: InputDecoration(
                                              label: Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 10),
                                                child: Text(
                                                  'Garantitype',
                                                  style: GoogleFonts.mandali(
                                                      color:
                                                          Myisellcolors.hoved,
                                                      fontSize: 19),
                                                ),
                                              ),
                                              floatingLabelBehavior:
                                                  FloatingLabelBehavior.auto,
                                              focusedErrorBorder:
                                                  const OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  5)),
                                                      borderSide: BorderSide(
                                                          color: Myisellcolors
                                                              .hoved)),
                                              errorBorder: const OutlineInputBorder(
                                                  borderRadius: BorderRadius
                                                      .all(Radius.circular(5)),
                                                  borderSide: BorderSide(
                                                      color:
                                                          Myisellcolors.hoved)),
                                              // contentPadding: const EdgeInsets.only(
                                              //     right: 8, left: 1, top: 20, bottom: 20),
                                              enabledBorder:
                                                  const OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(5)),
                                                borderSide: BorderSide(
                                                    color: Myisellcolors.hoved,
                                                    width: 1),
                                              ),
                                              fillColor: Myisellcolors.home,
                                              focusedBorder:
                                                  const OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(5)),
                                                borderSide: BorderSide(
                                                    color: Myisellcolors.hoved,
                                                    width: 1),
                                              ),
                                              border: const OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(5),
                                                ),
                                              ),
                                              filled: true),
                                          // validator: (value) {
                                          //   if (value == null) {
                                          //     return 'Du må velge Kjøretøyets tilstand';
                                          //   } else {
                                          //     return null;
                                          //   }
                                          // },
                                          // onSaved: (newValue) {
                                          //   controller.itemtistand!.value == newValue;
                                          // },
                                          icon: const Icon(
                                            Icons.keyboard_arrow_down_sharp,
                                            size: (28),
                                            color: Myisellcolors.hoved,
                                          ),
                                          hint: const Text('Garantitype',
                                              style: TextStyle(
                                                  color: Myisellcolors.hvit70,
                                                  fontSize: 15)),
                                          items: bobilgaranti.map(
                                            (e) {
                                              return DropdownMenuItem(
                                                value: e,
                                                child: Text(
                                                  e,
                                                  style: GoogleFonts.roboto(
                                                      color:
                                                          Myisellcolors.hvit70),
                                                ),
                                              );
                                            },
                                          ).toList(),
                                          onChanged: (value) {
                                            controller.bobilgarantitype.value =
                                                value as String;
                                            controller.garantitype!.text =
                                                value;
                                            //controller.gkBilerannonse.currentState?.validate();
                                          },
                                        ),
                                      ),
                                    ),
                                  )
                                : const SizedBox(),
                            Container(
                              padding: const EdgeInsets.only(
                                  top: 25, left: 16, right: 16),
                              child: DropdownButtonHideUnderline(
                                child: ButtonTheme(
                                  alignedDropdown: true,
                                  child: DropdownButtonFormField(
                                    dropdownColor: Myisellcolors.appbar,
                                    decoration: InputDecoration(
                                        label: Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: Text(
                                            'Tilstandsrapport',
                                            style: GoogleFonts.mandali(
                                                color: Myisellcolors.hoved,
                                                fontSize: 19),
                                          ),
                                        ),
                                        floatingLabelBehavior:
                                            FloatingLabelBehavior.auto,
                                        focusedErrorBorder:
                                            const OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(5)),
                                                borderSide: BorderSide(
                                                    color:
                                                        Myisellcolors.hoved)),
                                        errorBorder: const OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5)),
                                            borderSide: BorderSide(
                                                color: Myisellcolors.hoved)),
                                        // contentPadding: const EdgeInsets.only(
                                        //     right: 8, left: 1, top: 20, bottom: 20),
                                        enabledBorder: const OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5)),
                                          borderSide: BorderSide(
                                              color: Myisellcolors.hoved,
                                              width: 1),
                                        ),
                                        fillColor: Myisellcolors.home,
                                        focusedBorder: const OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5)),
                                          borderSide: BorderSide(
                                              color: Myisellcolors.hoved,
                                              width: 1),
                                        ),
                                        border: const OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(5),
                                          ),
                                        ),
                                        filled: true),
                                    // validator: (value) {
                                    //   if (value == null) {
                                    //     return 'Du må velge Kjøretøyets tilstand';
                                    //   } else {
                                    //     return null;
                                    //   }
                                    // },
                                    // onSaved: (newValue) {
                                    //   controller.itemtistand!.value == newValue;
                                    // },
                                    icon: const Icon(
                                      Icons.keyboard_arrow_down_sharp,
                                      size: (28),
                                      color: Myisellcolors.hoved,
                                    ),
                                    hint: const Text(
                                        'Kjøretøyet har tilstandsrapport?',
                                        style: TextStyle(
                                            color: Myisellcolors.hvit70,
                                            fontSize: 15)),
                                    items: hartilsandsrapport.map(
                                      (e) {
                                        return DropdownMenuItem(
                                          value: e,
                                          child: Text(
                                            e,
                                            style: GoogleFonts.roboto(
                                                color: Myisellcolors.hvit70),
                                          ),
                                        );
                                      },
                                    ).toList(),
                                    onChanged: (value) {
                                      controller.biltistandrapport.value =
                                          value as String;
                                      controller.harbilentilstandsrapport!
                                          .text = value;
                                      //controller.gkBilerannonse.currentState?.validate();
                                    },
                                  ),
                                ),
                              ),
                            ),
                            controller.biltype == "Campingvogn"
                                ? Container(
                                    padding: const EdgeInsets.only(
                                        top: 25, left: 16, right: 16),
                                    child: DropdownButtonHideUnderline(
                                      child: ButtonTheme(
                                        alignedDropdown: true,
                                        child: DropdownButtonFormField(
                                          dropdownColor: Myisellcolors.appbar,
                                          decoration: InputDecoration(
                                              label: Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 10),
                                                child: Text(
                                                  'Garanti',
                                                  style: GoogleFonts.mandali(
                                                      color:
                                                          Myisellcolors.hoved,
                                                      fontSize: 19),
                                                ),
                                              ),
                                              floatingLabelBehavior:
                                                  FloatingLabelBehavior.auto,
                                              focusedErrorBorder:
                                                  const OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  5)),
                                                      borderSide: BorderSide(
                                                          color: Myisellcolors
                                                              .hoved)),
                                              errorBorder: const OutlineInputBorder(
                                                  borderRadius: BorderRadius
                                                      .all(Radius.circular(5)),
                                                  borderSide: BorderSide(
                                                      color:
                                                          Myisellcolors.hoved)),
                                              // contentPadding: const EdgeInsets.only(
                                              //     right: 8, left: 1, top: 20, bottom: 20),
                                              enabledBorder:
                                                  const OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(5)),
                                                borderSide: BorderSide(
                                                    color: Myisellcolors.hoved,
                                                    width: 1),
                                              ),
                                              fillColor: Myisellcolors.home,
                                              focusedBorder:
                                                  const OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(5)),
                                                borderSide: BorderSide(
                                                    color: Myisellcolors.hoved,
                                                    width: 1),
                                              ),
                                              border: const OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(5),
                                                ),
                                              ),
                                              filled: true),
                                          // validator: (value) {
                                          //   if (value == null) {
                                          //     return 'Du må velge Kjøretøyets tilstand';
                                          //   } else {
                                          //     return null;
                                          //   }
                                          // },
                                          // onSaved: (newValue) {
                                          //   controller.itemtistand!.value == newValue;
                                          // },
                                          icon: const Icon(
                                            Icons.keyboard_arrow_down_sharp,
                                            size: (28),
                                            color: Myisellcolors.hoved,
                                          ),
                                          hint: const Text(
                                              'Har Kjøretøyet garanti?',
                                              style: TextStyle(
                                                  color: Myisellcolors.hvit70,
                                                  fontSize: 15)),
                                          items: harbilgaranti.map(
                                            (e) {
                                              return DropdownMenuItem(
                                                value: e,
                                                child: Text(
                                                  e,
                                                  style: GoogleFonts.roboto(
                                                      color:
                                                          Myisellcolors.hvit70),
                                                ),
                                              );
                                            },
                                          ).toList(),
                                          onChanged: (value) {
                                            controller.bilgaranti.value =
                                                value as String;
                                            controller.harbilengaranti!.text =
                                                value;
                                            //controller.gkBilerannonse.currentState?.validate();
                                          },
                                        ),
                                      ),
                                    ),
                                  )
                                : const SizedBox(),
                            controller.biltype == "Bobil"
                                ? Container(
                                    padding: const EdgeInsets.only(
                                        top: 25, left: 16, right: 16),
                                    child: DropdownButtonHideUnderline(
                                      child: ButtonTheme(
                                        alignedDropdown: true,
                                        child: DropdownButtonFormField(
                                          dropdownColor: Myisellcolors.appbar,
                                          decoration: InputDecoration(
                                              label: Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 10),
                                                child: Text(
                                                  'Vedlikeholdsprogram',
                                                  style: GoogleFonts.mandali(
                                                      color:
                                                          Myisellcolors.hoved,
                                                      fontSize: 19),
                                                ),
                                              ),
                                              floatingLabelBehavior:
                                                  FloatingLabelBehavior.auto,
                                              focusedErrorBorder:
                                                  const OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  5)),
                                                      borderSide: BorderSide(
                                                          color: Myisellcolors
                                                              .hoved)),
                                              errorBorder: const OutlineInputBorder(
                                                  borderRadius: BorderRadius
                                                      .all(Radius.circular(5)),
                                                  borderSide: BorderSide(
                                                      color:
                                                          Myisellcolors.hoved)),
                                              // contentPadding: const EdgeInsets.only(
                                              //     right: 8, left: 1, top: 20, bottom: 20),
                                              enabledBorder:
                                                  const OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(5)),
                                                borderSide: BorderSide(
                                                    color: Myisellcolors.hoved,
                                                    width: 1),
                                              ),
                                              fillColor: Myisellcolors.home,
                                              focusedBorder:
                                                  const OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(5)),
                                                borderSide: BorderSide(
                                                    color: Myisellcolors.hoved,
                                                    width: 1),
                                              ),
                                              border: const OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(5),
                                                ),
                                              ),
                                              filled: true),
                                          // validator: (value) {
                                          //   if (value == null) {
                                          //     return 'Du må velge Kjøretøyets tilstand';
                                          //   } else {
                                          //     return null;
                                          //   }
                                          // },
                                          // onSaved: (newValue) {
                                          //   controller.itemtistand!.value == newValue;
                                          // },
                                          icon: const Icon(
                                            Icons.keyboard_arrow_down_sharp,
                                            size: (28),
                                            color: Myisellcolors.hoved,
                                          ),
                                          hint: const Text(
                                              'Fulgt bobilen Vedlikeholdsprogram',
                                              style: TextStyle(
                                                  color: Myisellcolors.hvit70,
                                                  fontSize: 13)),
                                          items: hartilsandsrapport.map(
                                            (e) {
                                              return DropdownMenuItem(
                                                value: e,
                                                child: Text(
                                                  e,
                                                  style: GoogleFonts.roboto(
                                                      color:
                                                          Myisellcolors.hvit70),
                                                ),
                                              );
                                            },
                                          ).toList(),
                                          onChanged: (value) {
                                            controller.bilvedlikeholdsprogram
                                                .value = value as String;
                                            controller.carvedlikeholdsprogram!
                                                .text = value;
                                            //controller.gkBilerannonse.currentState?.validate();
                                          },
                                        ),
                                      ),
                                    ),
                                  )
                                : const SizedBox(),
                            IsellTextField(
                              con: controller.linkvideo,
                              maxlines: null,
                              focusNode: FocusNode(),
                              paddingcontainer: const EdgeInsets.only(
                                  left: 16, right: 16, top: 25),
                              fontsizehinttext: 13,
                              // validater: (val) {
                              //   return validInput(val!, 0, 200, "");
                              // },
                              hinttxt: "Link til video på YouTube for eksampel",
                              hinttxtcolor: Myisellcolors.hvit70,
                              contentpadding:
                                  const EdgeInsets.fromLTRB(30, 20, 30, 20),
                              txtcolor: Myisellcolors.hvit70,
                              txttype: TextInputType.text,
                              onSav: (value) {},
                              height: 22,
                              width: 1,
                              cursorColor: Myisellcolors.hvit70,
                              borderR: 5,
                              borderwidth: 1,
                              bordersidecolor: Myisellcolors.hoved,
                              obs: false,
                              label: Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  'Video URL',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.mandali(
                                      color: Myisellcolors.hoved, fontSize: 19),
                                ),
                              ),
                              float: FloatingLabelBehavior.always,
                            ),
                            IsellTextField(
                              con: controller.carbeskrivelse,
                              maxlines: null,
                              focusNode: FocusNode(),
                              paddingcontainer: const EdgeInsets.only(
                                  left: 16, right: 16, top: 25),
                              fontsizehinttext: 14.5,
                              // validater: (val) {
                              //   return validInput(val!, 0, 200, "");
                              // },
                              hinttxt: "Skriv en beskrivelse av bilen",
                              hinttxtcolor: Myisellcolors.hvit70,
                              contentpadding:
                                  const EdgeInsets.fromLTRB(30, 40, 30, 40),
                              txtcolor: Myisellcolors.hvit70,
                              txttype: TextInputType.text,
                              onSav: (value) {},
                              height: 22,
                              width: 1,
                              cursorColor: Myisellcolors.hvit70,
                              borderR: 5,
                              borderwidth: 1,
                              bordersidecolor: Myisellcolors.hoved,
                              obs: false,
                              label: Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  'Bilbeskrivelse',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.mandali(
                                      color: Myisellcolors.hoved, fontSize: 19),
                                ),
                              ),
                              float: FloatingLabelBehavior.always,
                            ),
                            controller.annonsetype == "Leie ut"
                                ? IsellTextField(
                                    con: controller.startleiecar,
                                    maxlines: null,
                                    focusNode: FocusNode(),
                                    paddingcontainer: const EdgeInsets.only(
                                        left: 16, right: 16, top: 25),
                                    fontsizehinttext: 13,
                                    validater: (val) {
                                      return validInput(val!, 0, 20, "");
                                    },
                                    hinttxt: "Innskudd i NOK",
                                    hinttxtcolor: Myisellcolors.hvit70,
                                    contentpadding: const EdgeInsets.fromLTRB(
                                        30, 20, 30, 20),
                                    txtcolor: Myisellcolors.hvit70,
                                    txttype: TextInputType.number,
                                    onSav: (value) {},
                                    height: 22,
                                    width: 1,
                                    cursorColor: Myisellcolors.hvit70,
                                    borderR: 5,
                                    borderwidth: 1,
                                    bordersidecolor: Myisellcolors.hoved,
                                    obs: false,
                                    label: Container(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: Text(
                                        'Startleie *',
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.mandali(
                                            color: Myisellcolors.hoved,
                                            fontSize: 19),
                                      ),
                                    ),
                                    float: FloatingLabelBehavior.always,
                                  )
                                : const SizedBox(),
                            controller.annonsetype == "Leie ut"
                                ? IsellTextField(
                                    con: controller.manedsbelopcar,
                                    maxlines: null,
                                    focusNode: FocusNode(),
                                    paddingcontainer: const EdgeInsets.only(
                                        left: 16, right: 16, top: 25),
                                    fontsizehinttext: 13,
                                    validater: (val) {
                                      return validInput(val!, 0, 20, "");
                                    },
                                    hinttxt: "Månedsbeløp i NOK",
                                    hinttxtcolor: Myisellcolors.hvit70,
                                    contentpadding: const EdgeInsets.fromLTRB(
                                        30, 20, 30, 20),
                                    txtcolor: Myisellcolors.hvit70,
                                    txttype: TextInputType.number,
                                    onSav: (value) {},
                                    height: 22,
                                    width: 1,
                                    cursorColor: Myisellcolors.hvit70,
                                    borderR: 5,
                                    borderwidth: 1,
                                    bordersidecolor: Myisellcolors.hoved,
                                    obs: false,
                                    label: Container(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: Text(
                                        'Månedsbeløp *',
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.mandali(
                                            color: Myisellcolors.hoved,
                                            fontSize: 19),
                                      ),
                                    ),
                                    float: FloatingLabelBehavior.always,
                                  )
                                : const SizedBox(),
                            controller.annonsetype == "Selge"
                                ? Column(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.only(
                                            top: 15, left: 16, right: 16),
                                        child: DropdownButtonHideUnderline(
                                          child: ButtonTheme(
                                            alignedDropdown: true,
                                            child: DropdownButtonFormField(
                                              enableFeedback: true,
                                              dropdownColor:
                                                  Myisellcolors.appbar,
                                              decoration: InputDecoration(
                                                  label: Container(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        horizontal: 10),
                                                    child: Text(
                                                      'Fritak fra omreg.',
                                                      style:
                                                          GoogleFonts.mandali(
                                                              color:
                                                                  Myisellcolors
                                                                      .hoved,
                                                              fontSize: 19),
                                                    ),
                                                  ),
                                                  floatingLabelBehavior:
                                                      FloatingLabelBehavior
                                                          .auto,
                                                  focusedErrorBorder:
                                                      const OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius.circular(
                                                                      5)),
                                                          borderSide: BorderSide(
                                                              color:
                                                                  Myisellcolors
                                                                      .hoved)),
                                                  errorBorder: const OutlineInputBorder(
                                                      borderRadius: BorderRadius.all(
                                                          Radius.circular(5)),
                                                      borderSide: BorderSide(
                                                          color: Myisellcolors
                                                              .hoved)),
                                                  // contentPadding: const EdgeInsets.only(
                                                  //     right: 8, left: 1, top: 20, bottom: 20),
                                                  enabledBorder:
                                                      const OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(5)),
                                                    borderSide: BorderSide(
                                                        color:
                                                            Myisellcolors.hoved,
                                                        width: 1),
                                                  ),
                                                  fillColor: Myisellcolors.home,
                                                  focusedBorder:
                                                      const OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(5)),
                                                    borderSide: BorderSide(
                                                        color:
                                                            Myisellcolors.hoved,
                                                        width: 1),
                                                  ),
                                                  border: const OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                      Radius.circular(5),
                                                    ),
                                                  ),
                                                  filled: true),
                                              // validator: (value) {
                                              //   if (value == null) {
                                              //     return 'Du må velge drivstoff type';
                                              //   } else {
                                              //     return null;
                                              //   }
                                              // },
                                              onSaved: (newValue) {
                                                controller.fritakfracaromreg!
                                                        .text ==
                                                    newValue;
                                              },
                                              icon: const Icon(
                                                Icons.keyboard_arrow_down_sharp,
                                                size: (28),
                                                color: Myisellcolors.hoved,
                                              ),
                                              hint: const Text(
                                                  'Fritak fra omregistreringsavgit?',
                                                  style: TextStyle(
                                                      color:
                                                          Myisellcolors.hvit70,
                                                      fontSize: 14)),
                                              items: controller.fritak.map(
                                                (e) {
                                                  return DropdownMenuItem(
                                                    value: e,
                                                    child: Text(
                                                      e,
                                                      style: GoogleFonts.roboto(
                                                          color: Myisellcolors
                                                              .hvit70),
                                                    ),
                                                  );
                                                },
                                              ).toList(),
                                              onChanged: (value) {
                                                controller
                                                    .onChangedCaromregFritak(
                                                        value);

                                                if (controller
                                                        .fritakfracaromreg!
                                                        .text ==
                                                    "Ja") {
                                                  controller.omregnetavgift!
                                                      .text = "";
                                                  controller.updateTotalPrice();
                                                  controller.updateUI();
                                                }
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                      controller.fritakfracaromreg!.text ==
                                              "Nei"
                                          ? Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                IsellTextField(
                                                  con:
                                                      controller.omregnetavgift,
                                                  maxlines: null,
                                                  focusNode: FocusNode(),
                                                  paddingcontainer:
                                                      const EdgeInsets.only(
                                                          left: 16,
                                                          right: 16,
                                                          top: 16),
                                                  fontsizehinttext: 13,
                                                  validater: (val) {
                                                    return validInput(
                                                        val!, 0, 50, "");
                                                  },
                                                  onchanged: (p0) {
                                                    controller
                                                        .updateTotalPrice();
                                                    controller.updateUI();
                                                  },
                                                  hinttxt:
                                                      "Hva er omregistreringsavgit i kr",
                                                  hinttxtcolor:
                                                      Myisellcolors.hvit70,
                                                  contentpadding:
                                                      const EdgeInsets.fromLTRB(
                                                          30, 25, 30, 25),
                                                  txtcolor:
                                                      Myisellcolors.hvit70,
                                                  txttype: TextInputType.name,
                                                  onSav: (value) {},
                                                  height: 22,
                                                  width: 1,
                                                  cursorColor:
                                                      Myisellcolors.hvit70,
                                                  borderR: 5,
                                                  borderwidth: 1,
                                                  bordersidecolor:
                                                      Myisellcolors.hoved,
                                                  obs: false,
                                                  label: Container(
                                                    margin: const EdgeInsets
                                                        .symmetric(
                                                        horizontal: 10),
                                                    child: Text(
                                                      'Omregistreringsavgit',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style:
                                                          GoogleFonts.mandali(
                                                              color:
                                                                  Myisellcolors
                                                                      .hoved,
                                                              fontSize: 19),
                                                    ),
                                                  ),
                                                  float: FloatingLabelBehavior
                                                      .always,
                                                ),
                                                Container(
                                                  margin: const EdgeInsets.only(
                                                      top: 6,
                                                      left: 16.5,
                                                      right: 12),
                                                  child: Text(
                                                    "Som selger er du ansvarlig for at omregistreringsavgiten er riktig",
                                                    style: GoogleFonts.roboto(
                                                        color: Myisellcolors
                                                            .hvit70,
                                                        fontSize: 12),
                                                  ),
                                                ),
                                              ],
                                            )
                                          : const SizedBox(),
                                    ],
                                  )
                                : const SizedBox(),
                            controller.annonsetype == "Selge"
                                ? IsellTextField(
                                    con: controller.pris,
                                    maxlines: null,
                                    focusNode: FocusNode(),
                                    paddingcontainer: const EdgeInsets.only(
                                        left: 16, right: 16, top: 16),
                                    fontsizehinttext: 13,
                                    validater: (val) {
                                      return validInput(val!, 0, 50, "");
                                    },
                                    hinttxt: "Salgspris - eks. omregistrering",
                                    hinttxtcolor: Myisellcolors.hvit70,
                                    contentpadding: const EdgeInsets.fromLTRB(
                                        30, 20, 30, 20),
                                    txtcolor: Myisellcolors.hvit70,
                                    txttype: TextInputType.name,
                                    onchanged: (p0) {
                                      controller.updateTotalPrice();
                                      controller.updateUI();
                                    },
                                    height: 22,
                                    width: 1,
                                    cursorColor: Myisellcolors.hvit70,
                                    borderR: 5,
                                    borderwidth: 1,
                                    bordersidecolor: Myisellcolors.hoved,
                                    obs: false,
                                    label: Container(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: Text(
                                        'Salgspris',
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.mandali(
                                            color: Myisellcolors.hoved,
                                            fontSize: 19),
                                      ),
                                    ),
                                    float: FloatingLabelBehavior.always,
                                  )
                                : const SizedBox(),
                            controller.annonsetype == "Selge"
                                ? Obx(
                                    () => Container(
                                      margin: const EdgeInsets.only(
                                          top: 15, left: 17, right: 10),
                                      child: Text(
                                        "Totalpris blir: ${controller.formatTotalPrice(controller.totalpris.value)} kr",
                                        style: GoogleFonts.baloo2(
                                          color: Myisellcolors.hvit,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                  )
                                : const SizedBox(),
                            Container(
                              margin: const EdgeInsets.only(
                                  top: 20, left: 15, right: 10),
                              child: Text(
                                "Adresse og kontakt informasjon:",
                                style: GoogleFonts.baloo2(
                                    color: Myisellcolors.hvit, fontSize: 18),
                              ),
                            ),
                            IsellTextField(
                              con: controller.land,
                              maxlines: null,
                              focusNode: FocusNode(),
                              paddingcontainer: const EdgeInsets.only(
                                  left: 16, right: 16, top: 25),
                              fontsizehinttext: 14.5,
                              validater: (val) {
                                return validInput(val!, 0, 20, "");
                              },
                              hinttxt: "F.eks. Norge",
                              hinttxtcolor: Myisellcolors.hvit70,
                              contentpadding:
                                  const EdgeInsets.fromLTRB(30, 20, 30, 20),
                              txtcolor: Myisellcolors.hvit70,
                              txttype: TextInputType.streetAddress,
                              onSav: (value) {},
                              height: 22,
                              width: 1,
                              cursorColor: Myisellcolors.hvit70,
                              borderR: 5,
                              borderwidth: 1,
                              bordersidecolor: Myisellcolors.hoved,
                              obs: false,
                              label: Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  'Land *',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.mandali(
                                      color: Myisellcolors.hoved, fontSize: 19),
                                ),
                              ),
                              float: FloatingLabelBehavior.always,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: Get.width / 2,
                                  child: IsellTextField(
                                    con: controller.postnummer,
                                    maxlines: null,
                                    focusNode: FocusNode(),
                                    paddingcontainer: const EdgeInsets.only(
                                        left: 16, right: 6, top: 25),
                                    fontsizehinttext: 14.5,
                                    validater: (val) {
                                      return validInput(val!, 0, 50, "");
                                    },
                                    hinttxt: "Postnummer",
                                    hinttxtcolor: Myisellcolors.hvit70,
                                    contentpadding: const EdgeInsets.fromLTRB(
                                        30, 20, 30, 20),
                                    txtcolor: Myisellcolors.hvit70,
                                    txttype: TextInputType.number,
                                    onSav: (value) {},
                                    height: 22,
                                    width: 1,
                                    cursorColor: Myisellcolors.hvit70,
                                    borderR: 5,
                                    borderwidth: 1,
                                    bordersidecolor: Myisellcolors.hoved,
                                    obs: false,
                                    label: Container(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: Text(
                                        'Postnr. *',
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.mandali(
                                            color: Myisellcolors.hoved,
                                            fontSize: 19),
                                      ),
                                    ),
                                    float: FloatingLabelBehavior.always,
                                  ),
                                ),
                                SizedBox(
                                  width: Get.width / 2,
                                  child: IsellTextField(
                                    con: controller.poststed,
                                    maxlines: null,
                                    focusNode: FocusNode(),
                                    paddingcontainer: const EdgeInsets.only(
                                        left: 6, right: 16, top: 25),
                                    fontsizehinttext: 14.5,
                                    validater: (val) {
                                      return validInput(val!, 0, 50, "");
                                    },
                                    hinttxt: "Poststed",
                                    hinttxtcolor: Myisellcolors.hvit70,
                                    contentpadding: const EdgeInsets.fromLTRB(
                                        30, 20, 30, 20),
                                    txtcolor: Myisellcolors.hvit70,
                                    txttype: TextInputType.text,
                                    onSav: (value) {},
                                    height: 22,
                                    width: 1,
                                    cursorColor: Myisellcolors.hvit70,
                                    borderR: 5,
                                    borderwidth: 1,
                                    bordersidecolor: Myisellcolors.hoved,
                                    obs: false,
                                    label: Container(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: Text(
                                        'Poststed *',
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.mandali(
                                            color: Myisellcolors.hoved,
                                            fontSize: 19),
                                      ),
                                    ),
                                    float: FloatingLabelBehavior.always,
                                  ),
                                ),
                              ],
                            ),
                            IsellTextField(
                              con: controller.gateadresse,
                              maxlines: null,
                              focusNode: FocusNode(),
                              paddingcontainer: const EdgeInsets.only(
                                  left: 16, right: 16, top: 25),
                              fontsizehinttext: 14.5,
                              // validater: (val) {
                              //   return validInput(val!, 0, 200, "");
                              // },
                              hinttxt: "Eks. Årstadveien 25",
                              hinttxtcolor: Myisellcolors.hvit70,
                              contentpadding:
                                  const EdgeInsets.fromLTRB(30, 20, 30, 20),
                              txtcolor: Myisellcolors.hvit70,
                              txttype: TextInputType.streetAddress,
                              onSav: (value) {},
                              height: 22,
                              width: 1,
                              cursorColor: Myisellcolors.hvit70,
                              borderR: 5,
                              borderwidth: 1,
                              bordersidecolor: Myisellcolors.hoved,
                              obs: false,
                              label: Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  'Gateadresse',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.mandali(
                                      color: Myisellcolors.hoved, fontSize: 19),
                                ),
                              ),
                              float: FloatingLabelBehavior.always,
                            ),
                            IsellTextField(
                              con: controller.telefonnummer,
                              maxlines: null,
                              focusNode: FocusNode(),
                              paddingcontainer: const EdgeInsets.only(
                                  left: 16, right: 16, top: 25),
                              fontsizehinttext: 13,
                              validater: (val) {},
                              hinttxt: "Nummer å bli kontatet på ang. annonsen",
                              hinttxtcolor: Myisellcolors.hvit70,
                              contentpadding:
                                  const EdgeInsets.fromLTRB(30, 20, 30, 20),
                              txtcolor: Myisellcolors.hvit70,
                              txttype: TextInputType.name,
                              onSav: (value) {},
                              height: 22,
                              width: 1,
                              cursorColor: Myisellcolors.hvit70,
                              borderR: 5,
                              borderwidth: 1,
                              bordersidecolor: Myisellcolors.hoved,
                              obs: false,
                              label: Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  'Telefonnummer',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.mandali(
                                      color: Myisellcolors.hoved, fontSize: 19),
                                ),
                              ),
                              float: FloatingLabelBehavior.always,
                            ),
                            IsellTextField(
                              con: controller.itemselger,
                              maxlines: null,
                              focusNode: FocusNode(),
                              paddingcontainer: const EdgeInsets.only(
                                  left: 16, right: 16, top: 25),
                              fontsizehinttext: 12,
                              validater: (val) {},
                              hinttxt:
                                  "Navnet til kontakt person angående sp. om kjøretøyet",
                              hinttxtcolor: Myisellcolors.hvit70,
                              contentpadding:
                                  const EdgeInsets.fromLTRB(30, 20, 30, 20),
                              txtcolor: Myisellcolors.hvit70,
                              txttype: TextInputType.name,
                              onSav: (value) {},
                              height: 22,
                              width: 1,
                              cursorColor: Myisellcolors.hvit70,
                              borderR: 5,
                              borderwidth: 1,
                              bordersidecolor: Myisellcolors.hoved,
                              obs: false,
                              label: Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  'Kontaktperson',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.mandali(
                                      color: Myisellcolors.hoved, fontSize: 19),
                                ),
                              ),
                              float: FloatingLabelBehavior.always,
                            ),
                            Container(
                              padding:
                                  const EdgeInsets.only(top: 20, bottom: 10),
                              child: IsellButtons(
                                  size:
                                      Size(Get.width / 1.079, Get.height / 16),
                                  name: "Legg til ny annonsem",
                                  onPresset: () {
                                    if (controller.gkBilerannonse.currentState!
                                        .validate()) {
                                      controller.addBilerAnnonseData();
                                    } else {
                                      Get.snackbar(
                                        "OBS!",
                                        "Fyll opp obligatoriske felter markert med *",
                                        backgroundColor: Colors.red,
                                        colorText: Colors.white,
                                      );
                                      Future.delayed(Duration.zero, () {
                                        controller.clicked = true;
                                        controller.update();
                                      });
                                    }
                                  },
                                  alignmen: Alignment.center,
                                  borderradius: 5,
                                  fontsize: 16,
                                  bgcolor: Myisellcolors.hoved),
                            ),
                            const SizedBox(height: 40),
                          ],
                        ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
