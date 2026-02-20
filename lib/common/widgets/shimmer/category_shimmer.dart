import 'package:e_commerce/common/widgets/shimmer/custom_shimmer_effect.dart';
import 'package:e_commerce/utils/constants/custom_size.dart';
import 'package:flutter/material.dart';

class CategoryShimmer extends StatelessWidget {
  final int categoryItems;

  const CategoryShimmer({super.key, this.categoryItems = 6});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: .horizontal,
        itemBuilder: (_, _) {
          return const Column(
            crossAxisAlignment: .start,
            children: [
              //image
              CustomShimmerEffect(height: 55, width: 55, radius: 55),
              SizedBox(height: CustomSize.spaceBtwItems / 2),

              //text
              CustomShimmerEffect(height: 8, width: 55),
            ],
          );
        },
        separatorBuilder: (_, _) =>
            const SizedBox(width: CustomSize.spaceBtwItems),
        itemCount: categoryItems,
      ),
    );
  }
}
