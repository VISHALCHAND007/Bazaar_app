import 'package:flutter/material.dart';

import '../../../../../utils/constants/custom_size.dart';
import '../../../../../utils/constants/my_colors.dart';
import '../../../../../utils/helpers/helpers.dart';
import '../../../customShapes/containers/rounded_container.dart';

class CouponWidget extends StatelessWidget {
  const CouponWidget({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final isDark = Helpers.isDarkMode(context);

    return RoundedContainer(
      showBorder: true,
      backgroundColor: isDark ? MyColors.dark : MyColors.light,
      padding: const .only(
        left: CustomSize.md,
        right: CustomSize.sm,
        top: CustomSize.sm,
        bottom: CustomSize.sm,
      ),
      child: Row(
        children: [
          //textfield
          Expanded(
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: "Have a promo code? Enter here",
                focusedBorder: .none,
                enabledBorder: .none,
                errorBorder: .none,
                disabledBorder: .none,
                focusedErrorBorder: .none,
              ),
            ),
          ),
          //button
          SizedBox(
            width: 80,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                foregroundColor: isDark
                    ? MyColors.white.withValues(alpha: .5)
                    : MyColors.dark.withValues(alpha: .5),
                backgroundColor: Colors.grey.withValues(alpha: .5),
                side: BorderSide(
                  color: Colors.grey.withValues(alpha: .2),
                ),
              ),
              child: const Text("Apply"),
            ),
          ),
        ],
      ),
    );
  }
}