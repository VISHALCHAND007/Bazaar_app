import 'package:e_commerce/features/authentication/screens/login/login_screen.dart';
import 'package:e_commerce/features/authentication/screens/navigation_menu/navigation_menu.dart';
import 'package:e_commerce/features/authentication/screens/onboarding/onboarding_screen.dart';
import 'package:e_commerce/features/authentication/screens/signup/verification/verify_email.dart';
import 'package:e_commerce/utils/constants/storage_keys.dart';
import 'package:e_commerce/utils/exceptions/exports.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../utils/exceptions/firebase_auth_exceptions.dart';
import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/format_exceptions.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();
  final _auth = FirebaseAuth.instance;

  final deviceStorage = GetStorage();

  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  void screenRedirect() async {
    final user = _auth.currentUser;
    if (user != null) {
      if (user.emailVerified) {
        // ignore: prefer_const_constructors
        Get.offAll(() => NavigationMenu());
      } else {
        Get.offAll(() => VerifyEmail(email: user.email));
      }
    } else {
      deviceStorage.writeIfNull(StorageKeys.isFirstTime, true);

      //checking
      deviceStorage.read(StorageKeys.isFirstTime) != true
          ? Get.to(() => const LoginScreen())
          : Get.to(() => const OnboardingScreen());
    }
  }

  /*----------------E-mail & passwork sign in----------------*/
  // Sign in [Authentication]

  //Register
  Future<UserCredential> registerUserWithEmailAndPass(
    String email,
    String password,
  ) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      throw CustomFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw CustomFirebaseException(e.code).message;
    } on FormatException catch (e) {
      throw const CustomFormatException();
    } on PlatformException catch (e) {
      throw CustomPlatformException(e.code).message;
    } catch (e) {
      throw "Something went wrong. Please try again later.";
    }
  }

  //Mail verification
  Future<void> sendEmailForVerification() async {
    try {
      await _auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      throw CustomFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw CustomFirebaseException(e.code).message;
    } on FormatException catch (e) {
      throw const CustomFormatException();
    } on PlatformException catch (e) {
      throw CustomPlatformException(e.code).message;
    } catch (e) {
      throw "Something went wrong. Please try again later.";
    }
  }
  //Re-authenticate user
  //forget password

  /*----------------Social sign in----------------*/
  //google

  //facebook
  /*----------------logout----------------*/
  Future<void> logout() async{
    try {
      await _auth.signOut();
    }on FirebaseAuthException catch (e) {
      throw CustomFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw CustomFirebaseException(e.code).message;
    } on FormatException catch (e) {
      throw const CustomFormatException();
    } on PlatformException catch (e) {
      throw CustomPlatformException(e.code).message;
    } catch(e) {
      throw "Something went wrong. Please try again later.";
    }
  }
  /*----------------delete use----------------*/
}
