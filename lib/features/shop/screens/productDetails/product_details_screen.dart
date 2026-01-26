import 'package:e_commerce/common/widgets/texts/section_heading.dart';
import 'package:e_commerce/features/shop/screens/productDetails/widgets/add_to_cart_bottom.dart';
import 'package:e_commerce/features/shop/screens/productDetails/widgets/product_image_slider.dart';
import 'package:e_commerce/features/shop/screens/productDetails/widgets/product_meta_data.dart';
import 'package:e_commerce/features/shop/screens/productDetails/widgets/product_variation.dart';
import 'package:e_commerce/features/shop/screens/productDetails/widgets/rating_and_share.dart';
import 'package:e_commerce/features/shop/screens/productReviews/product_reviews_screen.dart';
import 'package:e_commerce/utils/device/device_utility.dart';
import 'package:e_commerce/utils/helpers/helpers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';

import '../../../../utils/constants/custom_size.dart';
import '../../../../utils/constants/my_colors.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Helpers.isDarkMode(context);

    return Scaffold(
      body: SafeArea(
        child: Container(
          color: isDark ? MyColors.dark : MyColors.grey.withValues(alpha: .9),
          child: SingleChildScrollView(
            child: Column(
              children: [
                //Product image slider
                const ProductImageSlider(),

                //Product details
                Padding(
                  padding: const .only(
                    right: CustomSize.defaultSpace,
                    left: CustomSize.defaultSpace,
                    bottom: CustomSize.defaultSpace,
                  ),
                  child: Column(
                    children: [
                      //Rating & share
                      const RatingAndShare(),

                      //Price, title, stock and brand
                      const ProductMetaData(),

                      //Attributes- for product variation
                      const ProductVariation(),

                      //Checkout btn
                      const SizedBox(height: CustomSize.spaceBtwItems),
                      SizedBox(
                        width: .infinity,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: const Text("Checkout"),
                        ),
                      ),
                      const SizedBox(height: CustomSize.spaceBtwSections),

                      //description
                      const SectionHeading(
                        title: "Description",
                        showActionBtn: false,
                      ),
                      const SizedBox(height: CustomSize.spaceBtwItems),
                      const ReadMoreText(
                        "This is a product description for nike green shoes, they are comfortable and long-lasting with great feedback from over crores of happy customers.",
                        trimLines: 2,
                        trimMode: .Line,
                        trimCollapsedText: "Show more",
                        trimExpandedText: "Show less",
                        isExpandable: true,
                        moreStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: MyColors.grey,
                        ),
                        lessStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: MyColors.grey,
                        ),
                      ),
                      const SizedBox(height: CustomSize.spaceBtwItems),
                      const Divider(),
                      const SizedBox(height: CustomSize.spaceBtwSections),

                      //Reviews
                      Row(
                        mainAxisAlignment: .spaceBetween,
                        children: [
                          const SectionHeading(
                            title: "Reviews (199)",
                            showActionBtn: false,
                          ),
                          IconButton(
                            onPressed: () => Get.to(() => const ProductReviewsScreen()),
                            icon: const Icon(
                              Iconsax.arrow_right_3,
                              size: CustomSize.iconSm,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: AddToCardBottom(),
    );
  }
}
