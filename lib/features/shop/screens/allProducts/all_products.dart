import 'package:e_commerce/common/widgets/appbar/custom_app_bar.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/products/sortable/sortable_products.dart';
import '../../../../utils/constants/custom_size.dart';

class AllProducts extends StatelessWidget {
  const AllProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          title: Text("Popular Products"),
          shouldShowBackBtn: true,
        ),

        body: SingleChildScrollView(
          child: Padding(
            padding: .all(CustomSize.defaultSpace),
            child: SortableProducts(),
          ),
        ),
      ),
    );
  }
}
