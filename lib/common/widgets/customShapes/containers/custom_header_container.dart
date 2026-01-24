import 'package:flutter/material.dart';

import '../../../../utils/constants/my_colors.dart';
import '../curved_edges/curved_edges_widget.dart';
import 'rounded_container.dart';

class PrimaryHeaderContainer extends StatelessWidget {
  const PrimaryHeaderContainer({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return CurvedEdgesWidget(
      child: Container(
        color: MyColors.primary,
        child: Stack(
          children: [
            Positioned(
              top: -150,
              right: -250,
              child: RoundedContainer(
                backgroundColor: MyColors.textWhite.withValues(alpha: .1),
                height: 400,
                width: 400,
                radius: 200,
              ),
            ),
            Positioned(
              top: 100,
              right: -300,
              child: RoundedContainer(
                backgroundColor: MyColors.textWhite.withValues(alpha: .1),
                height: 400,
                width: 400,
                radius: 200,
              ),
            ),
            child
          ],
        ),
      ),
    );
  }
}
