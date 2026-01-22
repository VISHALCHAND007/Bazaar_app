import 'package:e_commerce/common/widgets/appbar/custom_app_bar.dart';
import 'package:e_commerce/common/widgets/customShapes/containers/rounded_container.dart';
import 'package:e_commerce/common/widgets/customShapes/containers/search_container.dart';
import 'package:e_commerce/common/widgets/layout/grid_layout.dart';
import 'package:e_commerce/common/widgets/products/cart/cart_icon_with_label.dart';
import 'package:e_commerce/common/widgets/texts/brand_title_text_with_icon.dart';
import 'package:e_commerce/common/widgets/texts/section_heading.dart';
import 'package:e_commerce/utils/constants/image_strings.dart';
import 'package:e_commerce/utils/helpers/helpers.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/customShapes/containers/circular_container.dart';
import '../../../../utils/constants/custom_size.dart';
import '../../../../utils/constants/my_colors.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Helpers.isDarkMode(context);

    return Scaffold(
      appBar: CustomAppBar(
        title: SizedBox(
          width: double.infinity,
          child: Text(
            "Store",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        actions: [
          CartIconWithLabel(
            iconColor: isDark ? MyColors.white : MyColors.black,
            onPressedHandler: () {},
          ),
        ],
      ),
      body: NestedScrollView(
        headerSliverBuilder: (_, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              pinned: true,
              floating: true,
              automaticallyImplyLeading: false,
              expandedHeight: 440,
              backgroundColor: Helpers.isDarkMode(context)
                  ? MyColors.black
                  : MyColors.white,
              //to add items inside
              flexibleSpace: Padding(
                padding: const .all(CustomSize.defaultSpace),
                child: ListView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    //search section
                    const SizedBox(height: CustomSize.spaceBtwItems),
                    const SearchContainer(
                      text: "Search in store",
                      showBackground: false,
                      padding: .zero,
                    ),
                    const SizedBox(height: CustomSize.spaceBtwSections),

                    //featured brands
                    SectionHeading(title: "Featured Brands", onPressed: () {}),
                    const SizedBox(height: CustomSize.spaceBtwItems / 2),

                    GridLayout(itemCount: 4, mainAxisExtent: 80, itemBuilder: (_, ind) =>
                        RoundedContainer(
                          padding: const .all(CustomSize.sm),
                          backgroundColor: Colors.transparent,
                          showBorder: true,
                          child: Row(
                            children: [
                              //image
                              Flexible(
                                child: CircularContainer(
                                  imageUrl: ImageStrings.clothIcon,
                                  backgroundColor: Colors.transparent,
                                  foregroundColor: isDark
                                      ? MyColors.white
                                      : MyColors.black,
                                ),
                              ),
                              const SizedBox(width: CustomSize.spaceBtwItems),

                              //text
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: .start,
                                  mainAxisSize: .min,
                                  children: [
                                    const BrandTitleWithIcon(
                                      title: "Nike",
                                      icon: Iconsax.verify5,
                                      textSize: .large,
                                    ),
                                    //products
                                    Text(
                                      "256 products",
                                      overflow: .ellipsis,
                                      style: Theme.of(context).textTheme.labelMedium,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                    )
                  ],
                ),
              ),
            ),
          ];
        },
        body: Container(),
      ),
    );
  }
}
