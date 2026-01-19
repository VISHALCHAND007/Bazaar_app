import 'package:e_commerce/utils/constants/custom_size.dart';
import 'package:e_commerce/utils/device/device_utility.dart';
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: CustomSize.spaceBtwItems),
      child: AppBar(
        automaticallyImplyLeading: false,
        title: title,
        leading: shouldShowBackBtn
            ? IconButton(
                onPressed: () => Get.back(),
                icon: const Icon(Iconsax.arrow_left),
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
