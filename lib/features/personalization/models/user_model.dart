import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/utils/formatters/custom_formatter.dart';

class UserModel {
  final String id;
  String firstName;
  String lastName;
  final String username;
  final String email;
  String phoneNumber;
  String profilePicture;

  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.email,
    required this.phoneNumber,
    required this.profilePicture,
  });

  //to get the full name
  String get fullName => "$firstName $lastName";

  // to get the phone number
  String get formattedPhoneNumer =>
      CustomFormatter.formatPhoneNumber(phoneNumber);

  // to split the full name
  static List<String> nameParts(String fullName) => fullName.split(" ");

  static String generateUsername(String fullName) {
    List<String> nameParts = fullName.split(" ");

    String firstName = nameParts[0].toLowerCase();
    String lastName = nameParts.length > 1 ? nameParts[1].toLowerCase() : "";
    String combinedName = "$firstName$lastName";

    return "eCom_$combinedName";
  }

  static UserModel empty() => UserModel(
    id: "",
    firstName: "",
    lastName: "",
    username: "",
    email: "",
    phoneNumber: "",
    profilePicture: "",
  );

  //convert model to json
  Map<String, dynamic> toJson() {
    return {
      "first_name": firstName,
      "last_name": lastName,
      "username": username,
      "email": email,
      "phone_number": phoneNumber,
      "profile_pic": profilePicture,
    };
  }

  //factory method to create user model from firebase response
  // factory UserModel.fromSnapShot(
  //   DocumentSnapshot<Map<String, dynamic>> document,
  // ) {
  //   if (document.data() != null) {
  //     final data = document.data()!;
  //     return UserModel(
  //       id: document.id,
  //       firstName: data['first_name'] ?? "",
  //       lastName: data['last_name'] ?? "",
  //       username: data['username'] ?? "",
  //       email: data['email'] ?? "",
  //       phoneNumber: data['phone_number'] ?? "",
  //       profilePicture: data['profile_pic'] ?? "",
  //     );
  //   }
  //   UserModel.empty();
  // }
}
