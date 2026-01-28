import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constants/custom_size.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/my_colors.dart';
import '../../../utils/helpers/helpers.dart';
import '../customShapes/containers/circular_container.dart';
import '../customShapes/containers/rounded_container.dart';
import '../texts/brand_title_text_with_icon.dart';


class BrandCard extends StatelessWidget {
  const BrandCard({
    super.key, required this.onTap,
  });

  final VoidCallback onTap;


  @override
  Widget build(BuildContext context) {
    final isDark = Helpers.isDarkMode(context);

    return InkWell(
      onTap: onTap,
      child: RoundedContainer(
        padding: const .all(CustomSize.sm),
        backgroundColor: Colors.transparent,
        showBorder: true,
        child: Row(
          children: [
            //image
            Flexible(
              child: CircularContainer(
                imageUrl: ImageStrings.clothIcon,
                backgroundColor: Colors.transparent,
                foregroundColor: isDark
                    ? MyColors.white
                    : MyColors.black,
              ),
            ),
            const SizedBox(width: CustomSize.spaceBtwItems),

            //text
            Expanded(
              child: Column(
                crossAxisAlignment: .start,
                mainAxisSize: .min,
                children: [
                  const BrandTitleWithIcon(
                    title: "Nike",
                    icon: Iconsax.verify5,
                    textSize: .large,
                  ),
                  //products
                  Text(
                    "256 products",
                    overflow: .ellipsis,
                    style: Theme.of(
                      context,
                    ).textTheme.labelMedium,
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
