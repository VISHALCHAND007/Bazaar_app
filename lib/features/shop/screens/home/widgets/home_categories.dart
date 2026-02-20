import 'package:e_commerce/common/widgets/shimmer/category_shimmer.dart';
import 'package:e_commerce/features/shop/controllers/category_controller.dart';
import 'package:e_commerce/features/shop/screens/subCategories/sub_categories_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/product_items/product_item_with_title.dart';
import '../../../../../common/widgets/texts/section_heading.dart';
import '../../../../../utils/constants/custom_size.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/my_colors.dart';

class HomeCategories extends StatelessWidget {
  const HomeCategories({super.key});

  @override
  Widget build(BuildContext context) {
    final categoryController = CategoryController.instance;

    return Padding(
      padding: const EdgeInsetsGeometry.only(left: CustomSize.spaceBtwItems),
      child: Column(
        children: [
          //heading
          const SectionHeading(
            title: "Popular Categories",
            showActionBtn: false,
            textColor: MyColors.white,
          ),
          const SizedBox(height: CustomSize.spaceBtwItems),

          //Category items
          Obx(() {
            if (categoryController.isLoading.value) {
              return const CategoryShimmer();
            }

            if (categoryController.featuredCategories.isEmpty) {
              return Center(
                child: Text(
                  "No data found.",
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium!.apply(color: Colors.white),
                ),
              );
            }
            return SizedBox(
              height: 100,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: .horizontal,
                itemCount: categoryController.featuredCategories.length,
                itemBuilder: (_, ind) {
                  final category = categoryController.featuredCategories[ind];
                  return ProductWithTitle(
                    title: category.name,
                    image: category.image,
                    networkImage: true,
                    onTap: () => Get.to(() => const SubCategoriesScreen()),
                  );
                },
              ),
            );
          }),
        ],
      ),
    );
  }
}
