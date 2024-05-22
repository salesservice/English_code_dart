import 'package:flutter/material.dart';
import 'package:flutter_isell_new/controller/itemdeatails_controller.dart';
import 'package:flutter_isell_new/core/constants/sellx_colors.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class BoatDetailEssensiell {
  final String title;
  final String data;

  BoatDetailEssensiell(this.title, this.data);
}

// ignore: must_be_immutable
class EssensielleBoatdata extends StatelessWidget {
  EssensielleBoatdata({super.key});
  ItemDetailsControllerImp controller = Get.put(ItemDetailsControllerImp());

  @override
  Widget build(BuildContext context) {
    String boatprisformated =
        NumberFormat.decimalPattern().format(controller.itemsModel.itemPris);

    final List<BoatDetailEssensiell> allData = [
      BoatDetailEssensiell('Pris', boatprisformated),
      BoatDetailEssensiell('Tilstand', "${controller.itemsModel.itemTistand}"),
      BoatDetailEssensiell('Type', controller.itemsModel.boatType!),
      BoatDetailEssensiell('Den er', controller.itemsModel.salgLeie!),
      BoatDetailEssensiell('Merke', controller.itemsModel.boatMerke!),
      BoatDetailEssensiell(
          "Motorefftekt", "${controller.itemsModel.boatHk} hk"),
      BoatDetailEssensiell('Hoved farge', "${controller.itemsModel.boatFarge}"),
      BoatDetailEssensiell(
          'Båten står i', "${controller.itemsModel.boatLiggeri}"),
      BoatDetailEssensiell(
          'Bredde', "${controller.itemsModel.boatbreddeCm!} cm"),
      BoatDetailEssensiell("Dybde", "${controller.itemsModel.boatdybdeCm} cm"),
      BoatDetailEssensiell(
          "Lengde", "${controller.itemsModel.boatlengdeFot} fot"),
      BoatDetailEssensiell("Modell", controller.itemsModel.boatModell!),
      BoatDetailEssensiell("Vekt", "${controller.itemsModel.boatVektkg!} kg"),
      BoatDetailEssensiell(
          'Antall sitteplasser', "${controller.itemsModel.boatSitteplasser}"),
      BoatDetailEssensiell(
          "Antall soveplasser", "${controller.itemsModel.boatSoveplasser}"),
      BoatDetailEssensiell(
          "Fart", "${controller.itemsModel.boatFartiknop} knop"),
      BoatDetailEssensiell(
          "Motormerke", "${controller.itemsModel.boatMotormerke}"),
      BoatDetailEssensiell(
          "Type motor", "${controller.itemsModel.boatMotortype}"),
      BoatDetailEssensiell(
          "Motor inkludert?", "${controller.itemsModel.boatmotorInk}"),
      BoatDetailEssensiell(
          "Byggemateriale", "${controller.itemsModel.boatByggematerial}"),
      BoatDetailEssensiell("LYS-tall", "${controller.itemsModel.boatLystall}"),
    ];

    final List<BoatDetailEssensiell> essensielleData = allData
        .where((data) =>
            data.data.isNotEmpty &&
            data.data != "0" &&
            data.data != " knop" &&
            data.data != "" &&
            data.data != "0 hk" &&
            data.data != "0 cm" &&
            data.data != "0 kg" &&
            data.data != "0 kr" &&
            data.data != "0 fot")
        .toList();

    return Container(
      margin: const EdgeInsets.only(top: 10, left: 4, right: 4),
      child: ListView.builder(
        shrinkWrap: true,
        physics: const PageScrollPhysics(),
        itemCount: essensielleData.length,
        itemBuilder: (context, index) {
          final BoatDetailEssensiell data = essensielleData[index];
          final Color tileColor = index.isEven
              ? Myisellcolors.home
              : Myisellcolors.appbar; // Change colors here

          return _buildCarDetailTile(data, tileColor);
        },
      ),
    );
  }

  Widget _buildCarDetailTile(
      BoatDetailEssensiell essensielleData, Color tileColor) {
    return essensielleData.data.isNotEmpty
        ? Container(
            padding:
                const EdgeInsets.only(left: 8, right: 8, top: 10, bottom: 10),
            color: tileColor,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  essensielleData.title,
                  style: GoogleFonts.roboto(
                      color: Myisellcolors.hvit, fontSize: 16),
                ),
                const Spacer(),
                Text(
                  essensielleData.data,
                  style: GoogleFonts.roboto(
                      color: Myisellcolors.hvit, fontSize: 16),
                ),
              ],
            ),
          )
        : const SizedBox();
  }
}
