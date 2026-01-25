import 'package:e_commerce/utils/constants/my_colors.dart';
import 'package:flutter/material.dart';

class CustomChipTheme {
  CustomChipTheme._();

  static ChipThemeData lightChipTheme = ChipThemeData(
    disabledColor: Colors.grey.withValues(alpha: .4),
    labelStyle: const TextStyle(color: Colors.black),
    selectedColor: MyColors.primary,
    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12 ),
    checkmarkColor: MyColors.white
  );
  static ChipThemeData darkChipTheme = const ChipThemeData(
      disabledColor: Colors.grey,
      labelStyle: TextStyle(color: Colors.white),
      selectedColor: MyColors.primary,
      padding:  EdgeInsets.symmetric(horizontal: 12.0, vertical: 12 ),
      checkmarkColor: MyColors.white
  );
}