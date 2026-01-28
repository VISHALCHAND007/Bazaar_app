import 'package:e_commerce/common/widgets/appbar/custom_app_bar.dart';
import 'package:e_commerce/common/widgets/layout/grid_layout.dart';
import 'package:e_commerce/common/widgets/products/products_card/products_card_vertical.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/custom_size.dart';

class AllProducts extends StatelessWidget {
  const AllProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar(
          title: Text("Popular Products"),
          shouldShowBackBtn: true,
        ),

        body: SingleChildScrollView(
          child: Padding(
            padding: const .all(CustomSize.defaultSpace),
            child: Column(
              children: [
                DropdownButtonFormField(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Iconsax.sort)
                  ),
                  items:
                      [
                            "Name",
                            "Higher Price",
                            "Lower Price",
                            "Sale",
                            "Newest",
                            "Popularity",
                          ]
                          .map(
                            (value) => DropdownMenuItem(
                              value: value,
                              child: Text(value),
                            ),
                          )
                          .toList(),
                  onChanged: (value) {},
                ),
                const SizedBox(height: CustomSize.spaceBtwSections,),

                //Products of this type
                GridLayout(itemCount: 12, itemBuilder: (_, ind) => const ProductsCardVertical())
              ],
            ),
          ),
        ),
      ),
    );
  }
}
