import 'package:e_commerce/common/styles/shadows.dart';
import 'package:e_commerce/common/widgets/customShapes/containers/rounded_container.dart';
import 'package:e_commerce/common/widgets/images/circular_image.dart';
import 'package:e_commerce/common/widgets/texts/product_title_text.dart';
import 'package:e_commerce/features/shop/screens/productDetails/product_details_screen.dart';
import 'package:e_commerce/utils/constants/custom_size.dart';
import 'package:e_commerce/utils/constants/my_colors.dart';
import 'package:e_commerce/utils/helpers/helpers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/image_strings.dart';
import '../../../icons/circular_icon.dart';
import '../../texts/brand_title_text_with_icon.dart';
import '../../texts/product_price_text.dart';

class ProductsCardVertical extends StatelessWidget {
  const ProductsCardVertical({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Helpers.isDarkMode(context);

    //Container
    return GestureDetector(
      onTap: () => Get.to(() => const ProductDetailsScreen()),
      child: Container(
        width: 180,
        padding: const .all(1),
        decoration: BoxDecoration(
          boxShadow: [ShadowStyle.verticalProductShadow],
          borderRadius: .circular(CustomSize.productImageRadius),
          color: isDark ? MyColors.darkerGrey : MyColors.white,
        ),
        child: Column(
          children: [
            //thumbnail: favourite btn, discount, image
            RoundedContainer(
              height: 180,
              padding: const EdgeInsets.all(CustomSize.sm),
              backgroundColor: isDark ? MyColors.black : MyColors.light,
              child: Stack(
                children: [
                  //Image
                  const Center(
                    child: RoundedImage(imageUrl: ImageStrings.productImage1),
                  ),

                  //Sale tag
                  Positioned(
                    top: 12,
                    child: RoundedContainer(
                      radius: CustomSize.sm,
                      backgroundColor: MyColors.secondary.withValues(alpha: .8),
                      padding: const EdgeInsets.symmetric(
                        horizontal: CustomSize.sm,
                        vertical: CustomSize.xs,
                      ),
                      child: Text(
                        "25%",
                        style: Theme.of(
                          context,
                        ).textTheme.labelLarge!.apply(color: MyColors.black),
                      ),
                    ),
                  ),

                  //favourite btn
                  const Positioned(
                    top: 0,
                    right: 0,
                    child: CircularIcon(icon: Iconsax.heart5),
                  ),
                ],
              ),
            ),
            const SizedBox(height: CustomSize.spaceBtwItems / 2),

            //product details
            const Padding(
              padding: .only(left: CustomSize.sm),
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  ProductTitleText(
                    title: "Green Nike Air Shoes",
                    showSmallSize: true,
                  ),
                  SizedBox(height: CustomSize.spaceBtwItems / 2),

                  BrandTitleWithIcon(title: "Nike", icon: Iconsax.verify5),
                ],
              ),
            ),
            // so that the space is occupied till the very end
            const Spacer(),

            Padding(
              padding: const .only(left: CustomSize.sm),
              child: Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  //Price
                  const ProductPriceText(price: '56.0'),

                  //Cart button
                  Container(
                    decoration: const BoxDecoration(
                      color: MyColors.dark,
                      borderRadius: .only(
                        topLeft: Radius.circular(CustomSize.cardRadiusMd),
                        bottomRight: Radius.circular(
                          CustomSize.productImageRadius,
                        ),
                      ),
                    ),
                    child: const SizedBox(
                      height: CustomSize.iconLg * 1.2,
                      width: CustomSize.iconLg * 1.2,
                      child: Center(
                        child: Icon(Iconsax.add, color: MyColors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


