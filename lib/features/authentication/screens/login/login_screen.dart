import 'package:e_commerce/common/styles/spacing_style.dart';
import 'package:e_commerce/common/widgets/horizontal_divider_with_text.dart';
import 'package:e_commerce/common/widgets/social_btns.dart';
import 'package:e_commerce/features/authentication/screens/login/widgets/login_form.dart';
import 'package:e_commerce/features/authentication/screens/login/widgets/login_header.dart';
import 'package:e_commerce/utils/constants/custom_strings.dart';
import 'package:e_commerce/utils/helpers/helpers.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/string_extensions.dart';

import '../../../../utils/constants/custom_size.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = "/login";

  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Helpers.isDarkMode(context);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: SpacingStyle.paddingWithAppbarHeight,
          child: Column(
            children: [
              //header
              LoginHeader(isDark: isDark),

              // body: form
              LoginForm(),

              //Divider
              HorizontalDividerWithText(
                isDark: isDark,
                text: CustomStrings.orSignInWith.capitalize!,
              ),
              const SizedBox(height: CustomSize.spaceBtwSections),
              //Social media icons
              SocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
