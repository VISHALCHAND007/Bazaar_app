import 'package:e_commerce/common/widgets/appbar/custom_app_bar.dart';
import 'package:e_commerce/common/widgets/brands/brand_card.dart';
import 'package:e_commerce/common/widgets/layout/grid_layout.dart';
import 'package:e_commerce/common/widgets/texts/section_heading.dart';
import 'package:e_commerce/features/shop/screens/brands/brand_products.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/constants/custom_size.dart';

class AllBrands extends StatelessWidget {
  const AllBrands({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar(
          title: Text("Brands"),
          shouldShowBackBtn: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const .all(CustomSize.defaultSpace),
            child: Column(
              children: [
                //Heading
                const SectionHeading(title: "Brands", showActionBtn: false),
                const SizedBox(height: CustomSize.spaceBtwItems),

                //brands
                GridLayout(
                  mainAxisExtent: 90,
                  itemCount: 8,
                  itemBuilder: (_, ind) => BrandCard(
                    onTap: () => Get.to(() => const BrandProducts()),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
