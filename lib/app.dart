import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:getx_structure/services/localization_service.dart';
import 'core/theme/app_theme.dart';
import 'core/theme/theme_service.dart';
import 'localization/app_translations.dart';
import 'presentation/routes/app_pages.dart';
import 'presentation/routes/app_routes.dart';

class AppRoot extends StatelessWidget {
  const AppRoot({super.key});

  @override
  Widget build(BuildContext context) {
    final themeService = Get.find<ThemeService>();
    final loc = Get.find<LocalizationService>();
    return GetMaterialApp(
      title: 'Clean GetX MVVM',
      initialRoute: Routes.splash,
      getPages: AppPages.pages,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: themeService.themeMode,
      debugShowCheckedModeBanner: false,
      // Localization
      translations: AppTranslations(),
      locale: loc.locale,
      fallbackLocale: LocalizationService.en,
      supportedLocales: LocalizationService.supportedLocales,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
    );
  }
}
