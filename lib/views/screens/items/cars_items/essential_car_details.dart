// import 'package:flutter/material.dart';
// import 'package:flutter_isell_new/controller/itemdeatails_controller.dart';
// import 'package:flutter_isell_new/core/constants/isellcolors.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:intl/intl.dart';

// class CarDetailEssensiell {
//   final String title;
//   final String data;

//   CarDetailEssensiell(this.title, this.data);
// }

// // ignore: must_be_immutable
// class Essensiellecardata extends StatelessWidget {
//   Essensiellecardata({super.key});
//   ItemDetailsControllerImp controller = Get.put(ItemDetailsControllerImp());

//   @override
//   Widget build(BuildContext context) {
//     String carprisformated =
//         NumberFormat.decimalPattern().format(controller.itemsModel.itemPris);

//     final List<CarDetailEssensiell> essensielleData = [
//       CarDetailEssensiell('Pris', carprisformated),
//       CarDetailEssensiell(
//           'Omregistrering', "${controller.itemsModel.omregnetAvgift} NOK"),
//       CarDetailEssensiell('Modell', controller.itemsModel.carModellar!),
//       CarDetailEssensiell('Hoved farge', "${controller.itemsModel.carFarge}"),
//       CarDetailEssensiell(
//           'Ineriør farge', "${controller.itemsModel.interiRFarge}"),
//       CarDetailEssensiell('Tilstand', controller.itemsModel.carTilstand!),
//       CarDetailEssensiell(
//           "Kjøretøyet parkert i", controller.itemsModel.carStR!),
//       CarDetailEssensiell("Kjøretøyets vekt",
//           "${controller.itemsModel.egenvektKg!}${controller.itemsModel.egenvektKg!.isNotEmpty ? " kg" : ""}"),
//       CarDetailEssensiell("Maks. tilhengervekt",
//           "${controller.itemsModel.maksTilhengervekt!}${controller.itemsModel.maksTilhengervekt!.isNotEmpty ? " kg" : ""}"),
//       CarDetailEssensiell(
//           'Antall seter', "${controller.itemsModel.antallSeter}"),
//       CarDetailEssensiell("Antall dør", "${controller.itemsModel.antallDR}"),
//       CarDetailEssensiell(
//           "Chassis nummer", "${controller.itemsModel.carChassis}"),
//       CarDetailEssensiell(
//           "Antall eiere", "${controller.itemsModel.antallEiere}"),
//       CarDetailEssensiell(
//           "Avgiftsklasse", "${controller.itemsModel.avgiftKlasse}"),
//       CarDetailEssensiell("CO\u2082-utslipp",
//           "${controller.itemsModel.carCo2utslipp}${controller.itemsModel.carCo2utslipp!.isNotEmpty ? " g/km" : ""}"),
//     ];
//     return ListView.builder(
//       shrinkWrap: true,
//       physics: const PageScrollPhysics(),
//       itemCount: essensielleData.length,
//       itemBuilder: (context, index) {
//         return _buildCarDetailTile(essensielleData[index]);
//       },
//     );
//   }

//   Widget _buildCarDetailTile(CarDetailEssensiell essensielleData) {
//     return essensielleData.data.isNotEmpty
//         ? Container(
//             padding: const EdgeInsets.only(left: 8, right: 8, top: 12),
//             child: Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   essensielleData.title,
//                   style: GoogleFonts.roboto(
//                       color: Myisellcolors.hvit, fontSize: 16),
//                 ),
//                 const Spacer(),
//                 Text(
//                   essensielleData.data,
//                   style: GoogleFonts.roboto(
//                       color: Myisellcolors.hvit, fontSize: 16),
//                 ),
//               ],
//             ),
//           )
//         : const SizedBox();
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_isell_new/controller/itemdeatails_controller.dart';
import 'package:flutter_isell_new/core/constants/sellx_colors.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class CarDetailEssensiell {
  final String title;
  final String data;

  CarDetailEssensiell(this.title, this.data);
}

class Essensiellecardata extends StatelessWidget {
  Essensiellecardata({Key? key});
  ItemDetailsControllerImp controller = Get.put(ItemDetailsControllerImp());

  @override
  Widget build(BuildContext context) {
    String carprisformated =
        NumberFormat.decimalPattern().format(controller.itemsModel.itemPris);

    final List<CarDetailEssensiell> allData = [
      CarDetailEssensiell("Kjøretøyetstype", controller.itemsModel.carType!),
      CarDetailEssensiell('Fritak fra omregistrering',
          "${controller.itemsModel.fritakFraCaromreg}"),
      CarDetailEssensiell(
          'Omregistrering', "${controller.itemsModel.omregnetAvgift} NOK"),
      CarDetailEssensiell('Pris', "$carprisformated NOK"),
      CarDetailEssensiell('Årsmodell', controller.itemsModel.carModellar!),
      CarDetailEssensiell('Hoved farge', "${controller.itemsModel.carFarge}"),
      CarDetailEssensiell(
          'Ineriør farge', "${controller.itemsModel.interiorFarge}"),
      CarDetailEssensiell('Tilstand', controller.itemsModel.carTilstand!),
      CarDetailEssensiell(
          "Kjøretøyet parkert i", controller.itemsModel.carStar!),
      CarDetailEssensiell("Kjøretøyets vekt",
          "${controller.itemsModel.egenvektKg!}${controller.itemsModel.egenvektKg!.isNotEmpty ? " kg" : ""}"),
      CarDetailEssensiell("Maks. tilhengervekt",
          "${controller.itemsModel.maksTilhengervekt!}${controller.itemsModel.maksTilhengervekt!.isNotEmpty ? " kg" : ""}"),
      CarDetailEssensiell(
          'Antall seter', "${controller.itemsModel.antallSeter}"),
      CarDetailEssensiell(
          'Antall soveplasser', "${controller.itemsModel.bilSoveplasser}"),
      CarDetailEssensiell('Seng type', "${controller.itemsModel.sengType}"),
      CarDetailEssensiell("Antall dør", "${controller.itemsModel.antallDor}"),
      CarDetailEssensiell(
          "Chassis nummer", "${controller.itemsModel.carChassis}"),
      CarDetailEssensiell(
          "Antall eiere", "${controller.itemsModel.antallEiere}"),
      CarDetailEssensiell(
          "Avgiftsklasse", "${controller.itemsModel.avgiftKlasse}"),
      CarDetailEssensiell("CO\u2082-utslipp",
          "${controller.itemsModel.carCo2utslipp}${controller.itemsModel.carCo2utslipp!.isNotEmpty ? " g/km" : ""}"),
    ];

    final List<CarDetailEssensiell> essensielleData = allData
        .where((data) =>
            data.data.isNotEmpty &&
            data.data != '0' &&
            data.data != "null" &&
            data.data != "0 NOK")
        .toList();

    return Container(
      margin: const EdgeInsets.only(top: 10, left: 4, right: 4),
      child: ListView.builder(
        shrinkWrap: true,
        physics: const PageScrollPhysics(),
        itemCount: essensielleData.length,
        itemBuilder: (context, index) {
          final CarDetailEssensiell data = essensielleData[index];
          final Color tileColor = index.isEven
              ? Myisellcolors.home
              : Myisellcolors.appbar; // Change colors here

          return _buildCarDetailTile(data, tileColor);
        },
      ),
    );
  }

  Widget _buildCarDetailTile(
      CarDetailEssensiell essensielleData, Color tileColor) {
    return essensielleData.data.isNotEmpty &&
            essensielleData.data != "0" &&
            essensielleData.data != "null" &&
            essensielleData.data != "0 NOK"
        ? Container(
            padding:
                const EdgeInsets.only(left: 8, right: 8, top: 10, bottom: 10),
            color: tileColor, // Use the provided color for the container
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
