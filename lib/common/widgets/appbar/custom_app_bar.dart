import 'package:e_commerce/utils/constants/custom_size.dart';
import 'package:e_commerce/utils/constants/my_colors.dart';
import 'package:e_commerce/utils/device/device_utility.dart';
import 'package:e_commerce/utils/helpers/helpers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.title,
    this.shouldShowBackBtn = false,
    this.leadingIcon,
    this.leadingCallback,
    this.actions,
  });

  final Widget? title;
  final bool shouldShowBackBtn;
  final IconData? leadingIcon;
  final VoidCallback? leadingCallback;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    final isDark = Helpers.isDarkMode(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: CustomSize.spaceBtwItems),
      child: AppBar(
        automaticallyImplyLeading: false,
        title: title,
        leading: shouldShowBackBtn
            ? IconButton(
                onPressed: () => Get.back(),
                icon: Icon(
                  Iconsax.arrow_left,
                  color: isDark ? MyColors.white : MyColors.black,
                ),
              )
            : leadingIcon != null
            ? IconButton(onPressed: leadingCallback, icon: Icon(leadingIcon))
            : null,
        actions: actions,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(DeviceUtility.getAppbarHeight());
}
