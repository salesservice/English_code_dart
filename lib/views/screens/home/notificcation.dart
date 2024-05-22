import 'package:flutter/material.dart';
import 'package:flutter_isell_new/controller/notifications_controller.dart';
import 'package:flutter_isell_new/core/classes/handling_data_view.dart';
import 'package:flutter_isell_new/core/constants/sellx_colors.dart';
import 'package:flutter_isell_new/data/model/notifications_model.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationView extends StatelessWidget {
  final NotificationModel notificationModel;
  const NotificationView({super.key, required this.notificationModel});

  @override
  Widget build(BuildContext context) {
    Get.put(NotificationController());
    return Container(
      child: GetBuilder<NotificationController>(
        builder: (controller) => HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: Column(
              children: <Widget>[
                Dismissible(
                  key: UniqueKey(),
                  background: Container(
                    color: Colors.red,
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.only(right: 20.0),
                    child: const Icon(
                      Icons.delete,
                      color: Colors.white,
                      size: 32.0,
                    ),
                  ),
                  onDismissed: (direction) {
                    controller.deleteNoti(notificationModel.notificationId!);
                    // Handle the delete action here
                    // You can use the `notification` object to identify the item to delete
                  },
                  child: Stack(
                    children: [
                      ListTile(
                        tileColor: Myisellcolors.appbar,
                        onTap: () {},
                        title: Text(
                          notificationModel.notificationTitle!,
                          style: GoogleFonts.roboto(color: Myisellcolors.hvit),
                        ),
                        subtitle: Text(
                          notificationModel.notificationBody!,
                          style: GoogleFonts.roboto(color: Myisellcolors.hvit),
                        ),
                      ),
                      // Positioned(
                      //   right: 8,
                      //   top: 27,
                      //   child: Text(
                      //     Jiffy(notificationModel.notificationTime,
                      //             "yyyy-MM-dd")
                      //         .fromNow(),
                      //     style: GoogleFonts.roboto(color: Myisellcolors.hvit),
                      //   ),
                      // )
                    ],
                  ),
                ),
                if (notificationModel != controller.data.last)
                  const Divider(
                    height: 2,
                    color: Myisellcolors.blak,
                  ),
              ],
            )),
      ),
    );
  }
}
