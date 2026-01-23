import 'package:e_commerce/utils/helpers/helpers.dart';
import 'package:flutter/material.dart';

import '../../../../utils/constants/custom_size.dart';
import '../../../../utils/constants/my_colors.dart';

class RoundedContainer extends StatelessWidget {
  const RoundedContainer({
    this.height,
    this.width,
    this.padding = EdgeInsets.zero,
    this.margin,
    this.backgroundColor = MyColors.white,
    this.child,
    this.showBorder = false,
    this.radius = CustomSize.cardRadiusLg,
    super.key,
    this.borderColor,
  });

  final double? height;
  final double? width;
  final double radius;
  final EdgeInsets padding;
  final EdgeInsets? margin;
  final Widget? child;
  final Color backgroundColor;
  final Color? borderColor;
  final bool showBorder;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: backgroundColor,
        border: showBorder
            ? Border.all(
                color:
                    borderColor ??
                    (Helpers.isDarkMode(context)
                        ? MyColors.white
                        : MyColors.grey),
                width: 1,
              )
            : null,
      ),
      child: child,
    );
  }
}
