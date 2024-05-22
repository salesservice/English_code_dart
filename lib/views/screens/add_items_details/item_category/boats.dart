import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_isell_new/controller/add_items/boat_items_controller.dart';
import 'package:flutter_isell_new/core/classes/handling_data_view.dart';
import 'package:flutter_isell_new/core/constants/sellx_colors.dart';
import 'package:flutter_isell_new/core/functions/upload_file.dart';
import 'package:flutter_isell_new/core/functions/validate_input.dart';
import 'package:flutter_isell_new/views/screens/home/navbar.dart';
import 'package:flutter_isell_new/views/widget/sellx_text_filed.dart';
import 'package:flutter_isell_new/views/widget/sellx_%20buttons.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class BaterAnnonse extends StatelessWidget {
  const BaterAnnonse({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> drivstoffet = [
      "Bensin",
      "Diesel",
      "Elektrisitet",
      "Hybrid",
      "Andre"
    ];

    List<String> boattypene = [
      "Bowrider",
      "Cabincruiser",
      "Daycruiser",
      "Gummibåt/Jolle",
      "RIB",
      "Seilbåt/Motorseiler",
      "Skjærgårdsjeep/Landstedsbåt",
      "Pilothouse",
      "Speedbåt",
      "Trebåt/Snekke",
      "Yacht",
      "Vannscooter",
      "Yrkesbåt/Sjark/Skøyte",
      "Andre"
    ];

    List<String> materiale = [
      "Plast",
      "Glassfiber",
      "Tre",
      "Aluminium",
      "Andre"
    ];

    List<String> tilsant = ["Ny", "Brukt"];

    List<String> ermotorboartincludert = ["Ja", "Nei"];

    List<String> motortypen = ["Innenbords", "Utenbords", "Andre"];

    AddBoatAnnonseController controller = Get.put(AddBoatAnnonseController());
    controller.VelgAnnonseType(controller.annonsetype!);
    controller.VelgMCType(controller.bottype!);

    return Form(
      key: controller.gkBoaterannonse,
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
              "Båter",
              style:
                  GoogleFonts.baloo2(fontSize: 20, color: Myisellcolors.hvit),
            ),
          ),
        ),
        endDrawer: const NavBar(),
        body: GetBuilder<AddBoatAnnonseController>(
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
                          controller.bottype != "Båt" &&
                                  controller.bottype != "Båtplass"
                              ? const Spacer()
                              : const SizedBox(),
                          controller.bottype != "Båt" &&
                                  controller.bottype != "Båtplass"
                              ? InkWell(
                                  onTap: () {
                                    controller.VelgAnnonseType("Gi bort");
                                  },
                                  child: Container(
                                    height: Get.height / 21,
                                    width: Get.width / 2.3,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(
                                          color: controller.annonsetype ==
                                                  "Gi bort"
                                              ? Myisellcolors.hoved
                                              : Myisellcolors.hvit70),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "Gi bort",
                                        style: GoogleFonts.roboto(
                                            fontSize: 16,
                                            color: controller.annonsetype ==
                                                    "Gi bort"
                                                ? Myisellcolors.hoved
                                                : Myisellcolors.hvit70),
                                      ),
                                    ),
                                  ),
                                )
                              : const SizedBox(),
                          const Spacer()
                        ],
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        top: Get.height / 40, left: Get.height / 50),
                    child: Text(
                      "Hva vil du ${controller.annonsetype}:",
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
                              controller.VelgMCType("Båt");
                            },
                            child: Container(
                              height: Get.height / 21,
                              width: Get.width / 2.3,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                    color: controller.bottype == "Båt"
                                        ? Myisellcolors.hoved
                                        : Myisellcolors.hvit70),
                              ),
                              child: Center(
                                child: Text(
                                  "Båt",
                                  style: GoogleFonts.roboto(
                                      fontSize: 16,
                                      color: controller.bottype == "Båt"
                                          ? Myisellcolors.hoved
                                          : Myisellcolors.hvit70),
                                ),
                              ),
                            ),
                          ),
                          const Spacer(),
                          InkWell(
                            onTap: () {
                              controller.VelgMCType("Båtplass");
                            },
                            child: Container(
                              height: Get.height / 21,
                              width: Get.width / 2.3,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                    color: controller.bottype == "Båtplass"
                                        ? Myisellcolors.hoved
                                        : Myisellcolors.hvit70),
                              ),
                              child: Center(
                                child: Text(
                                  "Båtplass",
                                  style: GoogleFonts.roboto(
                                      fontSize: 16,
                                      color: controller.bottype == "Båtplass"
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
                                controller.VelgMCType("Båtmotor");
                              },
                              child: Container(
                                height: Get.height / 21,
                                width: Get.width / 2.3,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                      color: controller.bottype == "Båtmotor"
                                          ? Myisellcolors.hoved
                                          : Myisellcolors.hvit70),
                                ),
                                child: Center(
                                  child: Text(
                                    "Båtmotor",
                                    style: GoogleFonts.roboto(
                                        fontSize: 16,
                                        color: controller.bottype == "Båtmotor"
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
                                controller.VelgMCType("Motordeler");
                              },
                              child: Container(
                                height: Get.height / 21,
                                width: Get.width / 2.3,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                      color: controller.bottype == "Motordeler"
                                          ? Myisellcolors.hoved
                                          : Myisellcolors.hvit70),
                                ),
                                child: Center(
                                  child: Text(
                                    "Motordeler",
                                    style: GoogleFonts.roboto(
                                        fontSize: 16,
                                        color:
                                            controller.bottype == "Motordeler"
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
                  Container(
                    margin: const EdgeInsets.only(top: 20, left: 15, right: 10),
                    child: Text(
                      "${controller.bottype} generell informasjon:",
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
                  controller.bottype == "Båt"
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
                                    dropdownColor: Myisellcolors.appbar,
                                    decoration: InputDecoration(
                                        label: Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: Text(
                                            'Båten står i *',
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
                                        return 'Hvor er båten står parkert';
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
                                    hint: const Text('Båten står i',
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
                                      controller.onChangedBatStari(value);
                                      controller.update();
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
                                            'Båttype',
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
                                    // validator: (value) {
                                    //   if (value == null) {
                                    //     return 'Du må velge Boat tilstand';
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
                                    hint: const Text('Velg båttype',
                                        style: TextStyle(
                                            color: Myisellcolors.hvit70,
                                            fontSize: 13)),
                                    items: boattypene.map(
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
                                      controller.boattypen.value =
                                          value as String;
                                      controller.boattype!.text = value;
                                      // controller.gkBoaterannonse.currentState
                                      //     ?.validate();
                                    },
                                  ),
                                ),
                              ),
                            ),
                            IsellTextField(
                              con: controller.boatregnr,
                              maxlines: null,
                              focusNode: FocusNode(),
                              paddingcontainer: const EdgeInsets.only(
                                  left: 16, right: 16, top: 25),
                              fontsizehinttext: 13,
                              validater: (val) {
                                return validInput(val!, 0, 100, "");
                              },
                              hinttxt:
                                  "Båtens kjennemerke i Småbåt- eller Skipsregisteret",
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
                              con: controller.boatmodellar,
                              maxlines: null,
                              focusNode: FocusNode(),
                              paddingcontainer: const EdgeInsets.only(
                                  left: 16, right: 16, top: 25),
                              fontsizehinttext: 14.5,
                              validater: controller.annonsetype != "Kjøpe"
                                  ? (val) {
                                      return validInput(val!, 4, 4, "");
                                    }
                                  : null,
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
                                        return 'Du må velge Båt tilstand';
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
                                    hint: const Text(
                                      'Båt tilstand *',
                                      style: TextStyle(
                                          color: Myisellcolors.hvit70,
                                          fontSize: 13),
                                    ),
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
                                      controller.tilstandboat.value =
                                          value as String;
                                      controller.itemtistand!.text = value;
                                      controller.gkBoaterannonse.currentState
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
                                  controller.gkBoaterannonse.currentState
                                      ?.validate();
                                },
                                readOnly: true,
                                maxLines:
                                    controller.boatmerke!.text.contains(', ')
                                        ? null
                                        : 1,
                                controller: controller.boatmerke,
                                cursorColor: Myisellcolors.hoved,
                                onTap: () {
                                  FocusScope.of(context).unfocus();
                                  controller.showDropdownBoatMerke(context);
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
                              con: controller.boatmodell,
                              maxlines: null,
                              focusNode: FocusNode(),
                              paddingcontainer: const EdgeInsets.only(
                                  left: 16, right: 16, top: 25),
                              fontsizehinttext: 13,
                              // validater: (val) {
                              //   return validInput(val!, 4, 4, "");
                              // },
                              hinttxt: "Båtmodell",
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
                                                  'Er motoren inkludert?',
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
                                          //     return 'Du må velge Boat tilstand';
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
                                              'Er motoren inkludert i salget?',
                                              style: TextStyle(
                                                  color: Myisellcolors.hvit70,
                                                  fontSize: 13)),
                                          items: ermotorboartincludert.map(
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
                                            controller.includermotorboat.value =
                                                value as String;
                                            controller.boatmotorinc!.text =
                                                value;
                                            // controller.gkBoaterannonse.currentState
                                            //     ?.validate();
                                          },
                                        ),
                                      ),
                                    ),
                                  )
                                : SizedBox(),
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
                                            'Motor type',
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
                                    // validator: (value) {
                                    //   if (value == null) {
                                    //     return 'Du må velge Boat tilstand';
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
                                    hint: const Text('Velg motor type',
                                        style: TextStyle(
                                            color: Myisellcolors.hvit70,
                                            fontSize: 13)),
                                    items: motortypen.map(
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
                                      controller.motortypen.value =
                                          value as String;
                                      controller.boatmotortype!.text = value;
                                      // controller.gkBoaterannonse.currentState
                                      //     ?.validate();
                                    },
                                  ),
                                ),
                              ),
                            ),
                            IsellTextField(
                              con: controller.boatmotormerke,
                              maxlines: null,
                              focusNode: FocusNode(),
                              paddingcontainer: const EdgeInsets.only(
                                  left: 16, right: 16, top: 25),
                              fontsizehinttext: 13,
                              // validater: (val) {
                              //   return validInput(val!, 4, 4, "");
                              // },
                              hinttxt: "Hva er motormerke",
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
                                  'Motomerke',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.mandali(
                                      color: Myisellcolors.hoved, fontSize: 19),
                                ),
                              ),
                              float: FloatingLabelBehavior.always,
                            ),
                            IsellTextField(
                              con: controller.boathk,
                              maxlines: null,
                              focusNode: FocusNode(),
                              paddingcontainer: const EdgeInsets.only(
                                  left: 16, right: 16, top: 25),
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
                            IsellTextField(
                              con: controller.boatfartiknop,
                              maxlines: null,
                              focusNode: FocusNode(),
                              paddingcontainer: const EdgeInsets.only(
                                  left: 16, right: 16, top: 25),
                              fontsizehinttext: 13,
                              // validater: (val) {
                              //   return validInput(val!, 4, 4, "");
                              // },
                              hinttxt: "Maks fart i knop",
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
                                  'Maks fart i knop',
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
                                    // validator: (value) {
                                    //   if (value == null) {
                                    //     return 'Du må velge Boat tilstand';
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
                                    hint: const Text('Velg drivstoff',
                                        style: TextStyle(
                                            color: Myisellcolors.hvit70,
                                            fontSize: 13)),
                                    items: drivstoffet.map(
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
                                      controller.drivstoff.value =
                                          value as String;
                                      controller.boatdrivstoff!.text = value;
                                      // controller.gkBoaterannonse.currentState
                                      //     ?.validate();
                                    },
                                  ),
                                ),
                              ),
                            ),
                            IsellTextField(
                              con: controller.boatlengdefot,
                              maxlines: null,
                              focusNode: FocusNode(),
                              paddingcontainer: const EdgeInsets.only(
                                  left: 16, right: 16, top: 25),
                              fontsizehinttext: 13,
                              // validater: (val) {
                              //   return validInput(val!, 4, 4, "");
                              // },
                              hinttxt: "Lengde i fot",
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
                                  'Lengde i fot',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.mandali(
                                      color: Myisellcolors.hoved, fontSize: 19),
                                ),
                              ),
                              float: FloatingLabelBehavior.always,
                            ),
                            IsellTextField(
                              con: controller.boatbreddecm,
                              maxlines: null,
                              focusNode: FocusNode(),
                              paddingcontainer: const EdgeInsets.only(
                                  left: 16, right: 16, top: 25),
                              fontsizehinttext: 13,
                              // validater: (val) {
                              //   return validInput(val!, 4, 4, "");
                              // },
                              hinttxt: "Bredde i cm",
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
                                  'Bredde i cm',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.mandali(
                                      color: Myisellcolors.hoved, fontSize: 19),
                                ),
                              ),
                              float: FloatingLabelBehavior.always,
                            ),
                            IsellTextField(
                              con: controller.boatdybdecm,
                              maxlines: null,
                              focusNode: FocusNode(),
                              paddingcontainer: const EdgeInsets.only(
                                  left: 16, right: 16, top: 25),
                              fontsizehinttext: 13,
                              // validater: (val) {
                              //   return validInput(val!, 4, 4, "");
                              // },
                              hinttxt: "Dybde i cm",
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
                                  'Dybde i cm',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.mandali(
                                      color: Myisellcolors.hoved, fontSize: 19),
                                ),
                              ),
                              float: FloatingLabelBehavior.always,
                            ),
                            IsellTextField(
                              con: controller.boatvektkg,
                              maxlines: null,
                              focusNode: FocusNode(),
                              paddingcontainer: const EdgeInsets.only(
                                  left: 16, right: 16, top: 25),
                              fontsizehinttext: 13,
                              // validater: (val) {
                              //   return validInput(val!, 4, 4, "");
                              // },
                              hinttxt: "Vekt i kg",
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
                                            'Byggematerialet',
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
                                    // validator: (value) {
                                    //   if (value == null) {
                                    //     return 'Du må velge Boat tilstand';
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
                                    hint: const Text('Velg byggematerialet',
                                        style: TextStyle(
                                            color: Myisellcolors.hvit70,
                                            fontSize: 13)),
                                    items: materiale.map(
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
                                      controller.byggematrialet.value =
                                          value as String;
                                      controller.boatbyggematerial!.text =
                                          value;
                                      // controller.gkBoaterannonse.currentState
                                      //     ?.validate();
                                    },
                                  ),
                                ),
                              ),
                            ),
                            IsellTextField(
                              con: controller.boatfarge,
                              maxlines: null,
                              focusNode: FocusNode(),
                              paddingcontainer: const EdgeInsets.only(
                                  left: 16, right: 16, top: 25),
                              fontsizehinttext: 13,
                              // validater: (val) {
                              //   return validInput(val!, 4, 4, "");
                              // },
                              hinttxt: "Båt farge",
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
                                  'Farge',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.mandali(
                                      color: Myisellcolors.hoved, fontSize: 19),
                                ),
                              ),
                              float: FloatingLabelBehavior.always,
                            ),
                            IsellTextField(
                              con: controller.boatsitteplasser,
                              maxlines: null,
                              focusNode: FocusNode(),
                              paddingcontainer: const EdgeInsets.only(
                                  left: 16, right: 16, top: 25),
                              fontsizehinttext: 13,
                              // validater: (val) {
                              //   return validInput(val!, 4, 4, "");
                              // },
                              hinttxt: "Antall sitteplasser",
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
                                  'Antall sitteplasser',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.mandali(
                                      color: Myisellcolors.hoved, fontSize: 19),
                                ),
                              ),
                              float: FloatingLabelBehavior.always,
                            ),
                            IsellTextField(
                              con: controller.boatsoveplasser,
                              maxlines: null,
                              focusNode: FocusNode(),
                              paddingcontainer: const EdgeInsets.only(
                                  left: 16, right: 16, top: 25),
                              fontsizehinttext: 13,
                              // validater: (val) {
                              //   return validInput(val!, 4, 4, "");
                              // },
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
                                  'Antall soveplasser',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.mandali(
                                      color: Myisellcolors.hoved, fontSize: 19),
                                ),
                              ),
                              float: FloatingLabelBehavior.always,
                            ),
                            IsellTextField(
                              con: controller.boatlystall,
                              maxlines: null,
                              focusNode: FocusNode(),
                              paddingcontainer: const EdgeInsets.only(
                                  left: 16, right: 16, top: 25),
                              fontsizehinttext: 13,
                              // validater: (val) {
                              //   return validInput(val!, 4, 4, "");
                              // },
                              hinttxt: "LYS-tall (bare for seilbåter)",
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
                                  'LYS-tall',
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
                                "Tallet beskriver hvor raskt seilbåten er. For eksampel: 1.16. Målebrev utsendes av Norlys",
                                style: GoogleFonts.roboto(
                                    color: Myisellcolors.hvit70, fontSize: 12),
                              ),
                            ),
                            IsellTextField(
                              con: controller.boatutstyr,
                              maxlines: null,
                              focusNode: FocusNode(),
                              paddingcontainer: const EdgeInsets.only(
                                  left: 16, right: 16, top: 25),
                              fontsizehinttext: 13,
                              // validater: (val) {
                              //   return validInput(val!, 4, 4, "");
                              // },
                              hinttxt: "Utstyr",
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
                                  'Utstyr',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.mandali(
                                      color: Myisellcolors.hoved, fontSize: 19),
                                ),
                              ),
                              float: FloatingLabelBehavior.always,
                            ),
                            IsellTextField(
                              con: controller.boatvideo,
                              maxlines: null,
                              focusNode: FocusNode(),
                              paddingcontainer: const EdgeInsets.only(
                                  left: 16, right: 16, top: 25),
                              fontsizehinttext: 13,
                              // validater: (val) {
                              //   return validInput(val!, 4, 4, "");
                              // },
                              hinttxt: "Link på video fra for eks. YouTube'",
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
                                  'Video URL',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.mandali(
                                      color: Myisellcolors.hoved, fontSize: 19),
                                ),
                              ),
                              float: FloatingLabelBehavior.always,
                            ),
                            IsellTextField(
                              con: controller.pris,
                              maxlines: null,
                              focusNode: FocusNode(),
                              paddingcontainer: const EdgeInsets.only(
                                  left: 16, right: 16, top: 25),
                              fontsizehinttext: 13,
                              // validater: (val) {
                              //   return validInput(val!, 4, 4, "");
                              // },
                              hinttxt: controller.annonsetype == "Kjøpe"
                                  ? "Maks pris i NOK"
                                  : controller.annonsetype == "Leie ut"
                                      ? "Minstepris per uke i NOK"
                                      : " Pris i NOK",
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
                                  controller.annonsetype == "Kjøpe"
                                      ? "Minstepris"
                                      : controller.annonsetype == "Leie ut"
                                          ? "Minstepris"
                                          : "Pris",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.mandali(
                                      color: Myisellcolors.hoved, fontSize: 19),
                                ),
                              ),
                              float: FloatingLabelBehavior.always,
                            ),
                          ],
                        )
                      : const SizedBox(),
                  controller.bottype == "Båtplass"
                      ? Column(
                          children: [
                            IsellTextField(
                              con: controller.boatbeliggenhet,
                              maxlines: null,
                              focusNode: FocusNode(),
                              paddingcontainer: const EdgeInsets.only(
                                  left: 16, right: 16, top: 25),
                              fontsizehinttext: 14.5,
                              validater: (val) {
                                return validInput(val!, 0, 200, "");
                              },
                              hinttxt: "Beliggenhet/Marina",
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
                                  'Beliggenhet/Marina *',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.mandali(
                                      color: Myisellcolors.hoved, fontSize: 19),
                                ),
                              ),
                              float: FloatingLabelBehavior.always,
                            ),
                            IsellTextField(
                              con: controller.boatbreddecm,
                              maxlines: null,
                              focusNode: FocusNode(),
                              paddingcontainer: const EdgeInsets.only(
                                  left: 16, right: 16, top: 25),
                              fontsizehinttext: 14.5,
                              validater: (val) {
                                return validInput(val!, 0, 50, "");
                              },
                              hinttxt: "Bredde i cm",
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
                                  'Bredde i cm *',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.mandali(
                                      color: Myisellcolors.hoved, fontSize: 19),
                                ),
                              ),
                              float: FloatingLabelBehavior.always,
                            ),
                            IsellTextField(
                              con: controller.pris,
                              maxlines: null,
                              focusNode: FocusNode(),
                              paddingcontainer: const EdgeInsets.only(
                                  left: 16, right: 16, top: 25),
                              fontsizehinttext: 14.5,
                              validater: (val) {
                                return validInput(val!, 0, 50, "");
                              },
                              hinttxt: controller.annonsetype == "Kjøpe"
                                  ? "Maks pris i nok"
                                  : "Pris i nok",
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
                                  controller.annonsetype == "Kjøpe"
                                      ? "Maks pris"
                                      : "Pris",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.mandali(
                                      color: Myisellcolors.hoved, fontSize: 19),
                                ),
                              ),
                              float: FloatingLabelBehavior.always,
                            ),
                          ],
                        )
                      : const SizedBox(),
                  controller.bottype == "Motordeler" &&
                          controller.annonsetype != "Gi bort"
                      ? IsellTextField(
                          con: controller.pris,
                          maxlines: null,
                          focusNode: FocusNode(),
                          paddingcontainer: const EdgeInsets.only(
                              left: 16, right: 16, top: 25),
                          fontsizehinttext: 14.5,
                          validater: (val) {
                            return validInput(val!, 0, 50, "");
                          },
                          hinttxt: controller.annonsetype == "Kjøpe"
                              ? "Maks pris i nok"
                              : "Pris i nok",
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
                              controller.annonsetype == "Kjøpe"
                                  ? "Mkas pris"
                                  : "Pris",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.mandali(
                                  color: Myisellcolors.hoved, fontSize: 19),
                            ),
                          ),
                          float: FloatingLabelBehavior.always,
                        )
                      : const SizedBox(),
                  controller.bottype == "Båtmotor"
                      ? Column(
                          children: [
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
                                            'Motor type',
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
                                    // validator: (value) {
                                    //   if (value == null) {
                                    //     return 'Du må velge Boat tilstand';
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
                                    hint: const Text('Velg motor type',
                                        style: TextStyle(
                                            color: Myisellcolors.hvit70,
                                            fontSize: 13)),
                                    items: motortypen.map(
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
                                      controller.motortypen.value =
                                          value as String;
                                      controller.boatmotortype!.text = value;
                                      // controller.gkBoaterannonse.currentState
                                      //     ?.validate();
                                    },
                                  ),
                                ),
                              ),
                            ),
                            IsellTextField(
                              con: controller.boathk,
                              maxlines: null,
                              focusNode: FocusNode(),
                              paddingcontainer: const EdgeInsets.only(
                                  left: 16, right: 16, top: 25),
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
                            controller.annonsetype != "Gi bort"
                                ? IsellTextField(
                                    con: controller.pris,
                                    maxlines: null,
                                    focusNode: FocusNode(),
                                    paddingcontainer: const EdgeInsets.only(
                                        left: 16, right: 16, top: 25),
                                    fontsizehinttext: 14.5,
                                    validater: (val) {
                                      return validInput(val!, 0, 50, "");
                                    },
                                    hinttxt: controller.annonsetype == "Kjøpe"
                                        ? "Maks pris i nok"
                                        : "Pris i nok",
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
                                        controller.annonsetype == "Kjøpe"
                                            ? "Mkas pris"
                                            : "Pris",
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
                              con: controller.boatvideo,
                              maxlines: null,
                              focusNode: FocusNode(),
                              paddingcontainer: const EdgeInsets.only(
                                  left: 16, right: 16, top: 25),
                              fontsizehinttext: 13,
                              // validater: (val) {
                              //   return validInput(val!, 4, 4, "");
                              // },
                              hinttxt: "Link på video fra for eks. YouTube",
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
                                  'Video URL',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.mandali(
                                      color: Myisellcolors.hoved, fontSize: 19),
                                ),
                              ),
                              float: FloatingLabelBehavior.always,
                            ),
                          ],
                        )
                      : const SizedBox(),
                  IsellTextField(
                    con: controller.boatbeskrivevlse,
                    maxlines: null,
                    focusNode: FocusNode(),
                    paddingcontainer:
                        const EdgeInsets.only(left: 16, right: 16, top: 25),
                    fontsizehinttext: 14.5,
                    // validater: (val) {
                    //   return validInput(val!, 0, 50, "");
                    // },
                    hinttxt: "Beksrivelse",
                    hinttxtcolor: Myisellcolors.hvit70,
                    contentpadding: const EdgeInsets.fromLTRB(30, 30, 30, 30),
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
                        "Beksrivelse",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.mandali(
                            color: Myisellcolors.hoved, fontSize: 19),
                      ),
                    ),
                    float: FloatingLabelBehavior.always,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin:
                            const EdgeInsets.only(top: 20, left: 15, right: 10),
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
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 10),
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
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 10),
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
                              if (controller.gkBoaterannonse.currentState!
                                  .validate()) {
                                controller.addBoatAnnonseData();
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
