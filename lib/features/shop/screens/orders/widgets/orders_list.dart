import 'package:e_commerce/common/widgets/customShapes/containers/rounded_container.dart';
import 'package:e_commerce/utils/constants/custom_size.dart';
import 'package:e_commerce/utils/constants/my_colors.dart';
import 'package:e_commerce/utils/helpers/helpers.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class OrdersList extends StatelessWidget {
  const OrdersList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 10,
      separatorBuilder: (_, __) =>
          const SizedBox(height: CustomSize.spaceBtwItems),
      itemBuilder: (_, ind) => const OrderItem(),
    );
  }
}

class OrderItem extends StatelessWidget {
  const OrderItem({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Helpers.isDarkMode(context);

    return RoundedContainer(
      showBorder: true,
      backgroundColor: isDark ? MyColors.dark : MyColors.light,
      padding: const .all(CustomSize.md),
      child: Column(
        mainAxisSize: .min,
        children: [
          //Row 1
          Row(
            children: [
              //Icon
              const Icon(Iconsax.ship),
              const SizedBox(width: CustomSize.spaceBtwItems),

              //details
              Expanded(
                child: Column(
                  crossAxisAlignment: .start,
                  children: [
                    Text(
                      "Processing",
                      style: Theme.of(context).textTheme.bodyLarge!.apply(
                        color: MyColors.primary,
                        fontSizeDelta: 1,
                      ),
                    ),
                    Text(
                      "07 Feb, 2025",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ],
                ),
              ),

              //navigation icon
              IconButton(
                onPressed: () {},
                icon: const Icon(Iconsax.arrow_right_34),
              ),
            ],
          ),
          const SizedBox(height: CustomSize.spaceBtwItems),

          //Row2
          Row(
            children: [
              //Row 1
              Expanded(
                child: Row(
                  children: [
                    //Icon
                    const Icon(Iconsax.tag),
                    const SizedBox(width: CustomSize.spaceBtwItems),

                    //details
                    Expanded(
                      child: Column(
                        crossAxisAlignment: .start,
                        children: [
                          Text(
                            "Order ID",
                            style: Theme.of(context).textTheme.labelMedium!,
                          ),
                          Text(
                            "[#@fdhkjfhlhahdljhfaldh]",
                            style: Theme.of(context).textTheme.titleMedium,
                            overflow: .ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: CustomSize.spaceBtwItems),

              // Row 2
              Expanded(
                child: Row(
                  children: [
                    //Icon
                    const Icon(Iconsax.calendar),
                    const SizedBox(width: CustomSize.spaceBtwItems),

                    //details
                    Expanded(
                      child: Column(
                        crossAxisAlignment: .start,
                        children: [
                          Text(
                            "Shipping Date",
                            style: Theme.of(context).textTheme.labelMedium!,
                          ),
                          Text(
                            "10 Feb, 2025",
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
