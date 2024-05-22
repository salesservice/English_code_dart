import 'package:flutter/material.dart';
import 'package:flutter_isell_new/controller/itemdeatails_controller.dart';
import 'package:flutter_isell_new/core/constants/sellx_colors.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class EiendomAdress {
  final String title;
  final String data;

  EiendomAdress(this.title, this.data);
}

// ignore: must_be_immutable
class AdresseEiendomdata extends StatelessWidget {
  ItemDetailsControllerImp controller = Get.put(ItemDetailsControllerImp());
  AdresseEiendomdata({super.key});

  @override
  Widget build(BuildContext context) {
    final List<EiendomAdress> allData = [
      controller.itemsModel.salgLeie == "Til leie"
          ? EiendomAdress("", "")
          : EiendomAdress('Byen', "${controller.itemsModel.itemBy}"),
      EiendomAdress(
          'Kommune nummer', "${controller.itemsModel.boligKommunenr}"),
      EiendomAdress('Gårdesnummer', "${controller.itemsModel.boligGarsnummer}"),
      EiendomAdress("Bruksnummer", "${controller.itemsModel.boligBruksnummer}"),
      EiendomAdress(
          "Seksjonsnummer", "${controller.itemsModel.boligSeksjonsnr}"),
      EiendomAdress("Festenummer", "${controller.itemsModel.boligFestenummer}"),
      EiendomAdress(
          "Leiglighetsnummer", "${controller.itemsModel.leilighetsNummer}"),
    ];

    final List<EiendomAdress> essensielleData =
        allData.where((data) => data.data.isNotEmpty).toList();
    return Container(
      margin: const EdgeInsets.only(left: 4, right: 4),
      child: ListView.builder(
        shrinkWrap: true,
        physics: const PageScrollPhysics(),
        itemCount: essensielleData.length,
        itemBuilder: (context, index) {
          final EiendomAdress data = essensielleData[index];
          final Color tileColor = index.isEven
              ? Myisellcolors.home
              : Myisellcolors.appbar; // Change colors here

          return _buildCarDetailTile(data, tileColor);
        },
      ),
    );
  }

  Widget _buildCarDetailTile(EiendomAdress essensielleData, Color tileColor) {
    return essensielleData.data.isNotEmpty && essensielleData.data != '0'
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
