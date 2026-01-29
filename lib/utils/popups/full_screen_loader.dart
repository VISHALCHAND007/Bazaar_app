//utility class for showing full screen loading dialog.
import 'package:e_commerce/utils/constants/my_colors.dart';
import 'package:e_commerce/utils/helpers/helpers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/widgets/loaders/animation_loader.dart';

class FullScreenLoader {
  FullScreenLoader._();

  static void openLoadingDialog(String text, String animation) {
    showDialog(
      context: Get.overlayContext!,
      //using get-overlay context for overlay dialogs
      barrierDismissible: false,
      //dialog can't be dismissed by clicking outside
      builder: (_) => PopScope(
        canPop: false, // so that the back button doesn't work
        child: Container(
          color: Helpers.isDarkMode(Get.context!)
              ? MyColors.dark
              : MyColors.white,
          width: .infinity,
          height: .infinity,
          child: Column(
            children: [
              const SizedBox(height: 250), //random top space
              AnimationLoader(text: text, animation: animation),
            ],
          ),
        ),
      ),
    );
  }

  static void stopLoading() {
    Navigator.of(Get.overlayContext!).pop(); // close the loading using the navigator
  }
}
