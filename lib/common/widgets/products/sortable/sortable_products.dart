import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/custom_size.dart';
import '../../layout/grid_layout.dart';
import '../products_card/products_card_vertical.dart';

class SortableProducts extends StatelessWidget {
  const SortableProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropdownButtonFormField(
          decoration: const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
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
                    (value) =>
                        DropdownMenuItem(value: value, child: Text(value)),
                  )
                  .toList(),
          onChanged: (value) {},
        ),
        const SizedBox(height: CustomSize.spaceBtwSections),

        //Products of this type
        GridLayout(
          itemCount: 12,
          itemBuilder: (_, ind) => const ProductsCardVertical(),
        ),
      ],
    );
  }
}
