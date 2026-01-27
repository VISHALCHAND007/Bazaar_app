import 'package:e_commerce/common/widgets/appbar/custom_app_bar.dart';
import 'package:e_commerce/common/widgets/images/circular_image.dart';
import 'package:e_commerce/common/widgets/texts/section_heading.dart';
import 'package:e_commerce/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/custom_size.dart';
import '../../../../utils/constants/image_strings.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
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

                ProfileMenu(
                  title: "Name",
                  value: "Vishal Chand",
                  onPressed: () {},
                ),
                ProfileMenu(
                  title: "Username",
                  value: "vishal_chand96",
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
                  value: "djldfa1122da2fd",
                  icon: Iconsax.copy,
                ),
                ProfileMenu(
                  onPressed: () {},
                  title: "E-mail",
                  value: "vishal.chand@gmail.in",
                ),
                ProfileMenu(
                  onPressed: () {},
                  title: "Phone Number",
                  value: "+91 5248759685",
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
