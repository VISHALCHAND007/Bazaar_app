import 'package:e_commerce/features/authentication/controllers/forget_password/forget_password_controller.dart';
import 'package:e_commerce/features/authentication/screens/login/login_screen.dart';
import 'package:e_commerce/utils/constants/custom_size.dart';
import 'package:e_commerce/utils/constants/custom_strings.dart';
import 'package:e_commerce/utils/constants/image_strings.dart';
import 'package:e_commerce/utils/device/device_utility.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(CupertinoIcons.clear),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(CustomSize.defaultSpace),
            child: Column(
              children: [
                //Animation covering 60% height
                Lottie.asset(
                  ImageStrings.emailSent,
                  height: DeviceUtility.getScreenWidth(context) * .6,
                  width: double.infinity,
                ),

                Text(email, style: Theme.of(context).textTheme.bodyMedium),
                const SizedBox(height: CustomSize.spaceBtwItems),

                //title and subtitle
                Text(
                  CustomStrings.changeYourPasswordTitle,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: CustomSize.spaceBtwItems),
                Text(
                  CustomStrings.changeYourPasswordSubTitle,
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: .center,
                ),
                const SizedBox(height: CustomSize.spaceBtwSections),

                //buttons
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => Get.offAll(() => const LoginScreen()),
                    child: const Text(CustomStrings.done),
                  ),
                ),
                const SizedBox(height: CustomSize.spaceBtwItems),
                SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () => ForgetPasswordController.instance
                        .reSendPasswordResetLink(email),
                    child: const Text(CustomStrings.resendEmail),
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
