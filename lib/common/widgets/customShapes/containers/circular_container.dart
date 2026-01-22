import 'dart:math';

import 'package:flutter/material.dart';

import '../../../../utils/constants/custom_size.dart';
import '../../../../utils/constants/my_colors.dart';
import '../../../../utils/helpers/helpers.dart';

class CircularContainer extends StatelessWidget {
  const CircularContainer({
    super.key,
    required this.imageUrl,
    this.fit = BoxFit.cover,
    this.backgroundColor,
    this.foregroundColor,
    this.padding = const EdgeInsetsGeometry.all(CustomSize.sm),
    this.isNetworkImg = false,
    this.width = 56,
    this.height = 56,
  });

  final String imageUrl;
  final BoxFit? fit;
  final Color? backgroundColor, foregroundColor;
  final EdgeInsetsGeometry? padding;
  final bool isNetworkImg;
  final double width, height;

  @override
  Widget build(BuildContext context) {
    final isDark = Helpers.isDarkMode(context);

    return Container(
      height: height,
      width: width,
      padding: padding,
      decoration: BoxDecoration(
        color: backgroundColor ?? (isDark ? MyColors.black : MyColors.white),
        borderRadius: .circular(max(height, width)),
      ),
      child: Center(
        child: Image(
          fit: fit,
          image: isNetworkImg ? NetworkImage(imageUrl) : AssetImage(imageUrl),
          color: foregroundColor ?? (isDark ? MyColors.white : MyColors.black),
        ),
      ),
    );
  }
}
