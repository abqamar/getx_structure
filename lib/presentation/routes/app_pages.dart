import 'package:get/get.dart';
import '../bindings/home_binding.dart';
import '../pages/home/home_view.dart';
import '../pages/splash/splash_view.dart';
import 'app_routes.dart';

class AppPages {
  static final pages = <GetPage>[
    GetPage(name: Routes.splash, page: () => const SplashView()),
    GetPage(name: Routes.home, page: () => const HomeView(), binding: HomeBinding()),
  ];
}
