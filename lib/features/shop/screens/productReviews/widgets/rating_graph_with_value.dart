import 'package:flutter/material.dart';

import '../../../../../utils/constants/my_colors.dart';

class RatingGraphWithValue extends StatelessWidget {
  const RatingGraphWithValue({
    super.key,
    required this.ratingText,
    required this.value,
  });

  final String ratingText;
  final double value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        //text rating for each type
        Expanded(
          flex: 1,
          child: Text(
            ratingText,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),

        //graph for each type
        Expanded(
          flex: 10,
          child: LinearProgressIndicator(
            value: value,
            minHeight: 10,
            borderRadius: .circular(10),
            backgroundColor: MyColors.grey,
            valueColor: const AlwaysStoppedAnimation(MyColors.primary),
          ),
        ),
      ],
    );
  }
}