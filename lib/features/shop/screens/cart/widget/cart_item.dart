import 'package:flutter/material.dart';

import '../../../../../common/widgets/customShapes/containers/rounded_container.dart';
import '../../../../../common/widgets/texts/brand_title_text_with_icon.dart';
import '../../../../../common/widgets/texts/product_title_text.dart';
import '../../../../../utils/constants/custom_size.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/my_colors.dart';
import '../../../../../utils/helpers/helpers.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Helpers.isDarkMode(context);

    return Row(
      children: [
        RoundedContainer(
          padding: const .all(CustomSize.sm),
          height: 50,
          width: 50,
          backgroundColor: isDark ? MyColors.darkerGrey : MyColors.light,
          child: const Center(
            child: Image(image: AssetImage(ImageStrings.productImage1)),
          ),
        ),
        const SizedBox(width: CustomSize.spaceBtwItems),
        Expanded(
          child: Column(
            mainAxisSize: .min,
            crossAxisAlignment: .start,
            children: [
              const BrandTitleWithIcon(title: "Nike"),
              const SizedBox(height: CustomSize.sm / 2),
              const ProductTitleText(
                title: "Black Nike Sports Shoes",
                maxLines: 1,
              ),
              const SizedBox(height: CustomSize.sm / 2),

              //variations
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "Color: ",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    TextSpan(
                      text: "Green",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),

                    TextSpan(
                      text: " Size: ",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    TextSpan(
                      text: "EU 36",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}