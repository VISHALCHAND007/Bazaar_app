import 'package:e_commerce/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:e_commerce/features/authentication/screens/onboarding/widgets/onboarding_btn.dart';
import 'package:e_commerce/features/authentication/screens/onboarding/widgets/onboarding_indicator.dart';
import 'package:e_commerce/features/authentication/screens/onboarding/widgets/onboarding_next.dart';
import 'package:e_commerce/utils/constants/custom_strings.dart';
import 'package:e_commerce/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widgets/onboarding_pages.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnboardingController());

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            //page view
            PageView(
              controller: controller.pageController,
              onPageChanged: controller.updatePageInd,
              children: const [
                OnboardingPage(
                  lottieAnimationPath: ImageStrings.onboardingAnim1,
                  title: CustomStrings.onBoardingTitle1,
                  subTitle: CustomStrings.onBoardingSubTitle1,
                ),
                OnboardingPage(
                  lottieAnimationPath: ImageStrings.onboardingAnim2,
                  title: CustomStrings.onBoardingTitle2,
                  subTitle: CustomStrings.onBoardingSubTitle2,
                ),
                OnboardingPage(
                  lottieAnimationPath: ImageStrings.onboardingAnim3,
                  title: CustomStrings.onBoardingTitle3,
                  subTitle: CustomStrings.onBoardingSubTitle3,
                ),
              ],
            ),

            //skip
            const OnboardingSkipBtn(),

            //next
            const OnboardingNext(),

            //page indicator
            const OnboardingIndicator(),
          ],
        ),
      ),
    );
  }
}


