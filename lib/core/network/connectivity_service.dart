import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';

enum ConnectionStatus { online, offline }

class ConnectivityService extends GetxService {
  final _status = ConnectionStatus.online.obs;
  Rx<ConnectionStatus> get rx => _status;
  bool get isOnline => _status.value == ConnectionStatus.online;

  @override
  void onInit() {
    super.onInit();
    Connectivity().onConnectivityChanged.listen((results) {
      final online = results.any((result) => result != ConnectivityResult.none);
      _status.value = online ? ConnectionStatus.online : ConnectionStatus.offline;
    });
    // Initial check
    Connectivity().checkConnectivity().then((res) {
      final notConnected = res.any((result) => result == ConnectivityResult.none);
      _status.value = notConnected ? ConnectionStatus.offline : ConnectionStatus.online;
    });
  }
}