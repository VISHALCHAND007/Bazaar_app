import 'package:e_commerce/utils/helpers/helpers.dart';
import 'package:e_commerce/utils/validators/validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get_storage/get_storage.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/custom_size.dart';
import '../../../../../utils/constants/custom_strings.dart';
import '../../../../../utils/constants/my_colors.dart';
import '../../../controllers/signup/signup_controller.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());

    final isDark = Helpers.isDarkMode(context);
    return Form(
      key: controller.signUpFormKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: CustomSize.spaceBtwSections,
        ),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: controller.firstName,
                    validator: (value) =>
                        Validator.validateEmptyField("First name", value),
                    expands: false,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Iconsax.user),
                      labelText: CustomStrings.firstName,
                    ),
                  ),
                ),
                const SizedBox(width: CustomSize.spaceBtwInputFields),
                Expanded(
                  child: TextFormField(
                    controller: controller.lastName,
                    validator: (value) =>
                        Validator.validateEmptyField("Last name", value),
                    expands: false,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Iconsax.user),
                      labelText: CustomStrings.lastName,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: CustomSize.spaceBtwItems),
            TextFormField(
              controller: controller.username,
              validator: (value) =>
                  Validator.validateEmptyField("Username", value),
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.user_edit),
                labelText: CustomStrings.userName,
              ),
            ),
            const SizedBox(height: CustomSize.spaceBtwItems),
            TextFormField(
              controller: controller.email,
              validator: (value) => Validator.validateEmail(value),
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.mail_lock_outlined),
                labelText: CustomStrings.email,
              ),
            ),
            const SizedBox(height: CustomSize.spaceBtwItems),
            TextFormField(
              controller: controller.phoneNumber,
              validator: (value) => Validator.validatePhoneNumber(value),
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.call),
                labelText: CustomStrings.phoneNo,
              ),
            ),
            const SizedBox(height: CustomSize.spaceBtwItems),
            Obx(
              () => TextFormField(
                controller: controller.password,
                obscureText: controller.hidePassword.value,
                validator: (value) => Validator.validatePassword(value),
                decoration: InputDecoration(
                  prefixIcon: const Icon(Iconsax.password_check),
                  labelText: CustomStrings.password,
                  suffixIcon: IconButton(
                    onPressed: () => controller.hidePassword.value =
                        !controller.hidePassword.value,
                    icon: Icon(
                      controller.hidePassword.value
                          ? Iconsax.eye_slash
                          : Iconsax.eye,
                    ),
                  ),
                ),
              ),
            ),
            //Privacy policy and terms of use
            const SizedBox(height: CustomSize.spaceBtwItems),
            Row(
              children: [
                SizedBox(
                  height: 24,
                  width: 24,
                  child: Obx(
                    () => Checkbox(
                      value: controller.privacyPolicy.value,
                      onChanged: (value) => controller.privacyPolicy.value =
                          !controller.privacyPolicy.value,
                    ),
                  ),
                ),
                const SizedBox(width: CustomSize.spaceBtwItems),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "${CustomStrings.iAgreeTo} ",
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      TextSpan(
                        text: "${CustomStrings.privacyPolicy} ",
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          decoration: TextDecoration.underline,
                          color: isDark ? MyColors.white : MyColors.primary,
                        ),
                      ),
                      TextSpan(
                        text: " ${CustomStrings.and} ",
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      TextSpan(
                        text: "${CustomStrings.termsOfUse} ",
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          decoration: TextDecoration.underline,
                          color: isDark ? MyColors.white : MyColors.primary,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
