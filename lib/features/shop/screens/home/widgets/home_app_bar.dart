import 'package:flutter/material.dart';

import '../../../../../common/widgets/appbar/custom_app_bar.dart';
import '../../../../../common/widgets/products/cart/cart_icon_with_label.dart';
import '../../../../../utils/constants/custom_strings.dart';
import '../../../../../utils/constants/my_colors.dart';


class HomeAppbar extends StatelessWidget {
  const HomeAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppBar(
          title: Column(
            crossAxisAlignment: .stretch,
            children: [
              Text(
                CustomStrings.homeAppBarTitle,
                style: Theme.of(
                  context,
                ).textTheme.labelMedium!.apply(color: MyColors.grey),
              ),
              Text(
                CustomStrings.homeAppBarSubTitle,
                style: Theme.of(
                  context,
                ).textTheme.headlineSmall!.apply(color: MyColors.white),
              ),
            ],
          ),
          actions: [
            CartIconWithLabel(
              iconColor: MyColors.white,
              onPressedHandler: () {},
            ),
          ],
        ),
      ],
    );
  }
}