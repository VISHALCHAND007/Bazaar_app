import 'package:e_commerce/common/styles/spacing_style.dart';
import 'package:e_commerce/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../utils/constants/custom_size.dart';
import '../../utils/constants/custom_strings.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({
    super.key,
    required this.animationPath,
    required this.title,
    required this.subTitle,
    required this.onButtonClicked,
  });

  final String animationPath, title, subTitle;
  final VoidCallback onButtonClicked;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: SpacingStyle.paddingWithAppbarHeight * 2,
            child: Column(
              crossAxisAlignment: .stretch,
              children: [
                //animation
                Lottie.asset(
                  animationPath,
                  width: DeviceUtility.getScreenWidth(context) * .6,
                ),

                //title, sub-title
                Text(
                  title,
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: .center,
                ),
                const SizedBox(height: CustomSize.spaceBtwItems),

                const SizedBox(height: CustomSize.spaceBtwItems),
                Text(
                  subTitle,
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: .center,
                ),
                const SizedBox(height: CustomSize.spaceBtwSections),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: onButtonClicked,
                    child: const Text(CustomStrings.myContinue),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
