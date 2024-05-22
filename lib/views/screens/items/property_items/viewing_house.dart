import 'package:flutter/material.dart';
import 'package:flutter_isell_new/controller/itemdeatails_controller.dart';
import 'package:flutter_isell_new/core/constants/sellx_colors.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class EiendomVisningData {
  final String title;
  final String data;

  EiendomVisningData(this.title, this.data);
}

// ignore: must_be_immutable
class VisningEiendomdata extends StatelessWidget {
  ItemDetailsControllerImp controller = Get.put(ItemDetailsControllerImp());
  VisningEiendomdata({super.key});

  @override
  Widget build(BuildContext context) {
    final List<EiendomVisningData> allData = [
      EiendomVisningData(
          'Visningsdato', "${controller.itemsModel.visningDato}"),
      EiendomVisningData('Fra klokka', "${controller.itemsModel.fraKlokke}"),
      EiendomVisningData('Til klokka', "${controller.itemsModel.tilKlokke}"),
      EiendomVisningData("Merknad", "${controller.itemsModel.visningMerknad}"),
    ];

    final List<EiendomVisningData> essensielleData =
        allData.where((data) => data.data.isNotEmpty).toList();
    return Container(
      margin: const EdgeInsets.only(top: 10, left: 4, right: 4),
      child: ListView.builder(
        shrinkWrap: true,
        physics: const PageScrollPhysics(),
        itemCount: essensielleData.length,
        itemBuilder: (context, index) {
          final EiendomVisningData data = essensielleData[index];
          final Color tileColor = index.isEven
              ? Myisellcolors.home
              : Myisellcolors.appbar; // Change colors here

          return _buildCarDetailTile(data, tileColor);
        },
      ),
    );
  }

  Widget _buildCarDetailTile(
      EiendomVisningData essensielleData, Color tileColor) {
    return essensielleData.data.isNotEmpty && essensielleData.data != ''
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
                SizedBox(
                  width: 200,
                  child: Text(
                    essensielleData.data,
                    textAlign: TextAlign.end,
                    maxLines: 3,
                    style: GoogleFonts.roboto(
                      color: Myisellcolors.hvit,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          )
        : const SizedBox();
  }
}
