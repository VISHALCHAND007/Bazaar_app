import 'package:e_commerce/common/widgets/customShapes/containers/rounded_container.dart';
import 'package:e_commerce/common/widgets/images/circular_image.dart';
import 'package:e_commerce/common/widgets/texts/brand_title_text_with_icon.dart';
import 'package:e_commerce/common/widgets/texts/product_price_text.dart';
import 'package:e_commerce/common/widgets/texts/product_title_text.dart';
import 'package:e_commerce/utils/constants/my_colors.dart';
import 'package:e_commerce/utils/helpers/helpers.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/custom_size.dart';
import '../../../../../utils/constants/image_strings.dart';

class ProductMetaData extends StatelessWidget {
  const ProductMetaData({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Helpers.isDarkMode(context);

    return Column(
      crossAxisAlignment: .start,
      children: [
        //Discount percentage & Price
        Row(
          children: [
            RoundedContainer(
              radius: CustomSize.sm,
              backgroundColor: MyColors.secondary.withValues(alpha: .8),
              padding: const .symmetric(
                horizontal: CustomSize.sm,
                vertical: CustomSize.xs,
              ),
              child: Text(
                "25%",
                style: Theme.of(
                  context,
                ).textTheme.labelLarge!.apply(color: Colors.black),
              ),
            ),
            const SizedBox(width: CustomSize.spaceBtwItems),
            Text(
              "\$250",
              style: Theme.of(context).textTheme.bodyMedium!.apply(
                decoration: TextDecoration.lineThrough,
              ),
            ),
            const SizedBox(width: CustomSize.spaceBtwItems),
            const ProductPriceText(price: "175 "),
          ],
        ),
        const SizedBox(height: CustomSize.spaceBtwItems / 2),

        //Product description
        const ProductTitleText(title: "Green Nike shoes."),
        const SizedBox(height: CustomSize.spaceBtwItems / 2),

        //Availability
        Row(
          children: [
            const ProductTitleText(title: "Status"),
            const SizedBox(width: CustomSize.spaceBtwItems),
            Text("In-stock", style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(height: CustomSize.spaceBtwItems / 2),

        //Brand
        Row(
          children: [
            CircularImage(
              imageUrl: ImageStrings.cosmeticsIcon,
              height: CustomSize.iconLg,
              width: CustomSize.iconLg,
              foregroundColor: isDark ? MyColors.white : MyColors.black,
            ),
            const BrandTitleWithIcon(title: "Nike", icon: Iconsax.verify5),
          ],
        ),
      ],
    );
  }
}
