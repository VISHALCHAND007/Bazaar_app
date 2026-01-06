import 'package:flutter/material.dart';

import '../../utils/constants/my_colors.dart';

class HorizontalDividerWithText extends StatelessWidget {
  final bool isDark;
  final String text;

  const HorizontalDividerWithText({
    super.key,
    required this.isDark,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: Divider(
            color: isDark ? MyColors.darkGrey : MyColors.grey,
            thickness: .5,
            indent: 60,
            endIndent: 5,
          ),
        ),
        Text(
          text,
          style: Theme.of(context).textTheme.labelMedium,
        ),
        Flexible(
          child: Divider(
            color: isDark ? MyColors.darkGrey : MyColors.grey,
            thickness: .5,
            indent: 5,
            endIndent: 60,
          ),
        ),
      ],
    );
  }
}
