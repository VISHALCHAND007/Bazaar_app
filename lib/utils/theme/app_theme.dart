import 'package:e_commerce/utils/constants/my_colors.dart';
import 'package:e_commerce/utils/theme/custom_themes/app_bar_theme.dart';
import 'package:e_commerce/utils/theme/custom_themes/bottom_sheet_theme.dart';
import 'package:e_commerce/utils/theme/custom_themes/check_box_theme.dart';
import 'package:e_commerce/utils/theme/custom_themes/chip_theme.dart';
import 'package:e_commerce/utils/theme/custom_themes/elevated_button_theme.dart';
import 'package:e_commerce/utils/theme/custom_themes/outlined_button_theme.dart';
import 'package:e_commerce/utils/theme/custom_themes/text_field_theme.dart';
import 'package:flutter/material.dart';
import './custom_themes/text_theme.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: "poppins",
    scaffoldBackgroundColor: MyColors.white,
    primaryColor: MyColors.primary,
    brightness: .light,
    textTheme: MyTextTheme.lightTextTheme,
    elevatedButtonTheme: CustomElevatedButtonTheme.lightElevatedTheme,
    appBarTheme: CustomAppBarTheme.lightAppBarTheme,
    outlinedButtonTheme: CustomOutlinedButtonTheme.lightOutlinedButtonTheme,
    bottomSheetTheme: CustomBottomSheetTheme.lightBottomSheetTheme,
    checkboxTheme: CustomCheckBoxTheme.lightCheckBoxTheme, 
    chipTheme: CustomChipTheme.lightChipTheme,
    inputDecorationTheme: CustomTextFieldTheme.lightTextFieldTheme

  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: .dark,
    fontFamily: "poppins",
    primaryColor: MyColors.primary,
    scaffoldBackgroundColor: MyColors.dark,
    textTheme: MyTextTheme.dartTextTheme,
    elevatedButtonTheme: CustomElevatedButtonTheme.dartElevatedTheme,
    appBarTheme: CustomAppBarTheme.darkAppBarTheme,
    outlinedButtonTheme: CustomOutlinedButtonTheme.darkOutlinedButtonTheme,
    bottomSheetTheme: CustomBottomSheetTheme.darkBottomSheetTheme,
    checkboxTheme: CustomCheckBoxTheme.darkCheckBoxTheme,
    chipTheme: CustomChipTheme.darkChipTheme,
      inputDecorationTheme: CustomTextFieldTheme.darkTextFieldTheme
  );
}