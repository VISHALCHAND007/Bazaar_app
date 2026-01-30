import 'package:e_commerce/utils/constants/my_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class Loaders {
  Loaders._();


  static void successSnackBar({
    required String title,
    String message = "",
    int duration = 3,
  }) {
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: MyColors.white,
      backgroundColor: MyColors.primary,
      snackPosition: .BOTTOM,
      duration: Duration(seconds: duration),
      margin: const .all(10),
      icon: const Icon(Iconsax.check, color: MyColors.white),
    );
  }

  static void warningSnackBar({required String title, String message = ""}) {
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: MyColors.white,
      backgroundColor: MyColors.primary,
      snackPosition: .BOTTOM,
      margin: const .all(10),
      duration: const Duration(seconds: 3),
      icon: const Icon(Iconsax.warning_2, color: MyColors.white),
    );
  }

  static void errorSnackBar({required String title, String message = ""}) {
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: MyColors.white,
      backgroundColor: Colors.red.shade600,
      snackPosition: .BOTTOM,
      margin: const .all(20),
      duration: const Duration(seconds: 3),
      icon: const Icon(Iconsax.warning_2, color: MyColors.white),
    );
  }
}
