import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/custom_size.dart';
import '../../../../utils/constants/my_colors.dart';

class CartIconWithLabel extends StatelessWidget {
  const CartIconWithLabel({
    super.key,
    required this.iconColor,
    required this.onPressedHandler,
  });

  final Color iconColor;
  final VoidCallback onPressedHandler;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(
          onPressed: onPressedHandler,
          icon: Icon(
            Iconsax.shopping_bag,
            color: iconColor,
            size: CustomSize.iconMd,
          ),
        ),
        Positioned(
          right: 0,
          child: Container(
            width: 18,
            height: 18,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              color: MyColors.black,
            ),
            child: Center(
              child: Text(
                "12",
                style: Theme.of(context).textTheme.labelLarge!.apply(
                  color: MyColors.white,
                  fontSizeFactor: .8,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
