import 'package:flutter/material.dart';
import 'package:flutter_isell_new/controller/itemdeatails_controller.dart';
import 'package:flutter_isell_new/core/constants/sellx_colors.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class SellxDetailEssensiell {
  final String title;
  final String data;

  SellxDetailEssensiell(this.title, this.data);
}

// ignore: must_be_immutable
class SellxdataList extends StatelessWidget {
  ItemDetailsControllerImp controller = Get.put(ItemDetailsControllerImp());
  SellxdataList({super.key});

  @override
  Widget build(BuildContext context) {
    String itempris =
        NumberFormat.decimalPattern().format(controller.itemsModel.itemPris);

    final List<SellxDetailEssensiell> essensielleData = [
      SellxDetailEssensiell('Pris', itempris),
      SellxDetailEssensiell('Tilstand', "${controller.itemsModel.itemTistand}"),
      SellxDetailEssensiell('Merke', "${controller.itemsModel.itemMerke}"),
      SellxDetailEssensiell("Varen er", "${controller.itemsModel.salgLeie}")
    ];
    return Container(
      margin: const EdgeInsets.only(top: 10, left: 4, right: 4),
      child: ListView.builder(
        shrinkWrap: true,
        physics: const PageScrollPhysics(),
        itemCount: essensielleData.length,
        itemBuilder: (context, index) {
          final SellxDetailEssensiell data = essensielleData[index];
          final Color tileColor = index.isEven
              ? Myisellcolors.home
              : Myisellcolors.appbar; // Change colors here

          return _buildCarDetailTile(data, tileColor);
        },
      ),
    );
  }

  Widget _buildCarDetailTile(
      SellxDetailEssensiell essensielleData, Color tileColor) {
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
