import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:e_commerce/common/widgets/loaders/loaders.dart';
import 'package:get/get.dart';

//Used to check connection status instantly/continuously by setting up a listener
class NetworkManager extends GetxController {
  static NetworkManager get instance => Get.find();

  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<List<ConnectivityResult>> _connectionSubscription;
  final RxList<ConnectivityResult> _connectionStatus = [ConnectivityResult.none].obs;

  //
  @override
  void onInit() {
    super.onInit();
    _connectionSubscription = _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  Future<void> _updateConnectionStatus(List<ConnectivityResult> result) async {
    _connectionStatus.value = result;
    if(result.contains(ConnectivityResult.none)) {
      Loaders.warningSnackBar(title: "No internet connection");
    }
  }

  //check internet connection
  Future<bool> isConnected() async {
    try {
      final result = await _connectivity.checkConnectivity();
      if(result.contains(ConnectivityResult.none)) {
        return false;
      } else {
        return true;
      }
    } catch (e) {
      return false;
    }
  }
  //to close/dismiss the connectivity stream.
  @override
  void onClose() {
    super.onClose();
    _connectionSubscription.cancel();
  }
}

