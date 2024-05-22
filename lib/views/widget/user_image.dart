import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_isell_new/controller/home_page_controller.dart';
import 'package:flutter_isell_new/core/constants/sellx_colors.dart';
import 'package:flutter_isell_new/sellx_link_api.dart';
import 'package:get/get.dart';

class UserImage extends GetView<HomePageControllerImp> {
  final double radius;
  final double iconsize;
  const UserImage({super.key, required this.radius, required this.iconsize});

  @override
  Widget build(BuildContext context) {
    Get.put(HomePageControllerImp());
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.only(),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Myisellcolors.hoved),
            color: Myisellcolors.home,
          ),
          child: InkWell(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            onTap: () {},
            child: ClipOval(
              child: CircleAvatar(
                radius: radius,
                backgroundColor: Myisellcolors.appbar,
                child: controller.userimage != ''
                    ? CachedNetworkImage(
                        width: Get.width,
                        fit: BoxFit.cover,
                        //  imageBuilder: (context, imageProvider) => PhotoView(
                        //  minScale: 0.1,
                        //  maxScale: 1.0,

                        //   //disableGestures: true,
                        //   imageProvider: imageProvider,
                        //   filterQuality: FilterQuality.high,
                        // ),
                        imageUrl:
                            "${AppLink.imageuser}/${controller.userimage}",
                      )
                    // ? ClipOval(
                    //     child: CachedNetworkImage(
                    //       fit: BoxFit.cover,
                    //       // imageBuilder: (context, imageProvider) => PhotoView(
                    //       //   minScale: 0.1,
                    //       //   maxScale: 1.0,

                    //       //   //disableGestures: true,
                    //       //   imageProvider: imageProvider,
                    //       //   filterQuality: FilterQuality.high,
                    //       // ),
                    //       imageUrl:
                    //           "${AppLink.imageuser}/${controller.userimage}",
                    //     ),
                    //   )
                    : Icon(
                        Icons.person,
                        color: Myisellcolors.hvit70,
                        size: iconsize,
                      ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
