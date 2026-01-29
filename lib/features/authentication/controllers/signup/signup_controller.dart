import 'package:e_commerce/utils/constants/image_strings.dart';
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

  // methods
  Future<void> signup() async {
    //show loader
    FullScreenLoader.openLoadingDialog(
      "We are processing your information...",
      ImageStrings.verify,
    );

    //check internet


    //form validation

    //privacy policy check

    //Register user with the firebase authentication && Save user data into firestore

    //
  }
}
