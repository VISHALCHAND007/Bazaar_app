import 'package:e_commerce/firebase_options.dart';
import 'package:e_commerce/utils/constants/my_colors.dart';
import 'package:e_commerce/utils/theme/app_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'data/repositories/authentication/authentication_repository.dart';

Future<void> main() async {
  // Init widgets
  final widgetBinding = WidgetsFlutterBinding.ensureInitialized();

  // Init local storage
  GetStorage.init();

  // Set native splash to preserve
  FlutterNativeSplash.preserve(widgetsBinding: widgetBinding);

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((FirebaseApp value) => Get.put(AuthenticationRepository()));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Bazaar',
      themeMode: .system,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      // home: const OnboardingScreen(),
      home: const Scaffold(
        backgroundColor: MyColors.primary,
        body: Center(child: CircularProgressIndicator(color: MyColors.white)),
      ),
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
