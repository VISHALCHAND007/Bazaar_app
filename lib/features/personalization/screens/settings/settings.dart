import 'package:e_commerce/common/widgets/appbar/custom_app_bar.dart';
import 'package:e_commerce/common/widgets/customShapes/containers/custom_header_container.dart';
import 'package:e_commerce/common/widgets/list_tiles/settings_menu_tile.dart';
import 'package:e_commerce/common/widgets/texts/section_heading.dart';
import 'package:e_commerce/utils/constants/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/list_tiles/user_profile_tile.dart';
import '../../../../utils/constants/custom_size.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            //header
            PrimaryHeaderContainer(
              child: Column(
                children: [
                  //App bar
                  CustomAppBar(
                    title: SizedBox(
                      width: .infinity,
                      child: Text(
                        "Account",
                        style: Theme.of(context).textTheme.headlineMedium!
                            .apply(color: MyColors.white),
                      ),
                    ),
                  ),

                  //user profile card
                  const UserProfileTile(),
                  const SizedBox(height: CustomSize.spaceBtwSections),
                ],
              ),
            ),

            //body
            Padding(
              padding: const .all(CustomSize.defaultSpace),
              child: Column(
                children: [
                  //heading
                  const SectionHeading(
                    title: "Account Settings",
                    showActionBtn: false,
                  ),
                  const SizedBox(height: CustomSize.spaceBtwItems),

                  //Account settings
                  const SettingsMenuTile(
                    icon: Iconsax.safe_home,
                    title: "My Address",
                    subTitle: "Set shopping delivery address",
                  ),
                  const SettingsMenuTile(
                    icon: Iconsax.shopping_cart,
                    title: "My Address",
                    subTitle: "Add, remove products and move to checkout",
                  ),
                  const SettingsMenuTile(
                    icon: Iconsax.bag_tick,
                    title: "My Address",
                    subTitle: "In-progress and completed orders",
                  ),
                  const SettingsMenuTile(
                    icon: Iconsax.bank,
                    title: "My Address",
                    subTitle: "Withdraw balance to registered account",
                  ),
                  const SettingsMenuTile(
                    icon: Iconsax.discount_shape,
                    title: "My Address",
                    subTitle: "List of all the discounted coupons",
                  ),
                  const SettingsMenuTile(
                    icon: Iconsax.notification,
                    title: "My Address",
                    subTitle: "Set any kind of notification message",
                  ),
                  const SettingsMenuTile(
                    icon: Iconsax.security_card,
                    title: "My Address",
                    subTitle: "Manage data usage and connected accounts",
                  ),
                  const SizedBox(height: CustomSize.spaceBtwSections),

                  //App settings
                  const SectionHeading(title: "App Settings", showActionBtn: false),
                  const SizedBox(height: CustomSize.spaceBtwItems),
                  const SettingsMenuTile(
                    icon: Iconsax.document_upload,
                    title: "Load data",
                    subTitle: "Upload data to your Cloud Firebase",
                  ),
                  SettingsMenuTile(
                    icon: Iconsax.location,
                    title: "Geo-location",
                    subTitle: "Set recommendation based on location",
                    trailingWidget: Switch(value: true, onChanged: (value) {}),
                  ),
                  SettingsMenuTile(
                    icon: Iconsax.security_user,
                    title: "Safe mode",
                    subTitle: "Search result is safe for all ages",
                    trailingWidget: Switch(value: false, onChanged: (value) {}),
                  ),
                  SettingsMenuTile(
                    icon: Iconsax.image,
                    title: "HD image quality",
                    subTitle: "Set the loading images quality",
                    trailingWidget: Switch(value: true, onChanged: (value) {}),
                  ),
                  const SizedBox(height: CustomSize.spaceBtwSections),

                  //logout
                  SizedBox(width: .infinity, child: OutlinedButton(onPressed: () {}, child: const Text("Logout")),),
                  const SizedBox(height: CustomSize.spaceBtwSections * 2.5),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
