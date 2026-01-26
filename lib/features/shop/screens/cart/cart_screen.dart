import 'package:e_commerce/common/widgets/appbar/custom_app_bar.dart';
import 'package:e_commerce/features/shop/screens/cart/widget/cart_item.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/products/cart/cart_item_adjustement_widget.dart';
import '../../../../utils/constants/custom_size.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: const CustomAppBar(
        shouldShowBackBtn: true,
        title: Text("Your Cart"),
      ),

      body: Padding(
        padding: const .all(CustomSize.defaultSpace),
        child: ListView.separated(
          itemBuilder: (_, index) => const Column(
            children: [
              CartItem(),
              SizedBox(height: CustomSize.spaceBtwItems),
              CartItemAdjustmentWidget(),
            ],
          ),
          separatorBuilder: (_, _) =>
              const SizedBox(height: CustomSize.spaceBtwSections),
          itemCount: 10,
        ),
      ),

      bottomNavigationBar: Padding(
        padding: const .all(CustomSize.defaultSpace),
        child: SizedBox(
          width: .infinity,
          child: ElevatedButton(
            onPressed: () {},
            child: const Text("Checkout \$ 2455"),
          ),
        ),
      ),
    );
  }
}



