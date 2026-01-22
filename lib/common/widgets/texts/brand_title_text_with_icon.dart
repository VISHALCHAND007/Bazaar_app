import 'package:flutter/material.dart';

import '../../../utils/constants/custom_size.dart';
import '../../../utils/constants/enums.dart';
import '../../../utils/constants/my_colors.dart';
import 'brand_title_text.dart';


class BrandTitleWithIcon extends StatelessWidget {
  const BrandTitleWithIcon({
    super.key,
    required this.title,
    required this.icon,
    this.iconColor = MyColors.primary,
    this.iconSize = CustomSize.iconXs,
    this.textColor,
    this.maxLines = 1,
    this.textSize = .small,
    this.textAlign = .center,
  });

  final String title;
  final IconData icon;
  final double iconSize;
  final Color? textColor, iconColor;
  final int maxLines;
  final TextSizes textSize;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: .min,
      children: [
        Flexible(
          child: BrandTitleText(
            title: title,
            textColor: textColor,
            textAlign: textAlign,
            maxLines: maxLines,
            textSize: textSize,
          ),
        ),
        const SizedBox(width: CustomSize.xs),
        Icon(icon, color: iconColor, size: iconSize),
      ],
    );
  }
}