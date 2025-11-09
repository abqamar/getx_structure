import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeService extends GetxService {
  static const _key = 'isDark';
  final box = GetStorage();

  bool get isDarkMode => box.read(_key) ?? false;
  ThemeMode get themeMode => isDarkMode ? ThemeMode.dark : ThemeMode.light;

  void toggleTheme() {
    final dark = !isDarkMode;
    box.write(_key, dark);
    Get.changeThemeMode(dark ? ThemeMode.dark : ThemeMode.light);
  }
}