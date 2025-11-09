import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_structure/core/theme/theme_service.dart';
import 'core/network/connectivity_service.dart';
import 'services/localization_service.dart';
import 'app.dart';
import 'services/storage_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Get.put(StorageService()).init();
  //Get.put(StorageService(), permanent: true);
  Get.put(ConnectivityService(), permanent: true);
  Get.put(LocalizationService(), permanent: true);
  Get.put(ThemeService(), permanent: true);
  runApp(const AppRoot());
}