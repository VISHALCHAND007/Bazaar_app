import 'package:e_commerce/common/widgets/layout/grid_layout.dart';
import 'package:e_commerce/common/widgets/products/products_card/products_card_vertical.dart';
import 'package:e_commerce/features/shop/screens/home/widgets/banner_slider.dart';
import 'package:e_commerce/features/shop/screens/home/widgets/home_app_bar.dart';
import 'package:e_commerce/features/shop/screens/home/widgets/home_categories.dart';
import 'package:e_commerce/utils/constants/custom_size.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/customShapes/containers/custom_header_container.dart';
import '../../../../common/widgets/customShapes/containers/search_container.dart';
import '../../../../utils/constants/image_strings.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
              ],
            ),
          ),
          //body::

          //carousel
          const Padding(
            padding: .all(CustomSize.defaultSpace),
            child: BannerSlider(
              banners: [
                ImageStrings.banner1,
                ImageStrings.banner2,
                ImageStrings.banner3,
              ],
            ),
          ),

          //popular products
          GridLayout(
            itemCount: 2,
            itemBuilder: (BuildContext _, int index) =>
                const ProductsCardVertical(),
          ),
        ],
      ),
    );
  }
}
