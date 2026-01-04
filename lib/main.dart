import 'package:e_commerce/utils/theme/app_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bazaar',
      themeMode: .system,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,

    );
  }
}

 // utils
 //  v -> validators
 //  l -> logging
 //  t -> theme
//   l -> local storage
//   h -> helpers
//   h -> http
//   d -> device
//   f -> formatters
//   c -> constants