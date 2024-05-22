import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_isell_new/controller/add_items/property_items_controller.dart';
import 'package:flutter_isell_new/core/classes/handling_data_view.dart';
import 'package:flutter_isell_new/core/constants/sellx_colors.dart';
import 'package:flutter_isell_new/core/functions/upload_file.dart';
import 'package:flutter_isell_new/core/functions/validate_input.dart';
import 'package:flutter_isell_new/views/screens/home/navbar.dart';
import 'package:flutter_isell_new/views/widget/sellx_%20buttons.dart';
import 'package:flutter_isell_new/views/widget/sellx_text_filed.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class EiendomAnnonse extends StatelessWidget {
  const EiendomAnnonse({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> boligtype = [
      "Enebolig",
      "Leilighet",
      "Rekkehus",
      "Tomannsbolig",
      "Garasje/Parkering",
      "Gårdsbruk/Småbruk",
      "Andre"
    ];
    List<String> leietype = [
      "Enebolig",
      "Leilighet",
      "Rekkehus",
      "Tomannsbolig",
      "Garasje/Parkering",
      "Gårdsbruk/Småbruk",
      "Hybel",
      "Rom i bofelleskap",
      "Andre"
    ];
    List<String> eieformen = [
      "Aksje",
      "Andel",
      "Eier (Selveier)",
      "Obligasjon",
      "Andre",
    ];
    List<String> energikarakter = ["A", "B", "C", "D", "E", "F", "G"];
    List<String> oppvarmingskarakter = [
      "Gul",
      "Lysegrønn",
      "Mørkegrønn",
      "Oransje",
      "Rød"
    ];
    List<String> moblering = [
      "Delvis møblert",
      "Møblert",
      "Umøblert",
    ];
    List<String> dyr = [
      "Ja",
      "Nei",
    ];

    AddBoligAnnonseController controller = Get.put(AddBoligAnnonseController());
    controller.VelgAnnonseType(controller.annonsetype!);

    return Form(
      key: controller.gkBoligannonse,
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
              "Eiendom",
              style:
                  GoogleFonts.baloo2(fontSize: 20, color: Myisellcolors.hvit),
            ),
          ),
        ),
        endDrawer: const NavBar(),
        body: GetBuilder<AddBoligAnnonseController>(
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
                        border:
                            Border.all(color: Myisellcolors.hoved, width: 0.4),
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
                  margin: const EdgeInsets.only(top: 30, left: 15, right: 10),
                  child: Text(
                    "Fyll ut feltene nedover med det som passer med din annonse. Felt markert med * er obligatoriske.",
                    style: GoogleFonts.baloo2(
                        color: Myisellcolors.hvit, fontSize: 18),
                  ),
                ),
                controller.annonsetype == "Selge"
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(
                                top: 20, left: 15, right: 10),
                            child: Text(
                              "Eiendommens generell informasjon:",
                              style: GoogleFonts.baloo2(
                                  color: Myisellcolors.hvit, fontSize: 18),
                            ),
                          ),
                          IsellTextField(
                            maxlines: null,
                            focusNode: FocusNode(),
                            paddingcontainer: const EdgeInsets.only(
                                left: 16, right: 16, top: 25),
                            fontsizehinttext: 13,
                            validater: (val) {
                              return validInput(val!, 0, 1000, "");
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
                          IsellTextField(
                            con: controller.boligadkomst,
                            maxlines: null,
                            focusNode: FocusNode(),
                            paddingcontainer: const EdgeInsets.only(
                                left: 16, right: 16, top: 25),
                            fontsizehinttext: 13,
                            // validater: (val) {
                            //   return validInput(val!, 0, 1000000, "");
                            // },
                            hinttxt: "Forklar kort om adkomsten til eiendommen",
                            hinttxtcolor: Myisellcolors.hvit70,
                            contentpadding:
                                const EdgeInsets.fromLTRB(30, 20, 30, 50),
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
                                'Adkomst',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.mandali(
                                    color: Myisellcolors.hoved, fontSize: 19),
                              ),
                            ),
                            float: FloatingLabelBehavior.always,
                          ),
                          IsellTextField(
                            con: controller.boligbeliggenhet,
                            maxlines: null,
                            focusNode: FocusNode(),
                            paddingcontainer: const EdgeInsets.only(
                                left: 16, right: 16, top: 25),
                            fontsizehinttext: 13,
                            validater: (val) {
                              //return validInput(val!, 0, 10000000, "");
                            },
                            hinttxt:
                                "Beskriv kort beliggenheten til eiendommen",
                            hinttxtcolor: Myisellcolors.hvit70,
                            contentpadding:
                                const EdgeInsets.fromLTRB(30, 20, 30, 50),
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
                                'Beliggenheten',
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
                                  validator: (value) {
                                    if (value == null) {
                                      return 'Du må velge eiendomstype';
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
                                  hint: const Text('Eiendomstype *',
                                      style: TextStyle(
                                          color: Myisellcolors.hvit70,
                                          fontSize: 15)),
                                  items: boligtype.map(
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
                                    controller.selectedland.value =
                                        value as String;
                                    controller.boligtype!.text = value;
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
                                  validator: (value) {
                                    if (value == null) {
                                      return 'Du må velge eieformen';
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
                                  hint: const Text('Eieform *',
                                      style: TextStyle(
                                          color: Myisellcolors.hvit70,
                                          fontSize: 15)),
                                  items: eieformen.map(
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
                                    controller.eieform.value = value as String;
                                    controller.boligeieform!.text = value;
                                  },
                                ),
                              ),
                            ),
                          ),

                          //////////////////////////////////////////////////////////////////////////////////////////////
                          Container(
                            margin: EdgeInsets.only(
                                left: Get.width / 25,
                                right: Get.width / 25,
                                top: Get.height / 37),
                            child: TextFormField(
                              maxLines: controller.boligfasiliteter!.text
                                      .contains(', ')
                                  ? null
                                  : 1,
                              readOnly: true,
                              controller: controller.boligfasiliteter,
                              cursorColor: Myisellcolors.hoved,
                              onTap: () {
                                FocusScope.of(context).unfocus();
                                controller.showDropdown(context);
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
                                hintText: "Fasiliteter",
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
                              "Adresse informasjon:",
                              style: GoogleFonts.baloo2(
                                  color: Myisellcolors.hvit, fontSize: 18),
                            ),
                          ),
                          IsellTextField(
                            con: controller.boliglokalomrade,
                            maxlines: null,
                            focusNode: FocusNode(),
                            paddingcontainer: const EdgeInsets.only(
                                left: 16, right: 16, top: 25),
                            fontsizehinttext: 14.5,
                            // validater: (val) {
                            //   return validInput(val!, 0, 50, "");
                            // },
                            hinttxt: "F.eks. Solheim eller Bjerke",
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
                                'Navn på lokalområde',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.mandali(
                                    color: Myisellcolors.hoved, fontSize: 19),
                              ),
                            ),
                            float: FloatingLabelBehavior.always,
                          ),
                          IsellTextField(
                            con: controller.boligkommunenr,
                            maxlines: null,
                            focusNode: FocusNode(),
                            paddingcontainer: const EdgeInsets.only(
                                left: 16, right: 16, top: 25),
                            fontsizehinttext: 13,
                            validater: (val) {
                              return validInput(val!, 0, 50, "");
                            },
                            hinttxt: "Identifikasjonsnummeret til din kommune",
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
                                'Kommunenummer *',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.mandali(
                                    color: Myisellcolors.hoved, fontSize: 19),
                              ),
                            ),
                            float: FloatingLabelBehavior.always,
                          ),
                          IsellTextField(
                            con: controller.boliggarsnummer,
                            maxlines: null,
                            focusNode: FocusNode(),
                            paddingcontainer: const EdgeInsets.only(
                                left: 16, right: 16, top: 25),
                            fontsizehinttext: 13,
                            validater: (val) {
                              return validInput(val!, 0, 50, "");
                            },
                            hinttxt: "Nummeret på gårdsenheten",
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
                                'Gårdsnummer *',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.mandali(
                                    color: Myisellcolors.hoved, fontSize: 19),
                              ),
                            ),
                            float: FloatingLabelBehavior.always,
                          ),
                          IsellTextField(
                            con: controller.boligbruksnummer,
                            maxlines: null,
                            focusNode: FocusNode(),
                            paddingcontainer: const EdgeInsets.only(
                                left: 16, right: 16, top: 25),
                            fontsizehinttext: 13,
                            validater: (val) {
                              return validInput(val!, 0, 50, "");
                            },
                            hinttxt:
                                "Hvert gårdsnummer er delt inn i bruksnummer",
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
                                'Bruksnummer *',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.mandali(
                                    color: Myisellcolors.hoved, fontSize: 19),
                              ),
                            ),
                            float: FloatingLabelBehavior.always,
                          ),
                          IsellTextField(
                            con: controller.boligseksjonsnr,
                            maxlines: null,
                            focusNode: FocusNode(),
                            paddingcontainer: const EdgeInsets.only(
                                left: 16, right: 16, top: 25),
                            fontsizehinttext: 10.5,
                            // validater: (val) {
                            //   return validInput(val!, 0, 50, "");
                            // },
                            hinttxt:
                                "Seksjonsnummer får man tildelt når eiendommen seksjoneres",
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
                                'Seksjonsnummer',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.mandali(
                                    color: Myisellcolors.hoved, fontSize: 19),
                              ),
                            ),
                            float: FloatingLabelBehavior.always,
                          ),
                          IsellTextField(
                            con: controller.boligfestenummer,
                            maxlines: null,
                            focusNode: FocusNode(),
                            paddingcontainer: const EdgeInsets.only(
                                left: 16, right: 16, top: 25),
                            fontsizehinttext: 10.6,
                            // validater: (val) {
                            //   return validInput(val!, 0, 50, "");
                            // },
                            hinttxt:
                                "Brukes når bruksnummer skal deles inn i flere grunneiendeler",
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
                                'Festenummer',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.mandali(
                                    color: Myisellcolors.hoved, fontSize: 19),
                              ),
                            ),
                            float: FloatingLabelBehavior.always,
                          ),
                          IsellTextField(
                            con: controller.leilighetsnummer,
                            maxlines: null,
                            focusNode: FocusNode(),
                            paddingcontainer: const EdgeInsets.only(
                                left: 16, right: 16, top: 25),
                            fontsizehinttext: 12,
                            // validater: (val) {
                            //   return validInput(val!, 0, 50, "");
                            // },
                            hinttxt:
                                "Leiglighetsnummer består av H, L, U eller K og fire tall",
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
                                'Leilighetsnummer',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.mandali(
                                    color: Myisellcolors.hoved, fontSize: 19),
                              ),
                            ),
                            float: FloatingLabelBehavior.always,
                          ),
                          IsellTextField(
                            con: controller.land,
                            maxlines: null,
                            focusNode: FocusNode(),
                            paddingcontainer: const EdgeInsets.only(
                                left: 16, right: 16, top: 25),
                            fontsizehinttext: 14.5,
                            validater: (val) {
                              return validInput(val!, 0, 50, "");
                            },
                            hinttxt: "Eks. Norge",
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
                          Container(
                            margin: const EdgeInsets.only(
                                top: 20, left: 15, right: 10),
                            child: Text(
                              "Areal informasjon:",
                              style: GoogleFonts.baloo2(
                                  color: Myisellcolors.hvit, fontSize: 18),
                            ),
                          ),
                          IsellTextField(
                            con: controller.boligbruksareal,
                            maxlines: null,
                            focusNode: FocusNode(),
                            paddingcontainer: const EdgeInsets.only(
                                left: 16, right: 16, top: 25),
                            fontsizehinttext: 11,
                            validater: (val) {
                              return validInput(val!, 0, 200, "");
                            },
                            hinttxt:
                                "Bruksareal er bruttoareal minus den plassen ytrevegger tar",
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
                                'Bruksareal *',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.mandali(
                                    color: Myisellcolors.hoved, fontSize: 19),
                              ),
                            ),
                            float: FloatingLabelBehavior.always,
                          ),
                          IsellTextField(
                            con: controller.primaarrom,
                            maxlines: null,
                            focusNode: FocusNode(),
                            paddingcontainer: const EdgeInsets.only(
                                left: 16, right: 16, top: 25),
                            fontsizehinttext: 13,
                            // validater: (val) {
                            //   return validInput(val!, 0, 200, "");
                            // },
                            hinttxt: "Arealet av primærrom på eiendommen",
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
                                'Primærrom',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.mandali(
                                    color: Myisellcolors.hoved, fontSize: 19),
                              ),
                            ),
                            float: FloatingLabelBehavior.always,
                          ),
                          IsellTextField(
                            con: controller.flateareal,
                            maxlines: null,
                            focusNode: FocusNode(),
                            paddingcontainer: const EdgeInsets.only(
                                left: 16, right: 16, top: 25),
                            fontsizehinttext: 13,
                            // validater: (val) {
                            //   return validInput(val!, 0, 200, "");
                            // },
                            hinttxt:
                                "Det arealet som bygningen dekker på tomten",
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
                                'Flateareal',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.mandali(
                                    color: Myisellcolors.hoved, fontSize: 19),
                              ),
                            ),
                            float: FloatingLabelBehavior.always,
                          ),
                          IsellTextField(
                            con: controller.tomtareal,
                            maxlines: null,
                            focusNode: FocusNode(),
                            paddingcontainer: const EdgeInsets.only(
                                left: 16, right: 16, top: 25),
                            fontsizehinttext: 13,
                            // validater: (val) {
                            //   return validInput(val!, 0, 200, "");
                            // },
                            hinttxt: "m\u00b2",
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
                                'Tomtareal',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.mandali(
                                    color: Myisellcolors.hoved, fontSize: 19),
                              ),
                            ),
                            float: FloatingLabelBehavior.always,
                          ),
                          IsellTextField(
                            con: controller.boligarealbeskribelse,
                            maxlines: null,
                            focusNode: FocusNode(),
                            paddingcontainer: const EdgeInsets.only(
                                left: 16, right: 16, top: 25),
                            fontsizehinttext: 14.5,
                            // validater: (val) {
                            //   return validInput(val!, 0, 1000000, "");
                            // },
                            hinttxt:
                                "F.eks. stue 34 m\u00b2, kjøkken m\u00b2, grunnflate m\u00b2 \nosv",
                            hinttxtcolor: Myisellcolors.hvit70,
                            contentpadding:
                                const EdgeInsets.fromLTRB(30, 20, 30, 50),
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
                                'Arealbeskrivelse',
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
                              "Spesifikke informasjon",
                              style: GoogleFonts.baloo2(
                                  color: Myisellcolors.hvit, fontSize: 18),
                            ),
                          ),
                          IsellTextField(
                            con: controller.boligbyggar,
                            maxlines: null,
                            focusNode: FocusNode(),
                            paddingcontainer: const EdgeInsets.only(
                                left: 16, right: 16, top: 25),
                            fontsizehinttext: 14.5,
                            validater: (val) {
                              return validInput(val!, 0, 1000000, "");
                            },
                            hinttxt: "Året eiendommen ble bygget på",
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
                                'Byggeår *',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.mandali(
                                    color: Myisellcolors.hoved, fontSize: 19),
                              ),
                            ),
                            float: FloatingLabelBehavior.always,
                          ),
                          IsellTextField(
                            con: controller.boligrenovertar,
                            maxlines: null,
                            focusNode: FocusNode(),
                            paddingcontainer: const EdgeInsets.only(
                                left: 16, right: 16, top: 25),
                            fontsizehinttext: 14.5,
                            validater: (val) {},
                            hinttxt: "Året eiendommen ble renovert på",
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
                                'Renovert år',
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
                                  // validator: (value) {
                                  //   if (value == null) {
                                  //     return 'Du må velge energikarakter';
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
                                  hint: const Text('Energikarakter',
                                      style: TextStyle(
                                          color: Myisellcolors.hvit70)),
                                  items: energikarakter.map(
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
                                    controller.energikarakter.value =
                                        value as String;
                                    controller.boligenergikarakter!.text =
                                        value;
                                  },
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(
                                top: 7, left: 17, right: 10),
                            child: Text(
                              "Energikarakter går fra A til G, hvor A er best. Karakteren er basert på beregnet levert energi til boligen. En god energikarakter betyr at boligen er energieffektiv.",
                              style: GoogleFonts.baloo2(
                                  color: Myisellcolors.hvit, fontSize: 13),
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
                                  // validator: (value) {
                                  //   if (value == null) {
                                  //     return 'Du må velge oppvarmingskarakteren';
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
                                  hint: const Text('Oppvarmingskarakter',
                                      style: TextStyle(
                                          color: Myisellcolors.hvit70)),
                                  items: oppvarmingskarakter.map(
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
                                    controller.oppvarmingskarakter.value =
                                        value as String;
                                    controller.boligoppvarmingskarakter!.text =
                                        value;
                                  },
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(
                                top: 7, left: 17, right: 10),
                            child: Text(
                              "Oppvarmingskarakteren forteller om hvor stor andel av boligens oppvarming som gjøres med fossilt brensel og strøm. F.eks. blir karakteren mørkegrønn når andelen er under 30%, mens den blir rød når andelen er over 82,5%.",
                              style: GoogleFonts.baloo2(
                                  color: Myisellcolors.hvit, fontSize: 13),
                            ),
                          ),
                          IsellTextField(
                            con: controller.antallsoverom,
                            maxlines: null,
                            focusNode: FocusNode(),
                            paddingcontainer: const EdgeInsets.only(
                                left: 16, right: 16, top: 25),
                            fontsizehinttext: 14.5,
                            validater: (val) {
                              return validInput(val!, 0, 10, "");
                            },
                            hinttxt: "Antall soverom",
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
                                'Soverom *',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.mandali(
                                    color: Myisellcolors.hoved, fontSize: 19),
                              ),
                            ),
                            float: FloatingLabelBehavior.always,
                          ),
                          IsellTextField(
                            con: controller.antallstuer,
                            maxlines: null,
                            focusNode: FocusNode(),
                            paddingcontainer: const EdgeInsets.only(
                                left: 16, right: 16, top: 25),
                            fontsizehinttext: 14.5,
                            // validater: (val) {
                            //   return validInput(val!, 0, 10, "");
                            // },
                            hinttxt: "Antall stuer",
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
                                'Stuer',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.mandali(
                                    color: Myisellcolors.hoved, fontSize: 19),
                              ),
                            ),
                            float: FloatingLabelBehavior.always,
                          ),
                          IsellTextField(
                            con: controller.antallrom,
                            maxlines: null,
                            focusNode: FocusNode(),
                            paddingcontainer: const EdgeInsets.only(
                                left: 16, right: 16, top: 25),
                            fontsizehinttext: 13,
                            validater: (val) {},
                            hinttxt: "Antall rom totalt",
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
                                'Antall rom',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.mandali(
                                    color: Myisellcolors.hoved, fontSize: 19),
                              ),
                            ),
                            float: FloatingLabelBehavior.always,
                          ),
                          IsellTextField(
                            con: controller.boligetasje,
                            maxlines: null,
                            focusNode: FocusNode(),
                            paddingcontainer: const EdgeInsets.only(
                                left: 16, right: 16, top: 25),
                            fontsizehinttext: 14.5,
                            validater: (val) {},
                            hinttxt: "I hvilken etasje ligger boligen",
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
                                'Etasje',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.mandali(
                                    color: Myisellcolors.hoved, fontSize: 19),
                              ),
                            ),
                            float: FloatingLabelBehavior.always,
                          ),
                          IsellTextField(
                            con: controller.totaletasje,
                            maxlines: null,
                            focusNode: FocusNode(),
                            paddingcontainer: const EdgeInsets.only(
                                left: 16, right: 16, top: 25),
                            fontsizehinttext: 13,
                            validater: (val) {},
                            hinttxt:
                                "Totale antall etasjer i boligen/bygningen",
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
                                'Antall etasjer',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.mandali(
                                    color: Myisellcolors.hoved, fontSize: 19),
                              ),
                            ),
                            float: FloatingLabelBehavior.always,
                          ),
                          IsellTextField(
                            con: controller.borettslagetsnavn,
                            maxlines: null,
                            focusNode: FocusNode(),
                            paddingcontainer: const EdgeInsets.only(
                                left: 16, right: 16, top: 25),
                            fontsizehinttext: 13,
                            validater: (val) {},
                            hinttxt: "Borettslagets navn",
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
                                'Borettslagets navn',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.mandali(
                                    color: Myisellcolors.hoved, fontSize: 19),
                              ),
                            ),
                            float: FloatingLabelBehavior.always,
                          ),
                          IsellTextField(
                            con: controller.borettslagetseier,
                            maxlines: null,
                            focusNode: FocusNode(),
                            paddingcontainer: const EdgeInsets.only(
                                left: 16, right: 16, top: 25),
                            fontsizehinttext: 13,
                            validater: (val) {},
                            hinttxt: "Borettslagets eier",
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
                                'Borettslagets eier',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.mandali(
                                    color: Myisellcolors.hoved, fontSize: 19),
                              ),
                            ),
                            float: FloatingLabelBehavior.always,
                          ),
                          IsellTextField(
                            con: controller.borettslagetsorgnr,
                            maxlines: null,
                            focusNode: FocusNode(),
                            paddingcontainer: const EdgeInsets.only(
                                left: 16, right: 16, top: 25),
                            fontsizehinttext: 13,
                            validater: (val) {},
                            hinttxt: "Du finner det på Brønnøysundregistrene",
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
                                'Borettslagets org.nummer',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.mandali(
                                    color: Myisellcolors.hoved, fontSize: 19),
                              ),
                            ),
                            float: FloatingLabelBehavior.always,
                          ),
                          IsellTextField(
                            con: controller.borettslagetsandelnr,
                            maxlines: null,
                            focusNode: FocusNode(),
                            paddingcontainer: const EdgeInsets.only(
                                left: 16, right: 16, top: 25),
                            fontsizehinttext: 13,
                            validater: (val) {},
                            hinttxt: "Borettslagets andelsnummer",
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
                                'Borettslagets andelsnummer',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.mandali(
                                    color: Myisellcolors.hoved, fontSize: 19),
                              ),
                            ),
                            float: FloatingLabelBehavior.always,
                          ),
                          Container(
                            margin: const EdgeInsets.only(
                                top: 7, left: 17, right: 10),
                            child: Text(
                              "Dette er det tinglyste nummeret for din seksjon (leilighet). Dette nummeret oppgis gjerne sammen med gårds- og bruksnummer for å identifisere en seksjon i en boligblokk. Du kan finne ditt andelsnummer på kartverkets hjemmesider.",
                              style: GoogleFonts.baloo2(
                                  color: Myisellcolors.hvit, fontSize: 13),
                            ),
                          ),
                          IsellTextField(
                            con: controller.festeaar,
                            maxlines: null,
                            focusNode: FocusNode(),
                            paddingcontainer: const EdgeInsets.only(
                                left: 16, right: 16, top: 25),
                            fontsizehinttext: 13,
                            validater: (val) {},
                            hinttxt:
                                "Neste årstall for regulering av festeavgiften",
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
                                'Festeår',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.mandali(
                                    color: Myisellcolors.hoved, fontSize: 19),
                              ),
                            ),
                            float: FloatingLabelBehavior.always,
                          ),
                          IsellTextField(
                            con: controller.festeavgift,
                            maxlines: null,
                            focusNode: FocusNode(),
                            paddingcontainer: const EdgeInsets.only(
                                left: 16, right: 16, top: 25),
                            fontsizehinttext: 13,
                            validater: (val) {},
                            hinttxt: "Hva er dagens festeavgift for tometen",
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
                                'Festeavgift',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.mandali(
                                    color: Myisellcolors.hoved, fontSize: 19),
                              ),
                            ),
                            float: FloatingLabelBehavior.always,
                          ),
                          IsellTextField(
                            con: controller.felleskostnader,
                            maxlines: null,
                            focusNode: FocusNode(),
                            paddingcontainer: const EdgeInsets.only(
                                left: 16, right: 16, top: 25),
                            fontsizehinttext: 13,
                            validater: (val) {
                              return validInput(val!, 0, 10, "");
                            },
                            hinttxt: "NOK",
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
                                'Felleskostnader *',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.mandali(
                                    color: Myisellcolors.hoved, fontSize: 19),
                              ),
                            ),
                            float: FloatingLabelBehavior.always,
                          ),
                          IsellTextField(
                            con: controller.felleskostnaderetteravdper,
                            maxlines: null,
                            focusNode: FocusNode(),
                            paddingcontainer: const EdgeInsets.only(
                                left: 16, right: 16, top: 25),
                            fontsizehinttext: 13,
                            validater: (val) {},
                            hinttxt: "Felleskostnader etter avdragsfri periode",
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
                                'Felleskostnader etter avdragsfri periode',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.mandali(
                                    color: Myisellcolors.hoved, fontSize: 19),
                              ),
                            ),
                            float: FloatingLabelBehavior.always,
                          ),
                          Container(
                            margin: const EdgeInsets.only(
                                top: 7, left: 17, right: 10),
                            child: Text(
                              "Hva er estimerte felleskostnader etter den eventuelle avdragsfrie perioden? Dette feltet må fylles ut dersom boligen har fellesgjeld. Dersom det ikke er avdragsfrihet i fellesgjeld settes verdien til dagens felleskostnader.",
                              style: GoogleFonts.baloo2(
                                  color: Myisellcolors.hvit, fontSize: 13),
                            ),
                          ),
                          IsellTextField(
                            con: controller.felleskostnaderinkluderer,
                            maxlines: null,
                            focusNode: FocusNode(),
                            paddingcontainer: const EdgeInsets.only(
                                left: 16, right: 16, top: 25),
                            fontsizehinttext: 13,
                            validater: (val) {
                              return validInput(val!, 0, 100000, "");
                            },
                            hinttxt: "Felleskostnader inkluderer",
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
                                'Hva inkluderer felleskostnader *',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.mandali(
                                    color: Myisellcolors.hoved, fontSize: 19),
                              ),
                            ),
                            float: FloatingLabelBehavior.always,
                          ),
                          Container(
                            margin: const EdgeInsets.only(
                                top: 7, left: 17, right: 10),
                            child: Text(
                              "Her bør du spesifisere de månedlige totalkostnadene/husleien, sett gjerne opp hva som er felleskostnader og hva som er renter og avdrag.",
                              style: GoogleFonts.baloo2(
                                  color: Myisellcolors.hvit, fontSize: 13),
                            ),
                          ),
                          IsellTextField(
                            con: controller.formuesverdi,
                            maxlines: null,
                            focusNode: FocusNode(),
                            paddingcontainer: const EdgeInsets.only(
                                left: 16, right: 16, top: 25),
                            fontsizehinttext: 13,
                            validater: (val) {
                              return validInput(val!, 0, 100, "");
                            },
                            hinttxt: "NOK",
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
                                'Formuesverdi *',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.mandali(
                                    color: Myisellcolors.hoved, fontSize: 19),
                              ),
                            ),
                            float: FloatingLabelBehavior.always,
                          ),
                          Container(
                            margin: const EdgeInsets.only(
                                top: 7, left: 17, right: 10),
                            child: Text(
                              "Formuesverdi legges til grunn av skatteetaten og kommuner når skatt av boligen skal regnes ut. Mer om formuesverdi og hvordan du beregner dette kan du finne på skatteetaten sin hjemmeside.",
                              style: GoogleFonts.baloo2(
                                  color: Myisellcolors.hvit, fontSize: 13),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(
                                top: 20, left: 17, right: 10),
                            child: Text(
                              "Pris informasjon",
                              style: GoogleFonts.baloo2(
                                  color: Myisellcolors.hvit, fontSize: 20),
                            ),
                          ),
                          IsellTextField(
                            con: controller.pris,
                            maxlines: null,
                            focusNode: FocusNode(),
                            paddingcontainer: const EdgeInsets.only(
                                left: 16, right: 16, top: 25),
                            fontsizehinttext: 13,
                            validater: (val) {
                              return validInput(val!, 0, 1000, "");
                            },
                            hinttxt:
                                "Den minste prisen du selger eiendommen for",
                            hinttxtcolor: Myisellcolors.hvit70,
                            contentpadding:
                                const EdgeInsets.fromLTRB(30, 20, 30, 20),
                            txtcolor: Myisellcolors.hvit70,
                            txttype: TextInputType.name,
                            onSav: (value) {},
                            onchanged: (p0) {
                              controller.updateTotalPrice();
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
                                'Eiendoms pris *',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.mandali(
                                    color: Myisellcolors.hoved, fontSize: 19),
                              ),
                            ),
                            float: FloatingLabelBehavior.always,
                          ),
                          IsellTextField(
                            con: controller.boligomkostninger,
                            maxlines: null,
                            focusNode: FocusNode(),
                            paddingcontainer: const EdgeInsets.only(
                                left: 16, right: 16, top: 25),
                            fontsizehinttext: 13,
                            validater: (val) {
                              return validInput(val!, 0, 1000, "");
                            },
                            hinttxt: "NOK",
                            hinttxtcolor: Myisellcolors.hvit70,
                            contentpadding:
                                const EdgeInsets.fromLTRB(30, 20, 30, 20),
                            txtcolor: Myisellcolors.hvit70,
                            txttype: TextInputType.name,
                            onSav: (value) {},
                            onchanged: (p0) {
                              controller.updateTotalPrice();
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
                                'Omkostninger *',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.mandali(
                                    color: Myisellcolors.hoved, fontSize: 19),
                              ),
                            ),
                            float: FloatingLabelBehavior.always,
                          ),
                          Container(
                            margin: const EdgeInsets.only(
                                top: 7, left: 17, right: 10),
                            child: Text(
                              "Dersom det vil påløpe ekstra omkostninger ved salg av denne eiendommen oppgir du beløpet her. Fyll inn 0 hvis det ikke er ekstra omkostninger.",
                              style: GoogleFonts.baloo2(
                                  color: Myisellcolors.hvit, fontSize: 13),
                            ),
                          ),
                          IsellTextField(
                            con: controller.omkostningerinkluderer,
                            maxlines: null,
                            focusNode: FocusNode(),
                            paddingcontainer: const EdgeInsets.only(
                                left: 16, right: 16, top: 25),
                            fontsizehinttext: 13,
                            validater: (val) {
                              return validInput(val!, 0, 10000, "");
                            },
                            hinttxt: "Hva inkluderer omkostninger",
                            hinttxtcolor: Myisellcolors.hvit70,
                            contentpadding:
                                const EdgeInsets.fromLTRB(30, 30, 30, 30),
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
                                'Omkostninger inkluderer *',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.mandali(
                                    color: Myisellcolors.hoved, fontSize: 19),
                              ),
                            ),
                            float: FloatingLabelBehavior.always,
                          ),
                          Container(
                            margin: const EdgeInsets.only(
                                top: 7, left: 17, right: 10),
                            child: Text(
                              "Her kan du gi en mer detaljert beskrivelse av hvilke omkostninger som inngår i kjøpet.",
                              style: GoogleFonts.baloo2(
                                  color: Myisellcolors.hvit, fontSize: 13),
                            ),
                          ),
                          IsellTextField(
                            con: controller.andelfellesgjeld,
                            maxlines: null,
                            focusNode: FocusNode(),
                            paddingcontainer: const EdgeInsets.only(
                                left: 16, right: 16, top: 25),
                            fontsizehinttext: 13,
                            validater: (val) {
                              return validInput(val!, 0, 1000, "");
                            },
                            hinttxt: "Fellesgjeld for din bolig",
                            hinttxtcolor: Myisellcolors.hvit70,
                            contentpadding:
                                const EdgeInsets.fromLTRB(30, 20, 30, 20),
                            txtcolor: Myisellcolors.hvit70,
                            txttype: TextInputType.name,
                            onSav: (value) {},
                            onchanged: (p0) {
                              controller.updateTotalPrice();
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
                                'Andel fellesgjeld *',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.mandali(
                                    color: Myisellcolors.hoved, fontSize: 19),
                              ),
                            ),
                            float: FloatingLabelBehavior.always,
                          ),
                          Container(
                            margin: const EdgeInsets.only(
                                top: 20, left: 17, right: 10),
                            child: Text(
                              "Teotalpris regnes ut som summen av prisantydning, fellesgjeld og omkostninger. Alle disse tre feltene må fylles ut for at totalpris skal vises.",
                              style: GoogleFonts.baloo2(
                                  color: Myisellcolors.hvit, fontSize: 13),
                            ),
                          ),
                          Obx(
                            () => Container(
                              margin: const EdgeInsets.only(
                                  top: 15, left: 17, right: 10),
                              child: Text(
                                "Totalpris blir: ${formatTotalPrice(controller.totalpris.value)} kr",
                                style: GoogleFonts.baloo2(
                                  color: Myisellcolors.hvit,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                          IsellTextField(
                            con: controller.verditakst,
                            maxlines: null,
                            focusNode: FocusNode(),
                            paddingcontainer: const EdgeInsets.only(
                                left: 16, right: 16, top: 25),
                            fontsizehinttext: 13,
                            validater: (val) {},
                            hinttxt: "NOK",
                            hinttxtcolor: Myisellcolors.hvit70,
                            contentpadding:
                                const EdgeInsets.fromLTRB(30, 20, 30, 20),
                            txtcolor: Myisellcolors.hvit70,
                            txttype: TextInputType.name,
                            onSav: (value) {},
                            onchanged: (p0) {},
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
                                'Verditakst',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.mandali(
                                    color: Myisellcolors.hoved, fontSize: 19),
                              ),
                            ),
                            float: FloatingLabelBehavior.always,
                          ),
                          Container(
                            margin: const EdgeInsets.only(
                                top: 7, left: 17, right: 10),
                            child: Text(
                              "Verditakst blir satt av takstmannen og er forventet salgsverdi eller markedsverdien på din eiendom.",
                              style: GoogleFonts.baloo2(
                                  color: Myisellcolors.hvit, fontSize: 13),
                            ),
                          ),
                          IsellTextField(
                            con: controller.lanelakst,
                            maxlines: null,
                            focusNode: FocusNode(),
                            paddingcontainer: const EdgeInsets.only(
                                left: 16, right: 16, top: 25),
                            fontsizehinttext: 13,
                            validater: (val) {},
                            hinttxt: "NOK",
                            hinttxtcolor: Myisellcolors.hvit70,
                            contentpadding:
                                const EdgeInsets.fromLTRB(30, 20, 30, 20),
                            txtcolor: Myisellcolors.hvit70,
                            txttype: TextInputType.name,
                            onSav: (value) {},
                            onchanged: (p0) {},
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
                                'Lånetakst',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.mandali(
                                    color: Myisellcolors.hoved, fontSize: 19),
                              ),
                            ),
                            float: FloatingLabelBehavior.always,
                          ),
                          Container(
                            margin: const EdgeInsets.only(
                                top: 7, left: 17, right: 10),
                            child: Text(
                              "Lånetakst vil si den boligverdien som banken bruker for lån, pant og eventuelt tvangssalg av boliger. Lånetaksten er basert på verditaksten.",
                              style: GoogleFonts.baloo2(
                                  color: Myisellcolors.hvit, fontSize: 13),
                            ),
                          ),
                          IsellTextField(
                            con: controller.andelfellesformue,
                            maxlines: null,
                            focusNode: FocusNode(),
                            paddingcontainer: const EdgeInsets.only(
                                left: 16, right: 16, top: 25),
                            fontsizehinttext: 13,
                            validater: (val) {},
                            hinttxt:
                                "Boligens andel av borettslagets fellesformue",
                            hinttxtcolor: Myisellcolors.hvit70,
                            contentpadding:
                                const EdgeInsets.fromLTRB(30, 20, 30, 20),
                            txtcolor: Myisellcolors.hvit70,
                            txttype: TextInputType.name,
                            onSav: (value) {},
                            onchanged: (p0) {},
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
                                'Andel fellesformue',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.mandali(
                                    color: Myisellcolors.hoved, fontSize: 19),
                              ),
                            ),
                            float: FloatingLabelBehavior.always,
                          ),
                          IsellTextField(
                            con: controller.kommunaleavgiftar,
                            maxlines: null,
                            focusNode: FocusNode(),
                            paddingcontainer: const EdgeInsets.only(
                                left: 16, right: 16, top: 25),
                            fontsizehinttext: 13,
                            validater: (val) {},
                            hinttxt: "NOK",
                            hinttxtcolor: Myisellcolors.hvit70,
                            contentpadding:
                                const EdgeInsets.fromLTRB(30, 20, 30, 20),
                            txtcolor: Myisellcolors.hvit70,
                            txttype: TextInputType.name,
                            onSav: (value) {},
                            onchanged: (p0) {},
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
                                'Kommunale avgifter pr. år',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.mandali(
                                    color: Myisellcolors.hoved, fontSize: 19),
                              ),
                            ),
                            float: FloatingLabelBehavior.always,
                          ),
                          IsellTextField(
                            con: controller.eiendomsskattar,
                            maxlines: null,
                            focusNode: FocusNode(),
                            paddingcontainer: const EdgeInsets.only(
                                left: 16, right: 16, top: 25),
                            fontsizehinttext: 13,
                            validater: (val) {},
                            hinttxt: "NOK",
                            hinttxtcolor: Myisellcolors.hvit70,
                            contentpadding:
                                const EdgeInsets.fromLTRB(30, 20, 30, 20),
                            txtcolor: Myisellcolors.hvit70,
                            txttype: TextInputType.name,
                            onSav: (value) {},
                            onchanged: (p0) {},
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
                                'Eiendomsskatt pr. år',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.mandali(
                                    color: Myisellcolors.hoved, fontSize: 19),
                              ),
                            ),
                            float: FloatingLabelBehavior.always,
                          ),
                          Container(
                            margin: const EdgeInsets.only(
                                top: 20, left: 17, right: 10),
                            child: Text(
                              "Eiendomens beskrivelser",
                              style: GoogleFonts.baloo2(
                                  color: Myisellcolors.hvit, fontSize: 20),
                            ),
                          ),

                          IsellTextField(
                            con: controller.forskjopsrett,
                            maxlines: null,
                            focusNode: FocusNode(),
                            paddingcontainer: const EdgeInsets.only(
                                left: 16, right: 16, top: 25),
                            fontsizehinttext: 13,
                            validater: (val) {},
                            hinttxt: "Forkjøpsrett",
                            hinttxtcolor: Myisellcolors.hvit70,
                            contentpadding:
                                const EdgeInsets.fromLTRB(30, 20, 30, 20),
                            txtcolor: Myisellcolors.hvit70,
                            txttype: TextInputType.name,
                            onSav: (value) {},
                            onchanged: (p0) {},
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
                                'Forkjøpsrett',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.mandali(
                                    color: Myisellcolors.hoved, fontSize: 19),
                              ),
                            ),
                            float: FloatingLabelBehavior.always,
                          ),
                          Container(
                            margin: const EdgeInsets.only(
                                top: 7, left: 17, right: 10),
                            child: Text(
                              "Her kan du angi om det praktiseres en forkjøpsrett, eller når en eventuell forkjøpsrett vil bli avklart.",
                              style: GoogleFonts.baloo2(
                                  color: Myisellcolors.hvit, fontSize: 13),
                            ),
                          ),
                          IsellTextField(
                            con: controller.boligbeskrivelse,
                            maxlines: null,
                            focusNode: FocusNode(),
                            paddingcontainer: const EdgeInsets.only(
                                left: 16, right: 16, top: 25),
                            fontsizehinttext: 13,
                            validater: (val) {},
                            hinttxt:
                                "Fortell om hva som er bra med eiendommen, \nhvorfor har du trivdes der og hva som er inkludert \nav møbler og innredning osv.",
                            hinttxtcolor: Myisellcolors.hvit70,
                            contentpadding:
                                const EdgeInsets.fromLTRB(30, 40, 30, 40),
                            txtcolor: Myisellcolors.hvit70,
                            txttype: TextInputType.name,
                            onSav: (value) {},
                            onchanged: (p0) {},
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
                                'Beskriv eiendommen',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.mandali(
                                    color: Myisellcolors.hoved, fontSize: 19),
                              ),
                            ),
                            float: FloatingLabelBehavior.always,
                          ),
                          IsellTextField(
                            con: controller.boligtilleggsinfo,
                            maxlines: null,
                            focusNode: FocusNode(),
                            paddingcontainer: const EdgeInsets.only(
                                left: 16, right: 16, top: 25),
                            fontsizehinttext: 13,
                            validater: (val) {},
                            hinttxt:
                                "F.eks. Det er vannlekkasje på kjøkken. \nTaket på det ene soverommet er ikke malt.",
                            hinttxtcolor: Myisellcolors.hvit70,
                            contentpadding:
                                const EdgeInsets.fromLTRB(30, 40, 30, 40),
                            txtcolor: Myisellcolors.hvit70,
                            txttype: TextInputType.name,
                            onSav: (value) {},
                            onchanged: (p0) {},
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
                                'Tilleggsopplysninger',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.mandali(
                                    color: Myisellcolors.hoved, fontSize: 19),
                              ),
                            ),
                            float: FloatingLabelBehavior.always,
                          ),
                          Container(
                            margin: const EdgeInsets.only(
                                top: 7, left: 17, right: 10),
                            child: Text(
                              "Opplysninger om vesentlige kjente feil og mangler som er av betydning for kjøper. Dette kan f.eks være større fysiske skader på boligen, endringer på boligen som er gjort uten å skaffe nødvendig tillatelse, byggeprosjekter som kan påvirke boligen eller utført arbeid på eiendommen av ufaglærte. Henvis også gjerne til takst.",
                              style: GoogleFonts.baloo2(
                                  color: Myisellcolors.hvit, fontSize: 13),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(
                                top: 20, left: 17, right: 10),
                            child: Text(
                              "Visnings informasjon",
                              style: GoogleFonts.baloo2(
                                  color: Myisellcolors.hvit, fontSize: 20),
                            ),
                          ),
                          IsellTextField(
                            con: controller.boligvideolink,
                            maxlines: null,
                            focusNode: FocusNode(),
                            paddingcontainer: const EdgeInsets.only(
                                left: 16, right: 16, top: 25),
                            fontsizehinttext: 13,
                            validater: (val) {},
                            hinttxt:
                                "Skriv inn linken til en video på f.eks. Youtube",
                            hinttxtcolor: Myisellcolors.hvit70,
                            contentpadding:
                                const EdgeInsets.fromLTRB(30, 20, 30, 20),
                            txtcolor: Myisellcolors.hvit70,
                            txttype: TextInputType.name,
                            onSav: (value) {},
                            onchanged: (p0) {},
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
                            con: controller.boligurllink,
                            maxlines: null,
                            focusNode: FocusNode(),
                            paddingcontainer: const EdgeInsets.only(
                                left: 16, right: 16, top: 25),
                            fontsizehinttext: 13,
                            validater: (val) {},
                            hinttxt: "URL for 360 virtuel visning",
                            hinttxtcolor: Myisellcolors.hvit70,
                            contentpadding:
                                const EdgeInsets.fromLTRB(30, 20, 30, 20),
                            txtcolor: Myisellcolors.hvit70,
                            txttype: TextInputType.name,
                            onSav: (value) {},
                            onchanged: (p0) {},
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
                                'URL',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.mandali(
                                    color: Myisellcolors.hoved, fontSize: 19),
                              ),
                            ),
                            float: FloatingLabelBehavior.always,
                          ),
                          IsellTextField(
                            con: controller.visningdato,
                            maxlines: null,
                            focusNode: FocusNode(),
                            paddingcontainer: const EdgeInsets.only(
                                left: 16, right: 16, top: 25),
                            fontsizehinttext: 13,
                            validater: (val) {},
                            hinttxt: "F.eks. 23.01.2024",
                            hinttxtcolor: Myisellcolors.hvit70,
                            contentpadding:
                                const EdgeInsets.fromLTRB(30, 20, 30, 20),
                            txtcolor: Myisellcolors.hvit70,
                            txttype: TextInputType.name,
                            onSav: (value) {},
                            onchanged: (p0) {},
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
                                'Visningsdato',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.mandali(
                                    color: Myisellcolors.hoved, fontSize: 19),
                              ),
                            ),
                            float: FloatingLabelBehavior.always,
                          ),
                          IsellTextField(
                            con: controller.fraklokke,
                            maxlines: null,
                            focusNode: FocusNode(),
                            paddingcontainer: const EdgeInsets.only(
                                left: 16, right: 16, top: 25),
                            fontsizehinttext: 13,
                            validater: (val) {},
                            hinttxt: "F.eks. 18:30",
                            hinttxtcolor: Myisellcolors.hvit70,
                            contentpadding:
                                const EdgeInsets.fromLTRB(30, 20, 30, 20),
                            txtcolor: Myisellcolors.hvit70,
                            txttype: TextInputType.name,
                            onSav: (value) {},
                            onchanged: (p0) {},
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
                                'Fra klokka',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.mandali(
                                    color: Myisellcolors.hoved, fontSize: 19),
                              ),
                            ),
                            float: FloatingLabelBehavior.always,
                          ),
                          IsellTextField(
                            con: controller.tilklokke,
                            maxlines: null,
                            focusNode: FocusNode(),
                            paddingcontainer: const EdgeInsets.only(
                                left: 16, right: 16, top: 25),
                            fontsizehinttext: 13,
                            validater: (val) {},
                            hinttxt: "F.eks. 20:30",
                            hinttxtcolor: Myisellcolors.hvit70,
                            contentpadding:
                                const EdgeInsets.fromLTRB(30, 20, 30, 20),
                            txtcolor: Myisellcolors.hvit70,
                            txttype: TextInputType.name,
                            onSav: (value) {},
                            onchanged: (p0) {},
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
                                'Til klokka',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.mandali(
                                    color: Myisellcolors.hoved, fontSize: 19),
                              ),
                            ),
                            float: FloatingLabelBehavior.always,
                          ),
                          IsellTextField(
                            con: controller.visningmerknad,
                            maxlines: null,
                            focusNode: FocusNode(),
                            paddingcontainer: const EdgeInsets.only(
                                left: 16, right: 16, top: 25),
                            fontsizehinttext: 13,
                            validater: (val) {},
                            hinttxt: "F.eks. visning etter avtale",
                            hinttxtcolor: Myisellcolors.hvit70,
                            contentpadding:
                                const EdgeInsets.fromLTRB(30, 20, 30, 20),
                            txtcolor: Myisellcolors.hvit70,
                            txttype: TextInputType.name,
                            onSav: (value) {},
                            onchanged: (p0) {},
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
                                'Visningsmerknad',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.mandali(
                                    color: Myisellcolors.hoved, fontSize: 19),
                              ),
                            ),
                            float: FloatingLabelBehavior.always,
                          ),

                          IsellTextField(
                            con: controller.boligtelefon,
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
                            con: controller.kontaktperson,
                            maxlines: null,
                            focusNode: FocusNode(),
                            paddingcontainer: const EdgeInsets.only(
                                left: 16, right: 16, top: 25),
                            fontsizehinttext: 13,
                            validater: (val) {},
                            hinttxt:
                                "Navnet til kontakt person angående sp. om boligen",
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
                          IsellTextField(
                            con: controller.itemselger,
                            maxlines: null,
                            focusNode: FocusNode(),
                            paddingcontainer: const EdgeInsets.only(
                                left: 16, right: 16, top: 25),
                            fontsizehinttext: 13,
                            validater: (val) {},
                            hinttxt: "Navnet til selskapet ditt",
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
                                'Selskapet',
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
                                name: "Legg til ny annonsem",
                                onPresset: () {
                                  if (controller.gkBoligannonse.currentState!
                                      .validate()) {
                                    controller.addBoligAnnonseData();
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
                              "Generell informasjon:",
                              style: GoogleFonts.baloo2(
                                  color: Myisellcolors.hvit, fontSize: 18),
                            ),
                          ),
                          IsellTextField(
                            maxlines: null,
                            focusNode: FocusNode(),
                            paddingcontainer: const EdgeInsets.only(
                                left: 16, right: 16, top: 25),
                            fontsizehinttext: 13,
                            validater: (val) {
                              return validInput(val!, 0, 1000, "");
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
                          IsellTextField(
                            con: controller.land,
                            maxlines: null,
                            focusNode: FocusNode(),
                            paddingcontainer: const EdgeInsets.only(
                                left: 16, right: 16, top: 25),
                            fontsizehinttext: 14.5,
                            validater: (val) {
                              return validInput(val!, 0, 50, "");
                            },
                            hinttxt: "Eks. Norge",
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
                            con: controller.primaarrom,
                            maxlines: null,
                            focusNode: FocusNode(),
                            paddingcontainer: const EdgeInsets.only(
                                left: 16, right: 16, top: 25),
                            fontsizehinttext: 13,
                            validater: (val) {
                              return validInput(val!, 0, 200, "");
                            },
                            hinttxt: "Arealet av primærrom på eiendommen",
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
                                'Primærrom *',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.mandali(
                                    color: Myisellcolors.hoved, fontSize: 19),
                              ),
                            ),
                            float: FloatingLabelBehavior.always,
                          ),
                          IsellTextField(
                            con: controller.boligbruksareal,
                            maxlines: null,
                            focusNode: FocusNode(),
                            paddingcontainer: const EdgeInsets.only(
                                left: 16, right: 16, top: 25),
                            fontsizehinttext: 11,
                            validater: (val) {
                              return validInput(val!, 0, 200, "");
                            },
                            hinttxt:
                                "Bruksareal er bruttoareal minus den plassen ytrevegger tar",
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
                                'Bruksareal *',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.mandali(
                                    color: Myisellcolors.hoved, fontSize: 19),
                              ),
                            ),
                            float: FloatingLabelBehavior.always,
                          ),
                          IsellTextField(
                            con: controller.apentareal,
                            maxlines: null,
                            focusNode: FocusNode(),
                            paddingcontainer: const EdgeInsets.only(
                                left: 16, right: 16, top: 25),
                            fontsizehinttext: 13,
                            // validater: (val) {
                            //   return validInput(val!, 0, 200, "");
                            // },
                            hinttxt:
                                "Arealet av terraser og åpne balkonger osv",
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
                                'Åpent areal',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.mandali(
                                    color: Myisellcolors.hoved, fontSize: 19),
                              ),
                            ),
                            float: FloatingLabelBehavior.always,
                          ),
                          IsellTextField(
                            con: controller.boligetasje,
                            maxlines: null,
                            focusNode: FocusNode(),
                            paddingcontainer: const EdgeInsets.only(
                                left: 16, right: 16, top: 25),
                            fontsizehinttext: 14.5,
                            validater: (val) {},
                            hinttxt: "I hvilken etasje ligger boligen",
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
                                'Etasje',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.mandali(
                                    color: Myisellcolors.hoved, fontSize: 19),
                              ),
                            ),
                            float: FloatingLabelBehavior.always,
                          ),
                          IsellTextField(
                            con: controller.antallsoverom,
                            maxlines: null,
                            focusNode: FocusNode(),
                            paddingcontainer: const EdgeInsets.only(
                                left: 16, right: 16, top: 25),
                            fontsizehinttext: 14.5,
                            validater: (val) {
                              return validInput(val!, 0, 10, "");
                            },
                            hinttxt: "Antall soverom",
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
                                'Soverom *',
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
                                  validator: (value) {
                                    if (value == null) {
                                      return 'Du må velge eiendomstype';
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
                                  hint: const Text('Eiendomstype *',
                                      style: TextStyle(
                                          color: Myisellcolors.hvit70,
                                          fontSize: 15)),
                                  items: leietype.map(
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
                                    controller.selectedland.value =
                                        value as String;
                                    controller.boligtype!.text = value;
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
                                  // validator: (value) {
                                  //   if (value == null) {
                                  //     return 'Du må velge eiendomstype';
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
                                  hint: const Text('Møblering',
                                      style: TextStyle(
                                          color: Myisellcolors.hvit70,
                                          fontSize: 15)),
                                  items: moblering.map(
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
                                    controller.moblering.value =
                                        value as String;
                                    controller.mobleringleie!.text = value;
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
                                  // validator: (value) {
                                  //   if (value == null) {
                                  //     return 'Du må velge eiendomstype';
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
                                  hint: const Text('Dyrtillat?',
                                      style: TextStyle(
                                          color: Myisellcolors.hvit70,
                                          fontSize: 15)),
                                  items: dyr.map(
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
                                    controller.dyrtillate.value =
                                        value as String;
                                    controller.dyrtillat!.text = value;
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
                                  // validator: (value) {
                                  //   if (value == null) {
                                  //     return 'Du må velge oppvarmingskarakteren';
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
                                  hint: const Text('Oppvarmingskarakter',
                                      style: TextStyle(
                                          color: Myisellcolors.hvit70)),
                                  items: oppvarmingskarakter.map(
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
                                    controller.oppvarmingskarakter.value =
                                        value as String;
                                    controller.boligoppvarmingskarakter!.text =
                                        value;
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
                                  // validator: (value) {
                                  //   if (value == null) {
                                  //     return 'Du må velge energikarakter';
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
                                  hint: const Text('Energiklasse',
                                      style: TextStyle(
                                          color: Myisellcolors.hvit70)),
                                  items: energikarakter.map(
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
                                    controller.energikarakter.value =
                                        value as String;
                                    controller.boligenergikarakter!.text =
                                        value;
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
                              maxLines: controller.fasiliteterleie!.text
                                      .contains(', ')
                                  ? null
                                  : 1,
                              readOnly: true,
                              controller: controller.fasiliteterleie,
                              cursorColor: Myisellcolors.hoved,
                              onTap: () {
                                FocusScope.of(context).unfocus();
                                controller.showDropdownleie(context);
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
                                hintText: "Fasiliteter",
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
                            con: controller.pris,
                            maxlines: null,
                            focusNode: FocusNode(),
                            paddingcontainer: const EdgeInsets.only(
                                left: 16, right: 16, top: 25),
                            fontsizehinttext: 13,
                            validater: (val) {
                              return validInput(val!, 0, 1000, "");
                            },
                            hinttxt:
                                "Den minste prisen du selger eiendommen for",
                            hinttxtcolor: Myisellcolors.hvit70,
                            contentpadding:
                                const EdgeInsets.fromLTRB(30, 20, 30, 20),
                            txtcolor: Myisellcolors.hvit70,
                            txttype: TextInputType.name,
                            onSav: (value) {},
                            onchanged: (p0) {
                              controller.updateTotalPrice();
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
                                'Eiendoms pris *',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.mandali(
                                    color: Myisellcolors.hoved, fontSize: 19),
                              ),
                            ),
                            float: FloatingLabelBehavior.always,
                          ),
                          IsellTextField(
                            con: controller.depositumleie,
                            maxlines: null,
                            focusNode: FocusNode(),
                            paddingcontainer: const EdgeInsets.only(
                                left: 16, right: 16, top: 25),
                            fontsizehinttext: 13,
                            // validater: (val) {
                            //   return validInput(val!, 0, 1000, "");
                            // },
                            hinttxt: "NOK",
                            hinttxtcolor: Myisellcolors.hvit70,
                            contentpadding:
                                const EdgeInsets.fromLTRB(30, 20, 30, 20),
                            txtcolor: Myisellcolors.hvit70,
                            txttype: TextInputType.name,
                            onSav: (value) {},
                            onchanged: (p0) {
                              controller.updateTotalPrice();
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
                                'Depositum',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.mandali(
                                    color: Myisellcolors.hoved, fontSize: 19),
                              ),
                            ),
                            float: FloatingLabelBehavior.always,
                          ),
                          IsellTextField(
                            con: controller.inkludertileie,
                            maxlines: null,
                            focusNode: FocusNode(),
                            paddingcontainer: const EdgeInsets.only(
                                left: 16, right: 16, top: 25),
                            fontsizehinttext: 14.5,
                            // validater: (val) {
                            //   return validInput(val!, 0, 1000000, "");
                            // },
                            hinttxt:
                                "Hva blir inkludert i leien? F.eks. Strøm,\n internett osv",
                            hinttxtcolor: Myisellcolors.hvit70,
                            contentpadding:
                                const EdgeInsets.fromLTRB(30, 20, 30, 50),
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
                                'Inkludert i leie',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.mandali(
                                    color: Myisellcolors.hoved, fontSize: 19),
                              ),
                            ),
                            float: FloatingLabelBehavior.always,
                          ),
                          IsellTextField(
                            con: controller.leiesfra,
                            maxlines: null,
                            focusNode: FocusNode(),
                            paddingcontainer: const EdgeInsets.only(
                                left: 16, right: 16, top: 25),
                            fontsizehinttext: 13,
                            // validater: (val) {
                            //   return validInput(val!, 0, 1000, "");
                            // },
                            hinttxt: "F.eks. 01.01.2024",
                            hinttxtcolor: Myisellcolors.hvit70,
                            contentpadding:
                                const EdgeInsets.fromLTRB(30, 20, 30, 20),
                            txtcolor: Myisellcolors.hvit70,
                            txttype: TextInputType.name,
                            onSav: (value) {},
                            onchanged: (p0) {
                              controller.updateTotalPrice();
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
                                'Leies ut fra',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.mandali(
                                    color: Myisellcolors.hoved, fontSize: 19),
                              ),
                            ),
                            float: FloatingLabelBehavior.always,
                          ),
                          IsellTextField(
                            con: controller.leiestil,
                            maxlines: null,
                            focusNode: FocusNode(),
                            paddingcontainer: const EdgeInsets.only(
                                left: 16, right: 16, top: 25),
                            fontsizehinttext: 13,
                            // validater: (val) {
                            //   return validInput(val!, 0, 1000, "");
                            // },
                            hinttxt: "F.eks. 01.01.2025",
                            hinttxtcolor: Myisellcolors.hvit70,
                            contentpadding:
                                const EdgeInsets.fromLTRB(30, 20, 30, 20),
                            txtcolor: Myisellcolors.hvit70,
                            txttype: TextInputType.name,
                            onSav: (value) {},
                            onchanged: (p0) {
                              controller.updateTotalPrice();
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
                                'Leies ut til',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.mandali(
                                    color: Myisellcolors.hoved, fontSize: 19),
                              ),
                            ),
                            float: FloatingLabelBehavior.always,
                          ),
                          IsellTextField(
                            con: controller.boligbeskrivelse,
                            maxlines: null,
                            focusNode: FocusNode(),
                            paddingcontainer: const EdgeInsets.only(
                                left: 16, right: 16, top: 25),
                            fontsizehinttext: 13,
                            validater: (val) {},
                            hinttxt: "Gi en beskrivelse av eiendommen",
                            hinttxtcolor: Myisellcolors.hvit70,
                            contentpadding:
                                const EdgeInsets.fromLTRB(30, 40, 30, 40),
                            txtcolor: Myisellcolors.hvit70,
                            txttype: TextInputType.name,
                            onSav: (value) {},
                            onchanged: (p0) {},
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
                                'Beskriv eiendommen',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.mandali(
                                    color: Myisellcolors.hoved, fontSize: 19),
                              ),
                            ),
                            float: FloatingLabelBehavior.always,
                          ),
                          IsellTextField(
                            con: controller.visningmerknad,
                            maxlines: null,
                            focusNode: FocusNode(),
                            paddingcontainer: const EdgeInsets.only(
                                left: 16, right: 16, top: 25),
                            fontsizehinttext: 13,
                            validater: (val) {},
                            hinttxt: "F.eks. visning etter avtale",
                            hinttxtcolor: Myisellcolors.hvit70,
                            contentpadding:
                                const EdgeInsets.fromLTRB(30, 20, 30, 20),
                            txtcolor: Myisellcolors.hvit70,
                            txttype: TextInputType.name,
                            onSav: (value) {},
                            onchanged: (p0) {},
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
                                'Visningsmerknad',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.mandali(
                                    color: Myisellcolors.hoved, fontSize: 19),
                              ),
                            ),
                            float: FloatingLabelBehavior.always,
                          ),
                          IsellTextField(
                            con: controller.boligtelefon,
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
                            con: controller.kontaktperson,
                            maxlines: null,
                            focusNode: FocusNode(),
                            paddingcontainer: const EdgeInsets.only(
                                left: 16, right: 16, top: 25),
                            fontsizehinttext: 13,
                            validater: (val) {},
                            hinttxt:
                                "Navnet til kontakt person angående sp. om boligen",
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
                            padding: const EdgeInsets.only(top: 20, bottom: 10),
                            child: IsellButtons(
                                size: Size(Get.width / 1.079, Get.height / 16),
                                name: "Legg til ny annonsem",
                                onPresset: () {
                                  if (controller.gkBoligannonse.currentState!
                                      .validate()) {
                                    controller.addBoligAnnonseData();
                                  } else {
                                    Get.snackbar(
                                      "OBS!",
                                      "Fyll ut alle obligatoriske felter markert med *",
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
              ],
            )),
          ),
        ),
      ),
    );
  }

  String formatTotalPrice(int totalPrice) {
    final NumberFormat numberFormat = NumberFormat("#,###", "en_US");
    return numberFormat.format(totalPrice);
  }
}
