import 'package:e_commerce/common/widgets/customShapes/curved_edges/curved_edges_widget.dart';
import 'package:e_commerce/utils/helpers/helpers.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/icons/circular_icon.dart';
import '../../../../../common/widgets/appbar/custom_app_bar.dart';
import '../../../../../common/widgets/images/circular_image.dart';
import '../../../../../utils/constants/custom_size.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/my_colors.dart';

class ProductImageSlider extends StatelessWidget {
  const ProductImageSlider({super.key});


  @override
  Widget build(BuildContext context) {
    final isDark = Helpers.isDarkMode(context);

    return CurvedEdgesWidget(
      child: Container(
        color: isDark ? MyColors.darkerGrey : MyColors.light,
        height: 350,
        padding: const EdgeInsets.only(bottom: 10),
        child: Stack(
          children: [
            //main widget used as background
            const Center(
              child: Image(
                fit: .contain,
                image: AssetImage(ImageStrings.productImage1),
              ),
            ),
      
            //app bar
            const CustomAppBar(
              shouldShowBackBtn: true,
              actions: [
                CircularIcon(icon: Iconsax.heart5, selectedColor: Colors.red),
              ],
            ),
      
            //image slider
            Positioned(
              left: 10,
              right: 0,
              bottom: 20,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const AlwaysScrollableScrollPhysics(),
                  separatorBuilder: (_, _) =>
                      const SizedBox(width: CustomSize.spaceBtwItems),
                  itemCount: 6,
                  itemBuilder: (_, ind) => RoundedImage(
                    width: 80,
                    border: Border.all(color: MyColors.primary),
                    padding: const .all(CustomSize.sm),
                    backgroundColor: isDark ? MyColors.dark : MyColors.white,
                    imageUrl: ImageStrings.productImage1,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
