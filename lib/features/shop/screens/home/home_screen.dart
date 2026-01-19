import 'package:e_commerce/features/shop/screens/home/widgets/home_app_bar.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/customShapes/containers/custom_header_container.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          PrimaryHeaderContainer(
            child: HomeAppbar(),
          ),
        ],
      ),
    );
  }
}

