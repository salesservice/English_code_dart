import 'package:flutter/material.dart';
import 'package:flutter_isell_new/controller/stories/items_details_from_stroy_controller.dart';
import 'package:flutter_isell_new/controller/stories/stories_controller.dart';
import 'package:flutter_isell_new/core/constants/sellx_colors.dart';
import 'package:flutter_isell_new/sellx_link_api.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view_gallery.dart';

class ItemDetailsFromStory extends StatelessWidget {
  const ItemDetailsFromStory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ItemDetailsFromStoryControllerImp controller =
        Get.put(ItemDetailsFromStoryControllerImp());
    Get.put(StoriControllerImp());
    return Scaffold(
      backgroundColor: Myisellcolors.home,
      appBar: AppBar(
        backgroundColor: Myisellcolors.home,
        elevation: 0,
      ),
      body: Container(
        child: ListView(
          children: [
            Stack(
              children: [
                Container(
                  height: 230,
                  margin: const EdgeInsets.only(left: 5, right: 5),
                  decoration: BoxDecoration(
                    color: Myisellcolors.home,
                    border: Border.all(color: Myisellcolors.home),
                  ),
                  child: Container(
                    // transitionOnUserGestures: true,
                    // tag: "${controller.storyModell!.itemId}",
                    child: PhotoViewGallery.builder(
                        backgroundDecoration: const BoxDecoration(
                          color: Color.fromARGB(255, 2, 11, 25),
                        ),
                        itemCount: 1,
                        builder: (BuildContext context, int index) {
                          String myImg =
                              "${AppLink.imageitems}/${controller.storyModell.itemIamge!}";
                          return PhotoViewGalleryPageOptions(
                            disableGestures: true,
                            initialScale: 0.5,
                            imageProvider: NetworkImage(
                              myImg,
                              scale: 2.0,
                            ),
                          );
                        }),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
