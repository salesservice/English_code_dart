import 'package:flutter/material.dart';
import 'package:flutter_isell_new/controller/itemdeatails_controller.dart';
import 'package:flutter_isell_new/core/constants/sellx_colors.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class McUtstyr extends StatelessWidget {
  ItemDetailsControllerImp controller = Get.put(ItemDetailsControllerImp());
  McUtstyr({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> essensielleData =
        controller.itemsModel.mcUtstyr!.split(', ');

    return GridView.builder(
      shrinkWrap: true,
      physics: const PageScrollPhysics(),
      itemCount: essensielleData.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisExtent: 33,
      ),
      itemBuilder: (context, index) {
        return _buildCarDetailTile(essensielleData[index]);
      },
    );
  }

  Widget _buildCarDetailTile(String essensielleData) {
    return essensielleData.isNotEmpty
        ? Container(
            height: 100,
            padding: const EdgeInsets.only(left: 8, right: 8, top: 12),
            child: Text(
              essensielleData,
              style:
                  GoogleFonts.roboto(color: Myisellcolors.hvit, fontSize: 16),
            ))
        : const SizedBox();
  }
}
