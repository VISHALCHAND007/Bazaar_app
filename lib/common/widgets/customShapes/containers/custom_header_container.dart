import 'package:flutter/material.dart';

import '../../../../utils/constants/my_colors.dart';
import '../curved_edges/curved_edges_widget.dart';
import 'circular_container.dart';

class PrimaryHeaderContainer extends StatelessWidget {
  const PrimaryHeaderContainer({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return CurvedEdgesWidget(
      child: Container(
        padding: const EdgeInsets.all(0),
        color: MyColors.primary,
        child: SizedBox(
          height: 350,
          child: Stack(
            children: [
              Positioned(
                top: -150,
                right: -250,
                child: CircularContainer(backgroundColor: MyColors.textWhite.withValues(alpha: .1)),
              ),
              Positioned(
                top: 100,
                right: -300,
                child: CircularContainer(backgroundColor: MyColors.textWhite.withValues(alpha: .1)),
              ),
              Positioned(top: 0, left: 0, right: 0, child: child),
            ],
          ),
        ),
      ),
    );
  }
}
