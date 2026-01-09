import 'package:e_commerce/features/shop/screens/home/home_screen.dart';
import 'package:e_commerce/utils/constants/custom_strings.dart';
import 'package:e_commerce/utils/constants/my_colors.dart';
import 'package:e_commerce/utils/helpers/helpers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final navigationController = Get.put(NavigationController());
    final isDark = Helpers.isDarkMode(context);

    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          backgroundColor: isDark ? MyColors.black : MyColors.white,
          indicatorColor: isDark
              ? MyColors.white.withValues(alpha: .1)
              : MyColors.black.withValues(alpha: .1),
          selectedIndex: navigationController.selectedIndex.value,
          onDestinationSelected: (index) =>
              navigationController.selectedIndex.value = index,
          destinations: const [
            NavigationDestination(
              icon: Icon(Iconsax.home),
              label: CustomStrings.home,
            ),
            NavigationDestination(
              icon: Icon(Iconsax.shop),
              label: CustomStrings.store,
            ),
            NavigationDestination(
              icon: Icon(Iconsax.heart),
              label: CustomStrings.wishList,
            ),
            NavigationDestination(
              icon: Icon(Iconsax.user),
              label: CustomStrings.profile,
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Obx(
          () => navigationController
              .screens[navigationController.selectedIndex.value],
        ),
      ),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    const HomeScreen(),
    Container(color: Colors.blue),
    Container(color: Colors.brown),
    Container(color: Colors.orangeAccent),
  ];
}
