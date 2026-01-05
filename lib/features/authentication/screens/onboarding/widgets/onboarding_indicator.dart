import 'package:e_commerce/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:flutter/material.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../../../utils/constants/custom_size.dart';
import '../../../../../utils/constants/my_colors.dart';
import '../../../../../utils/device/device_utility.dart';
import '../../../../../utils/helpers/helpers.dart';

class OnboardingIndicator extends StatelessWidget {
  const OnboardingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = OnboardingController.instance;
    final isDark = Helpers.isDarkMode(context);
    return Positioned(
      bottom: DeviceUtility.getBottomNavigationBarHeight() + 15,
      left: CustomSize.defaultSpace,
      child: SmoothPageIndicator(
        controller: controller.pageController,
        onDotClicked: controller.dotNavigationClicked,
        count: 3,
        effect: ExpandingDotsEffect(
          activeDotColor: isDark ? MyColors.white : MyColors.dark,
          dotHeight: 6,
        ),
      ),
    );
  }
}
