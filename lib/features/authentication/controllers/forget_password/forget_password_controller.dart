import 'package:e_commerce/common/widgets/loaders/loaders.dart';
import 'package:e_commerce/data/repositories/authentication/authentication_repository.dart';
import 'package:e_commerce/features/authentication/screens/password_validation/reset_password.dart';
import 'package:e_commerce/utils/constants/image_strings.dart';
import 'package:e_commerce/utils/helpers/network_manager.dart';
import 'package:e_commerce/utils/popups/full_screen_loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find();

  ///variables
  final forgetPasswordFormKey = GlobalKey<FormState>();
  final email = TextEditingController();

  ///send password reset link
  void sendPasswordResetLink() async {
    try {
      //hide keyboard
      FocusManager.instance.primaryFocus?.unfocus();

      //show loader
      FullScreenLoader.openLoadingDialog(
        "Sending password reset link.",
        ImageStrings.processing,
      );

      //check for validations
      if (!forgetPasswordFormKey.currentState!.validate()) {
        FullScreenLoader.stopLoading();
        return;
      }

      //check for internet connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        FullScreenLoader.stopLoading();
        return;
      }

      //send password reset link
      await AuthenticationRepository.instance.sendPasswordResetLink(
        email.text.trim(),
      );

      //stop loading
      FullScreenLoader.stopLoading();

      //show success message
      Loaders.successSnackBar(
        title: "Email Sent",
        message: "Email link sent to reset your password.",
      );

      //go to reset password page
      Get.to(() => ResetPassword(email: email.text.trim()));
    } catch (e) {
      FullScreenLoader.stopLoading();
      Loaders.errorSnackBar(title: "Oh Snap", message: e.toString());
    }
  }

  ///re-send password reset link
  void reSendPasswordResetLink(String email) async {
    try {
      //show loader
      FullScreenLoader.openLoadingDialog(
        "Sending password reset link.",
        ImageStrings.processing,
      );

      //check for internet connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        FullScreenLoader.stopLoading();
        return;
      }

      //send password reset link
      await AuthenticationRepository.instance.sendPasswordResetLink(email);

      //stop loading
      FullScreenLoader.stopLoading();

      //show success message
      Loaders.successSnackBar(
        title: "Email resented",
        message: "Email link sent to reset your password.",
      );
    } catch (e) {
      FullScreenLoader.stopLoading();
      Loaders.errorSnackBar(title: "Oh Snap", message: e.toString());
    }
  }
}
