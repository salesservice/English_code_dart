import 'package:flutter/material.dart';
import 'package:flutter_isell_new/controller/itemdeatails_controller.dart';
import 'package:flutter_isell_new/core/constants/sellx_colors.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Utleiebil {
  final String title;
  final String data;

  Utleiebil(this.title, this.data);
}

// ignore: must_be_immutable
class UtleieData extends StatelessWidget {
  ItemDetailsControllerImp controller = Get.put(ItemDetailsControllerImp());

  UtleieData({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Utleiebil> allData = [
      Utleiebil('Startleie', "${controller.itemsModel.startleieCar!} kr"),
      Utleiebil('Månedsbeløp', "${controller.itemsModel.manedsbelopCar!} kr"),
      Utleiebil('Gjenværende kjøredistanse',
          "${controller.itemsModel.gjenvarendeKjoredistanse!}"),
      Utleiebil('Debitorskifte',
          "${controller.itemsModel.debitorskifteGebyrikr!} kr"),
      Utleiebil('Avtalen utløper', controller.itemsModel.avtalensUtlopsdato!),
      Utleiebil('Antall måneder igjen',
          "${controller.itemsModel.antallmonederTilavtalenutloper!}"),
      Utleiebil('Utleieselskap', controller.itemsModel.leieSelskap!),
      Utleiebil('Sted for levering', controller.itemsModel.stedforLevering!),
    ];

    final List<Utleiebil> essensielleData = allData
        .where((data) =>
            data.data.isNotEmpty && data.data != '0' && data.data != "null")
        .toList();
    return Container(
      margin: const EdgeInsets.only(top: 10, left: 4, right: 4),
      child: ListView.builder(
        shrinkWrap: true,
        physics: const PageScrollPhysics(),
        itemCount: essensielleData.length,
        itemBuilder: (context, index) {
          final Utleiebil data = essensielleData[index];
          final Color tileColor = index.isEven
              ? Myisellcolors.home
              : Myisellcolors.appbar; // Change colors here

          return _buildCarDetailTile(data, tileColor);
        },
      ),
    );
  }

  Widget _buildCarDetailTile(Utleiebil essensielleData, Color tileColor) {
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
