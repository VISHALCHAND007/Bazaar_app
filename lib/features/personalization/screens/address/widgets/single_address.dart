import 'package:e_commerce/common/widgets/customShapes/containers/rounded_container.dart';
import 'package:e_commerce/utils/constants/my_colors.dart';
import 'package:e_commerce/utils/helpers/helpers.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/custom_size.dart';

class SingleAddress extends StatelessWidget {
  const SingleAddress({super.key, required this.isSelected});

  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final isDark = Helpers.isDarkMode(context);

    return RoundedContainer(
      width: .infinity,
      backgroundColor: isSelected
          ? MyColors.primary.withValues(alpha: .2)
          : Colors.transparent,
      showBorder: true,
      borderColor: isSelected
          ? null
          : isDark
          ? MyColors.light
          : MyColors.grey,
      margin: const .only(bottom: CustomSize.spaceBtwItems),
      padding: const .all(CustomSize.md),
      child: Stack(
        children: [
          //tick
          if (isSelected)
            const Positioned(
              right: 5,
              top: 0,
              child: Icon(Iconsax.tick_circle5, color: Colors.green),
            ),

          //address content
          Column(
            mainAxisAlignment: .start,
            crossAxisAlignment: .stretch,
            children: [
              //name
              Text(
                "Ariana Wick",
                maxLines: 1,
                overflow: .ellipsis,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: CustomSize.sm / 2),
              //phone
              Text(
                "(+91) 87654567**",
                overflow: .ellipsis,
                maxLines: 1,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(height: CustomSize.sm / 2),
              Text(
                "26300, Main Road Delhi High Court, Near Dominos (Andheri east)",
                style: Theme.of(context).textTheme.bodySmall,
                maxLines: 2,
                overflow: .ellipsis,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
