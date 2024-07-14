import 'package:connectivity_plus/connectivity_plus.dart';

import 'IConnectivityChecker.dart';

class Connectivitychecker implements IConnectivityChecker {
  @override
  Future<bool> isConnectedToInternet() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    return connectivityResult != ConnectivityResult.none;
  }
}
