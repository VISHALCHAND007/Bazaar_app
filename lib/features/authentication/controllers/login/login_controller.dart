import 'package:e_commerce/common/widgets/loaders/loaders.dart';
import 'package:e_commerce/data/repositories/authentication/authentication_repository.dart';
import 'package:e_commerce/features/personalization/controllers/user_controller.dart';
import 'package:e_commerce/utils/constants/image_strings.dart';
import 'package:e_commerce/utils/constants/storage_keys.dart';
import 'package:e_commerce/utils/helpers/network_manager.dart';
import 'package:e_commerce/utils/popups/full_screen_loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  @override
  void onInit() {
    super.onInit();
    //to autofill the saved password
    if (localStorage.read(StorageKeys.userEmail) != null &&
        localStorage.read(StorageKeys.userPassword) != null) {
      email.text = localStorage.read(StorageKeys.userEmail);
      password.text = localStorage.read(StorageKeys.userPassword);
    }
  }

  //variables
  final loginFormKey = GlobalKey<FormState>();
  final email = TextEditingController();
  final password = TextEditingController();
  final hidePassword = true.obs;
  final rememberMe = false.obs;
  final localStorage = GetStorage();

  Future<void> loginWithEmailAndPassword() async {
    try {
      //hide keyboard
      FocusManager.instance.primaryFocus?.unfocus();

      //start loading
      FullScreenLoader.openLoadingDialog(
        "Logging you in...",
        ImageStrings.processing,
      );

      //check for internet
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        FullScreenLoader.stopLoading();
        return;
      }

      //form validation
      if (!loginFormKey.currentState!.validate()) {
        FullScreenLoader.stopLoading();
        return;
      }

      //save email and password if required
      if (rememberMe.value) {
        localStorage.write(StorageKeys.userEmail, email.text.trim());
        localStorage.write(StorageKeys.userPassword, password.text.trim());
      }

      //try logging in
      final credentials = await AuthenticationRepository.instance
          .signInWithEmailAndPassword(email.text.trim(), password.text.trim());

      //stop loading
      FullScreenLoader.stopLoading();

      //Redirect to home/email validation page
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      FullScreenLoader.stopLoading();
      Loaders.errorSnackBar(title: "On snap!", message: e.toString());
    }
  }

  Future<void> googleSignIn() async {
    try {
      //show loader
      FullScreenLoader.openLoadingDialog(
        "Logging you in...",
        ImageStrings.processing,
      );

      //check internet
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        FullScreenLoader.stopLoading();
        return;
      }

      //fire google sign in
      final credentials = await AuthenticationRepository.instance
          .signInWithGoogle();

      //save user data
      await UserController.instance.saveUserRecord(credentials);

      //stop loader
      FullScreenLoader.stopLoading();

      //fire re-direct
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      FullScreenLoader.stopLoading();
      Loaders.errorSnackBar(title: "On Snap", message: e.toString());
    }
  }
}
