import 'package:e_commerce/common/widgets/appbar/custom_app_bar.dart';
import 'package:e_commerce/features/shop/screens/cart/widget/cart_items.dart';
import 'package:e_commerce/features/shop/screens/checkout/checkout_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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

      body: const Padding(
        padding: .all(CustomSize.defaultSpace),
        child: CartItems(),
      ),

      bottomNavigationBar: Padding(
        padding: const .all(CustomSize.defaultSpace),
        child: SizedBox(
          width: .infinity,
          child: ElevatedButton(
            onPressed: () => Get.to(() => const CheckoutScreen()),
            child: const Text("Checkout \$ 2455"),
          ),
        ),
      ),
    );
  }
}



