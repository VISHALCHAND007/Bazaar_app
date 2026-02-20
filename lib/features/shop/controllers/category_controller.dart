import 'package:e_commerce/common/widgets/loaders/loaders.dart';
import 'package:e_commerce/data/repositories/categories/category_repository.dart';
import 'package:e_commerce/features/shop/models/categories_model.dart';
import 'package:e_commerce/utils/constants/image_strings.dart';
import 'package:e_commerce/utils/popups/full_screen_loader.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController{
  static CategoryController get instance => Get.find();

  //variables
  final RxBool isLoading = false.obs;
  final RxList<CategoriesModel> allCategories = <CategoriesModel>[].obs;
  final RxList<CategoriesModel> featuredCategories = <CategoriesModel>[].obs;
  final _categoryRepository = CategoryRepository.instance;

  @override
  void onInit() {
    fetchCategories();
    super.onInit();
  }

  //load category data
  Future<void> fetchCategories() async {
    try {
      //start loading
      isLoading.value = true;

      //fetch the categories
      final result = await _categoryRepository.getAllCategories();
      
      //update the category list
      allCategories.assignAll(result);

      //filter featured categories
      featuredCategories.assignAll(allCategories.where((category) => category.isFeatured && category.parentId.isEmpty).take(8).toList());

    } catch (e) {
      Loaders.errorSnackBar(title: "On Snap", message: e.toString());
    } finally {
      //stop loading
      isLoading.value = false;
    }
  }

  //load selected category data

  //get category or sub category products
}