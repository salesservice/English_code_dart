import 'package:flutter_isell_new/core/constants/sellx_route_names.dart';
import 'package:flutter_isell_new/data/model/story_model.dart';
import 'package:get/get.dart';

import '../../core/classes/statusrequest.dart';
import '../../core/functions/handling_data.dart';
import '../../core/services/services.dart';
import '../../data/static/remote/story_data.dart';

abstract class StoriController extends GetxController {
  //initialData();
  getdata();
  goToItemsFromStory(StoryModell storyModell);
}

class StoriControllerImp extends StoriController {
  late StoryModell? storyModell;

  MyServices myServices = Get.find();

  String? userfname;
  int? userid;

  StoriData storyData = StoriData(Get.find());

  List stories = [];

  late StatusRequest statusRequest;

  initialData() {}

  @override
  void onInit() {
    getdata();

    initialData();
    storyModell = Get.arguments['storymodel'];

    super.onInit();
  }

  @override
  getdata() async {
    statusRequest = StatusRequest.loading;
    var response = await storyData.getData();
    // print("==================================== Controller $response ");
    statusRequest = handlingData(response);

    if (StatusRequest.suksess == statusRequest) {
      if (response['status'] == "success") {
        stories.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  goToItemsFromStory(storyModell) {
    Get.toNamed(AppRouter.itemdetailsfromstory,
        arguments: {"storymodel": storyModell});
  }
}
