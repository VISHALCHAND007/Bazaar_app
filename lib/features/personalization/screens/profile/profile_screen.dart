import 'package:e_commerce/common/widgets/appbar/custom_app_bar.dart';
import 'package:e_commerce/common/widgets/images/circular_image.dart';
import 'package:e_commerce/common/widgets/texts/section_heading.dart';
import 'package:e_commerce/features/personalization/screens/profile/widgets/change_name_screen.dart';
import 'package:e_commerce/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/custom_size.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../controllers/user_controller.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;

    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar(
          shouldShowBackBtn: true,
          title: SizedBox(width: .infinity, child: Text("Profile")),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const .all(CustomSize.defaultSpace),
            child: Column(
              crossAxisAlignment: .stretch,
              children: [
                //Profile
                const RoundedImage(
                  imageUrl: ImageStrings.user,
                  width: 80,
                  height: 80,
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text("Change Profile Picture"),
                ),

                //separation
                const SizedBox(height: CustomSize.spaceBtwItems / 2),
                const Divider(),
                const SizedBox(height: CustomSize.spaceBtwItems),

                //details
                const SectionHeading(
                  title: "Profile Information",
                  showActionBtn: false,
                ),
                const SizedBox(height: CustomSize.spaceBtwItems),

                Obx(
                  () => ProfileMenu(
                    title: "Name",
                    value: controller.user.value?.fullName ?? "",
                    onPressed: () => Get.to(() => const ChangeNameScreen()),
                  ),
                ),
                ProfileMenu(
                  title: "Username",
                  value: controller.user.value?.username ?? "",
                  onPressed: () {},
                ),

                const SizedBox(height: CustomSize.spaceBtwItems),
                const Divider(),
                const SizedBox(height: CustomSize.spaceBtwItems),

                //heading
                const SectionHeading(
                  title: "Personal Information",
                  showActionBtn: false,
                ),
                const SizedBox(height: CustomSize.spaceBtwItems),

                ProfileMenu(
                  onPressed: () {},
                  title: "UserId",
                  value: controller.user.value?.id ?? "",
                  icon: Iconsax.copy,
                ),
                ProfileMenu(
                  onPressed: () {},
                  title: "E-mail",
                  value: controller.user.value?.email ?? "",
                ),
                ProfileMenu(
                  onPressed: () {},
                  title: "Phone Number",
                  value: controller.user.value?.phoneNumber ?? "",
                ),
                ProfileMenu(onPressed: () {}, title: "Gender", value: "Male"),
                ProfileMenu(
                  onPressed: () {},
                  title: "Date of Birth",
                  value: "26 Feb, 1997",
                ),

                const Divider(),
                const SizedBox(height: CustomSize.spaceBtwItems),

                //delete account
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Delete account",
                    style: TextStyle(color: Colors.red),
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
