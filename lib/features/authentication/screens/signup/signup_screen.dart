import 'package:e_commerce/common/widgets/login_signup/horizontal_divider_with_text.dart';
import 'package:e_commerce/common/widgets/login_signup/social_buttons.dart';
import 'package:e_commerce/features/authentication/screens/signup/verification/verify_email.dart';
import 'package:e_commerce/features/authentication/screens/signup/widgets/signup_form.dart';
import 'package:e_commerce/utils/constants/custom_size.dart';
import 'package:e_commerce/utils/constants/custom_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/signup/signup_controller.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());

    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(CustomSize.defaultSpace),
            child: Column(
              mainAxisAlignment: .start,
              crossAxisAlignment: .stretch,
              children: [
                //title
                Text(
                  CustomStrings.signUpTitle,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                //form
                const SignupForm(),

                //create account button
                const SizedBox(height: CustomSize.spaceBtwSections),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => controller.signup(),
                    child: const Text(CustomStrings.createAccount),
                  ),
                ),

                //horizontal divider
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: CustomSize.spaceBtwSections,
                  ),
                  child: HorizontalDividerWithText(
                    text: CustomStrings.orSignUpWith.capitalize!,
                  ),
                ),

                //social buttons
                const SocialButtons(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
