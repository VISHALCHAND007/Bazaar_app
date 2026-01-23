import 'package:e_commerce/utils/device/device_utility.dart';
import 'package:e_commerce/utils/helpers/helpers.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/my_colors.dart';

class CustomTabBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomTabBar({super.key, required this.tabs});

  //We have create this class because we need to avoid the opaque background of tab bar while scrolling the widget up and
  // to do that we need to wrap the tab bar with Material widget which is not possible without a custom class.

  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    final isDark = Helpers.isDarkMode(context);

    return Material(
      child: TabBar(
        isScrollable: true,
        indicatorColor: MyColors.primary,
        labelColor: isDark ? MyColors.white : MyColors.black,
        unselectedLabelColor: MyColors.darkGrey,
        tabs: tabs,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(DeviceUtility.getAppbarHeight());
}
