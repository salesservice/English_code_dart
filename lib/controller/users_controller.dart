// import 'package:flutter_isell_new/core/constants/isellroutenames.dart';
// import 'package:flutter_isell_new/core/services/services.dart';
// import 'package:flutter_isell_new/data/model/usermodell.dart';
// import 'package:flutter_isell_new/data/static/remote/usersdata.dart';
// import 'package:flutter_isell_new/views/screens/home/navbar.dart';
// import 'package:get/get.dart';

// import '../core/classes/statusrequest.dart';
// import '../core/functions/handlingdatacont.dart';
// import '../data/static/remote/test_data.dart';

// abstract class UserController extends GetxController {
//   getData();
//   opendrawer(UserModell userModell);
// }

// class UserControllerImp extends UserController {
//   MyServices myServices = Get.find();
//   UserData userData = UserData(Get.find());

//   List users = [];

//   late StatusRequest statusRequest;
//   late UserModell userModell;
//   String? userimage;
//   int? userid;
//   String? userfname;

//   @override
//   getData() async {
//     statusRequest = StatusRequest.loading;
//     var response = await userData.getData();
//     //print("==================================== Controller $response ");
//     statusRequest = handlingData(response);

//     if (StatusRequest.suksess == statusRequest) {
//       if (response['status'] == "success") {
//         users.addAll(response['data']);
//       } else {
//         statusRequest = StatusRequest.failure;
//       }
//     }
//     update();
//   }

//   @override
//   void onInit() {
//     //userModell = Get.arguments['usermodell'];
//     userimage = myServices.sharedPreferences.getString("userimage");
//     userfname = myServices.sharedPreferences.getString("userfname");

//     getData();
//     super.onInit();
//   }

//   @override
//   opendrawer(userModell) {
//     Get.toNamed(AppRouter.nsvbar, arguments: {"usermodell": userModell});
//   }
// }
