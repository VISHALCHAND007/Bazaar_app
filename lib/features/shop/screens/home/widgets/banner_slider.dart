import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce/common/widgets/images/rounded_image.dart';
import 'package:e_commerce/features/shop/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/customShapes/containers/rounded_container.dart';
import '../../../../../utils/constants/custom_size.dart';
import '../../../../../utils/constants/my_colors.dart';

class BannerSlider extends StatelessWidget {
  const BannerSlider({super.key, required this.banners});

  final List<String> banners;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());

    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            viewportFraction: .85,
            onPageChanged: (ind, _) => controller.updateCarousalInd(ind),
          ),
          items: banners.map((url) => RoundedImage(imageUrl: url, fit: .cover,)).toList(),
        ),
        const SizedBox(height: CustomSize.spaceBtwItems),
        Obx(
          () => Row(
            mainAxisAlignment: .center,
            children: [
              for (var i = 0; i < banners.length; i++)
                RoundedContainer(
                  height: 4,
                  width: 20,
                  margin: const .only(right: 10),
                  backgroundColor: controller.carousalInd.value == i
                      ? MyColors.primary
                      : MyColors.grey,
                ),
            ],
          ),
        ),
      ],
    );
  }
}
