import 'package:e_commerce/common/styles/spacing_style.dart';
import 'package:e_commerce/common/widgets/success_screen.dart';
import 'package:e_commerce/features/authentication/screens/login/login_screen.dart';
import 'package:e_commerce/utils/constants/custom_strings.dart';
import 'package:e_commerce/utils/constants/image_strings.dart';
import 'package:e_commerce/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lottie/lottie.dart';

import '../../../../../utils/constants/custom_size.dart';

class VerifyEmail extends StatelessWidget {
  const VerifyEmail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () => Get.offAll(() => const LoginScreen()),
            icon: const Icon(Iconsax.close_circle, size: CustomSize.iconMd),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: SpacingStyle.paddingWithAppbarHeight * 2,
            child: Column(
              crossAxisAlignment: .stretch,
              children: [
                //Image
                Lottie.asset(
                  ImageStrings.verify,
                  width: DeviceUtility.getScreenWidth(context) * .6,
                ),
                //title, sub-title and email
                Text(
                  CustomStrings.confirmEmail,
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: .center,
                ),
                const SizedBox(height: CustomSize.spaceBtwItems),
                Text(
                  "support@meals.com",
                  style: Theme.of(context).textTheme.labelSmall,
                  textAlign: .center,
                ),
                const SizedBox(height: CustomSize.spaceBtwItems),
                Text(
                  CustomStrings.confirmEmailSubTitle,
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: .center,
                ),
                const SizedBox(height: CustomSize.spaceBtwSections),

                //buttons
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => Get.to(
                      () => SuccessScreen(
                        onButtonClicked: () =>
                            Get.to(() => const LoginScreen()),
                        title: CustomStrings.yourAccountCreatedTitle,
                        subTitle: CustomStrings.yourAccountCreatedSubTitle,
                        animationPath: ImageStrings.verifySuccess,
                      ),
                    ),
                    child: const Text(CustomStrings.myContinue),
                  ),
                ),
                const SizedBox(height: CustomSize.spaceBtwItems),
                SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () {},
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
