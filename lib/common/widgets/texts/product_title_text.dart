import 'package:flutter/material.dart';

class ProductTitleText extends StatelessWidget {
  const ProductTitleText({
    super.key,
    required this.title,
    this.showSmallSize = false,
    this.maxLines = 2,
    this.textAlign = TextAlign.left,
  });

  final String title;
  final bool showSmallSize;
  final int maxLines;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Text(
      title,
      style: showSmallSize ? theme.textTheme.labelLarge : theme.textTheme.titleSmall,
      overflow: .ellipsis,
      maxLines: maxLines,
      textAlign: textAlign,
    );
  }
}
