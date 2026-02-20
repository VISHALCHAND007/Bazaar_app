import 'package:cloud_firestore/cloud_firestore.dart';

class CategoriesModel {
  final String id;
  final String name;
  final String image;
  final bool isFeatured;
  final String parentId;

  CategoriesModel({
    required this.id,
    required this.name,
    required this.image,
    required this.isFeatured,
    this.parentId = "",
  });

  //empty class helper
  static CategoriesModel empty() => CategoriesModel(
    id: "",
    name: "",
    image: "",
    isFeatured: false,
    parentId: "",
  );

  //convert model to json structure for the firebase operations
  Map<String, dynamic> toJson() => {
    "name": name,
    "image": image,
    "parentId": parentId,
    "isFeatured": isFeatured,
  };

  //map back to categories model from json for internal user after fetch
  factory CategoriesModel.fromSnapShot(
    DocumentSnapshot<Map<String, dynamic>> document,
  ) {
    if (document.data() != null) {
      final data = document.data()!;
      return CategoriesModel(
        id: document.id,
        name: data["name"] ?? "",
        image: data["image"] ?? "",
        parentId: data["parentId"] ?? "",
        isFeatured: data["isFeatured"] ?? false,
      );
    } else {
      return CategoriesModel.empty();
    }
  }
}
