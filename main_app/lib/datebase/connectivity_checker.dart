import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivityChecker {
  static final ConnectivityChecker _instance = ConnectivityChecker._internal();
  Timer? _connectivityTimer;

  ConnectivityChecker._internal();

  factory ConnectivityChecker() {
    return _instance;
  }

  Future<bool> isConnectedToInternet() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    return connectivityResult != ConnectivityResult.none;
  }

  void startConnectivityCheck(Function processUploadQueue) {
    _connectivityTimer?.cancel();
    _connectivityTimer =
        Timer.periodic(const Duration(seconds: 10), (timer) async {
      if (await isConnectedToInternet()) {
        await processUploadQueue();
      }
    });
  }
}
