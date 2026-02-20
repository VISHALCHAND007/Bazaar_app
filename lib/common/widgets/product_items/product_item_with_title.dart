import 'package:e_commerce/common/widgets/images/circular_image.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/custom_size.dart';
import '../../../utils/constants/my_colors.dart';
import '../../../utils/helpers/helpers.dart';

class ProductWithTitle extends StatelessWidget {
  const ProductWithTitle({
    super.key,
    required this.title,
    required this.image,
    this.textColor = MyColors.white,
    this.backgroundColor = MyColors.white,
    this.onTap,
    this.networkImage = false,
  });

  final String title, image;
  final Color textColor;
  final Color? backgroundColor;
  final Function()? onTap;
  final bool networkImage;

  @override
  Widget build(BuildContext context) {
    final isDark = Helpers.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsetsGeometry.only(right: CustomSize.spaceBtwItems),
        child: Column(
          children: [
            //Image
            RoundedImage(
              width: 56,
              height: 56,
              applyImageRadius: true,
              borderRadius: 56,
              imageUrl: image,
              fit: .cover,
              padding: const EdgeInsets.all(2),
              isNetworkImage: networkImage,
              backgroundColor: backgroundColor,
            ),

            const SizedBox(height: CustomSize.spaceBtwItems / 2),

            //item name
            SizedBox(
              width: 55,
              child: Text(
                title,
                style: Theme.of(
                  context,
                ).textTheme.labelMedium!.apply(color: textColor),
                overflow: .ellipsis,
                maxLines: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
