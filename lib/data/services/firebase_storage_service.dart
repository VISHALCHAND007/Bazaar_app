import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class FirebaseStorageService extends GetxController{
  static FirebaseStorageService get instance => Get.find();

  final _firebaseStorage = FirebaseStorage.instance;

  //upload local assets from IDE

  Future<Uint8List?> getImageDataFromAssets(String? path) async {
    try {
      if(path != null && path.isNotEmpty) {
        final byteData = await rootBundle.load(path);
        final imageData = byteData.buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes);
        return imageData;
      }
      return null;
    } catch (e) {
      throw "Error loading image data: $e";
    }
  }

  //upload images using image data to firebase storage -- for local/asset images 
  //returns download URL of the uploaded image
  Future<String> uploadImageData(String path, Uint8List imageData, String name) async {
    try {
      final ref = _firebaseStorage.ref(path).child(name);
      await ref.putData(imageData);
      final downloadUrl = await ref.getDownloadURL();
      return downloadUrl;
    } catch (e) {
      if(e is FirebaseException) {
        throw "Firebase Exception: ${e.message}";
      } else if(e is SocketException) {
        throw "Socket Exception: ${e.message}";
      } else if(e is PlatformException) {
        throw "Platform Exception: ${e.message}";
      } else {
        throw "Something went wrong. Please try again later.";
      }
    }
  }

  //upload images using image data to firebase storage -- for user selected images
  //returns download URL of the uploaded image
  Future<String> uploadImageFile(String path, XFile image) async {
    try {
      final ref = _firebaseStorage.ref(path).child(image.name);
      await ref.putFile(File(image.path));
      final url = await ref.getDownloadURL();
      return url;
    } catch (e) {
      if(e is FirebaseException) {
        throw "Firebase Exception: ${e.message}";
      } else if(e is SocketException) {
        throw "Socket Exception: ${e.message}";
      } else if(e is PlatformException) {
        throw "Platform Exception: ${e.message}";
      } else {
        throw "Something went wrong. Please try again later.";
      }
    }
  }
}