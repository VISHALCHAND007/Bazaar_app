import 'package:e_commerce/common/widgets/appbar/custom_app_bar.dart';
import 'package:e_commerce/features/personalization/controllers/user_controller.dart';
import 'package:e_commerce/utils/constants/custom_size.dart';
import 'package:e_commerce/utils/validators/validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/custom_strings.dart';

class ReAuthenticateUserLoginScreen extends StatelessWidget {
  const ReAuthenticateUserLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;

    return Scaffold(
      appBar: const CustomAppBar(title: Text("Re-Authenticate User")),
      body: Padding(
        padding: const .all(CustomSize.defaultSpace),
        child: Form(
          key: controller.reAuthFormKey,
          child: Column(
            children: [
              //email
              TextFormField(
                controller: controller.verifyEmail,
                validator: Validator.validateEmail,
                decoration: const InputDecoration(
                  labelText: CustomStrings.email,
                  prefixIcon: Icon(Iconsax.direct_right),
                ),
              ),
              const SizedBox(height: CustomSize.spaceBtwInputFields),

              //password
              Obx(
                () => TextFormField(
                  obscureText: controller.hidePassword.value,
                  controller: controller.verifyPassword,
                  validator: (value) => Validator.validateEmptyField(
                    CustomStrings.password,
                    value,
                  ),
                  decoration: InputDecoration(
                    labelText: CustomStrings.password,
                    prefixIcon: const Icon(Iconsax.password_check),
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
              const SizedBox(height: CustomSize.spaceBtwSections),

              //login btn
              SizedBox(
                width: .infinity,
                child: ElevatedButton(
                  onPressed: () => controller.reAuthenticateEmailAndPassUser(),
                  child: const Text("Verify"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
