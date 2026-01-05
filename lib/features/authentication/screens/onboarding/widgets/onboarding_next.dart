import 'package:e_commerce/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:e_commerce/utils/constants/custom_size.dart';
import 'package:e_commerce/utils/constants/my_colors.dart';
import 'package:e_commerce/utils/device/device_utility.dart';
import 'package:e_commerce/utils/helpers/helpers.dart';
import 'package:flutter/material.dart';

class OnboardingNext extends StatelessWidget {
  const OnboardingNext({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Helpers.isDarkMode(context);
    return Positioned(
      bottom: DeviceUtility.getBottomNavigationBarHeight(),
      right: CustomSize.defaultSpace,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(shape: const CircleBorder(),
            backgroundColor: isDark ? MyColors.primary : MyColors.black),
        onPressed: OnboardingController.instance.nextPage,
        child: Icon(Icons.navigate_next),
      ),
    );
  }
}
