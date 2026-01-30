import 'package:e_commerce/data/repositories/user/user_repository.dart';
import 'package:e_commerce/utils/helpers/network_manager.dart';
import 'package:get/get.dart';

class GeneralBindings extends Bindings{

  @override
  void dependencies() {
    Get.put(NetworkManager());
    Get.put(UserRepository());
  }
}