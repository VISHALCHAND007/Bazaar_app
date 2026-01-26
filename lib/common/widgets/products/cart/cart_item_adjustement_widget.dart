import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/custom_size.dart';
import '../../../../utils/constants/my_colors.dart';
import '../../../../utils/helpers/helpers.dart';
import '../../../icons/circular_icon.dart';
import '../../texts/product_price_text.dart';
import '../../texts/product_title_text.dart';


class CartItemAdjustmentWidget extends StatelessWidget {
  const CartItemAdjustmentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Helpers.isDarkMode(context);

    return Row(
      mainAxisAlignment: .spaceBetween,
      children: [
        Row(
          children: [
            const SizedBox(width: 70,),
            CircularIcon(
              height: 30,
              width: 30,
              icon: Iconsax.minus,
              backgroundColor: isDark ? MyColors.darkerGrey : MyColors.white,
              selectedColor: isDark ? MyColors.white : MyColors.black,
            ),
            const SizedBox(width: CustomSize.sm),
            const ProductTitleText(title: "2"),
            const SizedBox(width: CustomSize.sm),
            const CircularIcon(
              height: 30,
              width: 30,
              icon: Iconsax.add,
              backgroundColor: MyColors.primary,
              selectedColor: MyColors.white,
            ),
          ],
        ),
        const ProductPriceText(price: "245"),
      ],
    );
  }
}