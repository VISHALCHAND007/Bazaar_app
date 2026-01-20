import 'package:flutter/material.dart';

import '../../../../../common/widgets/product_items/product_item_with_title.dart';
import '../../../../../common/widgets/texts/section_heading.dart';
import '../../../../../utils/constants/custom_size.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/my_colors.dart';


class HomeCategories extends StatelessWidget {
  const HomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsGeometry.only(
        left: CustomSize.spaceBtwItems,
      ),
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
          SizedBox(
            height: 100,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: .horizontal,
              itemCount: 9,
              itemBuilder: (_, ind) => ProductWithTitle(
                title: "Pixel 19 pro",
                image: ImageStrings.facebook,
                onTap: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}