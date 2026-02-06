import 'package:e_commerce/common/widgets/loaders/loaders.dart';
import 'package:e_commerce/data/repositories/user/user_repository.dart';
import 'package:e_commerce/features/personalization/controllers/user_controller.dart';
import 'package:e_commerce/features/personalization/screens/profile/profile_screen.dart';
import 'package:e_commerce/utils/constants/image_strings.dart';
import 'package:e_commerce/utils/helpers/network_manager.dart';
import 'package:e_commerce/utils/popups/full_screen_loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

///Controller to update user details
class UpdateNameController extends GetxController {
  static UpdateNameController get instance => Get.find();

  //variables
  final changeNameFormKey = GlobalKey<FormState>();
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userController = UserController.instance;
  final userRepository = UserRepository.instance;

  //init names
  @override
  void onInit() {
    initNames();
    super.onInit();
  }

  void initNames() {
    firstName.text = userController.user.value?.firstName ?? "NA";
    lastName.text = userController.user.value?.lastName ?? "NA";
  }

  Future<void> updateUserName() async {
    try {
      //close keyboard
      FocusManager.instance.primaryFocus?.unfocus();

      //show loader
      FullScreenLoader.openLoadingDialog(
        "We are updating your details.",
        ImageStrings.processing,
      );

      //check internet
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        FullScreenLoader.stopLoading();
        return;
      }

      //check validations
      if (!changeNameFormKey.currentState!.validate()) {
        FullScreenLoader.stopLoading();
        return;
      }

      //update details online
      Map<String, dynamic> fullNameJson = {
        "first_name": firstName.text.trim(),
        "last_name": lastName.text.trim(),
      };
      await userRepository.updateSingleUserField(fullNameJson);

      //update reactive components for local data update
      userController.user.value?.firstName = firstName.text.trim();
      userController.user.value?.lastName = lastName.text.trim();

      //stop loading
      FullScreenLoader.stopLoading();

      //show success dialog
      Loaders.successSnackBar(
        title: "Congratulations",
        message: "Your name has been updated.",
      );

      //go back to previous screen
      Get.off(() => const ProfileScreen());
    } catch (e) {
      FullScreenLoader.stopLoading();
      Loaders.errorSnackBar(title: "Oh snap!", message: e.toString());
    }
  }
}
