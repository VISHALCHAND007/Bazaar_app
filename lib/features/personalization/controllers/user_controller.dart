import 'package:e_commerce/common/widgets/loaders/loaders.dart';
import 'package:e_commerce/data/repositories/user/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../models/user_model.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  Future<void> saveUserRecord(UserCredential? credentials) async {
    try {
      if (credentials != null) {
        final nameParts = UserModel.nameParts(
          credentials.user?.displayName ?? "",
        );
        final username = UserModel.generateUsername(
          credentials.user?.displayName ?? "",
        );

        final user = UserModel(
          id: credentials.user!.uid,
          firstName: nameParts[0],
          lastName: nameParts.length > 1
              ? nameParts.sublist(1).join()
              : nameParts[1],
          username: username,
          email: credentials.user?.email ?? "",
          phoneNumber: credentials.user?.phoneNumber ?? "",
          profilePicture: credentials.user?.photoURL ?? "",
        );

        //saving user data
        await UserRepository.instance.saveUserRecord(user);
      }
    } catch (e) {
      Loaders.errorSnackBar(
        title: "Data not saved",
        message:
            "Something went wrong while saving your information. You can re-save your information in your Profile.",
      );
    }
  }
}
