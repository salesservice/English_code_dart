import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_isell_new/controller/add_items/motorcycle_items_controller.dart';
import 'package:flutter_isell_new/core/classes/handling_data_view.dart';
import 'package:flutter_isell_new/core/constants/sellx_colors.dart';
import 'package:flutter_isell_new/core/functions/upload_file.dart';
import 'package:flutter_isell_new/core/functions/validate_input.dart';
import 'package:flutter_isell_new/views/screens/home/navbar.dart';
import 'package:flutter_isell_new/views/widget/sellx_%20buttons.dart';
import 'package:flutter_isell_new/views/widget/sellx_text_filed.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class McAnnonse extends StatelessWidget {
  const McAnnonse({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> drivstoff = [
      "Bensin",
      "Diesel",
      "Elektrisitet",
    ];

    List<String> tilsant = [
      "Ny",
      "Brukt",
    ];

    List<String> hartilsandsrapport = [
      "Ja",
      "Nei",
    ];

    AddMCAnnonseController controller = Get.put(AddMCAnnonseController());
    controller.VelgAnnonseType(controller.annonsetype!);
    controller.VelgMCType(controller.motorsykkeltypene!);

    return Form(
      key: controller.gkMCerannonse,
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
              "MC",
              style:
                  GoogleFonts.baloo2(fontSize: 20, color: Myisellcolors.hvit),
            ),
          ),
        ),
        endDrawer: const NavBar(),
        body: GetBuilder<AddMCAnnonseController>(
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
                      "MC type:",
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
                              controller.VelgMCType("Motorsykkel");
                            },
                            child: Container(
                              height: Get.height / 21,
                              width: Get.width / 2.3,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                    color: controller.motorsykkeltypene ==
                                            "Motorsykkel"
                                        ? Myisellcolors.hoved
                                        : Myisellcolors.hvit70),
                              ),
                              child: Center(
                                child: Text(
                                  "Motorsykkel",
                                  style: GoogleFonts.roboto(
                                      fontSize: 16,
                                      color: controller.motorsykkeltypene ==
                                              "Motorsykkel"
                                          ? Myisellcolors.hoved
                                          : Myisellcolors.hvit70),
                                ),
                              ),
                            ),
                          ),
                          const Spacer(),
                          InkWell(
                            onTap: () {
                              controller.VelgMCType("Moped");
                            },
                            child: Container(
                              height: Get.height / 21,
                              width: Get.width / 2.3,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                    color:
                                        controller.motorsykkeltypene == "Moped"
                                            ? Myisellcolors.hoved
                                            : Myisellcolors.hvit70),
                              ),
                              child: Center(
                                child: Text(
                                  "Moped",
                                  style: GoogleFonts.roboto(
                                      fontSize: 16,
                                      color: controller.motorsykkeltypene ==
                                              "Moped"
                                          ? Myisellcolors.hoved
                                          : Myisellcolors.hvit70),
                                ),
                              ),
                            ),
                          ),
                          const Spacer()
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.only(
                                top: Get.height / 55, left: Get.width / 22),
                            child: InkWell(
                              onTap: () {
                                controller.VelgMCType("ATV");
                              },
                              child: Container(
                                height: Get.height / 21,
                                width: Get.width / 2.3,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                      color:
                                          controller.motorsykkeltypene == "ATV"
                                              ? Myisellcolors.hoved
                                              : Myisellcolors.hvit70),
                                ),
                                child: Center(
                                  child: Text(
                                    "ATV",
                                    style: GoogleFonts.roboto(
                                        fontSize: 16,
                                        color: controller.motorsykkeltypene ==
                                                "ATV"
                                            ? Myisellcolors.hoved
                                            : Myisellcolors.hvit70),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(
                                top: Get.height / 55, left: Get.width / 22),
                            child: InkWell(
                              onTap: () {
                                controller.VelgMCType("Snøscooter");
                              },
                              child: Container(
                                height: Get.height / 21,
                                width: Get.width / 2.3,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                      color: controller.motorsykkeltypene ==
                                              "Snøscooter"
                                          ? Myisellcolors.hoved
                                          : Myisellcolors.hvit70),
                                ),
                                child: Center(
                                  child: Text(
                                    "Snøscooter",
                                    style: GoogleFonts.roboto(
                                        fontSize: 16,
                                        color: controller.motorsykkeltypene ==
                                                "Snøscooter"
                                            ? Myisellcolors.hoved
                                            : Myisellcolors.hvit70),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin:
                            const EdgeInsets.only(top: 20, left: 15, right: 10),
                        child: Text(
                          "MC generell informasjon:",
                          style: GoogleFonts.baloo2(
                              color: Myisellcolors.hvit,
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      IsellTextField(
                        maxlines: null,
                        focusNode: FocusNode(),
                        paddingcontainer:
                            const EdgeInsets.only(left: 16, right: 16, top: 25),
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
                      Container(
                        padding:
                            const EdgeInsets.only(top: 25, left: 16, right: 16),
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
                                      'Motorsykkelen står i *',
                                      style: GoogleFonts.mandali(
                                          color: Myisellcolors.hoved,
                                          fontSize: 19),
                                    ),
                                  ),
                                  focusedErrorBorder: const OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5)),
                                      borderSide: BorderSide(
                                          color: Myisellcolors.hoved)),
                                  errorBorder: const OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5)),
                                      borderSide: BorderSide(
                                          color: Myisellcolors.hoved)),
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
                              // value: controller.bilenstari[0],

                              validator: (value) {
                                if (value == null) {
                                  return 'Hvor er motorsykkelen står parkert';
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
                              hint: const Text('Motorsykkelen står i',
                                  style: TextStyle(
                                      color: Myisellcolors.hvit70,
                                      fontSize: 14)),
                              items: controller.mcstari.map(
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
                        con: controller.mcregnummer,
                        maxlines: null,
                        focusNode: FocusNode(),
                        paddingcontainer:
                            const EdgeInsets.only(left: 16, right: 16, top: 25),
                        fontsizehinttext: 13,
                        validater: (val) {
                          return validInput(val!, 0, 100, "");
                        },
                        hinttxt: "Reg.nr/understellsnr. må fylles ut ",
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
                          margin: const EdgeInsets.symmetric(horizontal: 10),
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
                        con: controller.mcchassisnr,
                        maxlines: null,
                        focusNode: FocusNode(),
                        paddingcontainer:
                            const EdgeInsets.only(left: 16, right: 16, top: 25),
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
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            'Chassisnummer *',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.mandali(
                                color: Myisellcolors.hoved, fontSize: 19),
                          ),
                        ),
                        float: FloatingLabelBehavior.always,
                      ),
                      IsellTextField(
                        con: controller.mcmodellar,
                        maxlines: null,
                        focusNode: FocusNode(),
                        paddingcontainer:
                            const EdgeInsets.only(left: 16, right: 16, top: 25),
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
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            'Modellår',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.mandali(
                                color: Myisellcolors.hoved, fontSize: 19),
                          ),
                        ),
                        float: FloatingLabelBehavior.always,
                      ),
                      Container(
                        padding:
                            const EdgeInsets.only(top: 25, left: 16, right: 16),
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
                                  focusedErrorBorder: const OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5)),
                                      borderSide: BorderSide(
                                          color: Myisellcolors.hoved)),
                                  errorBorder: const OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5)),
                                      borderSide: BorderSide(
                                          color: Myisellcolors.hoved)),
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
                                  return 'Du må velge MC tilstand';
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
                              hint: const Text('MC tilstand *',
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
                                controller.tilstandmc.value = value as String;
                                controller.itemtistand!.text = value;
                                controller.gkMCerannonse.currentState
                                    ?.validate();
                              },
                            ),
                          ),
                        ),
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
                            controller.gkMCerannonse.currentState?.validate();
                          },
                          readOnly: true,
                          maxLines: controller.mcmerke!.text.contains(', ')
                              ? null
                              : 1,
                          controller: controller.mcmerke,
                          cursorColor: Myisellcolors.hoved,
                          onTap: () {
                            FocusScope.of(context).unfocus();
                            controller.showDropdownMCMerke(context);
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
                            hintText: "Merke",
                            hintStyle:
                                GoogleFonts.roboto(color: Myisellcolors.blak),
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
                        con: controller.mcmodell,
                        maxlines: null,
                        focusNode: FocusNode(),
                        paddingcontainer:
                            const EdgeInsets.only(left: 16, right: 16, top: 25),
                        fontsizehinttext: 13,
                        // validater: (val) {
                        //   return validInput(val!, 4, 4, "");
                        // },
                        hinttxt: controller.motorsykkeltypene == "Motorsykkel"
                            ? "Motorsykkel modell"
                            : controller.motorsykkeltypene == "Moped"
                                ? "Moped nodell"
                                : controller.motorsykkeltypene == "ATV"
                                    ? "ATV modell"
                                    : "Snøscoorter modell",
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
                            'Modell',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.mandali(
                                color: Myisellcolors.hoved, fontSize: 19),
                          ),
                        ),
                        float: FloatingLabelBehavior.always,
                      ),
                      controller.motorsykkeltypene == "Motorsykkel"
                          ? Container(
                              margin: EdgeInsets.only(
                                  left: Get.width / 25,
                                  right: Get.width / 25,
                                  top: Get.height / 37),
                              child: TextFormField(
                                // validator: (value) {
                                //   if (value == null || value.isEmpty) {
                                //     return 'Du må velge merke';
                                //   }
                                //   return null;
                                // },
                                onChanged: (value) {
                                  controller.gkMCerannonse.currentState
                                      ?.validate();
                                },
                                readOnly: true,
                                maxLines: controller.motorsykkeltype!.text
                                        .contains(', ')
                                    ? null
                                    : 1,
                                controller: controller.motorsykkeltype,
                                cursorColor: Myisellcolors.hoved,
                                onTap: () {
                                  FocusScope.of(context).unfocus();
                                  controller.showDropdownTypeMC(context);
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
                                  hintText: "Type MC",
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
                            )
                          : const SizedBox(),
                      controller.motorsykkeltypene == "Moped"
                          ? Container(
                              margin: EdgeInsets.only(
                                  left: Get.width / 25,
                                  right: Get.width / 25,
                                  top: Get.height / 37),
                              child: TextFormField(
                                // validator: (value) {
                                //   if (value == null || value.isEmpty) {
                                //     return 'Du må velge merke';
                                //   }
                                //   return null;
                                // },
                                onChanged: (value) {
                                  controller.gkMCerannonse.currentState
                                      ?.validate();
                                },
                                readOnly: true,
                                maxLines: controller.motorsykkeltype!.text
                                        .contains(', ')
                                    ? null
                                    : 1,
                                controller: controller.motorsykkeltype,
                                cursorColor: Myisellcolors.hoved,
                                onTap: () {
                                  FocusScope.of(context).unfocus();
                                  controller.showDropdownTypeMoped(context);
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
                                  hintText: "Type moped",
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
                            )
                          : const SizedBox(),
                      IsellTextField(
                        con: controller.mcslagvolumiccm,
                        maxlines: null,
                        focusNode: FocusNode(),
                        paddingcontainer:
                            const EdgeInsets.only(left: 16, right: 16, top: 25),
                        fontsizehinttext: 13,
                        // validater: (val) {
                        //   return validInput(val!, 4, 4, "");
                        // },
                        hinttxt: "Slagvolum i ccm",
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
                            'Slagvolum',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.mandali(
                                color: Myisellcolors.hoved, fontSize: 19),
                          ),
                        ),
                        float: FloatingLabelBehavior.always,
                      ),
                      IsellTextField(
                        con: controller.mchk,
                        maxlines: null,
                        focusNode: FocusNode(),
                        paddingcontainer:
                            const EdgeInsets.only(left: 16, right: 16, top: 25),
                        fontsizehinttext: 13,
                        // validater: (val) {
                        //   return validInput(val!, 4, 4, "");
                        // },
                        hinttxt: "Antall hestekrefter",
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
                            'Hestekrefter',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.mandali(
                                color: Myisellcolors.hoved, fontSize: 19),
                          ),
                        ),
                        float: FloatingLabelBehavior.always,
                      ),
                      Container(
                        padding:
                            const EdgeInsets.only(top: 25, left: 16, right: 16),
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
                                  focusedErrorBorder: const OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5)),
                                      borderSide: BorderSide(
                                          color: Myisellcolors.hoved)),
                                  errorBorder: const OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5)),
                                      borderSide: BorderSide(
                                          color: Myisellcolors.hoved)),
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
                              // validator: (value) {
                              //   if (value == null) {
                              //     return 'Du må velge MC tilstand';
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
                              hint: const Text('Drivstoff',
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
                                controller.mcdrivstoffet.value =
                                    value as String;
                                controller.mcdrivstoff!.text = value;
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  IsellTextField(
                    con: controller.mcvektkg,
                    maxlines: null,
                    focusNode: FocusNode(),
                    paddingcontainer:
                        const EdgeInsets.only(left: 16, right: 16, top: 25),
                    fontsizehinttext: 13,
                    // validater: (val) {
                    //   return validInput(val!, 4, 4, "");
                    // },
                    hinttxt: "Motorsykkelens vekt i kg",
                    hinttxtcolor: Myisellcolors.hvit70,
                    contentpadding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
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
                        'Vekt i kg',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.mandali(
                            color: Myisellcolors.hoved, fontSize: 19),
                      ),
                    ),
                    float: FloatingLabelBehavior.always,
                  ),
                  IsellTextField(
                    con: controller.mcfarge,
                    maxlines: null,
                    focusNode: FocusNode(),
                    paddingcontainer:
                        const EdgeInsets.only(left: 16, right: 16, top: 25),
                    fontsizehinttext: 13,
                    // validater: (val) {
                    //   return validInput(val!, 4, 4, "");
                    // },
                    hinttxt: "Motorsykkelens farge. F.eks. svart, hvit...",
                    hinttxtcolor: Myisellcolors.hvit70,
                    contentpadding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
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
                        'Hovedfarge',
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
                          controller.mcutstyr!.text.contains(', ') ? null : 1,
                      readOnly: true,
                      controller: controller.mcutstyr,
                      cursorColor: Myisellcolors.hoved,
                      onTap: () {
                        FocusScope.of(context).unfocus();
                        controller.showDropdownMCutstyr(context);
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
                        hintStyle:
                            GoogleFonts.roboto(color: Myisellcolors.blak),
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
                    con: controller.mckilometerstand,
                    maxlines: null,
                    focusNode: FocusNode(),
                    paddingcontainer:
                        const EdgeInsets.only(left: 16, right: 16, top: 25),
                    fontsizehinttext: 13,
                    // validater: (val) {
                    //   return validInput(val!, 4, 4, "");
                    // },
                    hinttxt: "Kilometerstand i km",
                    hinttxtcolor: Myisellcolors.hvit70,
                    contentpadding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
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
                        'Kilometerstand',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.mandali(
                            color: Myisellcolors.hoved, fontSize: 19),
                      ),
                    ),
                    float: FloatingLabelBehavior.always,
                  ),
                  IsellTextField(
                    con: controller.mcantalleiere,
                    maxlines: null,
                    focusNode: FocusNode(),
                    paddingcontainer:
                        const EdgeInsets.only(left: 16, right: 16, top: 25),
                    fontsizehinttext: 13,
                    // validater: (val) {
                    //   return validInput(val!, 4, 4, "");
                    // },
                    hinttxt: "Antall MC eiere ",
                    hinttxtcolor: Myisellcolors.hvit70,
                    contentpadding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
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
                        'Antall eiere',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.mandali(
                            color: Myisellcolors.hoved, fontSize: 19),
                      ),
                    ),
                    float: FloatingLabelBehavior.always,
                  ),
                  Container(
                    padding:
                        const EdgeInsets.only(top: 25, left: 16, right: 16),
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
                                  'Tilstandsrapport',
                                  style: GoogleFonts.mandali(
                                      color: Myisellcolors.hoved, fontSize: 19),
                                ),
                              ),
                              floatingLabelBehavior: FloatingLabelBehavior.auto,
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
                          hint: const Text('Kjøretøyet har tilstandsrapport?',
                              style: TextStyle(
                                  color: Myisellcolors.hvit70, fontSize: 14)),
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
                            controller.mctilstandsrappoet!.text = value;
                          },
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin:
                        const EdgeInsets.only(top: 6, left: 16.5, right: 12),
                    child: Text(
                      "Tilstandsrapporten tar for seg alle de viktige punktene som er nødvendige for å gi et riktig bilde av motorsykkelens tilstand",
                      style: GoogleFonts.roboto(
                          color: Myisellcolors.hvit70, fontSize: 12),
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.only(top: 25, left: 16, right: 16),
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
                                  'Vedlikeholdsprogram',
                                  style: GoogleFonts.mandali(
                                      color: Myisellcolors.hoved, fontSize: 19),
                                ),
                              ),
                              floatingLabelBehavior: FloatingLabelBehavior.auto,
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
                          icon: const Icon(
                            Icons.keyboard_arrow_down_sharp,
                            size: (28),
                            color: Myisellcolors.hoved,
                          ),
                          hint: const Text('Fulgt bobilen Vedlikeholdsprogram',
                              style: TextStyle(
                                  color: Myisellcolors.hvit70, fontSize: 13)),
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
                            controller.bilvedlikeholdsprogram.value =
                                value as String;
                            controller.mcvelikeholdsprogram!.text = value;
                            //controller.gkBilerannonse.currentState?.validate();
                          },
                        ),
                      ),
                    ),
                  ),
                  IsellTextField(
                    con: controller.mcgjenvarendegarantimnd,
                    maxlines: null,
                    focusNode: FocusNode(),
                    paddingcontainer:
                        const EdgeInsets.only(left: 16, right: 16, top: 25),
                    fontsizehinttext: 13,
                    // validater: (val) {
                    //   return validInput(val!, 4, 4, "");
                    // },
                    hinttxt: "Gjenværende garanti i måneder",
                    hinttxtcolor: Myisellcolors.hvit70,
                    contentpadding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
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
                        'Gjenværende garanti i måneder',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.mandali(
                            color: Myisellcolors.hoved, fontSize: 19),
                      ),
                    ),
                    float: FloatingLabelBehavior.always,
                  ),
                  IsellTextField(
                    con: controller.mcgjenvarendegarantikm,
                    maxlines: null,
                    focusNode: FocusNode(),
                    paddingcontainer:
                        const EdgeInsets.only(left: 16, right: 16, top: 25),
                    fontsizehinttext: 13,
                    // validater: (val) {
                    //   return validInput(val!, 4, 4, "");
                    // },
                    hinttxt: "Gjenværende garanti i km",
                    hinttxtcolor: Myisellcolors.hvit70,
                    contentpadding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
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
                        'Gjenværende garanti i km',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.mandali(
                            color: Myisellcolors.hoved, fontSize: 19),
                      ),
                    ),
                    float: FloatingLabelBehavior.always,
                  ),
                  IsellTextField(
                    con: controller.mcvideo,
                    maxlines: null,
                    focusNode: FocusNode(),
                    paddingcontainer:
                        const EdgeInsets.only(left: 16, right: 16, top: 25),
                    fontsizehinttext: 13,
                    // validater: (val) {
                    //   return validInput(val!, 0, 200, "");
                    // },
                    hinttxt: "Link til video på YouTube for eksampel",
                    hinttxtcolor: Myisellcolors.hvit70,
                    contentpadding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
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
                        'Video URL',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.mandali(
                            color: Myisellcolors.hoved, fontSize: 19),
                      ),
                    ),
                    float: FloatingLabelBehavior.always,
                  ),
                  IsellTextField(
                    con: controller.mcbeskrivelse,
                    maxlines: null,
                    focusNode: FocusNode(),
                    paddingcontainer:
                        const EdgeInsets.only(left: 16, right: 16, top: 25),
                    fontsizehinttext: 14.5,
                    // validater: (val) {
                    //   return validInput(val!, 0, 200, "");
                    // },
                    hinttxt: controller.motorsykkeltypene == "Motorsykkel"
                        ? "Skriv en beskrivelse av motorsykkelen"
                        : controller.motorsykkeltypene == "Moped"
                            ? "Skriv en beskrivelse av mopeden"
                            : controller.motorsykkeltypene == "ATV"
                                ? "Skriv en beskrivelse av ATV-en"
                                : "Skriv en beskrivelse av Snøscoorteren",
                    hinttxtcolor: Myisellcolors.hvit70,
                    contentpadding: const EdgeInsets.fromLTRB(30, 40, 30, 40),
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
                        'Bilbeskrivelse',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.mandali(
                            color: Myisellcolors.hoved, fontSize: 19),
                      ),
                    ),
                    float: FloatingLabelBehavior.always,
                  ),
                  controller.annonsetype == "Selge"
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.only(
                                  top: 25, left: 16, right: 16),
                              child: DropdownButtonHideUnderline(
                                child: ButtonTheme(
                                  alignedDropdown: true,
                                  child: DropdownButtonFormField(
                                    enableFeedback: true,
                                    dropdownColor: Myisellcolors.appbar,
                                    decoration: InputDecoration(
                                        label: Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: Text(
                                            'Fritak fra omreg.',
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
                                    //     return 'Du må velge drivstoff type';
                                    //   } else {
                                    //     return null;
                                    //   }
                                    // },
                                    // onSaved: (newValue) {
                                    //   controller.fritakfracaromreg!
                                    //           .text ==
                                    //       newValue;
                                    // },
                                    icon: const Icon(
                                      Icons.keyboard_arrow_down_sharp,
                                      size: (28),
                                      color: Myisellcolors.hoved,
                                    ),
                                    hint: const Text(
                                        'Fritak fra omregistreringsavgit?',
                                        style: TextStyle(
                                            color: Myisellcolors.hvit70,
                                            fontSize: 14)),
                                    items: controller.fritak.map(
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
                                      controller.onChangedCaromregFritak(value);
                                      if (controller.mcomregfritak!.text ==
                                          "Ja") {
                                        controller.mcomregavgift!.text = "";
                                        controller.updateTotalPrice();
                                        controller.updateUI();
                                      }
                                    },
                                  ),
                                ),
                              ),
                            ),
                            controller.mcomregfritak!.text == "Nei"
                                ? Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      IsellTextField(
                                        con: controller.mcomregavgift,
                                        maxlines: null,
                                        focusNode: FocusNode(),
                                        paddingcontainer: const EdgeInsets.only(
                                            left: 16, right: 16, top: 25),
                                        fontsizehinttext: 13,
                                        validater: (val) {
                                          return validInput(val!, 0, 50, "");
                                        },
                                        onchanged: (p0) {
                                          controller.updateTotalPrice();
                                          controller.updateUI();
                                        },
                                        hinttxt:
                                            "Hva er omregistreringsavgit i kr",
                                        hinttxtcolor: Myisellcolors.hvit70,
                                        contentpadding:
                                            const EdgeInsets.fromLTRB(
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
                                            'Omregistreringsavgit',
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
                                          "Som selger er du ansvarlig for at omregistreringsavgiten er riktig",
                                          style: GoogleFonts.roboto(
                                              color: Myisellcolors.hvit70,
                                              fontSize: 12),
                                        ),
                                      ),
                                    ],
                                  )
                                : const SizedBox(),
                            IsellTextField(
                              con: controller.pris,
                              maxlines: null,
                              focusNode: FocusNode(),
                              paddingcontainer: const EdgeInsets.only(
                                  left: 16, right: 16, top: 25),
                              fontsizehinttext: 13,
                              validater: (val) {
                                return validInput(val!, 0, 50, "");
                              },
                              hinttxt: "Salgspris - eks. omregistrering",
                              hinttxtcolor: Myisellcolors.hvit70,
                              contentpadding:
                                  const EdgeInsets.fromLTRB(30, 20, 30, 20),
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
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  'Salgspris',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.mandali(
                                      color: Myisellcolors.hoved, fontSize: 19),
                                ),
                              ),
                              float: FloatingLabelBehavior.always,
                            ),
                            Obx(
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
                            ),
                          ],
                        )
                      : const SizedBox(),
                  controller.annonsetype == "Leie ut"
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(
                                  top: 20, left: 15, right: 10),
                              child: Text(
                                "Leie og pris informasjon:",
                                style: GoogleFonts.baloo2(
                                    color: Myisellcolors.hvit, fontSize: 18),
                              ),
                            ),
                            IsellTextField(
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
                                  'Startleie *',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.mandali(
                                      color: Myisellcolors.hoved, fontSize: 19),
                                ),
                              ),
                              float: FloatingLabelBehavior.always,
                            ),
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
                          ],
                        )
                      : const SizedBox(),
                  Container(
                    margin: const EdgeInsets.only(top: 20, left: 15, right: 10),
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
                    paddingcontainer:
                        const EdgeInsets.only(left: 16, right: 16, top: 25),
                    fontsizehinttext: 14.5,
                    validater: (val) {
                      return validInput(val!, 0, 20, "");
                    },
                    hinttxt: "F.eks. Norge",
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
                              'Postnr. *',
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
                          paddingcontainer: const EdgeInsets.only(
                              left: 6, right: 16, top: 25),
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
                              'Poststed *',
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
                    fontsizehinttext: 14.5,
                    // validater: (val) {
                    //   return validInput(val!, 0, 200, "");
                    // },
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
                    fontsizehinttext: 13,
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
                  IsellTextField(
                    con: controller.itemselger,
                    maxlines: null,
                    focusNode: FocusNode(),
                    paddingcontainer:
                        const EdgeInsets.only(left: 16, right: 16, top: 25),
                    fontsizehinttext: 13,
                    validater: (val) {},
                    hinttxt: "Navnet til selskapet",
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
                    paddingcontainer:
                        const EdgeInsets.only(left: 16, right: 16, top: 25),
                    fontsizehinttext: 12,
                    validater: (val) {},
                    hinttxt:
                        "Navnet til kontakt person angående sp. om kjøretøyet",
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
                        'Kontaktperson',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.mandali(
                            color: Myisellcolors.hoved, fontSize: 19),
                      ),
                    ),
                    float: FloatingLabelBehavior.always,
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 20, bottom: 10),
                    child: IsellButtons(
                        size: Size(Get.width / 1.079, Get.height / 16),
                        name: "Legg til ny annonse",
                        onPresset: () {
                          if (controller.gkMCerannonse.currentState!
                              .validate()) {
                            controller.addMCAnnonseData();
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
            ),
          ),
        ),
      ),
    );
  }
}
