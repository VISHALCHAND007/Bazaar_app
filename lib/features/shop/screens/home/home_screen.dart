import 'package:e_commerce/common/widgets/layout/grid_layout.dart';
import 'package:e_commerce/common/widgets/products/products_card/products_card_vertical.dart';
import 'package:e_commerce/common/widgets/texts/section_heading.dart';
import 'package:e_commerce/features/shop/screens/allProducts/all_products.dart';
import 'package:e_commerce/features/shop/screens/home/widgets/banner_slider.dart';
import 'package:e_commerce/features/shop/screens/home/widgets/home_app_bar.dart';
import 'package:e_commerce/features/shop/screens/home/widgets/home_categories.dart';
import 'package:e_commerce/utils/constants/custom_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/customShapes/containers/custom_header_container.dart';
import '../../../../common/widgets/customShapes/containers/search_container.dart';
import '../../../../utils/constants/image_strings.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime? _lastBackPressed;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_, didPop) {
        final now = DateTime.now();
        if(_lastBackPressed == null || now.difference(_lastBackPressed!) > const Duration(seconds: 2) ) {
          _lastBackPressed = now;
          Get.snackbar("Exit", "Press back again to exit.", snackPosition: .BOTTOM, margin: const .all(10));
        } else {
          SystemNavigator.pop();
        }
      },
      child: SingleChildScrollView(
        child: Column(
          children: [
            //header
            const PrimaryHeaderContainer(
              child: Column(
                children: [
                  // App bar
                  HomeAppbar(),
                  SizedBox(height: CustomSize.spaceBtwSections),

                  //Search bar
                  SearchContainer(text: "Search in store", showBackground: true),
                  SizedBox(height: CustomSize.spaceBtwSections),

                  //Categories
                  HomeCategories(),

                  SizedBox(height: CustomSize.spaceBtwSections),
                ],
              ),
            ),
            //body::

            //carousel
            Padding(
              padding: const .all(CustomSize.defaultSpace),
              child: Column(
                children: [
                  const BannerSlider(
                    banners: [
                      ImageStrings.banner1,
                      ImageStrings.banner2,
                      ImageStrings.banner3,
                    ],
                  ),
                  //popular products
                  SectionHeading(title: "Popular Products", onPressed: () => Get.to(() => const AllProducts())),
                  const SizedBox(height: CustomSize.spaceBtwItems),

                  GridLayout(
                    itemCount: 2,
                    itemBuilder: (BuildContext _, int index) =>
                        const ProductsCardVertical(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
