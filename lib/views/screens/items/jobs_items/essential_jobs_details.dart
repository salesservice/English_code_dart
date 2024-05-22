import 'package:flutter/material.dart';
import 'package:flutter_isell_new/controller/itemdeatails_controller.dart';
import 'package:flutter_isell_new/core/constants/sellx_colors.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class JobbDetailEssensiell {
  final String title;
  final String data;

  JobbDetailEssensiell(this.title, this.data);
}

// ignore: must_be_immutable
class Jobbdata extends StatelessWidget {
  ItemDetailsControllerImp controller = Get.put(ItemDetailsControllerImp());
  Jobbdata({super.key});

  @override
  Widget build(BuildContext context) {
    final List<JobbDetailEssensiell> allData = [
      JobbDetailEssensiell(
          'Stillingstittel', controller.itemsModel.jobbStillingtitel!),
      JobbDetailEssensiell('Arbeidssted', controller.itemsModel.jobbSted!),
      JobbDetailEssensiell('Bransje', controller.itemsModel.jobbBransje!),
      JobbDetailEssensiell(
          'Sitllingsfunksjon', controller.itemsModel.jobbStillingsfunksjon!),
      JobbDetailEssensiell(
          'Hjemmekontro', controller.itemsModel.jobbHjemmekontor!),
      JobbDetailEssensiell('Arbeidsspråk', controller.itemsModel.arbeidSprak!),
      JobbDetailEssensiell('Arbeidssted',
          "${controller.itemsModel.itemBy!}${controller.itemsModel.itemPostn}, ${controller.itemsModel.itemGata}"),
      JobbDetailEssensiell(
          'Stillingstype', controller.itemsModel.jobbDelheltid!),
    ];

    final List<JobbDetailEssensiell> essensielleData =
        allData.where((data) => data.data.isNotEmpty).toList();
    return Container(
      margin: const EdgeInsets.only(top: 10, left: 4, right: 4),
      child: ListView.builder(
        shrinkWrap: true,
        physics: const PageScrollPhysics(),
        itemCount: essensielleData.length,
        itemBuilder: (context, index) {
          final JobbDetailEssensiell data = essensielleData[index];
          final Color tileColor = index.isEven
              ? Myisellcolors.home
              : Myisellcolors.appbar; // Change colors here

          return _buildCarDetailTile(data, tileColor);
        },
      ),
    );
  }

  Widget _buildCarDetailTile(
      JobbDetailEssensiell essensielleData, Color tileColor) {
    return essensielleData.data.isNotEmpty
        ? Container(
            //height: essensielleData.data.length > 50 ? 90 : 70,
            padding:
                const EdgeInsets.only(left: 8, right: 8, top: 12, bottom: 12),
            color: tileColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  essensielleData.title,
                  style: GoogleFonts.roboto(
                    color: Myisellcolors.hvit,
                    fontSize: 17,
                  ),
                ),
                const SizedBox(
                  height: 7,
                ),
                //const Spacer(),
                Text(
                  essensielleData.data,
                  style: GoogleFonts.roboto(
                    color: Myisellcolors.hvit70,
                    height: 1.4,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          )
        : const SizedBox();
  }
}
