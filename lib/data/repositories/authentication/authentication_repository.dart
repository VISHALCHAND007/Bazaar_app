import 'package:e_commerce/features/authentication/screens/login/login_screen.dart';
import 'package:e_commerce/features/authentication/screens/onboarding/onboarding_screen.dart';
import 'package:e_commerce/utils/constants/storage_keys.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

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
    deviceStorage.writeIfNull(StorageKeys.isFirstTime, true);

    //checking
    deviceStorage.read(StorageKeys.isFirstTime) != true ? Get.to(() => const LoginScreen()) : Get.to(() => const OnboardingScreen());
  }

  /*----------------E-mail & passwork sign in----------------*/
  // Sign in [Authentication]

  //Register
  Future<UserCredential> registerUserWithEmailAndPass(String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(email: email, password: password);
    }
    // on FirebaseAuthException catch (e){
    //   throw FirebaseAuthException(code: e.code).message;
    // }on FirebaseException catch (e){
    //   throw FirebaseException(e.code).message;
    // }on FormatException catch (e){
    //   throw const TFormatException();
    // }on PlatformException catch (e){
    //   throw TPlatFormException(e.code).message;
    // }
    catch (e) {
      throw "Something went wrong. Please try again later.";
    }
  }

  //Main verification
  //Re-authenticate user
  //forget password


  /*----------------Social sign in----------------*/
  //google

  //facebook
  /*----------------logout----------------*/
  /*----------------delete use----------------*/
}