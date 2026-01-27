import 'package:e_commerce/common/widgets/appbar/custom_app_bar.dart';
import 'package:e_commerce/common/widgets/images/circular_image.dart';
import 'package:e_commerce/common/widgets/products/products_card/product_card_horizontal.dart';
import 'package:e_commerce/common/widgets/texts/section_heading.dart';
import 'package:e_commerce/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';

import '../../../../utils/constants/custom_size.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar(
          title: Text("Sports"),
          shouldShowBackBtn: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const .all(CustomSize.defaultSpace),
            child: Column(
              children: [
                //banner
                const RoundedImage(
                  imageUrl: ImageStrings.banner1,
                  width: .infinity,
                  applyImageRadius: true,
                ),
                const SizedBox(height: CustomSize.spaceBtwSections),

                //heading
                SectionHeading(title: "Sports Shirts", onPressed: () {}),

                //related products in horizontally extended manner, inside a horizontally scrollable list
                SizedBox(
                  height: 120,
                  child: ListView.separated(
                    scrollDirection: .horizontal,
                    itemBuilder: (_, ind) => const ProductCardHorizontal(),
                    separatorBuilder: (_, _) =>
                        const SizedBox(width: CustomSize.spaceBtwItems),
                    itemCount: 5,
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
