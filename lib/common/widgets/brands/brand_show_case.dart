import 'package:flutter/material.dart';

import '../../../utils/constants/custom_size.dart';
import '../../../utils/constants/my_colors.dart';
import '../../../utils/helpers/helpers.dart';
import '../customShapes/containers/rounded_container.dart';
import 'brand_card.dart';

class BrandShowCase extends StatelessWidget {
  const BrandShowCase({super.key, required this.images});

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return RoundedContainer(
      showBorder: true,
      padding: const EdgeInsets.all(CustomSize.md),
      borderColor: MyColors.darkGrey,
      backgroundColor: Colors.transparent,
      margin: const .only(bottom: CustomSize.spaceBtwItems),
      child: Column(
        children: [
          //brand with product cound
          BrandCard(onTap: () {  },),
          const SizedBox(height: CustomSize.spaceBtwItems),

          // top 3 products of brand
          Row(
            children: images
                .map((image) => brandTopProductImage(context, image))
                .toList(),
          ),
        ],
      ),
    );
  }
}

Widget brandTopProductImage(BuildContext context, String image) {
  return Expanded(
    child: RoundedContainer(
      height: 100,
      backgroundColor: Helpers.isDarkMode(context)
          ? MyColors.darkGrey
          : MyColors.white,
      padding: const .all(CustomSize.md),
      margin: const .only(right: CustomSize.sm),
      child: Image(fit: .cover, image: AssetImage(image)),
    ),
  );
}
