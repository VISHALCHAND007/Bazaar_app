import 'package:e_commerce/features/authentication/screens/password_validation/reset_password.dart';
import 'package:e_commerce/utils/constants/custom_size.dart';
import 'package:e_commerce/utils/constants/custom_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(CustomSize.defaultSpace),
            child: Column(
              crossAxisAlignment: .stretch,
              children: [
                //title & subtitle
                Text(
                  CustomStrings.forgetPasswordTitle,
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: .start,
                ),
                const SizedBox(height: CustomSize.spaceBtwItems),
                Text(
                  CustomStrings.forgetPasswordSubTitle,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                const SizedBox(height: CustomSize.spaceBtwSections * 2),
          
                //textfield
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: CustomStrings.email,
                    prefixIcon: Icon(Iconsax.direct_right),
                  ),
                ),
                const SizedBox(height: CustomSize.spaceBtwSections,),
          
                //button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => Get.off(() => const ResetPassword()),
                    child: const Text(CustomStrings.submit),
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
