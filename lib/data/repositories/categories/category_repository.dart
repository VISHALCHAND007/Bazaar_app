import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/features/shop/models/categories_model.dart';
import 'package:e_commerce/utils/constants/firebase_collection_details.dart';
import 'package:e_commerce/utils/exceptions/exports.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class CategoryRepository extends GetxController {
  static CategoryRepository get instance => Get.find();

  //variables
  final _db = FirebaseFirestore.instance;

  //get all the categories
  Future<List<CategoriesModel>> getAllCategories() async {
    try {
      final snapshot = await _db.collection(FirebaseCollectionDetails.categoriesCollection).get();
      final list = snapshot.docs.map((document) => CategoriesModel.fromSnapShot(document)).toList();
      return list;
    } on FirebaseException catch (e) {
      throw CustomFirebaseException(e.code);
    } on PlatformException catch (e) {
      throw CustomPlatformException(e.code);
    } catch (e) {
      throw "Something went wrong. Please try again later.";
    }
  }

//get all the sub categories

//upload categories to the firebase firestore
}