import 'package:e_commerce/common/widgets/texts/section_heading.dart';
import 'package:e_commerce/utils/constants/my_colors.dart';
import 'package:flutter/material.dart';

import '../../../../../utils/constants/custom_size.dart';

class BillingAddressSection extends StatelessWidget {
  const BillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        //heading
        SectionHeading(
          title: "Shipping Address",
          onPressed: () {},
          buttonTitle: "Change",
        ),

        //selected Address
        //Customer Name
        Text("Vishal Chand", style: Theme.of(context).textTheme.bodyLarge),
        const SizedBox(height: CustomSize.spaceBtwItems / 2),

        //phone number
        Row(
          children: [
            const Icon(Icons.phone, color: MyColors.grey, size: CustomSize.iconMd),
            const SizedBox(width: CustomSize.spaceBtwItems),
            Text(
              "+91 780896868**",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
        const SizedBox(height: CustomSize.spaceBtwItems / 2),

        //address
        Row(
          children: [
            const Icon(
              Icons.location_history,
              color: MyColors.grey,
              size: CustomSize.iconMd,
            ),
            const SizedBox(width: CustomSize.spaceBtwItems),
            Text(
              "New Delhi near Lal Kila, 2857469",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ],
    );
  }
}
