import 'package:flutter/material.dart';

import '../../../../utils/constants/custom_size.dart';
import '../../../../utils/constants/my_colors.dart';


class CircularContainer extends StatelessWidget {
  const CircularContainer({
    this.height,
    this.width,
    this.padding = EdgeInsets.zero,
    this.margin,
    this.backgroundColor = MyColors.white,
    this.child,
    this.radius = CustomSize.cardRadiusLg,
    super.key});

  final double? height;
  final double? width;
  final double radius;
  final EdgeInsets padding;
  final EdgeInsets? margin;
  final Widget? child;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          color: backgroundColor
      ),
      child: child,
    );
  }
}