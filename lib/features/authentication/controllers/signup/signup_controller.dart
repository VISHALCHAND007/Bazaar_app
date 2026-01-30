import 'package:e_commerce/common/widgets/loaders/loaders.dart';
import 'package:e_commerce/data/repositories/authentication/authentication_repository.dart';
import 'package:e_commerce/data/repositories/user/user_repository.dart';
import 'package:e_commerce/features/authentication/screens/signup/verification/verify_email.dart';
import 'package:e_commerce/features/personalization/models/user_model.dart';
import 'package:e_commerce/utils/constants/image_strings.dart';
import 'package:e_commerce/utils/helpers/network_manager.dart';
import 'package:e_commerce/utils/popups/full_screen_loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  //variables
  final GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final username = TextEditingController();
  final email = TextEditingController();
  final phoneNumber = TextEditingController();
  final password = TextEditingController();
  final RxBool hidePassword = true.obs;
  final RxBool privacyPolicy = true.obs;

  // methods
  Future<void> signup() async {
    try {
      //closing the keyboard
      FocusManager.instance.primaryFocus?.unfocus();

      //show loader
      FullScreenLoader.openLoadingDialog(
        "We are processing your information...",
        ImageStrings.processing,
      );

      //check internet
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        FullScreenLoader.stopLoading();
        return;
      }

      //form validation
      if (!signUpFormKey.currentState!.validate()) {
        FullScreenLoader.stopLoading();
        return;
      }

      //privacy policy check
      if (!privacyPolicy.value) {
        FullScreenLoader.stopLoading();
        Loaders.warningSnackBar(
          title: "Accept Privacy Policy",
          message:
              "In order to create account, you must accept the privacy policy.",
        );
        return;
      }

      //Register user with the firebase authentication && Save user data into firestore
      final credentials = await AuthenticationRepository.instance
          .registerUserWithEmailAndPass(
            email.text.trim(),
            password.text.trim(),
          );

      final newUser = UserModel(
        id: credentials.user!.uid,
        firstName: firstName.text.trim(),
        lastName: lastName.text.trim(),
        username: username.text.trim(),
        email: email.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        profilePicture: "",
      );
      UserRepository.instance.saveUserRecord(newUser);

      //stop loading
      FullScreenLoader.stopLoading();

      //show success message
      Loaders.successSnackBar(
        title: "Congratulations",
        message: "Your account has been created! Verify email to continue.",
      );

      //move to verify email screen
      Get.to(() => VerifyEmail(email: email.text.trim(),));
      // FullScreenLoader.stopLoading();
    } catch (e) {
      Loaders.errorSnackBar(title: "On snap!", message: e.toString());
    }
  }
}
