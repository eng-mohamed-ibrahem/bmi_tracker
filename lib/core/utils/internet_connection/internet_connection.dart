import 'package:connectivity_plus/connectivity_plus.dart';

class InternetConnection {
  static Future<bool> isConnected() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult.contains(ConnectivityResult.wifi) ||
        connectivityResult.contains(ConnectivityResult.mobile)) {
      return true;
    } else {
      return false;
    }
  }
}
