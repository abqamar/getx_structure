import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../localization/locale_keys.dart';

class NoInternetView extends StatelessWidget {
  const NoInternetView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          const Icon(Icons.wifi_off, size: 64),
          const SizedBox(height: 12),
          Text(Lk.errorNoInternetTitle.tr, style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 8),
          Text(Lk.errorNoInternetMsg.tr, style: Theme.of(context).textTheme.bodySmall, textAlign: TextAlign.center),
        ]),
      ),
    );
  }
}
