import 'package:e_commerce/common/widgets/customShapes/containers/rounded_container.dart';
import 'package:e_commerce/common/widgets/texts/section_heading.dart';
import 'package:e_commerce/utils/constants/image_strings.dart';
import 'package:e_commerce/utils/constants/my_colors.dart';
import 'package:e_commerce/utils/helpers/helpers.dart';
import 'package:flutter/material.dart';

import '../../../../../utils/constants/custom_size.dart';

class BillingPaymentSection extends StatelessWidget {
  const BillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Helpers.isDarkMode(context);

    return Column(
      children: [
        //heading
        SectionHeading(title: "Payment Method", buttonTitle: "Change", onPressed: () {},),

        //showing selected method
        Row(
          children: [
            RoundedContainer(
              height: 35,
                width: 60,
              backgroundColor: isDark ? MyColors.dark: MyColors.white,
              padding: const .all(CustomSize.sm),
              child: const Image(image: AssetImage(ImageStrings.appIconLight),),
            ),
            const SizedBox(width: CustomSize.spaceBtwItems /2,),
            //title
            Text("Paypal", style: Theme.of(context).textTheme.bodyLarge,)
          ],
        )
      ],
    );
  }
}
