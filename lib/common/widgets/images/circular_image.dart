import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/common/widgets/loaders/custom_shimmer_effect.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/custom_size.dart';

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
    this.foregroundColor,
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
  final Color? foregroundColor;

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
          child: isNetworkImage
              ? CachedNetworkImage(
                  fit: fit,
                  imageUrl: imageUrl,
                  color: foregroundColor,
                  progressIndicatorBuilder: (context, url, downloadProgress) => const CustomShimmerEffect(height: 55, width: 55, radius: 55,),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                )
              : Image(
                  fit: fit,
                  color: foregroundColor,
                  image: AssetImage(imageUrl),
                ),
        ),
      ),
    );
  }
}
