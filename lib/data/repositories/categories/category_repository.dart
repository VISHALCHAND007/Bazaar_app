import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/utils/constants/firebase_collection_details.dart';
import 'package:e_commerce/utils/exceptions/exports.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../features/shop/models/categories_model.dart';
import '../../services/firebase_storage_service.dart';

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
  Future<void> uploadDummyData(List<CategoriesModel> categories) async {
    try {
      final storage = Get.put(FirebaseStorageService());

      //loop through each category
      for(var category in categories) {
        //get image data
        final imageData = await storage.getImageDataFromAssets(category.image);
        
        //upload image
        final url = await storage.uploadImageData("Categories", imageData, category.name);

        //assign url to category.image
        category.image = url;

        //update the firebase firestore
        await _db.collection(FirebaseCollectionDetails.categoriesCollection).doc(category.id).set(category.toJson());
      }
    } on FirebaseException catch (e) {
      throw CustomFirebaseException(e.code);
    } on PlatformException catch (e) {
      throw CustomPlatformException(e.code);
    } catch (e) {
      throw "Something went wrong. Please try again later";
    }
  }
}