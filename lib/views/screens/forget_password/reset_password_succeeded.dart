import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../controller/login_controller.dart';
import '../../../core/classes/handling_data_view.dart';
import '../../../core/constants/sellx_colors.dart';
import '../../../data/static/login_static.dart';
import '../../widget/sellx_ buttons.dart';

class ResetPasswordSucceeded extends GetView<InnloggingControllerImp> {
  const ResetPasswordSucceeded({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put({InnloggingControllerImp()});
    final height = MediaQuery.of(context).size.height;
    return GetBuilder<InnloggingControllerImp>(
        builder: (controller) => HandlingDataRequest(
            statusRequest: controller.statusRequest!,
            widget: Scaffold(
              backgroundColor: Myisellcolors.appbar,
              body: Column(
                children: [
                  const Expanded(flex: 3, child: SizedBox()),
                  Text(
                    innloggingList[9].title!,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.merriweather(
                        fontSize: 40,
                        fontWeight: FontWeight.w500,
                        color: Myisellcolors.hoved),
                  ),
                  const Spacer(),
                  Container(
                    alignment: const Alignment(0, -0.3),
                    child: const Icon(
                      Icons.check_circle_outline_outlined,
                      color: Myisellcolors.hoved,
                      size: 100,
                    ),
                  ),
                  const Spacer(),
                  Container(
                    margin: const EdgeInsets.only(left: 25, right: 25),
                    child: Text(
                      innloggingList[9].body!,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.baloo2(
                        color: Colors.white60,
                        fontSize: 16.4,
                      ),
                    ),
                  ),
                  const Spacer(),
                  IsellButtons(
                      size: Size(Get.width / 1.1, 60),
                      name: 'Logg Inn',
                      onPresset: () {
                        controller.gotologginn();
                      },
                      alignmen: const Alignment(0, 0.64),
                      borderradius: 90,
                      fontsize: 18,
                      bgcolor: Myisellcolors.hoved),
                  const Expanded(flex: 5, child: SizedBox()),
                ],
              ),
            )));
  }
}
