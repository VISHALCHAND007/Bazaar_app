import 'package:e_commerce/features/personalization/controllers/user_controller.dart';
import 'package:e_commerce/features/personalization/screens/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/my_colors.dart';
import '../images/circular_image.dart';

class UserProfileTile extends StatelessWidget {
  const UserProfileTile({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;

    return ListTile(
      leading: const RoundedImage(
        imageUrl: ImageStrings.user,
        height: 56,
        width: 56,
        padding: EdgeInsets.zero,
      ),
      title: Obx(
        () => Text(
          controller.user.value?.fullName ?? "",
          style: Theme.of(
            context,
          ).textTheme.headlineMedium!.apply(color: MyColors.white),
        ),
      ),
      subtitle: Obx(
        () => Text(
          controller.user.value?.email ?? "",
          style: Theme.of(
            context,
          ).textTheme.bodyMedium!.apply(color: MyColors.white),
        ),
      ),
      trailing: IconButton(
        onPressed: () => Get.to(() => const ProfileScreen()),
        icon: const Icon(Iconsax.edit, color: MyColors.white),
      ),
    );
  }
}
