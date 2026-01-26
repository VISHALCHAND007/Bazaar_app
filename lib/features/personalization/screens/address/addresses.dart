import 'package:e_commerce/common/widgets/appbar/custom_app_bar.dart';
import 'package:e_commerce/features/personalization/screens/address/add_address.dart';
import 'package:e_commerce/features/personalization/screens/address/widgets/single_address.dart';
import 'package:e_commerce/utils/constants/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/custom_size.dart';

class AddressesScreen extends StatelessWidget {
  const AddressesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar(shouldShowBackBtn: true, title: Text("Addresses")),
        floatingActionButton: FloatingActionButton(
          backgroundColor: MyColors.primary,
          child: const Icon(Iconsax.location_add5, color: MyColors.white),
          onPressed: () => Get.to(() => const AddAddressScreen()),
        ),
        body: const SingleChildScrollView(
          child: Padding(
            padding: .all(CustomSize.defaultSpace),
            child: Column(children: [
              SingleAddress(isSelected: false),
              SingleAddress(isSelected: true),
            ]),
          ),
        ),
      ),
    );
  }
}
