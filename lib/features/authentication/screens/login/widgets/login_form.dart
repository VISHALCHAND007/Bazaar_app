import 'package:e_commerce/features/authentication/controllers/login/login_controller.dart';
import 'package:e_commerce/features/authentication/screens/navigation_menu/navigation_menu.dart';
import 'package:e_commerce/features/authentication/screens/password_validation/forgot_password.dart';
import 'package:e_commerce/features/authentication/screens/signup/signup_screen.dart';
import 'package:e_commerce/utils/validators/validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/custom_size.dart';
import '../../../../../utils/constants/custom_strings.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = LoginController.instance;

    return Form(
      key: controller.loginFormKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: CustomSize.spaceBtwSections,
        ),
        child: Column(
          children: [
            TextFormField(
              controller: controller.email,
              validator: (value) => Validator.validateEmail(value),
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.direct_right),
                label: Text(CustomStrings.email),
              ),
            ),
            const SizedBox(height: CustomSize.spaceBtwInputFields),
            Obx(
              () => TextFormField(
                controller: controller.password,
                obscureText: controller.hidePassword.value,
                validator: (value) =>
                    Validator.validateEmptyField("Password", value),
                decoration: InputDecoration(
                  prefixIcon: const Icon(Iconsax.password_check),
                  label: const Text(CustomStrings.password),
                  suffixIcon: IconButton(
                    onPressed: () => controller.hidePassword.value =
                        !controller.hidePassword.value,
                    icon: controller.hidePassword.value
                        ? const Icon(Iconsax.eye_slash)
                        : const Icon(Iconsax.eye),
                  ),
                ),
              ),
            ),
            const SizedBox(height: CustomSize.spaceBtwInputFields / 2),

            //Remember me and forgot password
            Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                Row(
                  children: [
                    Obx(
                      () => Checkbox(
                        value: controller.rememberMe.value,
                        onChanged: (value) => controller.rememberMe.value =
                            !controller.rememberMe.value,
                      ),
                    ),
                    const Text(CustomStrings.rememberMe),
                  ],
                ),
                //forget password
                TextButton(
                  onPressed: () => Get.to(() => const ForgotPassword()),
                  child: const Text(CustomStrings.forgetPass),
                ),
              ],
            ),
            //Sign in button
            const SizedBox(height: CustomSize.spaceBtwSections),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => LoginController.instance.loginWithEmailAndPassword(),
                child: const Text(CustomStrings.signIn),
              ),
            ),
            const SizedBox(height: CustomSize.spaceBtwItems),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () => Get.to(() => const SignupScreen()),
                child: const Text(CustomStrings.createAccount),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
