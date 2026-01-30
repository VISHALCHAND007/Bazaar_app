import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/features/personalization/models/user_model.dart';
import 'package:get/get.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  Future<void> saveUserRecord(UserModel user) async {
    try {
      await _db.collection("Users").doc(user.id).set(user.toJson());
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
    catch(e) {
      throw "Something went wrong. Please try again.";
    }
  }
}