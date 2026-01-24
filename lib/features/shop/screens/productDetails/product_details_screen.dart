import 'package:e_commerce/features/shop/screens/productDetails/widgets/product_image_slider.dart';
import 'package:e_commerce/features/shop/screens/productDetails/widgets/product_meta_data.dart';
import 'package:e_commerce/features/shop/screens/productDetails/widgets/rating_and_share.dart';
import 'package:e_commerce/utils/helpers/helpers.dart';
import 'package:flutter/material.dart';

import '../../../../utils/constants/custom_size.dart';
import '../../../../utils/constants/my_colors.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Helpers.isDarkMode(context);

    return SafeArea(
      child: Container(
        color: isDark ? MyColors.dark : MyColors.grey.withValues(alpha: .9),
        child: const SingleChildScrollView(
          child: Column(
            children: [
              //Product image slider
              ProductImageSlider(),

              //Product details
              Padding(
                padding: .only(
                  right: CustomSize.defaultSpace,
                  left: CustomSize.defaultSpace,
                  bottom: CustomSize.defaultSpace,
                ),
                child: Column(
                  children: [
                    //Rating & share
                    RatingAndShare(),

                    //Price, title, stock and brand
                    ProductMetaData(),

                    //Attributes

                    //Checkout btn

                    //description

                    //Reviews
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
