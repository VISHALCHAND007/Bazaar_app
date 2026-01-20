import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/custom_size.dart';
import '../../../../utils/constants/my_colors.dart';
import '../../../../utils/device/device_utility.dart';
import '../../../../utils/helpers/helpers.dart';

class SearchContainer extends StatelessWidget {
  const SearchContainer({
    super.key,
    required this.text,
    this.icon = Iconsax.search_normal,
    this.showBackground = true,
    this.showBorder = true, this.onTap,
  });

  final String text;
  final IconData? icon;
  final bool showBackground, showBorder;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final isDark = Helpers.isDarkMode(context);

    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsetsGeometry.symmetric(
          horizontal: CustomSize.md,
        ),
        child: Container(
          width: DeviceUtility.getScreenWidth(context),
          padding: const EdgeInsets.all(CustomSize.spaceBtwItems),
          decoration: BoxDecoration(
            color: showBackground
                ? isDark
                ? MyColors.dark
                : MyColors.light
                : Colors.transparent,
            borderRadius: BorderRadius.circular(CustomSize.cardRadiusLg),
            border: showBorder ? Border.all(color: MyColors.grey) : null,
          ),
          child: Row(
            children: [
              Icon(icon, color: MyColors.darkGrey),
              const SizedBox(width: CustomSize.spaceBtwItems),
              Text(text, style: Theme.of(context).textTheme.bodySmall),
            ],
          ),
        ),
      ),
    );
  }
}