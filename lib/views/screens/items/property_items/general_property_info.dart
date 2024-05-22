import 'package:flutter/material.dart';
import 'package:flutter_isell_new/controller/itemdeatails_controller.dart';
import 'package:flutter_isell_new/core/constants/sellx_colors.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class EiendomDetailgenerell {
  final String title;
  final String data;

  EiendomDetailgenerell(this.title, this.data);
}

// ignore: must_be_immutable
class GenerellEiendomdata extends StatelessWidget {
  ItemDetailsControllerImp controller = Get.put(ItemDetailsControllerImp());
  GenerellEiendomdata({super.key});

  @override
  Widget build(BuildContext context) {
    final List<EiendomDetailgenerell> allData = [
      EiendomDetailgenerell(
          'Primærrom', "${controller.itemsModel.primaarRom} m\u00B2"),
      EiendomDetailgenerell(
          'Bruksareal', "${controller.itemsModel.boligBruksareal} m\u00B2"),
      EiendomDetailgenerell(
          'Åpent areal', "${controller.itemsModel.apentAreal} m\u00B2"),
      EiendomDetailgenerell(
          'Tomteareal', "${controller.itemsModel.flateAreal} m\u00B2"),
      EiendomDetailgenerell(
          "Flateareal", "${controller.itemsModel.flateAreal} m\u00B2"),
      EiendomDetailgenerell(
          "Antall soverom", "${controller.itemsModel.antallSoverom}"),
      EiendomDetailgenerell(
          "Antall stuer", "${controller.itemsModel.antallStuer}"),
      EiendomDetailgenerell(
          "Total antall rom", "${controller.itemsModel.antallRom}"),
      EiendomDetailgenerell(
          "Total etasjer", "${controller.itemsModel.totalEtasje}"),
      EiendomDetailgenerell("Etasje", "${controller.itemsModel.boligEtasje}"),
      EiendomDetailgenerell(
          "Møblering", "${controller.itemsModel.mobleringLeie}"),
      EiendomDetailgenerell(
          "Renovert år", "${controller.itemsModel.boligRenovertar}"),
      EiendomDetailgenerell("Leies fra", "${controller.itemsModel.leiesFra}"),
      EiendomDetailgenerell("Leies til", "${controller.itemsModel.leiesTil}"),
    ];

    final List<EiendomDetailgenerell> essensielleData = allData
        .where((data) =>
            data.data.isNotEmpty &&
            data.data != '0 m\u00B2' &&
            data.data != '0')
        .toList();
    return Container(
      margin: const EdgeInsets.only(top: 10, left: 4, right: 4),
      child: ListView.builder(
        shrinkWrap: true,
        physics: const PageScrollPhysics(),
        itemCount: essensielleData.length,
        itemBuilder: (context, index) {
          final EiendomDetailgenerell data = essensielleData[index];
          final Color tileColor =
              index.isEven ? Myisellcolors.home : Myisellcolors.appbar;

          return _buildCarDetailTile(data, tileColor);
        },
      ),
    );
  }

  Widget _buildCarDetailTile(
      EiendomDetailgenerell essensielleData, Color tileColor) {
    return essensielleData.data.isNotEmpty &&
            essensielleData.data != '0 m\u00B2' &&
            essensielleData.data != '0'
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
