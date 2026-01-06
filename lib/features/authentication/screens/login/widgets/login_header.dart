import 'package:flutter/material.dart';

import '../../../../../utils/constants/custom_size.dart';
import '../../../../../utils/constants/custom_strings.dart';
import '../../../../../utils/constants/image_strings.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key, required this.isDark});
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return  Column(
      mainAxisAlignment: .start,
      crossAxisAlignment: .stretch,
      children: [
        Image(
          height: 100,
          image: AssetImage(
            isDark
                ? ImageStrings.appIconLight
                : ImageStrings.appIconDark,
          ),
          alignment: Alignment.centerLeft,
        ),
        Text(
          CustomStrings.loginTitle,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(height: CustomSize.sm),
        Text(
          CustomStrings.loginSubTitle,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const SizedBox(height: CustomSize.spaceBtwSections),
      ],
    );
  }
}
