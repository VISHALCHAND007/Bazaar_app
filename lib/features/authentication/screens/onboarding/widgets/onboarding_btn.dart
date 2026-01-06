import 'package:e_commerce/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:e_commerce/utils/constants/custom_size.dart';
import 'package:flutter/material.dart';

class OnboardingSkipBtn extends StatelessWidget {
  const OnboardingSkipBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: CustomSize.defaultSpace,
      right: CustomSize.defaultSpace,
      child: TextButton(
        onPressed: OnboardingController.instance.skipPage,
        child: Text("Skip"),
      ),
    );
  }
}
