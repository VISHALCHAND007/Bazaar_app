import 'package:flutter/material.dart';

class MyTextTheme {
  MyTextTheme._();

  static TextTheme lightTextTheme = TextTheme(
    headlineLarge: const TextStyle().copyWith(fontSize: 32, color: Colors.black, fontWeight: .bold),
    headlineMedium: const TextStyle().copyWith(fontSize: 24, color: Colors.black, fontWeight: .w600),
    headlineSmall: const TextStyle().copyWith(fontSize: 18, color: Colors.black, fontWeight: .w400),

    titleLarge: const TextStyle().copyWith(fontSize: 16, color: Colors.black, fontWeight: .w600,),
    titleMedium: const TextStyle().copyWith(fontSize: 16, color: Colors.black, fontWeight: .w500,),
    titleSmall: const TextStyle().copyWith(fontSize: 16, color: Colors.black, fontWeight: .w400,),

    bodyLarge: const TextStyle().copyWith(fontSize: 14, color: Colors.black, fontWeight: .w500),
    bodyMedium: const TextStyle().copyWith(fontSize: 14, color: Colors.black, fontWeight: .normal),
    bodySmall: const TextStyle().copyWith(fontSize: 14, color: Colors.black.withValues(alpha: .5), fontWeight: .w500),

    labelLarge: const TextStyle().copyWith(fontSize: 12, color: Colors.black, fontWeight: .normal),
    labelMedium: const TextStyle().copyWith(fontSize: 12, color: Colors.black.withValues(alpha: .5), fontWeight: .normal),
  );

  static TextTheme dartTextTheme = TextTheme(
    headlineLarge: const TextStyle().copyWith(fontSize: 32, color: Colors.white, fontWeight: .bold),
    headlineMedium: const TextStyle().copyWith(fontSize: 24, color: Colors.white, fontWeight: .w600),
    headlineSmall: const TextStyle().copyWith(fontSize: 18, color: Colors.white, fontWeight: .w400),

    titleLarge: const TextStyle().copyWith(fontSize: 16, color: Colors.white, fontWeight: .w600,),
    titleMedium: const TextStyle().copyWith(fontSize: 16, color: Colors.white, fontWeight: .w500,),
    titleSmall: const TextStyle().copyWith(fontSize: 16, color: Colors.white, fontWeight: .w400,),

    bodyLarge: const TextStyle().copyWith(fontSize: 14, color: Colors.white, fontWeight: .w500),
    bodyMedium: const TextStyle().copyWith(fontSize: 14, color: Colors.white, fontWeight: .normal),
    bodySmall: const TextStyle().copyWith(fontSize: 14, color: Colors.white.withValues(alpha: .5), fontWeight: .w500),

    labelLarge: const TextStyle().copyWith(fontSize: 12, color: Colors.white, fontWeight: .normal),
    labelMedium: const TextStyle().copyWith(fontSize: 12, color: Colors.white.withValues(alpha: .5), fontWeight: .normal),
  );
}