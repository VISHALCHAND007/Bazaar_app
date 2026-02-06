import 'package:e_commerce/common/widgets/appbar/custom_app_bar.dart';
import 'package:e_commerce/features/personalization/controllers/update_name_controller.dart';
import 'package:e_commerce/utils/validators/validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/custom_size.dart';
import '../../../../../utils/constants/custom_strings.dart';

class ChangeNameScreen extends StatelessWidget {
  const ChangeNameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateNameController());

    return Scaffold(
      appBar: const CustomAppBar(
        shouldShowBackBtn: true,
        title: Text("Change Name"),
      ),
      body: Padding(
        padding: const .all(CustomSize.defaultSpace),
        child: Column(
          crossAxisAlignment: .center,
          children: [
            //heading
            Text(
              "Use real name for easy verification. This name will appear on several pages.",
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const SizedBox(height: CustomSize.spaceBtwSections),

            //Textfield and button
            Form(
              key: controller.changeNameFormKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: controller.firstName,
                    expands: false,
                    decoration: const InputDecoration(
                      labelText: CustomStrings.firstName,
                      prefixIcon: Icon(Iconsax.user),
                    ),
                    validator: (value) => Validator.validateEmptyField(
                      CustomStrings.firstName,
                      value,
                    ),
                  ),
                  const SizedBox(height: CustomSize.spaceBtwItems),
                  TextFormField(
                    controller: controller.lastName,
                    expands: false,
                    decoration: const InputDecoration(
                      labelText: CustomStrings.lastName,
                      prefixIcon: Icon(Iconsax.user),
                    ),
                    validator: (value) => Validator.validateEmptyField(
                      CustomStrings.lastName,
                      value,
                    ),
                  ),
                ],
              ),
            ),

            //save button
            const SizedBox(height: CustomSize.spaceBtwSections),
            SizedBox(
              width: .infinity,
              child: ElevatedButton(
                onPressed: () => controller.updateUserName(),
                child: const Text("Save"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
