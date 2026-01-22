import 'package:flutter/material.dart';

import '../../../utils/constants/enums.dart';


class BrandTitleText extends StatelessWidget {
  const BrandTitleText({
    super.key,
    required this.title,
    this.textColor,
    this.maxLines = 1,
    this.textAlign = .center,
    this.textSize = .small,
  });

  final String title;
  final Color? textColor;
  final int maxLines;
  final TextAlign? textAlign;
  final TextSizes textSize;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Text(
      title,
      maxLines: maxLines,
      textAlign: textAlign,
      style: textSize == TextSizes.small
          ? theme.textTheme.labelMedium!.apply(color: textColor)
          : textSize == TextSizes.medium
          ? theme.textTheme.bodyLarge!.apply(color: textColor)
          : textSize == TextSizes.large
          ? theme.textTheme.titleLarge!.apply(color: textColor)
          : theme.textTheme.bodyMedium!.apply(color: textColor),
    );
  }
}