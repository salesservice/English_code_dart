import 'package:flutter/material.dart';
import 'package:flutter_isell_new/controller/itemdeatails_controller.dart';
import 'package:flutter_isell_new/core/constants/sellx_colors.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Tekniskdata {
  final String title;
  final String data;

  Tekniskdata(this.title, this.data);
}

// ignore: must_be_immutable
class TekniskData extends StatelessWidget {
  ItemDetailsControllerImp controller = Get.put(ItemDetailsControllerImp());

  TekniskData({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Tekniskdata> allData = [
      Tekniskdata('Effekt', "${controller.itemsModel.carEffekt!} hk"),
      Tekniskdata('Rekkevidde',
          "${controller.itemsModel.carRekkevidde!}${controller.itemsModel.carRekkevidde!.isNotEmpty ? " km" : ""}"),
      Tekniskdata('Karosseri', controller.itemsModel.karosseriType!),
      Tekniskdata('Hjuldrift', controller.itemsModel.carHjuledrift!),
      Tekniskdata(
          'Sylindervolum', "${controller.itemsModel.carSylindervolum!} L"),
      Tekniskdata('Bagasjeromvolum',
          "${controller.itemsModel.bagasjeRomvolum!}${controller.itemsModel.bagasjeRomvolum!.isNotEmpty ? " L" : ""}"),
      Tekniskdata('Batteri kapasitet',
          "${controller.itemsModel.carBattericp!}${controller.itemsModel.carBattericp!.isNotEmpty ? " kWh" : ""}"),
      Tekniskdata('Girkasse', controller.itemsModel.carGirkasse!),
      Tekniskdata('Egenvekt', "${controller.itemsModel.egenvektKg!} kg"),
      Tekniskdata('Totalvekt', "${controller.itemsModel.bilTotalvekt!} kg"),
      Tekniskdata('Lengde', "${controller.itemsModel.bilTotallengde!} cm"),
      Tekniskdata('Innvendig lengde',
          "${controller.itemsModel.bilInnvendiglengde!} cm"),
      Tekniskdata('Bredde', "${controller.itemsModel.bilBredde!} cm"),
      Tekniskdata(
          'Veldlikeholdprogram', controller.itemsModel.carVedlikeholdsprogram!),
      Tekniskdata('Er bilen trimmet?', controller.itemsModel.carTrimmet!),

      // Tekniskdata("", controller.itemsModel.whyTrimmet!)
    ];

    final List<Tekniskdata> essensielleData = allData
        .where((data) =>
            data.data.isNotEmpty &&
            data.data != "0" &&
            data.data != "0 kg" &&
            data.data != "0 L" &&
            data.data != "0 hk" &&
            data.data != "0 kWh" &&
            data.data != "0 km" &&
            data.data != "0 cm" &&
            data.data != " L" &&
            data.data != " hk")
        .toList();
    return Container(
      margin: const EdgeInsets.only(top: 10, left: 4, right: 4),
      child: ListView.builder(
        shrinkWrap: true,
        physics: const PageScrollPhysics(),
        itemCount: essensielleData.length,
        itemBuilder: (context, index) {
          final Tekniskdata data = essensielleData[index];
          final Color tileColor = index.isEven
              ? Myisellcolors.home
              : Myisellcolors.appbar; // Change colors here

          return _buildCarDetailTile(data, tileColor);
        },
      ),
    );
  }

  Widget _buildCarDetailTile(Tekniskdata essensielleData, Color tileColor) {
    return essensielleData.data.isNotEmpty &&
            essensielleData.data != "0" &&
            essensielleData.data != "0 kg" &&
            essensielleData.data != "0 L" &&
            essensielleData.data != "0 hk" &&
            essensielleData.data != "0 kWh" &&
            essensielleData.data != "0 km" &&
            essensielleData.data != "0 cm" &&
            essensielleData.data != " L" &&
            essensielleData.data != " hk"
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
                Text(essensielleData.data,
                    maxLines: 2,
                    style: GoogleFonts.roboto(
                        color: Myisellcolors.hvit, fontSize: 16)),
              ],
            ),
          )
        : const SizedBox();
  }
}
