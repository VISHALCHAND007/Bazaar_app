import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/my_colors.dart';

class CustomRatingIndicator extends StatelessWidget {
  const CustomRatingIndicator({
    super.key,
    required this.rating,
    this.iconData = Iconsax.star1,
  });

  final double rating;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
      unratedColor: MyColors.grey,
      itemSize: 20,
      rating: 4.5,
      itemBuilder: (_, __) => Icon(iconData, color: MyColors.primary),
    );
  }
}
