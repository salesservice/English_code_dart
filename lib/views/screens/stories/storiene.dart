import 'package:flutter/material.dart';
import 'package:flutter_isell_new/controller/items_controller.dart';
import 'package:flutter_isell_new/controller/stories/stories_controller.dart';
import 'package:flutter_isell_new/core/constants/sellx_colors.dart';
import 'package:flutter_isell_new/data/model/story_model.dart';
import 'package:flutter_isell_new/sellx_link_api.dart';
import 'package:flutter_isell_new/views/screens/stories/story_button.dart';
import 'package:flutter_isell_new/views/screens/stories/story_list_view.dart';
import 'package:flutter_isell_new/views/screens/stories/story_page_scaffold.dart';
import 'package:flutter_isell_new/views/screens/stories/story_page_transform.dart';
import 'package:flutter_isell_new/views/widget/sellx_%20buttons.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class StoryExamplePage extends StatefulWidget {
  final stcon = Get.put(StoriControllerImp());
  final itmcon = Get.put(ItemControllerImp());
  final StoryModell storyModell;
  StoryExamplePage({
    super.key,
    required this.storyModell,
  });

  @override
  State<StoryExamplePage> createState() => _StoryExamplePageState();
}

class _StoryExamplePageState extends State<StoryExamplePage> {
  @override
  void initState() {
    super.initState();
    Get.put(StoriControllerImp());
    Get.put(ItemControllerImp());
  }

  Widget _createDummyPage({
    required String text,
    required dynamic imageName,
    required String bgimage,
    required String username,
    required String storycreate,
    required IsellButtons isellButtons,
    bool addBottomBar = true,
  }) {
    Get.put(StoriControllerImp());
    return StoryPageScaffold(
      bottomNavigationBar: addBottomBar
          ? SizedBox(
              width: double.infinity,
              height: kBottomNavigationBarHeight,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8.0,
                  horizontal: 20.0,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Myisellcolors.hvit,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(
                            50.0,
                          ),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.send,
                        color: Myisellcolors.hvit,
                      ),
                    ),
                  ],
                ),
              ),
            )
          : const SizedBox.shrink(),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  imageName,
                ),
                fit: BoxFit.contain,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    text,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 23, left: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Myisellcolors.hoved)),
                  child: CircleAvatar(
                    radius: 21,
                    backgroundImage: NetworkImage(bgimage),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 6),
                      child: Text(
                        username,
                        style: GoogleFonts.poppins(
                            fontSize: 11, color: Myisellcolors.hvit),
                      ),
                    ),
                    Text(
                      storycreate,
                      style: GoogleFonts.poppins(
                          fontSize: 11, color: Myisellcolors.hvit),
                    ),
                  ],
                ),
                isellButtons
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //Get.put(StoriControllerImp());

    String getTimeDifference(String storyCreate) {
      DateTime createStory = DateTime.parse(storyCreate);
      DateTime now = DateTime.now();
      int differenceInMinutes = now.difference(createStory).inMinutes;
      int differenceInHours = now.difference(createStory).inHours;
      if (differenceInMinutes < 1) {
        return "just now";
      } else if (differenceInHours < 1) {
        return "$differenceInMinutes minute${differenceInMinutes != 1 ? 's' : ''} ago";
      } else {
        return "$differenceInHours hour${differenceInHours != 1 ? 's' : ''} ago";
      }
    }

    List<StoryButtonData> buttonDatas = [];
    for (var story in widget.stcon.stories) {
      StoryModell storyModell = StoryModell.fromJson(story);
      String setning = "${storyModell.userFname}";
      List<String> ord = setning.split(" ");

      StoryButtonData buttonData = StoryButtonData(
        timelineBackgroundColor: Myisellcolors.hoved,
        buttonDecoration: BoxDecoration(
          image: DecorationImage(
            image:
                NetworkImage('${AppLink.imageuser}/${storyModell.userImage}'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 99),
              child: Text(
                ord[0],
                textAlign: TextAlign.center,
                style:
                    GoogleFonts.baloo2(color: Myisellcolors.hvit, fontSize: 14),
              ),
            ),
          ],
        ),
        borderDecoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
          border: Border.fromBorderSide(
            BorderSide(
              color: Myisellcolors.hoved,
              width: 1.7,
            ),
          ),
        ),
        storyPages: [
          _createDummyPage(
              isellButtons: IsellButtons(
                  size: const Size(100, 100),
                  name: "see post",
                  onPresset: () {
                    widget.stcon.goToItemsFromStory(storyModell);
                  },
                  alignmen: Alignment.center,
                  borderradius: 12,
                  fontsize: 13,
                  bgcolor: Myisellcolors.hoved),
              text: storyModell.storyBeskrivelse!,
              imageName: '${AppLink.storyimage}/${storyModell.storyImage}',
              bgimage: '${AppLink.imageuser}/${storyModell.userImage}',
              username: storyModell.userFname!,
              storycreate: getTimeDifference(storyModell.storyCreate!)),
        ],
        segmentDuration: const Duration(seconds: 10),
      );

      buttonDatas.add(buttonData);
    }

    return StoryListView(
        pageTransform: const StoryPage3DTransform(), buttonDatas: buttonDatas);
  }
}

class Storiene extends GetView<StoriControllerImp> {
  const Storiene({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(StoriControllerImp());
    return SizedBox(
      height: 141,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 1,
        itemBuilder: (context, index) {
          return StoryExamplePage(
              storyModell: StoryModell.fromJson(controller.stories[index]));
        },
      ),
    );
  }
}

class StorieneHoved extends StatelessWidget {
  const StorieneHoved({super.key});

  @override
  Widget build(BuildContext context) {
    StoriControllerImp storiControllerImp = Get.put(StoriControllerImp());
    return SizedBox(
        //height: 141,
        child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 1,
      itemBuilder: (context, index) {
        return StoryExamplePage(
            storyModell:
                StoryModell.fromJson(storiControllerImp.stories[index]));
      },
    ));
  }
}
