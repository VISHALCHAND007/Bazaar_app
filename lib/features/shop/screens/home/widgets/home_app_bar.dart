import 'package:e_commerce/common/widgets/loaders/custom_shimmer_effect.dart';
import 'package:e_commerce/features/personalization/controllers/user_controller.dart';
import 'package:e_commerce/features/shop/screens/cart/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/appbar/custom_app_bar.dart';
import '../../../../../common/widgets/products/cart/cart_icon_with_label.dart';
import '../../../../../utils/constants/custom_strings.dart';
import '../../../../../utils/constants/my_colors.dart';

class HomeAppbar extends StatelessWidget {
  const HomeAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;

    return Column(
      children: [
        CustomAppBar(
          title: Column(
            crossAxisAlignment: .stretch,
            children: [
              Text(
                CustomStrings.homeAppBarTitle,
                style: Theme.of(
                  context,
                ).textTheme.labelMedium!.apply(color: MyColors.grey),
              ),
              Obx(() {
                if (controller.profileLoading.value) {
                  return const CustomShimmerEffect(width: 80, height: 20);
                } else {
                  return Text(
                    controller.user.value?.fullName ?? "",
                    style: Theme.of(
                      context,
                    ).textTheme.headlineSmall!.apply(color: MyColors.white),
                  );
                }
              }),
            ],
          ),
          actions: [
            CartIconWithLabel(
              iconColor: MyColors.white,
              onPressedHandler: () => Get.to(() => const CartScreen()),
            ),
          ],
        ),
      ],
    );
  }
}
