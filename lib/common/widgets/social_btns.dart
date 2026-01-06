import 'package:flutter/material.dart';

import '../../utils/constants/custom_size.dart';
import '../../utils/constants/image_strings.dart';
import '../../utils/constants/my_colors.dart';

class SocialButtons extends StatelessWidget {
  const SocialButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: .center,
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: MyColors.grey),
            borderRadius: BorderRadius.circular(100),
          ),
          child: IconButton(
            onPressed: () {},
            icon: const Image(
              width: CustomSize.iconMd,
              height: CustomSize.iconMd,
              image: AssetImage(ImageStrings.google),
            ),
          ),
        ),
        const SizedBox(width: CustomSize.spaceBtwItems),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: MyColors.grey),
            borderRadius: BorderRadius.circular(100),
          ),
          child: IconButton(
            onPressed: () {},
            icon: const Image(
              width: CustomSize.iconMd,
              height: CustomSize.iconMd,
              image: AssetImage(ImageStrings.facebook),
            ),
          ),
        ),
      ],
    );
  }
}
