import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../services/localization_service.dart';
import '../../../core/theme/theme_service.dart';
import '../../../localization/locale_keys.dart';

class LangThemeActions extends StatelessWidget {
  const LangThemeActions({super.key});

  @override
  Widget build(BuildContext context) {
    final loc = Get.find<LocalizationService>();
    return Row(children: [
      IconButton(
        tooltip: Lk.themeToggle.tr,
        icon: const Icon(Icons.brightness_6),
        onPressed: () => Get.find<ThemeService>().toggleTheme(),
      ),
      PopupMenuButton<Locale>(
        icon: const Icon(Icons.language),
        onSelected: (l) => loc.updateLocale(l),
        itemBuilder: (ctx) => [
          PopupMenuItem(value: LocalizationService.en, child: const Text('English')),
          PopupMenuItem(value: LocalizationService.ar, child: const Text('العربية')),
          PopupMenuItem(value: LocalizationService.ur, child: const Text('اردو')),
          PopupMenuItem(value: LocalizationService.fr, child: const Text('Français')),
        ],
      ),
    ]);
  }
}
