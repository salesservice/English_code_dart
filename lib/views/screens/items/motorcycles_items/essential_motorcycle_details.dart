import 'package:flutter/material.dart';
import 'package:flutter_isell_new/controller/itemdeatails_controller.dart';
import 'package:flutter_isell_new/core/constants/sellx_colors.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class McDetailEssensiell {
  final String title;
  final String data;

  McDetailEssensiell(this.title, this.data);
}

// ignore: must_be_immutable
class EssensielleMcdata extends StatelessWidget {
  EssensielleMcdata({super.key});
  ItemDetailsControllerImp controller = Get.put(ItemDetailsControllerImp());

  @override
  Widget build(BuildContext context) {
    String carprisformated =
        NumberFormat.decimalPattern().format(controller.itemsModel.itemPris);

    final List<McDetailEssensiell> allData = [
      McDetailEssensiell('Pris', "$carprisformated NOK"),
      McDetailEssensiell(
          "Chassis nummer", "${controller.itemsModel.mcChassisnr}"),
      McDetailEssensiell(
          "Fritak fra omrg.", "${controller.itemsModel.mcOmregFritak}"),
      McDetailEssensiell(
          'Omregistrering', "${controller.itemsModel.mcOmregavgift} NOK"),
      // McDetailEssensiell('Modell', "${controller.itemsModel.mcModellar}"),
      McDetailEssensiell('MC-type', controller.itemsModel.mcType!),
      McDetailEssensiell("Type ${controller.itemsModel.mcType}",
          controller.itemsModel.motorsykkelType!),
      McDetailEssensiell('Hoved farge', controller.itemsModel.mcFarge!),
      McDetailEssensiell('Tilstand', controller.itemsModel.itemTistand!),
      McDetailEssensiell("MC parkert i", controller.itemsModel.mcParkerti!),
      McDetailEssensiell("MC vekt",
          "${controller.itemsModel.mcVektkg!}${controller.itemsModel.mcVektkg == 0 ? "" : " kg"}"),
      McDetailEssensiell("Antall eiere",
          "${controller.itemsModel.mcAntalleiere == 0 ? '' : controller.itemsModel.mcAntalleiere}"),
      McDetailEssensiell(
          "Slagvolum", "${controller.itemsModel.mcSlagvolumiccm} ccm"),
      McDetailEssensiell("Har tilstandsrapport?",
          "${controller.itemsModel.mcTilstandsrappoet}"),
      McDetailEssensiell("Har vedlikeholdsprogram?",
          "${controller.itemsModel.mcVelikeholdsprogram}"),
      McDetailEssensiell("Gjenværende garanti i måneder",
          "${controller.itemsModel.mcGjenvarendeGarantiMnd}"),
      McDetailEssensiell("Gjenværende garanti i km",
          "${controller.itemsModel.mcGjenvarendeGarantiKm} km"),
    ];

    final List<McDetailEssensiell> essensielleData = allData
        .where((data) =>
            data.data.isNotEmpty &&
            data.data != '0' &&
            data.data != "" &&
            data.data != "0 NOK" &&
            data.data != "0 kg" &&
            data.data != "0 ccm" &&
            data.data != "0 km")
        .toList();
    return Container(
      child: ListView.builder(
        shrinkWrap: true,
        physics: const PageScrollPhysics(),
        itemCount: essensielleData.length,
        itemBuilder: (context, index) {
          final McDetailEssensiell data = essensielleData[index];
          final Color tileColor =
              index.isEven ? Myisellcolors.home : Myisellcolors.appbar;

          return _buildCarDetailTile(data, tileColor);
        },
      ),
    );
  }

  Widget _buildCarDetailTile(
      McDetailEssensiell essensielleData, Color tileColor) {
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
