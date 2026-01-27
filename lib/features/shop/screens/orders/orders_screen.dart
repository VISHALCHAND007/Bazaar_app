import 'package:e_commerce/common/widgets/appbar/custom_app_bar.dart';
import 'package:e_commerce/features/shop/screens/orders/widgets/orders_list.dart';
import 'package:flutter/material.dart';

import '../../../../utils/constants/custom_size.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(title: Text("My Orders", style: Theme.of(context).textTheme.headlineSmall,), shouldShowBackBtn: true),
        body: const Padding(
          padding: .all(CustomSize.defaultSpace),
          child: OrdersList(),
        ),
      ),
    );
  }
}
