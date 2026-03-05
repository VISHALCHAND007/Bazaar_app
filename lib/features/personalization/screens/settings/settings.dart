import 'package:e_commerce/common/widgets/appbar/custom_app_bar.dart';
import 'package:e_commerce/common/widgets/customShapes/containers/custom_header_container.dart';
import 'package:e_commerce/common/widgets/list_tiles/settings_menu_tile.dart';
import 'package:e_commerce/common/widgets/texts/section_heading.dart';
import 'package:e_commerce/data/repositories/authentication/authentication_repository.dart';
import 'package:e_commerce/features/personalization/screens/address/addresses.dart';
import 'package:e_commerce/features/personalization/screens/load_data/load_data_screen.dart';
import 'package:e_commerce/features/shop/screens/cart/cart_screen.dart';
import 'package:e_commerce/features/shop/screens/orders/orders_screen.dart';
import 'package:e_commerce/utils/constants/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
                  SettingsMenuTile(
                    icon: Iconsax.safe_home,
                    title: "My Address",
                    subTitle: "Set shopping delivery address",
                    onTap: () => Get.to(() => const AddressesScreen()),
                  ),
                  SettingsMenuTile(
                    icon: Iconsax.shopping_cart,
                    title: "My Cart",
                    subTitle: "Add, remove products and move to checkout",
                    onTap: () => Get.to(() => const CartScreen()),
                  ),
                  SettingsMenuTile(
                    icon: Iconsax.bag_tick,
                    title: "My Orders",
                    subTitle: "In-progress and completed orders",
                    onTap: () => Get.to(() => const OrdersScreen()),
                  ),
                  const SettingsMenuTile(
                    icon: Iconsax.bank,
                    title: "Bank Account",
                    subTitle: "Withdraw balance to registered account",
                  ),
                  const SettingsMenuTile(
                    icon: Iconsax.discount_shape,
                    title: "My Coupons",
                    subTitle: "List of all the discounted coupons",
                  ),
                  const SettingsMenuTile(
                    icon: Iconsax.notification,
                    title: "Notifications",
                    subTitle: "Set any kind of notification message",
                  ),
                  const SettingsMenuTile(
                    icon: Iconsax.security_card,
                    title: "Account Privacy",
                    subTitle: "Manage data usage and connected accounts",
                  ),
                  const SizedBox(height: CustomSize.spaceBtwSections),

                  //App settings
                  const SectionHeading(
                    title: "App Settings",
                    showActionBtn: false,
                  ),
                  const SizedBox(height: CustomSize.spaceBtwItems),
                  SettingsMenuTile(
                    icon: Iconsax.document_upload,
                    title: "Load data",
                    subTitle: "Upload data to your Cloud Firebase",
                    onTap: () => Get.to(() => const LoadDataScreen()),
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
                  SizedBox(
                    width: .infinity,
                    child: OutlinedButton(
                      onPressed:() async {
                        await AuthenticationRepository.instance.logout();
                        AuthenticationRepository.instance.screenRedirect();
                      },
                      child: const Text("Logout"),
                    ),
                  ),
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
