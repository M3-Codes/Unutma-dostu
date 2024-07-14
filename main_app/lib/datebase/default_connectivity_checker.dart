import 'package:connectivity_plus/connectivity_plus.dart';

import 'connectivity_checker .dart';

class DefaultConnectivityChecker implements ConnectivityChecker {
  @override
  Future<bool> isConnected() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    return connectivityResult != ConnectivityResult.none;
  }
}
