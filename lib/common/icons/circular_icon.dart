import 'package:e_commerce/utils/helpers/helpers.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../utils/constants/my_colors.dart';

class CircularIcon extends StatelessWidget {
  const CircularIcon({
    super.key,
    this.height,
    this.width,
    this.size,
    required this.icon,
    this.backgroundColor,
    this.selectedColor = Colors.red,
    this.onPressed,
  });

  final double? height, width, size;
  final IconData icon;
  final Color? backgroundColor;
  final Color selectedColor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: Helpers.isDarkMode(context)
            ? MyColors.black.withValues(alpha: .9)
            : MyColors.white.withValues(alpha: .9),
        borderRadius: .circular(100),
      ),
      child: IconButton(
        onPressed: () {},
        icon: Icon(Iconsax.heart5, size: size,),
        color: selectedColor,
      ),
    );
  }
}
