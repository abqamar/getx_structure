import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../routes/app_routes.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});
  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 800), () => Get.offAllNamed(Routes.home));
  }
  @override
  Widget build(BuildContext context) => const Scaffold(
    body: Center(child: FlutterLogo(size: 72)),
  );
}
