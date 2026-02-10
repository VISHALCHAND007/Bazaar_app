import 'package:e_commerce/common/widgets/loaders/loaders.dart';
import 'package:e_commerce/data/repositories/authentication/authentication_repository.dart';
import 'package:e_commerce/data/repositories/user/user_repository.dart';
import 'package:e_commerce/features/authentication/screens/login/login_screen.dart';
import 'package:e_commerce/features/personalization/screens/profile/widgets/re_authenticate_user_login_screen.dart';
import 'package:e_commerce/utils/constants/image_strings.dart';
import 'package:e_commerce/utils/helpers/network_manager.dart';
import 'package:e_commerce/utils/popups/full_screen_loader.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/constants/custom_size.dart';
import '../models/user_model.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  //for the details of the current user
  Rx<UserModel?> user = UserModel.empty().obs;
  final userRepository = UserRepository.instance;
  final profileLoading = false.obs;

  //var
  final hidePassword = false.obs;
  final verifyEmail = TextEditingController();
  final verifyPassword = TextEditingController();
  final reAuthFormKey = GlobalKey<FormState>();

  //to save the user details when the class in initiated
  @override
  void onInit() {
    super.onInit();
    fetchUserDetails();
  }

  void fetchUserDetails() async {
    try {
      profileLoading.value = true;
      final result = await userRepository.fetchUserDetails();
      user(result);
    } catch (e) {
      user(UserModel.empty());
    } finally {
      profileLoading.value = false;
    }
  }

  //saving user details
  Future<void> saveUserRecord(UserCredential? credentials) async {
    try {
      if (credentials != null) {
        final nameParts = UserModel.nameParts(
          credentials.user?.displayName ?? "",
        );
        final username = UserModel.generateUsername(
          credentials.user?.displayName ?? "",
        );

        final user = UserModel(
          id: credentials.user!.uid,
          firstName: nameParts[0],
          lastName: nameParts.length > 1
              ? nameParts.sublist(1).join()
              : nameParts[1],
          username: username,
          email: credentials.user?.email ?? "",
          phoneNumber: credentials.user?.phoneNumber ?? "",
          profilePicture: credentials.user?.photoURL ?? "",
        );

        //saving user data
        await userRepository.saveUserRecord(user);
      }
    } catch (e) {
      Loaders.errorSnackBar(
        title: "Data not saved",
        message:
            "Something went wrong while saving your information. You can re-save your information in your Profile.",
      );
    }
  }

  //delete account warning pop up
  void deleteAccountWarningPopUp() {
    Get.defaultDialog(
      title: "Delete Account",
      middleText:
          "Are you sure your want to delete your account? This action is not reversible and all your data will be deleted permanently!",
      confirm: ElevatedButton(
        onPressed: () {
          Navigator.of(Get.overlayContext!).pop();
          deleteUserAccount();
        } ,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red,
          side: const BorderSide(color: Colors.red),
        ),
        child: const Padding(
          padding: .symmetric(horizontal: CustomSize.lg),
          child: Text("Delete"),
        ),
      ),
      cancel: OutlinedButton(
        onPressed: () => Navigator.of(Get.overlayContext!).pop(),
        child: const Text("Cancel"),
      ),
    );
  }

  Future<void> deleteUserAccount() async {
    try {
      //show loader
      FullScreenLoader.openLoadingDialog("Processing", ImageStrings.processing);

      //get provider && based on provider delete account
      final auth = AuthenticationRepository.instance;
      final loginProvider = auth.currentUser!.providerData
          .map((e) => e.providerId)
          .first;

      //re authenticate the user first in each case
      if (loginProvider.isNotEmpty) {
        if (loginProvider == "google.com") {
          await auth.signInWithGoogle();
          await auth.deleteAccount();
          FullScreenLoader.stopLoading();
          Get.offAll(() => const LoginScreen());
        } else if (loginProvider == "password") {
          FullScreenLoader.stopLoading();
          Get.to(() => const ReAuthenticateUserLoginScreen());
        }
      }
    } catch (e) {
      FullScreenLoader.stopLoading();
      Loaders.errorSnackBar(title: "On Snap!", message: e.toString());
    }
  }

  Future<void> reAuthenticateEmailAndPassUser() async {
    try {
      //show full screen loader
      FullScreenLoader.openLoadingDialog("Processing", ImageStrings.processing);

      //check internet
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        FullScreenLoader.stopLoading();
        return;
      }

      //validate form
      if (!reAuthFormKey.currentState!.validate()) {
        FullScreenLoader.stopLoading();
        return;
      }

      //reauthenticate/delete user with auth repository
      await AuthenticationRepository.instance
          .reAuthenticatedUserWithEmailAndPassword(
            email: verifyEmail.text.trim(),
            password: verifyPassword.text.trim(),
          );
      await AuthenticationRepository.instance.deleteAccount();

      //stop loading
      FullScreenLoader.stopLoading();

      //navigate to login page
      Get.offAll(() => const LoginScreen());
    } catch (e) {
      FullScreenLoader.stopLoading();
      Loaders.errorSnackBar(title: "On Snap!", message: e.toString());
    }
  }
}
