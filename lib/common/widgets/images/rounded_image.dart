import 'package:flutter/material.dart';

import '../../../utils/constants/custom_size.dart';
import '../../../utils/constants/my_colors.dart';


class RoundedImage extends StatelessWidget {
  const RoundedImage({
    super.key,
    this.height,
    this.width = .infinity,
    required this.imageUrl,
    this.applyImageRadius = true,
    this.border,
    this.backgroundColor,
    this.fit,
    this.padding = const EdgeInsetsGeometry.symmetric(horizontal: 10),
    this.isNetworkImage = false,
    this.onTap,
    this.borderRadius = CustomSize.md,
  });

  final double? height, width;
  final String imageUrl;
  final bool applyImageRadius;
  final BoxBorder? border;
  final Color? backgroundColor;
  final BoxFit? fit;
  final EdgeInsetsGeometry? padding;
  final bool isNetworkImage;
  final VoidCallback? onTap;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        padding: padding,
        decoration: BoxDecoration(
          color: backgroundColor,
          border: border,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: ClipRRect(
          borderRadius: applyImageRadius ? .circular(borderRadius) : .zero,
          child: Image(
            fit: fit,
            image: isNetworkImage
                ? NetworkImage(imageUrl)
                : AssetImage(imageUrl),
          ),
        ),
      ),
    );
  }
}