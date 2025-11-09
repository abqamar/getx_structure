import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LocalizationService extends GetxService {
  static const _key = 'locale_code';
  final _box = GetStorage();

  // Supported locales
  static const Locale en = Locale('en', 'US');
  static const Locale ar = Locale('ar', 'AE');
  static const Locale ur = Locale('ur', 'PK');
  static const Locale fr = Locale('fr', 'FR');

  static final Map<String, Locale> _code2Locale = {
    'en_US': en,
    'ar_AE': ar,
    'ur_PK': ur,
    'fr_FR': fr,
  };

  static final supportedLocales = _code2Locale.values.toList();

  Locale get locale {
    final code = _box.read<String>(_key);
    if (code != null && _code2Locale.containsKey(code)) return _code2Locale[code]!;
    // try device first; fall back to EN
    final device = Get.deviceLocale;
    if (device != null && supportedLocales.any((l) => l.languageCode == device.languageCode)) {
      return supportedLocales.firstWhere((l) => l.languageCode == device.languageCode);
    }
    return en;
  }

  Future<void> updateLocale(Locale l) async {
    await _box.write(_key, '${l.languageCode}_${l.countryCode}');
    Get.updateLocale(l);
  }

  String trPlural(String baseKey, int count, {Map<String, String>? params}) {
    final String selKey = switch (count) {
      0 => '$baseKey.zero',
      1 => '$baseKey.one',
      _ => '$baseKey.other',
    };
    return selKey.trParams(params ?? {'count': '$count'});
  }
}
