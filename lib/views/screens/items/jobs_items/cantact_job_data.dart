import 'package:flutter/material.dart';
import 'package:flutter_isell_new/controller/itemdeatails_controller.dart';
import 'package:flutter_isell_new/core/constants/sellx_colors.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class JobbDetailKontakt {
  final String title;
  final String data;

  JobbDetailKontakt(this.title, this.data);
}

// ignore: must_be_immutable
class JobbKontaktdata extends StatelessWidget {
  ItemDetailsControllerImp controller = Get.put(ItemDetailsControllerImp());
  JobbKontaktdata({super.key});

  @override
  Widget build(BuildContext context) {
    String formatPhoneNumber(String phoneNumber) {
      String cleanedNumber = phoneNumber.replaceAll(RegExp(r'[^0-9]'), '');
      String formattedNumber = '+47 ${cleanedNumber.replaceAllMapped(
            RegExp(r'.{2}'),
            (match) => '${match.group(0)} ',
          ).trim()}';
      return formattedNumber;
    }

    final List<JobbDetailKontakt> allData = [
      JobbDetailKontakt(
          'Hoved kontaktperson', controller.itemsModel.kontaktPerson!),
      JobbDetailKontakt('Mobil (Hoved kontaktperson)',
          formatPhoneNumber("${controller.itemsModel.itemTelefon}")),
      JobbDetailKontakt('Stilling (Hoved kontaktperson)',
          controller.itemsModel.stillingKontaktperon1!),
      JobbDetailKontakt(
          'Neste kontaktperson', controller.itemsModel.jobbKontaktperson!),
      JobbDetailKontakt('Mobil (Neste kontaktperson)',
          formatPhoneNumber("${controller.itemsModel.jobbTelefonkontaktpers}")),
      JobbDetailKontakt('Stilling (Neste kontaktperson)',
          controller.itemsModel.stillingKontaktperon2!)
    ];
    final List<JobbDetailKontakt> essensielleData = allData
        .where((data) =>
            data.data.isNotEmpty &&
            data.data != "0" &&
            data.data != "+47 0" &&
            data.data != 0)
        .toList();
    return Container(
      margin: const EdgeInsets.only(top: 10, left: 4, right: 4),
      child: ListView.builder(
        shrinkWrap: true,
        physics: const PageScrollPhysics(),
        itemCount: essensielleData.length,
        itemBuilder: (context, index) {
          final JobbDetailKontakt data = essensielleData[index];
          final Color tileColor =
              index.isEven ? Myisellcolors.home : Myisellcolors.appbar;

          return _buildCarDetailTile(data, tileColor);
        },
      ),
    );
  }

  Widget _buildCarDetailTile(
      JobbDetailKontakt essensielleData, Color tileColor) {
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
