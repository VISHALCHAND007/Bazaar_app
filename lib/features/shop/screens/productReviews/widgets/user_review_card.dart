import 'package:e_commerce/common/widgets/customShapes/containers/rounded_container.dart';
import 'package:e_commerce/common/widgets/products/rating/custom_rating_indicator.dart';
import 'package:e_commerce/utils/constants/my_colors.dart';
import 'package:e_commerce/utils/helpers/helpers.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

import '../../../../../utils/constants/custom_size.dart';

class UserReviewCard extends StatelessWidget {
  const UserReviewCard({super.key, required this.userImg});

  final String userImg;

  @override
  Widget build(BuildContext context) {
    final isDark = Helpers.isDarkMode(context);

    return Column(
      children: [
        //user details
        Row(
          mainAxisAlignment: .spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  child: ClipRRect(
                    borderRadius: .circular(100),
                    child: Image(
                      image: AssetImage(userImg),
                      height: 50,
                      width: 50,
                      fit: .cover,
                    ),
                  ),
                ),
                const SizedBox(width: CustomSize.spaceBtwItems),
                Text("Rihana", style: Theme.of(context).textTheme.titleMedium),
              ],
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
          ],
        ),
        const SizedBox(height: CustomSize.spaceBtwItems),

        //rating and date of review
        Row(
          children: [
            const CustomRatingIndicator(rating: 4),
            const SizedBox(width: CustomSize.spaceBtwItems),
            Text("01 Jan, 2025", style: Theme.of(context).textTheme.bodySmall),
          ],
        ),
        const SizedBox(height: CustomSize.spaceBtwItems),

        //Comment
        const ReadMoreText(
          "I’ve been using Vaseline Petroleum Jelly for a long time, and it honestly does what it promises. It’s very affordable, which makes it easy to use every day without worrying about running out. A little goes a long way, so one jar lasts longer than you’d expect. It nourishes the skin properly and helps lock in moisture, especially on dry areas like lips, hands, and elbows. I’ve never had any rashes or irritation from it, which is a big plus for sensitive skin. The size is also just right—not too big, not too small—so it’s easy to keep at home or carry around. Overall, it’s a simple, trustworthy product that works well for everyday use.",
          trimLines: 2,
          trimMode: .Line,
          trimExpandedText: "show less",
          trimCollapsedText: "show more",
          lessStyle: TextStyle(
            fontSize: 14,
            fontWeight: .w600,
            color: MyColors.primary,
          ),
          moreStyle: TextStyle(
            fontSize: 14,
            fontWeight: .w600,
            color: MyColors.primary,
          ),
        ),
        const SizedBox(height: CustomSize.spaceBtwItems),

        //reply from the owner
        RoundedContainer(
          backgroundColor: isDark ? MyColors.darkerGrey : MyColors.grey,
          child: Padding(
            padding: const .all(CustomSize.md),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: .spaceBetween,
                  children: [
                    Text(
                      "Play Store",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    Text(
                      "04 Jan, 2025",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
                const SizedBox(height: CustomSize.spaceBtwItems),
                const ReadMoreText(
                  "Thanks for the update. This aligns well with the current sprint goals. Please proceed with the proposed approach and ensure any risks are documented. Let me know if you need clarification or support before moving forward.",
                  trimLines: 2,
                  trimMode: .Line,
                  trimExpandedText: "show less",
                  trimCollapsedText: "show more",
                  lessStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: .w600,
                    color: MyColors.primary,
                  ),
                  moreStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: .w600,
                    color: MyColors.primary,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: CustomSize.spaceBtwSections),
      ],
    );
  }
}
