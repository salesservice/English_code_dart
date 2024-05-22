import 'package:flutter_isell_new/core/services/services.dart';
import 'package:flutter_isell_new/data/model/story_model.dart';
import 'package:get/get.dart';

abstract class ItemDetailsFromStoryController extends GetxController {}

class ItemDetailsFromStoryControllerImp extends ItemDetailsFromStoryController {
  late StoryModell storyModell;
  MyServices myServices = Get.find();

  initialdata() {
    storyModell = Get.arguments['storymodel'];
  }

  @override
  void onInit() {
    initialdata();
    super.onInit();
  }
}
