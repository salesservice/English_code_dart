import 'package:flutter/material.dart';
import 'package:flutter_isell_new/controller/itemdeatails_controller.dart';
import 'package:flutter_isell_new/core/constants/sellx_colors.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class EiendomDetailEssensiell {
  final String title;
  final String data;

  EiendomDetailEssensiell(this.title, this.data);
}

// ignore: must_be_immutable
class PrisEiendomdata extends StatelessWidget {
  ItemDetailsControllerImp controller = Get.put(ItemDetailsControllerImp());
  PrisEiendomdata({super.key});

  @override
  Widget build(BuildContext context) {
    int eiendompris = controller.itemsModel.itemPris!;
    int omkostninger = controller.itemsModel.boligOmkostninger!;
    int fellesgjed = controller.itemsModel.andelFellesgjeld!;
    int totalpriseiendom = eiendompris + omkostninger + fellesgjed;

    String totaleiendomprisformated =
        NumberFormat.decimalPattern().format(totalpriseiendom);
    String eiendomprisformated =
        NumberFormat.decimalPattern().format(eiendompris);
    String omkostningerformated = NumberFormat.decimalPattern()
        .format(controller.itemsModel.boligOmkostninger);
    String felesgjeldformated = NumberFormat.decimalPattern()
        .format(controller.itemsModel.andelFellesgjeld);
    String feleskostnaderformated = NumberFormat.decimalPattern()
        .format(controller.itemsModel.fellesKostnader);
    String fellesformueformated = NumberFormat.decimalPattern()
        .format(controller.itemsModel.andelFellesformue);
    String formueverdiformated = NumberFormat.decimalPattern()
        .format(controller.itemsModel.formuesVerdi);
    String kommunaleavgifter = NumberFormat.decimalPattern()
        .format(controller.itemsModel.kommunaleAvgiftar);
    String depsitummet = NumberFormat.decimalPattern()
        .format(controller.itemsModel.depositumLeie);
    // String felleskostnaderetteravdper = NumberFormat.decimalPattern()
    //     .format(controller.itemsModel.felleskostnaderEtteravdper);
    String verditakst =
        NumberFormat.decimalPattern().format(controller.itemsModel.verdiTakst);
    String lanetakst =
        NumberFormat.decimalPattern().format(controller.itemsModel.laneLakst);

    final List<EiendomDetailEssensiell> allData = [
      controller.itemsModel.salgLeie == "Til leie"
          ? EiendomDetailEssensiell("Pris/måned", "$eiendomprisformated kr")
          : EiendomDetailEssensiell("Pris", "$eiendomprisformated kr"),
      // EiendomDetailEssensiell(
      //     controller.itemsModel.salgLeie == "Til leie" ? 'Pris/måned' : "Pris",
      //     "$eiendomprisformated kr"),
      // controller.itemsModel.salgLeie == "Til leie"
      //     ? EiendomDetailEssensiell("Depositum", "$depsitummet kr")
      //     : EiendomDetailEssensiell("d", "$depsitummet kr"),
      EiendomDetailEssensiell("Depositum", "$depsitummet kr"),
      EiendomDetailEssensiell('Omkostninger', "$omkostningerformated kr"),
      EiendomDetailEssensiell('Fellesgjeld', "$felesgjeldformated kr"),
      EiendomDetailEssensiell(
          'Felleskostnader/mnd', "$feleskostnaderformated kr"),
      EiendomDetailEssensiell('Fellesformue', "$fellesformueformated kr"),
      EiendomDetailEssensiell('Formuesverdi', "$formueverdiformated kr"),
      controller.itemsModel.salgLeie == "Til leie"
          ? EiendomDetailEssensiell("", "")
          : EiendomDetailEssensiell(
              'Totalpris', "$totaleiendomprisformated kr"),
      EiendomDetailEssensiell(
          "Kommunale avgifter pr. år", "$kommunaleavgifter kr"),
      EiendomDetailEssensiell("Verditakst", "$verditakst kr"),
      EiendomDetailEssensiell("Lånetakst", "$lanetakst kr"),
    ];

    final List<EiendomDetailEssensiell> essensielleData = allData
        .where((data) => data.data.isNotEmpty && data.data != "0 kr")
        .toList();
    return Container(
      margin: const EdgeInsets.only(top: 10, left: 4, right: 4),
      child: ListView.builder(
        shrinkWrap: true,
        physics: const PageScrollPhysics(),
        itemCount: essensielleData.length,
        itemBuilder: (context, index) {
          final EiendomDetailEssensiell data = essensielleData[index];
          final Color tileColor = index.isEven
              ? Myisellcolors.home
              : Myisellcolors.appbar; // Change colors here

          return _buildCarDetailTile(data, tileColor);
        },
      ),
    );
  }

  Widget _buildCarDetailTile(
      EiendomDetailEssensiell essensielleData, Color tileColor) {
    return essensielleData.data.isNotEmpty && essensielleData.data != "0 kr"
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
