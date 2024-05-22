import 'package:flutter/material.dart';
import 'package:flutter_isell_new/controller/notifications_controller.dart';
import 'package:flutter_isell_new/core/classes/handling_data_view.dart';
import 'package:flutter_isell_new/core/constants/sellx_colors.dart';
import 'package:flutter_isell_new/views/screens/home/navbar.dart';
import 'package:flutter_isell_new/views/screens/home/notificcation.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Varsler extends StatelessWidget {
  const Varsler({super.key});

  @override
  Widget build(BuildContext context) {
    NotificationController notificationController =
        Get.put(NotificationController());
    return Scaffold(
      backgroundColor: Myisellcolors.home,
      appBar: AppBar(
        elevation: 0,
        iconTheme: const IconThemeData(color: Myisellcolors.hvit),
        actions: [
          Builder(
            builder: (context) => IconButton(
              icon: const Icon(
                Icons.menu_rounded,
                size: 30,
                color: Myisellcolors.hvit,
              ),
              padding: const EdgeInsets.only(right: 20, top: 5),
              onPressed: () => Scaffold.of(context).openEndDrawer(),
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            ),
          ),
        ],
        toolbarHeight: 65,
        backgroundColor: Myisellcolors.home,
        title: Container(
          alignment: Alignment.centerLeft,
          child: Text(
            "Varslinger",
            style: GoogleFonts.baloo2(fontSize: 20, color: Myisellcolors.hvit),
          ),
        ),
      ),
      endDrawer: const NavBar(),
      body: GetBuilder<NotificationController>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: notificationController.data.length,
            itemBuilder: (context, index) {
              return NotificationView(
                key: UniqueKey(),
                notificationModel: notificationController.data[index],
              );
            },
          ),
        ),
      ),
    );
  }
}
