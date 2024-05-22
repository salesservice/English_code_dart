import 'package:flutter/material.dart';
import 'package:flutter_isell_new/controller/itemdeatails_controller.dart';
import 'package:flutter_isell_new/core/constants/sellx_colors.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class EiendomBorettslaget {
  final String title;
  final String data;

  EiendomBorettslaget(this.title, this.data);
}

// ignore: must_be_immutable
class BorettslagetEiendomdata extends StatelessWidget {
  ItemDetailsControllerImp controller = Get.put(ItemDetailsControllerImp());
  BorettslagetEiendomdata({super.key});

  @override
  Widget build(BuildContext context) {
    String festeavgift =
        NumberFormat.decimalPattern().format(controller.itemsModel.festeAvgift);
    final List<EiendomBorettslaget> allData = [
      EiendomBorettslaget(
          'Borettslagets nvan', "${controller.itemsModel.borettslagetsNavn}"),
      EiendomBorettslaget(
          'Borettslagets eier', "${controller.itemsModel.borettslagetsEier}"),
      EiendomBorettslaget('Borettslagets org.nr',
          "${controller.itemsModel.borettslagetsOrgnr}"),
      EiendomBorettslaget("Borettslagets andelsnummer",
          "${controller.itemsModel.borettslagetsAndelnr}"),
      EiendomBorettslaget('Festeår', "${controller.itemsModel.festeAar}"),
      EiendomBorettslaget('Festeavgift', "$festeavgift kr"),
      EiendomBorettslaget(
          'Forkjøpsrett', "${controller.itemsModel.forskjopsRett}")
    ];

    final List<EiendomBorettslaget> essensielleData =
        allData.where((data) => data.data.isNotEmpty).toList();
    return Container(
      margin: const EdgeInsets.only(left: 4, right: 4),
      child: ListView.builder(
        shrinkWrap: true,
        physics: const PageScrollPhysics(),
        itemCount: essensielleData.length,
        itemBuilder: (context, index) {
          final EiendomBorettslaget data = essensielleData[index];
          final Color tileColor = index.isEven
              ? Myisellcolors.home
              : Myisellcolors.appbar; // Change colors here

          return _buildCarDetailTile(data, tileColor);
        },
      ),
    );
  }

  Widget _buildCarDetailTile(
      EiendomBorettslaget essensielleData, Color tileColor) {
    return essensielleData.data.isNotEmpty &&
            essensielleData.data != '0 kr' &&
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
