import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_isell_new/controller/add_items/clothes_items_controller.dart';
import 'package:flutter_isell_new/core/classes/handling_data_view.dart';
import 'package:flutter_isell_new/core/constants/sellx_colors.dart';
import 'package:flutter_isell_new/core/functions/upload_file.dart';
import 'package:flutter_isell_new/core/functions/validate_input.dart';
import 'package:flutter_isell_new/views/screens/home/navbar.dart';
import 'package:flutter_isell_new/views/widget/sellx_%20buttons.dart';
import 'package:flutter_isell_new/views/widget/sellx_text_filed.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class KlarAnnonse extends StatelessWidget {
  const KlarAnnonse({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> items = ["Ny", "Brukt"];
    AddKlarAnnonseController addKlarAnnonseController =
        Get.put(AddKlarAnnonseController());
    addKlarAnnonseController.VelgAnnonseType("Selge");

    return Form(
      key: addKlarAnnonseController.gkKlarannonse,
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
              "Klær",
              style:
                  GoogleFonts.baloo2(fontSize: 20, color: Myisellcolors.hvit),
            ),
          ),
        ),
        endDrawer: const NavBar(),
        body: GetBuilder<AddKlarAnnonseController>(
          builder: (controller) => HandlingDataRequest(
            statusRequest: controller.statusRequest,
            widget: ListView(
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      height: Get.height / 4.2,
                      decoration: BoxDecoration(
                        border:
                            Border.all(color: Myisellcolors.hoved, width: 0.4),
                      ),
                      child: Stack(
                        children: [
                          // Container(
                          //   padding: EdgeInsets.all(5),
                          //   decoration: BoxDecoration(
                          //       border: Border.all(color: Colors.grey),
                          //       borderRadius: BorderRadius.circular(10)),
                          //   height: controller.file.isEmpty ? 100 : 200,
                          //   child: controller.file.isEmpty
                          //       ? InkWell(
                          //           onTap: () {
                          //             controller.chooseImageGalery();
                          //           },
                          //           child: SvgPicture.asset(
                          //               width: 50, "assets/images/address.svg"))
                          //       : GridView.builder(
                          //           gridDelegate:
                          //               SliverGridDelegateWithFixedCrossAxisCount(
                          //             crossAxisCount: 4,
                          //             crossAxisSpacing: 4.0,
                          //             mainAxisSpacing: 4.0,
                          //           ),
                          //           itemCount: controller.file.length,
                          //           itemBuilder:
                          //               (BuildContext context, int index) {
                          //             return Image.file(
                          //               controller.file[index],
                          //               fit: BoxFit.cover,
                          //             );
                          //           },
                          //         ),
                          // ),
                          Container(
                            height:
                                200, // Set the desired height for the images
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
                            controller.VelgAnnonseType("Kjøpe");
                          },
                          child: Container(
                            height: Get.height / 21,
                            width: Get.width / 2.3,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                  color: controller.annonsetype == "Kjøpe"
                                      ? Myisellcolors.hoved
                                      : Myisellcolors.hvit70),
                            ),
                            child: Center(
                              child: Text(
                                "Kjøpe",
                                style: GoogleFonts.roboto(
                                    fontSize: 16,
                                    color: controller.annonsetype == "Kjøpe"
                                        ? Myisellcolors.hoved
                                        : Myisellcolors.hvit70),
                              ),
                            ),
                          ),
                        ),
                        const Spacer()
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
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
                        const Spacer(),
                        InkWell(
                          onTap: () {
                            controller.VelgAnnonseType("Gi bort");
                          },
                          child: Container(
                            height: Get.height / 21,
                            width: Get.width / 2.3,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                  color: controller.annonsetype == "Gi bort"
                                      ? Myisellcolors.hoved
                                      : Myisellcolors.hvit70),
                            ),
                            child: Center(
                              child: Text(
                                "Gi bort",
                                style: GoogleFonts.roboto(
                                    fontSize: 16,
                                    color: controller.annonsetype == "Gi bort"
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
                  margin: const EdgeInsets.only(top: 30, left: 15, right: 10),
                  child: Text(
                    "Fyll ut feltene nedover med det som passer med din annonse. Felt markert med * er obligatoriske.",
                    style: GoogleFonts.baloo2(
                        color: Myisellcolors.hvit, fontSize: 18),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20, left: 15, right: 10),
                  child: Text(
                    "Annonse detaljer:",
                    style: GoogleFonts.baloo2(
                        color: Myisellcolors.hvit, fontSize: 18),
                  ),
                ),
                IsellTextField(
                  maxlines: null,
                  focusNode: FocusNode(),
                  paddingcontainer:
                      const EdgeInsets.only(left: 16, right: 16, top: 25),
                  fontsizehinttext: 13.5,
                  con: controller.name,
                  // validater: (val) {
                  //   return validInput(val!, 0, 50, "");
                  // },
                  hinttxt: "Skriv inn navnet på varen",
                  hinttxtcolor: Myisellcolors.hvit70,
                  contentpadding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
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
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      'Navn',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.mandali(
                          color: Myisellcolors.hoved, fontSize: 19),
                    ),
                  ),
                  float: FloatingLabelBehavior.always,
                ),
                IsellTextField(
                  maxlines: null,
                  focusNode: FocusNode(),
                  paddingcontainer:
                      const EdgeInsets.only(left: 16, right: 16, top: 25),
                  fontsizehinttext: 14.5,
                  // validater: (val) {
                  //   return validInput(val!, 0, 100, "");
                  // },
                  hinttxt: "Skriv en kort overskrift til annonsen",
                  hinttxtcolor: Myisellcolors.hvit70,
                  contentpadding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
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
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      'Overskrift *',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.mandali(
                          color: Myisellcolors.hoved, fontSize: 19),
                    ),
                  ),
                  float: FloatingLabelBehavior.always,
                ),
                controller.annonsetype == "Selge" ||
                        controller.annonsetype == "Kjøpe" ||
                        controller.annonsetype == "Leie ut"
                    ? IsellTextField(
                        maxlines: null,
                        focusNode: FocusNode(),
                        paddingcontainer:
                            const EdgeInsets.only(left: 16, right: 16, top: 25),
                        fontsizehinttext: 13.5,
                        validater: (val) {
                          return validInput(val!, 0, 50, "");
                        },
                        hinttxt: controller.annonsetype == "Selge" ||
                                controller.annonsetype == "Leie ut"
                            ? "Prisen på varen"
                            : "Maks pris du ønsker å betale",
                        hinttxtcolor: Myisellcolors.hvit70,
                        contentpadding:
                            const EdgeInsets.fromLTRB(30, 20, 30, 20),
                        txtcolor: Myisellcolors.hvit70,
                        txttype: TextInputType.number,
                        onSav: (value) {},
                        height: 22,
                        con: controller.pris,
                        width: 1,
                        cursorColor: Myisellcolors.hvit70,
                        borderR: 5,
                        borderwidth: 1,
                        bordersidecolor: Myisellcolors.hoved,
                        obs: false,
                        label: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            controller.annonsetype == "Selge" ||
                                    controller.annonsetype == "Leie ut"
                                ? 'Pris *'
                                : 'Maks pris *',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.mandali(
                                color: Myisellcolors.hoved, fontSize: 19),
                          ),
                        ),
                        float: FloatingLabelBehavior.always,
                      )
                    : const SizedBox(),
                IsellTextField(
                  con: controller.merke,
                  maxlines: null,
                  focusNode: FocusNode(),
                  paddingcontainer:
                      const EdgeInsets.only(left: 16, right: 16, top: 25),
                  fontsizehinttext: 13.5,
                  validater: (val) {},
                  hinttxt: "Hvilken merke har varen",
                  hinttxtcolor: Myisellcolors.hvit70,
                  contentpadding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
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
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      'Merke',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.mandali(
                          color: Myisellcolors.hoved, fontSize: 19),
                    ),
                  ),
                  float: FloatingLabelBehavior.always,
                ),
                Container(
                  padding: const EdgeInsets.only(top: 25, left: 16, right: 16),
                  child: DropdownButtonHideUnderline(
                    child: ButtonTheme(
                      alignedDropdown: true,
                      child: DropdownButtonFormField(
                        dropdownColor: Myisellcolors.appbar,
                        decoration: InputDecoration(
                            label: Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Text(
                                'Tilstand *',
                                style: GoogleFonts.mandali(
                                    color: Myisellcolors.hoved, fontSize: 19),
                              ),
                            ),
                            focusedErrorBorder: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                                borderSide:
                                    BorderSide(color: Myisellcolors.hoved)),
                            errorBorder: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                                borderSide:
                                    BorderSide(color: Myisellcolors.hoved)),
                            // contentPadding: const EdgeInsets.only(
                            //     right: 8, left: 1, top: 20, bottom: 20),
                            enabledBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                              borderSide: BorderSide(
                                  color: Myisellcolors.hoved, width: 1),
                            ),
                            fillColor: Myisellcolors.home,
                            focusedBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                              borderSide: BorderSide(
                                  color: Myisellcolors.hoved, width: 1),
                            ),
                            border: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(5),
                              ),
                            ),
                            filled: true),
                        validator: (value) {
                          if (value == null) {
                            return 'Du må velge tilstanden på varen';
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
                        hint: const Text('Velg tilstanden til varen',
                            style: TextStyle(
                                color: Myisellcolors.hvit70, fontSize: 13.5)),
                        items: items.map(
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
                          controller.selectedland.value = value as String;
                          controller.itemtistand!.text = value;
                        },
                      ),
                    ),
                  ),
                ),
                IsellTextField(
                  con: controller.sellxbeskrivelse,
                  maxlines: null,
                  focusNode: FocusNode(),
                  paddingcontainer:
                      const EdgeInsets.only(left: 16, right: 16, top: 25),
                  fontsizehinttext: 14.5,
                  validater: (val) {
                    return validInput(val!, 0, 1000000, "");
                  },
                  hinttxt: "Skriv en beskrivelse av varen",
                  hinttxtcolor: Myisellcolors.hvit70,
                  contentpadding: const EdgeInsets.fromLTRB(30, 20, 30, 50),
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
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      'Beskrivelse',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.mandali(
                          color: Myisellcolors.hoved, fontSize: 19),
                    ),
                  ),
                  float: FloatingLabelBehavior.always,
                ),
                IsellTextField(
                  con: controller.nokkelord,
                  maxlines: null,
                  focusNode: FocusNode(),
                  paddingcontainer:
                      const EdgeInsets.only(left: 16, right: 16, top: 25),
                  fontsizehinttext: 13,
                  validater: (val) {
                    return validInput(val!, 0, 1000000, "");
                  },
                  hinttxt:
                      "Skriv nøkkelord som er relatert til varen du selger",
                  hinttxtcolor: Myisellcolors.hvit70,
                  contentpadding: const EdgeInsets.fromLTRB(25, 20, 25, 35),
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
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      'Nøkkelord',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.mandali(
                          color: Myisellcolors.hoved, fontSize: 19),
                    ),
                  ),
                  float: FloatingLabelBehavior.always,
                ),
                Container(
                  margin: const EdgeInsets.only(top: 6, left: 16.5, right: 12),
                  child: Text(
                    "Nøkkelord spiller en viktig rolle i å øke synligheten til annonsene dine når potensielle kunder bruker søkemotorer. For eksempel kan nøkkelord som 'Bukser', 'T-skjorter', og 'Sko' bidra til å øke sannsynligheten for at din annonse blir sett.",
                    style: GoogleFonts.roboto(
                        color: Myisellcolors.hvit70, fontSize: 12),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20, left: 15, right: 10),
                  child: Text(
                    "Adresse og kontakt:",
                    style: GoogleFonts.baloo2(
                        color: Myisellcolors.hvit, fontSize: 18),
                  ),
                ),
                IsellTextField(
                  con: controller.land,
                  maxlines: null,
                  focusNode: FocusNode(),
                  paddingcontainer:
                      const EdgeInsets.only(left: 16, right: 16, top: 25),
                  fontsizehinttext: 13.5,
                  validater: (val) {
                    return validInput(val!, 0, 50, "");
                  },
                  hinttxt: "Eks. Norge",
                  hinttxtcolor: Myisellcolors.hvit70,
                  contentpadding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
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
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      'Land',
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
                        paddingcontainer:
                            const EdgeInsets.only(left: 16, right: 6, top: 25),
                        fontsizehinttext: 13.5,
                        validater: (val) {
                          return validInput(val!, 0, 50, "");
                        },
                        hinttxt: "Postnummer",
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
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            'Postnummer',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.mandali(
                                color: Myisellcolors.hoved, fontSize: 19),
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
                        paddingcontainer:
                            const EdgeInsets.only(left: 6, right: 16, top: 25),
                        fontsizehinttext: 14.5,
                        validater: (val) {
                          return validInput(val!, 0, 50, "");
                        },
                        hinttxt: "Poststed",
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
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            'Poststed',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.mandali(
                                color: Myisellcolors.hoved, fontSize: 19),
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
                  paddingcontainer:
                      const EdgeInsets.only(left: 16, right: 16, top: 25),
                  fontsizehinttext: 13.5,
                  validater: (val) {
                    return validInput(val!, 0, 200, "");
                  },
                  hinttxt: "Eks. Årstadveien 25",
                  hinttxtcolor: Myisellcolors.hvit70,
                  contentpadding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
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
                    margin: const EdgeInsets.symmetric(horizontal: 10),
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
                  paddingcontainer:
                      const EdgeInsets.only(left: 16, right: 16, top: 25),
                  fontsizehinttext: 13.5,
                  validater: (val) {},
                  hinttxt: "Nummer å bli kontatet på ang. annonsen",
                  hinttxtcolor: Myisellcolors.hvit70,
                  contentpadding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
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
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      'Telefonnummer',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.mandali(
                          color: Myisellcolors.hoved, fontSize: 19),
                    ),
                  ),
                  float: FloatingLabelBehavior.always,
                ),
                Container(
                  padding: const EdgeInsets.only(top: 20, bottom: 30),
                  child: IsellButtons(
                      size: Size(Get.width / 1.079, Get.height / 16),
                      name: "Legg til ny annonsem",
                      onPresset: () {
                        controller.addKlarAnnonseData();
                      },
                      alignmen: Alignment.center,
                      borderradius: 5,
                      fontsize: 16,
                      bgcolor: Myisellcolors.hoved),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// PageView.builder(
//   controller: controller.pageController,
//   itemCount: controller.imageFileList!.length,
//   itemBuilder: (context, index) {
//     return Center(
//       child: Image.file(
//         File(controller.imageFileList![index].path),
//         width: Get.width.toDouble(),
//         height: (Get.height / 4.2).toDouble(),
//       ),
//     );
//   },
//   // onPageChanged: (index) {
//   //   controller.updateCounter(index + 1);
//   // },
// ),
