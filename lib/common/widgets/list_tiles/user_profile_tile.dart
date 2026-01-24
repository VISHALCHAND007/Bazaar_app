import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/my_colors.dart';
import '../images/circular_image.dart';

class UserProfileTile extends StatelessWidget {
  const UserProfileTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircularImage(
        imageUrl: ImageStrings.user,
        height: 56,
        width: 56,
        padding: EdgeInsets.zero,
      ),
      title: Text(
        "Vishal Chand",
        style: Theme.of(
          context,
        ).textTheme.headlineMedium!.apply(color: MyColors.white),
      ),
      subtitle: Text(
        "support@indie-tect.com",
        style: Theme.of(
          context,
        ).textTheme.bodyMedium!.apply(color: MyColors.white),
      ),
      trailing: IconButton(
        onPressed: () {},
        icon: const Icon(Iconsax.edit, color: MyColors.white),
      ),
    );
  }
}
