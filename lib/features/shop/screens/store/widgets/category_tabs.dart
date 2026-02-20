import 'package:e_commerce/common/widgets/layout/grid_layout.dart';
import 'package:e_commerce/common/widgets/products/products_card/products_card_vertical.dart';
import 'package:e_commerce/common/widgets/texts/section_heading.dart';
import 'package:e_commerce/features/shop/models/categories_model.dart';
import 'package:flutter/material.dart';

import '../../../../../common/widgets/brands/brand_show_case.dart';
import '../../../../../utils/constants/custom_size.dart';
import '../../../../../utils/constants/image_strings.dart';

class CategoryTabs extends StatelessWidget {
  final CategoriesModel category;
  const CategoryTabs({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(CustomSize.defaultSpace),
          child: Column(
            children: [
              //brands
              const BrandShowCase(
                images: [
                  ImageStrings.productImage13,
                  ImageStrings.productImage12,
                  ImageStrings.productImage1,
                ],
              ),

              //Products
              SectionHeading(title: "You might like", onPressed: () {}),
              const SizedBox(height: CustomSize.spaceBtwItems),

              GridLayout(
                itemCount: 4,
                itemBuilder: (_, ind) => const ProductsCardVertical(),
              ),
              const SizedBox(height: CustomSize.spaceBtwSections,)
            ],
          ),
        ),
      ],
    );
  }
}
