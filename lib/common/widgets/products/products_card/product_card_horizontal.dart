import 'package:e_commerce/common/icons/circular_icon.dart';
import 'package:e_commerce/common/styles/shadows.dart';
import 'package:e_commerce/common/widgets/customShapes/containers/rounded_container.dart';
import 'package:e_commerce/common/widgets/images/circular_image.dart';
import 'package:e_commerce/common/widgets/texts/brand_title_text_with_icon.dart';
import 'package:e_commerce/common/widgets/texts/product_price_text.dart';
import 'package:e_commerce/common/widgets/texts/product_title_text.dart';
import 'package:e_commerce/features/shop/screens/productDetails/product_details_screen.dart';
import 'package:e_commerce/utils/constants/image_strings.dart';
import 'package:e_commerce/utils/constants/my_colors.dart';
import 'package:e_commerce/utils/helpers/helpers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/custom_size.dart';

class ProductCardHorizontal extends StatelessWidget {
  const ProductCardHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Helpers.isDarkMode(context);

    return InkWell(
      onTap: () => Get.to(() => const ProductDetailsScreen()),
      child: Container(
        width: 310,
        padding: const .all(1),
        decoration: BoxDecoration(
          borderRadius: .circular(CustomSize.productImageRadius),
          color: isDark ? MyColors.darkerGrey : MyColors.softGrey,
        ),
        child: Row(
          children: [
            /// Thumbnail
            RoundedContainer(
              height: 120,
              padding: const .all(CustomSize.sm),
              backgroundColor: isDark ? MyColors.dark : MyColors.light,
              child: Stack(
                children: [
                  //main background
                  const SizedBox(
                    height: 120,
                    width: 120,
                    child: RoundedImage(
                      imageUrl: ImageStrings.productImage19,
                      fit: .cover,
                      padding: .all(CustomSize.md),
                      applyImageRadius: true,
                    ),
                  ),
      
                  //sale tag
                  Positioned(
                    top: 12,
                    child: RoundedContainer(
                      radius: CustomSize.sm,
                      backgroundColor: MyColors.secondary.withValues(alpha: .8),
                      padding: const .symmetric(
                        vertical: CustomSize.xs,
                        horizontal: CustomSize.sm,
                      ),
                      child: Text(
                        "28%",
                        style: Theme.of(
                          context,
                        ).textTheme.labelLarge!.apply(color: MyColors.black),
                      ),
                    ),
                  ),
      
                  //favourite icon
                  const Positioned(
                    top: 0,
                    right: 0,
                    child: CircularIcon(icon: Iconsax.heart5),
                  ),
                ],
              ),
            ),
      
            /// Product Details
            Expanded(
              child: Padding(
                padding: const .only(top: CustomSize.sm, left: CustomSize.sm),
                child: Column(
                  mainAxisSize: .min,
                  crossAxisAlignment: .start,
                  children: [
                    ProductTitleText(title: "Nike Sneakers with Extra in-soul's", showSmallSize: true,),
                    const SizedBox(height: CustomSize.spaceBtwItems / 2),
                    BrandTitleWithIcon(title: "Nike", textSize: .small,),
      
                    ///to make the bottom widget appear at the very bottom
                    const Spacer(),
              
                    Expanded(
                      child: Row(
                        mainAxisAlignment: .spaceBetween,
                        children: [
                          //Price
                          Expanded(child: ProductPriceText(price: "234", isLarge: false,)),
      
                          //cart button
                          Container(
                            decoration: BoxDecoration(
                              color: MyColors.dark,
                              borderRadius: .only(
                                topLeft: .circular(CustomSize.cardRadiusMd),
                                bottomRight: .circular(CustomSize.productImageRadius),
                              ),
                            ),
                            child: SizedBox(
                              height: CustomSize.iconLg * 1.2,
                              width: CustomSize.iconLg * 1.2,
                              child: Icon(Iconsax.add, color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
