import 'package:flutter/material.dart';

import '../../../../utils/constants/my_colors.dart';


class CircularContainer extends StatelessWidget {
  const CircularContainer({
    this.height = 400,
    this.width = 400,
    this.padding = 0,
    this.backgroundColor = MyColors.white,
    this.child,
    this.radius = 200,
    super.key});

  final double? height;
  final double? width;
  final double radius;
  final double padding;
  final Widget? child;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          color: backgroundColor.withValues(alpha: .1)
      ),
      child: child,
    );
  }
}