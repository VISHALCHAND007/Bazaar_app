import 'package:e_commerce/common/widgets/chips/custom_choice_chip.dart';
import 'package:e_commerce/common/widgets/customShapes/containers/rounded_container.dart';
import 'package:e_commerce/common/widgets/texts/product_price_text.dart';
import 'package:e_commerce/common/widgets/texts/product_title_text.dart';
import 'package:e_commerce/common/widgets/texts/section_heading.dart';
import 'package:e_commerce/utils/constants/my_colors.dart';
import 'package:e_commerce/utils/helpers/helpers.dart';
import 'package:flutter/material.dart';

import '../../../../../utils/constants/custom_size.dart';

class ProductVariation extends StatelessWidget {
  const ProductVariation({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Helpers.isDarkMode(context);

    return Column(
      children: [
        RoundedContainer(
          padding: const .all(CustomSize.spaceBtwItems),
          backgroundColor: isDark ? MyColors.darkerGrey : MyColors.grey,
          child: Column(
            children: [
              Row(
                children: [
                  const SectionHeading(
                    title: "Variation",
                    showActionBtn: false,
                  ),
                  const SizedBox(width: CustomSize.spaceBtwItems),

                  Column(
                    crossAxisAlignment: .start,
                    children: [
                      //Price and discounted price
                      Row(
                        children: [
                          const ProductTitleText(
                            title: "Price: ",
                            showSmallSize: true,
                          ),

                          Text(
                            "\$250",
                            style: Theme.of(context).textTheme.titleSmall!
                                .apply(decoration: TextDecoration.lineThrough),
                          ),
                          const SizedBox(width: CustomSize.spaceBtwItems),
                          const ProductPriceText(price: "175"),
                        ],
                      ),
                      Row(
                        children: [
                          //in stock
                          const ProductTitleText(
                            title: "Stocks: ",
                            showSmallSize: true,
                          ),
                          Text(
                            "In-stocks",
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ],
                      ),

                      //stock
                    ],
                  ),
                ],
              ),
              //description
              const ProductTitleText(
                title:
                    "This is the description of the product which can go upto 4 lines.",
                showSmallSize: true,
                maxLines: 4,
              ),
            ],
          ),
        ),
        const SizedBox(height: CustomSize.spaceBtwItems),

        //variations
        Column(
          crossAxisAlignment: .start,
          children: [
            //title
            const SectionHeading(title: "Colors"),
            const SizedBox(height: CustomSize.spaceBtwItems / 2),

            //Values
            Wrap(
              spacing: 8,
              children: [
                CustomChoiceChip(
                  label: 'Green',
                  selected: true,
                  onSelected: (value) {},
                ),
                CustomChoiceChip(
                  label: 'Blue',
                  selected: false,
                  onSelected: (value) {},
                ),
                CustomChoiceChip(
                  label: 'Yellow',
                  selected: false,
                  onSelected: (value) {},
                ),
              ],
            ),
          ],
        ),

        Column(
          crossAxisAlignment: .start,
          children: [
            //title
            const SectionHeading(title: "Sizes"),
            const SizedBox(height: CustomSize.spaceBtwItems / 2),

            //Values
            Wrap(
              spacing: 8,
              children: [
                CustomChoiceChip(
                  label: 'EU 34',
                  selected: true,
                  onSelected: (value) {},
                ),
                CustomChoiceChip(
                  label: 'EU 36',
                  selected: false,
                  onSelected: (value) {},
                ),
                CustomChoiceChip(
                  label: 'EU 38',
                  selected: false,
                  onSelected: (value) {},
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
