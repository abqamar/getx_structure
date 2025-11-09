import 'connectivity_service.dart';
import 'package:get/get.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;
}

class NetworkInfoImpl implements NetworkInfo {
  final ConnectivityService connectivity = Get.find();
  @override
  Future<bool> get isConnected async => connectivity.isOnline;
}
