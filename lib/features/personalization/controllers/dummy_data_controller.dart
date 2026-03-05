import 'package:e_commerce/data/repositories/categories/category_repository.dart';
import 'package:e_commerce/features/personalization/dummy_data/dummy_data.dart';
import 'package:get/get.dart';

class DummyDataController extends GetxController{
  static DummyDataController get instance => Get.find();


  //variables
  final categoryRepository = CategoryRepository.instance;
  final isLoading = false.obs;

  Future<void> uploadPopularCategories() async {
    try {
      isLoading.value = true;
      await categoryRepository.uploadDummyData(DummyData.categories);
    } catch(e) {
      throw "Error uploading popular categories:: $e";
    } finally {
      isLoading.value = false;
    }
  }
}