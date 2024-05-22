import 'package:flutter/widgets.dart';
import 'package:flutter_isell_new/core/constants/sellx_route_names.dart';
import 'package:get/get.dart';

import '../services/services.dart';

class SellxMiddleware extends GetMiddleware {
  @override
  int? get priority => 1;
  MyServices myServices = Get.find();

  @override
  RouteSettings? redirect(String? route) {
    if (myServices.sharedPreferences.getString("step") == "2") {
      return const RouteSettings(name: AppRouter.homepage);
    }
    if (myServices.sharedPreferences.getString("step") == "1") {
      return const RouteSettings(name: AppRouter.loginellerreg);
    }
    return null;
  }
}
