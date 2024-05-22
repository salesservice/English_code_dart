import 'package:flutter/material.dart';
import 'package:flutter_isell_new/core/constants/sellx_route_names.dart';
import 'package:get/get.dart';

import '../core/services/services.dart';
import '../data/static/onboarding_static.dart';

abstract class OnboardingController extends GetxController {
  next();
  onPageChange(int index);
  gotoLests();
}

class OnboardingControllerImp extends OnboardingController {
  late PageController pageController;
  int currentPage = 0;
  var selectedland = "".obs;
  MyServices myServices = Get.find();

  @override
  next() {
    currentPage++;
    if (currentPage > onBoardingList.length - 1) {
      myServices.sharedPreferences.setString("step", "1");
      Get.offAllNamed(AppRouter.loginellerreg);
    } else {
      pageController.animateToPage(currentPage,
          duration: const Duration(milliseconds: 700), curve: Curves.easeInOut);
    }
  }

  @override
  onPageChange(int index) {
    currentPage = index;
    update();
  }

  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }

  @override
  gotoLests() {
    Get.toNamed(AppRouter.onboardingpages);
  }
}
