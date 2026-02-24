import 'package:e_commerce/common/widgets/appbar/custom_app_bar.dart';
import 'package:e_commerce/common/widgets/appbar/custom_tab_bar.dart';
import 'package:e_commerce/common/widgets/customShapes/containers/search_container.dart';
import 'package:e_commerce/common/widgets/layout/grid_layout.dart';
import 'package:e_commerce/common/widgets/products/cart/cart_icon_with_label.dart';
import 'package:e_commerce/common/widgets/texts/section_heading.dart';
import 'package:e_commerce/features/shop/controllers/category_controller.dart';
import 'package:e_commerce/features/shop/screens/brands/all_brands.dart';
import 'package:e_commerce/features/shop/screens/store/widgets/category_tabs.dart';
import 'package:e_commerce/utils/helpers/helpers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/brands/brand_card.dart';
import '../../../../utils/constants/custom_size.dart';
import '../../../../utils/constants/my_colors.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Helpers.isDarkMode(context);
    final categoryController = CategoryController.instance;

    return DefaultTabController(
      length: categoryController.featuredCategories.length,
      child: Scaffold(
        appBar: CustomAppBar(
          title: SizedBox(
            width: double.infinity,
            child: Text(
              "Store",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
          actions: [
            CartIconWithLabel(
              iconColor: isDark ? MyColors.white : MyColors.black,
              onPressedHandler: () {},
            ),
          ],
        ),
        body: NestedScrollView(
          headerSliverBuilder: (_, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                pinned: true,
                floating: true,
                automaticallyImplyLeading: false,
                expandedHeight: 440,
                backgroundColor: Helpers.isDarkMode(context)
                    ? MyColors.black
                    : MyColors.white,
                //to add items inside
                flexibleSpace: Padding(
                  padding: const .all(CustomSize.defaultSpace),
                  child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      //search section
                      const SizedBox(height: CustomSize.spaceBtwItems),
                      const SearchContainer(
                        text: "Search in store",
                        showBackground: false,
                        padding: .zero,
                      ),
                      const SizedBox(height: CustomSize.spaceBtwSections),

                      //featured brands
                      SectionHeading(
                        title: "Featured Brands",
                        onPressed: () => Get.to(() => const AllBrands()),
                      ),
                      const SizedBox(height: CustomSize.spaceBtwItems / 2),

                      GridLayout(
                        itemCount: 4,
                        mainAxisExtent: 80,
                        itemBuilder: (_, ind) => BrandCard(onTap: () {}),
                      ),
                    ],
                  ),
                ),
                bottom: CustomTabBar(
                  tabs: categoryController.featuredCategories
                      .map((category) => Tab(child: Text(category.name)))
                      .toList(),
                ),
              ),
            ];
          },
          body: TabBarView(
            children: [
              ...categoryController.featuredCategories.map(
                (category) => CategoryTabs(category: category),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
