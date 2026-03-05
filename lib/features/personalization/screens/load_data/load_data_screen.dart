import 'package:e_commerce/common/widgets/appbar/custom_app_bar.dart';
import 'package:e_commerce/common/widgets/list_tiles/settings_menu_tile.dart';
import 'package:e_commerce/features/personalization/controllers/dummy_data_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/custom_size.dart';

class LoadDataScreen extends StatelessWidget {
  const LoadDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = DummyDataController.instance;

    return Scaffold(
      appBar: const CustomAppBar(
        title: Text("Load Data"),
        shouldShowBackBtn: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const .all(CustomSize.defaultSpace),
          child: Obx(() {
            if (controller.isLoading.value) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return Column(
                children: [
                  SettingsMenuTile(
                    icon: Iconsax.document_upload,
                    title: "Upload Popular Categories",
                    subTitle:
                        "Tap to upload all the popular categories to your firebase backend.",
                    onTap: () => controller.uploadPopularCategories(),
                  ),
                  const SizedBox(height: CustomSize.spaceBtwItems),
                ],
              );
            }
          }),
        ),
      ),
    );
  }
}
