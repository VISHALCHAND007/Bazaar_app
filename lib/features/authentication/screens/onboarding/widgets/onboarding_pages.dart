import 'package:flutter/material.dart';

import '../../../../../utils/constants/custom_size.dart';
import '../../../../../utils/device/device_utility.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({
    required this.image,
    required this.title,
    required this.subTitle,
    super.key,
  });

  final String image, title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(CustomSize.defaultSpace),
      child: Column(
        children: [
          Image(
            image: AssetImage(image),
            height: DeviceUtility.getScreenHeight(context) * .6,
            width: DeviceUtility.getScreenWidth(context) * .8,
          ),
          Text(
            title,
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: .center,
          ),
          const SizedBox(height: CustomSize.spaceBtwItems),
          Text(
            subTitle,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: .center,
          ),
        ],
      ),
    );
  }
}