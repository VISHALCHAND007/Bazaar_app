import 'package:e_commerce/common/widgets/appbar/custom_app_bar.dart';
import 'package:e_commerce/common/widgets/customShapes/containers/rounded_container.dart';
import 'package:e_commerce/common/widgets/success_screen.dart';
import 'package:e_commerce/features/authentication/screens/navigation_menu/navigation_menu.dart';
import 'package:e_commerce/features/shop/screens/cart/widget/cart_items.dart';
import 'package:e_commerce/features/shop/screens/checkout/widgets/billing_address_section.dart';
import 'package:e_commerce/features/shop/screens/checkout/widgets/billing_payment_section.dart';
import 'package:e_commerce/features/shop/screens/checkout/widgets/billing_pricing_section.dart';
import 'package:e_commerce/utils/constants/image_strings.dart';
import 'package:e_commerce/utils/constants/my_colors.dart';
import 'package:e_commerce/utils/helpers/helpers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/products/cart/coupons/coupon_widget.dart';
import '../../../../utils/constants/custom_size.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Helpers.isDarkMode(context);

    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar(
          title: Text("Order Review"),
          shouldShowBackBtn: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const .all(CustomSize.defaultSpace),
            child: Column(
              children: [
                //items in cart
                const CartItems(showCartAdjustment: false),
                const SizedBox(height: CustomSize.spaceBtwSections),

                //coupon textfield
                const CouponWidget(),
                const SizedBox(height: CustomSize.spaceBtwSections),

                //billing section
                RoundedContainer(
                  showBorder: true,
                  backgroundColor: isDark ? MyColors.black : MyColors.white,
                  padding: const .all(CustomSize.defaultSpace),
                  child: const Column(
                    children: [
                      //Pricing
                      BillingPricingSection(),
                      SizedBox(height: CustomSize.spaceBtwItems),

                      //Divider
                      Divider(),
                      SizedBox(height: CustomSize.spaceBtwItems),

                      //Payment methods
                      BillingPaymentSection(),
                      SizedBox(height: CustomSize.spaceBtwItems),

                      //Divider
                      Divider(),
                      SizedBox(height: CustomSize.spaceBtwItems),

                      //Address section
                      BillingAddressSection(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),

        bottomNavigationBar: Padding(
          padding: const .all(CustomSize.defaultSpace),
          child: ElevatedButton(
            onPressed: () => Get.to(
              () => SuccessScreen(
                animationPath: ImageStrings.verifySuccess,
                title: "Payment Success",
                subTitle: "Your items will be shipped soon!",
                onButtonClicked: () => Get.offAll(() => const NavigationMenu()),
              ),
            ),
            child: const Text("Place Order"),
          ),
        ),
      ),
    );
  }
}
