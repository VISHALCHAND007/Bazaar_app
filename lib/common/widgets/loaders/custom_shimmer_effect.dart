import 'package:e_commerce/utils/constants/my_colors.dart';
import 'package:e_commerce/utils/helpers/helpers.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomShimmerEffect extends StatelessWidget {
  const CustomShimmerEffect({
    super.key,
    required this.height,
    required this.width,
    this.radius = 15,
    this.color,
  });

  final double height, width, radius;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final isDark = Helpers.isDarkMode(context);

    return Shimmer.fromColors(
      baseColor: isDark ? Colors.grey[850]! : Colors.grey[300]!,
      highlightColor: isDark ? Colors.grey[700]! : Colors.grey[100]!,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: isDark ? MyColors.darkerGrey : MyColors.white,
          borderRadius: .circular(radius)
        ),
      ),
    );
  }
}
