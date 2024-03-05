import 'package:app_phat_giao/presentation/journey/splash/splash_page.dart';
import 'package:get/get.dart';

class AppRoute {
  static const INITIAL = '/';

  static final pages = [
    GetPage(
      name: INITIAL,
      page: () => const SplashPage(),
    ),
  ];
}
