import 'package:e_commerce/utils/constants/custom_size.dart';
import 'package:flutter/cupertino.dart';

class SpacingStyle {
  SpacingStyle._();

  static EdgeInsetsGeometry paddingWithAppbarHeight = EdgeInsets.only(
    top: CustomSize.appBarHeight,
    bottom: CustomSize.defaultSpace,
    left: CustomSize.defaultSpace,
    right: CustomSize.defaultSpace,
  );
}
