import 'dart:async';

import 'package:e_commerce/common/widgets/loaders/loaders.dart';
import 'package:e_commerce/common/widgets/success_screen.dart';
import 'package:e_commerce/data/repositories/authentication/authentication_repository.dart';
import 'package:e_commerce/utils/constants/custom_strings.dart';
import 'package:e_commerce/utils/constants/image_strings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

  ///Send email whenever the verify screen appears and set timer of auto-redirect.
  @override
  void onInit() {
    sendEmailForVerification();
    setTimerForAutoReDirect();
    super.onInit();
  }

  ///Send email verification link
  void sendEmailForVerification() async {
    try {
      await AuthenticationRepository.instance.sendEmailForVerification();
      Loaders.successSnackBar(
        title: "Email Sent",
        message: "Please check your inbox and verify your email.",
      );
    } catch (e) {
      Loaders.errorSnackBar(title: "On snap!", message: e.toString());
    }
  }

  ///Timer to automatically redirect on email verification
  void setTimerForAutoReDirect() {
    Timer.periodic(const Duration(seconds: 1), (timer) async {
      final auth = FirebaseAuth.instance;
      await auth.currentUser?.reload();
      final user = auth.currentUser;
      if (user?.emailVerified ?? false) {
        timer.cancel();
        Get.off(
          () => SuccessScreen(
            animationPath: ImageStrings.verifySuccess,
            title: CustomStrings.yourAccountCreatedTitle,
            subTitle: CustomStrings.yourAccountCreatedSubTitle,
            onButtonClicked: () =>
                AuthenticationRepository.instance.screenRedirect(),
          ),
        );
      }
    });
  }

  ///Manually check if email verified
  void checkEmailVerificationStatus() async {
    final auth = FirebaseAuth.instance;

    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null && currentUser.emailVerified) {
      Get.off(
        () => SuccessScreen(
          animationPath: ImageStrings.verifySuccess,
          title: CustomStrings.yourAccountCreatedTitle,
          subTitle: CustomStrings.yourAccountCreatedSubTitle,
          onButtonClicked: () =>
              AuthenticationRepository.instance.screenRedirect(),
        ),
      );
    }
  }
}
