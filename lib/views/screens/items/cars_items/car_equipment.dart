import 'package:flutter/material.dart';
import 'package:flutter_isell_new/controller/itemdeatails_controller.dart';
import 'package:flutter_isell_new/core/constants/sellx_colors.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class CarUtstyr extends StatelessWidget {
  ItemDetailsControllerImp controller = Get.put(ItemDetailsControllerImp());
  CarUtstyr({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> essensielleData = controller.itemsModel.carUtstyr!.split(', ');

    // Categories and their corresponding lists
    Map<String, List<String>> categories = {
      'Eksteriør': [
        "Sommerhjul",
        "Støtteben",
        "Sykkelstativ",
        "Vinterhjul",
        "Metallic lakk",
        "Markise",
        "Hengerfeste, fast krok",
        "Helårsdekk",
        "Hengerfeste, avtagbart/svingbart",
        "Lasteholdere/skistativ",
        "Lettmet. felg sommer",
        "Lettmet. felg vinter",
        "Lettmetallfelger",
        "Takralis",
        "Xenonlys",
        "Led-lys",
        "Laserlys",
        "Takgrind/Stige"
      ],
      'Sikkerhet': [
        "Sentrallås",
        "Airbag foran",
        "Sideairebager",
        "ABS-bremser",
        "Alarm",
        "Gjenfinningssystem",
        "Gassalarm",
        "Bilalarm",
        "Airbag fører",
        "Airbag passasjer",
        "Isofix",
        "Startsperre",
      ],
      'Interiør': [
        "El.vinduer",
        "Elektrisk speil",
        "Soltak/glasstak",
        "Mørke ruter bak",
        "Seter i delskinn",
        "Seter i helskinn",
        "Sortseter",
        "Gassuttak",
        "Kjøleskap",
        "Mikrobølgeovn",
        "Stekeovn",
        "Elektriske speil",
        "Elektriske vinduer",
        "Skinninteriør",
        "Løse tepper",
        "Røykfri"
      ],
      'Media/Underholdning': [
        "CD-spiller",
        "Kassettspiller",
        "AUX-inngang",
        "Bluetooth",
        "Hnasfree opplegg",
        "Head Up Display",
        "Multifunksjonsratt",
        "Navigasjonssystem",
        "Original telefon",
        "Radio DAB+",
        "Radio FM",
        "TV-skjerm i baksetet",
        "DVD",
        "TV",
        "Automatisk parabol",
        "Manuell parabol",
        "TV-antenne",
        "Radio/CD"
      ],
      'Komfort': [
        "Oppvarmede seter",
        "Klimaanlegg",
        "Cruisekontroll Adaptiv",
        "Air Condition",
        "Bagasjeromstrekk",
        "Elektrisk sete m.memory",
        "Elektrisk sete u.memory",
        "Kupevarmer",
        "Luftfjæring",
        "Midtarlene",
        "Motorvarmer",
        "Nivåregulering",
        "Nøkkelløs start",
        "Luftfjæring",
        "Klimaanlegg bildel",
        "Klimaanlegg bodel",
        "Elvarme",
        "Luftvarme",
        "Gulvvarme",
        "Vannbåren varme",
        "Tilleggsvarme (f.eks Vebasto)",
        "Varmtvann",
        "Frostfri vanntank",
        "Frostfri spillevanntank",
        "Fast toalett",
        "Myggdør"
      ],
      'Motor/Drivverk': [
        "Sensorstyring",
        "Antispinn",
        "Diff.sperre",
        "Antiskrens",
        "Diesel-partikkelfilter",
        "Diesel-partikkelfilter",
        "Kjørecomputer",
        "Sentrallås",
      ],
      'Førerassistanse': [
        "Fjernlysassistent",
        "Lyssensor",
        "Metallic lakk",
        "Parkeringsenson bak",
        "Parkeringsenson foran",
        "Regnsensor",
        "Ryggekamera",
        "Cruisekontroll",
        "Kjørecomputer",
        "Navigasjonssystem"
      ],
    };

    // Extract items that are not in any category
    List<String> otherItems = essensielleData
        .where((item) => !categories.values.any((list) => list.contains(item)))
        .toList();

    return ListView(
      shrinkWrap: true,
      physics: const PageScrollPhysics(),
      children: [
        for (var entry in categories.entries)
          if (entry.value.any((item) => essensielleData.contains(item)))
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Display the title in bold
                _buildTitle(entry.key),
                // Display the categoryItems with a circle
                for (String item in entry.value)
                  if (essensielleData.contains(item)) _buildCarDetailTile(item),
              ],
            ),
        // Display other items under the title "Utstyr"
        if (otherItems.isNotEmpty)
          _buildTitle(controller.itemsModel.carType == "Campingvogn"
              ? "Utstyrene"
              : "Andre utstyr"),
        for (String item in otherItems) _buildCarDetailTile(item),
      ],
    );
  }

  Widget _buildTitle(String title) {
    return Container(
      padding: const EdgeInsets.only(left: 8, right: 8, top: 12),
      child: Text(
        title,
        style: GoogleFonts.roboto(
          color: Myisellcolors.hvit,
          fontSize: 21,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildCarDetailTile(String essensielleData) {
    return essensielleData.isNotEmpty
        ? Container(
            padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
            child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 8, left: 10),
                  width: 5,
                  height: 5,
                  decoration: const BoxDecoration(
                    color: Myisellcolors.hvit,
                    shape: BoxShape.circle,
                  ),
                ),
                Text(
                  essensielleData,
                  style: GoogleFonts.roboto(
                    color: Myisellcolors.hvit,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          )
        : const SizedBox();
  }
}
