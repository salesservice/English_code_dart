import 'package:flutter/material.dart';
import 'package:flutter_isell_new/controller/itemdeatails_controller.dart';
import 'package:flutter_isell_new/core/constants/sellx_colors.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class kjoretoyshistorie {
  final String title;
  final String data;

  kjoretoyshistorie(this.title, this.data);
}

// ignore: must_be_immutable
class KjoretoysHistorie extends StatelessWidget {
  ItemDetailsControllerImp controller = Get.put(ItemDetailsControllerImp());

  KjoretoysHistorie({super.key});

  @override
  Widget build(BuildContext context) {
    final List<kjoretoyshistorie> allData = [
      kjoretoyshistorie(
          'Første gang reg.', controller.itemsModel.forstegangsReg!),
      kjoretoyshistorie(
          'Kilometerstand', "${controller.itemsModel.carKilometer!} km"),
      kjoretoyshistorie('Garantitype', controller.itemsModel.garantiType!),
      kjoretoyshistorie('Garanti inntil',
          "${controller.itemsModel.garantiVarighetk!}${controller.itemsModel.garantiVarighetk!.isNotEmpty ? " km" : ""}"),
      kjoretoyshistorie('Garantilengde',
          "${controller.itemsModel.garantiVarighetm!}${controller.itemsModel.garantiVarighetm!.isNotEmpty ? " måneder" : ""}"),
      kjoretoyshistorie('Siste EU', controller.itemsModel.sistecarEu!),
      kjoretoyshistorie('Neste EU', controller.itemsModel.nesteEufrist!),
      kjoretoyshistorie(
          'Tilstandsrapport?', controller.itemsModel.harbilenTilstandsrapport!),
      kjoretoyshistorie(
          'Vedlikeholdprogram?', controller.itemsModel.carVedlikeholdsprogram!),
      kjoretoyshistorie('Har garanti?', controller.itemsModel.harbilenGaranti!),
    ];

    final List<kjoretoyshistorie> essensielleData =
        allData.where((data) => data.data.isNotEmpty).toList();
    return Container(
      margin: const EdgeInsets.only(top: 10, left: 4, right: 4),
      child: ListView.builder(
        shrinkWrap: true,
        physics: const PageScrollPhysics(),
        itemCount: essensielleData.length,
        itemBuilder: (context, index) {
          final kjoretoyshistorie data = essensielleData[index];
          final Color tileColor = index.isEven
              ? Myisellcolors.home
              : Myisellcolors.appbar; // Change colors here

          return _buildCarDetailTile(data, tileColor);
        },
      ),
    );
  }

  Widget _buildCarDetailTile(
      kjoretoyshistorie essensielleData, Color tileColor) {
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
                Text(essensielleData.data,
                    style: GoogleFonts.roboto(
                        color: Myisellcolors.hvit, fontSize: 16)),
              ],
            ),
          )
        : const SizedBox();
  }
}
