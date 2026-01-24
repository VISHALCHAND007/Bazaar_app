import 'package:e_commerce/common/widgets/appbar/custom_app_bar.dart';
import 'package:e_commerce/common/widgets/layout/grid_layout.dart';
import 'package:e_commerce/common/widgets/products/products_card/products_card_vertical.dart';
import 'package:e_commerce/features/authentication/screens/navigation_menu/navigation_menu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/custom_size.dart';

class WishListScreen extends StatelessWidget {
  const WishListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: SizedBox(
          width: .infinity,
          child: Text(
            "Wishlist",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () => Get.find<NavigationController>().selectedIndex.value = 0,
            icon: const Icon(Iconsax.add),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const .all(CustomSize.defaultSpace),
                child: GridLayout(
                  itemCount: 8,
                  itemBuilder: (_, ind) => const ProductsCardVertical(),
                ),
              ),
              const SizedBox(height: CustomSize.spaceBtwSections),
            ],
          ),
        ),
      ),
    );
  }
}
