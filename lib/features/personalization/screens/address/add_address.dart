import 'package:e_commerce/common/widgets/appbar/custom_app_bar.dart';
import 'package:e_commerce/utils/constants/custom_size.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class AddAddressScreen extends StatelessWidget {
  const AddAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar(
          shouldShowBackBtn: true,
          title: Text("Add your address"),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const .all(CustomSize.defaultSpace),
            child: Form(
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Iconsax.user),
                      labelText: "Name",
                    ),
                  ),
                  const SizedBox(height: CustomSize.spaceBtwInputFields),
                  TextFormField(
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Iconsax.mobile),
                      labelText: "Phone Number",
                    ),
                  ),
                  const SizedBox(height: CustomSize.spaceBtwInputFields),

                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.streetview),
                            labelText: "Street",
                          ),
                        ),
                      ),
                      const SizedBox(width: CustomSize.spaceBtwInputFields),
                      Expanded(
                        child: TextFormField(
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.signpost),
                            labelText: "Postal Code",
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: CustomSize.spaceBtwInputFields),

                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.location_city_outlined),
                            labelText: "City",
                          ),
                        ),
                      ),
                      const SizedBox(width: CustomSize.spaceBtwInputFields),
                      Expanded(
                        child: TextFormField(
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.real_estate_agent),
                            labelText: "State",
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: CustomSize.spaceBtwInputFields),

                  TextFormField(
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Iconsax.global),
                      labelText: "Country",
                    ),
                  ),
                  const SizedBox(height: CustomSize.spaceBtwSections),

                  SizedBox(
                    width: .infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text("Save"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
