import 'package:flutter/material.dart';

import '../../../../../utils/constants/custom_size.dart';

class BillingPricingSection extends StatelessWidget {
  const BillingPricingSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        //Sub-total
        Row(
          mainAxisAlignment: .spaceBetween,
          children: [
            Text("Sub-total", style: theme.textTheme.bodyMedium,),
            Text("\$ 256.0", style: theme.textTheme.bodyMedium,),
          ],
        ),
        const SizedBox(height: CustomSize.spaceBtwItems /2,),

        //Shipping fee
        Row(
          mainAxisAlignment: .spaceBetween,
          children: [
            Text("Shipping fee", style: theme.textTheme.bodyMedium,),
            Text("\$ 6.0", style: theme.textTheme.labelLarge,),
          ],
        ),
        const SizedBox(height: CustomSize.spaceBtwItems /2,),

        //tax fee
        Row(
          mainAxisAlignment: .spaceBetween,
          children: [
            Text("Tax fee", style: theme.textTheme.bodyMedium,),
            Text("\$ 6.0", style: theme.textTheme.labelLarge,),
          ],
        ),
        const SizedBox(height: CustomSize.spaceBtwItems /2,),

        //order total
        Row(
          mainAxisAlignment: .spaceBetween,
          children: [
            Text("Order Total", style: theme.textTheme.bodyMedium,),
            Text("\$ 268.0", style: theme.textTheme.titleMedium,),
          ],
        ),
      ],
    );
  }
}
