import 'package:e_commerce/common/widgets/appbar/custom_app_bar.dart';
import 'package:e_commerce/common/widgets/products/rating/custom_rating_indicator.dart';
import 'package:e_commerce/features/shop/screens/productReviews/widgets/overall_product_rating.dart';
import 'package:e_commerce/features/shop/screens/productReviews/widgets/user_review_card.dart';
import 'package:e_commerce/utils/constants/custom_size.dart';
import 'package:flutter/material.dart';

import '../../../../utils/constants/image_strings.dart';

class ProductReviewsScreen extends StatelessWidget {
  const ProductReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: Text("Reviews & Ratings"),
        shouldShowBackBtn: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const .all(CustomSize.defaultSpace),
            child: Column(
              crossAxisAlignment: .start,
              children: [
                //description
                const Text(
                  "Rating and reviews are verified, and are from people who use the same type of device that you use.",
                ),
                const SizedBox(height: CustomSize.spaceBtwItems),

                //chart
                const OverallProductRating(),

                //rating
               const CustomRatingIndicator(rating: 4.6),
                Text("12,899", style: Theme.of(context).textTheme.bodySmall,),
                const SizedBox(height: CustomSize.spaceBtwItems,),

                //reviews
                const Column(
                  children: [
                    UserReviewCard(userImg: ImageStrings.reviewUser,),
                    UserReviewCard(userImg: ImageStrings.reviewUser2,),
                    UserReviewCard(userImg: ImageStrings.reviewUser,),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
