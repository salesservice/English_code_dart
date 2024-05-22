import 'package:get/get.dart';

import '../core/classes/statusrequest.dart';
import '../core/functions/handling_data.dart';
import '../data/static/remote/test_data.dart';

class TestController extends GetxController {
  TestData testData = TestData(Get.find());

  List data = [];

  late StatusRequest statusRequest;

  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await testData.getData();
    //print("==================================== Controller $response ");
    statusRequest = handlingData(response);

    if (StatusRequest.suksess == statusRequest) {
      if (response['status'] == "success") {
        data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
