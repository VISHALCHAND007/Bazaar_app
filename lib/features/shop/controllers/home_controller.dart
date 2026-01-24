
import 'package:get/get.dart';

class HomeController extends GetxController{
  static HomeController get instance => Get.find();

  final carousalInd = 0.obs;

  void updateCarousalInd(index) {
    carousalInd.value = index;
  }
}