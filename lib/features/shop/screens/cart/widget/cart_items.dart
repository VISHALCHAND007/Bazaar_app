import 'package:flutter/material.dart';

import '../../../../../common/widgets/products/cart/cart_item_adjustement_widget.dart';
import '../../../../../utils/constants/custom_size.dart';
import 'cart_item.dart';

class CartItems extends StatelessWidget {
  const CartItems({super.key, this.showCartAdjustment = true});

  final bool showCartAdjustment;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemBuilder: (_, index) => Column(
        children: [
          const CartItem(),
          if(showCartAdjustment) const SizedBox(height: CustomSize.spaceBtwItems),
          if(showCartAdjustment) const CartItemAdjustmentWidget(),
        ],
      ),
      separatorBuilder: (_, _) =>
      const SizedBox(height: CustomSize.spaceBtwSections),
      itemCount: 2,
    );
  }
}
