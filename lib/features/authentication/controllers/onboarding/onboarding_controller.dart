import 'package:e_commerce/features/authentication/screens/login/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class OnboardingController extends GetxController {
  static OnboardingController get instance => Get.find();

  //variables
  final pageController = PageController();
  Rx<int> ind = 0.obs;

  //Update current ind when page scrolls
  void updatePageInd(index) => ind.value = index;


  //Jump to a specific dot
  void dotNavigationClicked(index) {
    ind.value = index;
    pageController.jumpToPage(index);
  }

  //update current ind and jump to next page
  void nextPage() {
    if(ind.value == 2) {
      Get.offAll(const LoginScreen());
    } else {
      final page = ind.value + 1;
      pageController.jumpToPage(page);
    }
  }

  //update current ind and jump to last page
  void skipPage() {
    ind.value = 2;
    pageController.jumpToPage(ind.value);
  }
}
