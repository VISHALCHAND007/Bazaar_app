import 'package:e_commerce/features/shop/screens/productReviews/widgets/rating_graph_with_value.dart';
import 'package:flutter/material.dart';

class OverallProductRating extends StatelessWidget {
  const OverallProductRating({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        //Average rating
        Expanded(
          flex: 5,
          child: Text(
            "4.9",
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ),

        //graph
        const Expanded(
          flex: 10,
          child: Column(
            children: [
              RatingGraphWithValue(ratingText: "5", value: .9),
              RatingGraphWithValue(ratingText: "4", value: .7),
              RatingGraphWithValue(ratingText: "3", value: .3),
              RatingGraphWithValue(ratingText: "2", value: .2),
              RatingGraphWithValue(ratingText: "1", value: .5),
            ],
          ),
        ),
      ],
    );
  }
}
