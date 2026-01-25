import 'package:e_commerce/common/icons/circular_icon.dart';
import 'package:e_commerce/utils/helpers/helpers.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/custom_size.dart';
import '../../../../../utils/constants/my_colors.dart';

class AddToCardBottom extends StatelessWidget {
  const AddToCardBottom({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Helpers.isDarkMode(context);

    return Container(
      padding: const .symmetric(
        vertical: CustomSize.defaultSpace / 2,
        horizontal: CustomSize.defaultSpace,
      ),
      decoration: BoxDecoration(
        color: isDark ? MyColors.darkerGrey : MyColors.light,
        borderRadius: const .only(
          topLeft: Radius.circular(CustomSize.cardRadiusLg),
          topRight: Radius.circular(CustomSize.cardRadiusLg),
        ),
      ),
      child: Row(
        mainAxisAlignment: .spaceBetween,
        children: [
          Row(
            children: [
              const CircularIcon(
                icon: Iconsax.minus,
                selectedColor: MyColors.white,
                backgroundColor: MyColors.darkGrey,
                width: 40,
                height: 40,
              ),

              const SizedBox(width: CustomSize.spaceBtwItems),
              Text("2", style: Theme.of(context).textTheme.titleSmall),
              const SizedBox(width: CustomSize.spaceBtwItems),

              const CircularIcon(
                icon: Iconsax.add,
                selectedColor: MyColors.white,
                backgroundColor: MyColors.dark,
                width: 40,
                height: 40,
              ),
            ],
          ),
          //cart button
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: MyColors.dark,
              padding: const .all(CustomSize.md),
              side: const BorderSide(color: MyColors.dark)
            ),
            child: const Text("Add to Cart"),
          ),
        ],
      ),
    );
  }
}
