import 'package:e_commerce/common/widgets/appbar/custom_app_bar.dart';
import 'package:e_commerce/common/widgets/brands/brand_card.dart';
import 'package:e_commerce/common/widgets/products/sortable/sortable_products.dart';
import 'package:e_commerce/utils/constants/custom_size.dart';
import 'package:flutter/material.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: const CustomAppBar(title: Text("Nike"), shouldShowBackBtn: true,),
      body: SingleChildScrollView(
        child: Padding(padding: const .all(CustomSize.defaultSpace),
        child: Column(
          children: [
            //brand tile
            BrandCard(onTap: () {}),
            const SizedBox(height: CustomSize.spaceBtwSections,),

            //products related to this brand
            const SortableProducts()
          ],
        ),),
      ),
    ));
  }
}
