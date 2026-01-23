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
  });

  final String title, image;
  final Color textColor;
  final Color? backgroundColor;
  final Function()? onTap;

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
            Container(
              height: 56,
              width: 56,
              padding: const .all(CustomSize.sm),
              decoration: BoxDecoration(
                color:
                backgroundColor ??
                    (isDark ? MyColors.black : MyColors.light),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Center(
                child: Image.asset(
                  image,
                  fit: BoxFit.cover,
                  // color: isDark ? MyColors.light : MyColors.dark,
                ),
              ),
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