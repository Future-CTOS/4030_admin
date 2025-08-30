import 'package:get/get.dart';

import '../../../pages/dashboard/commons/dashboard_binding.dart';
import '../../../pages/dashboard/views/dashboard_page.dart';
import '../../../pages/splash_screen/bindings/splash_screen_page_binding.dart';
import '../../../pages/splash_screen/controllers/splash_screen_page_controller.dart';
import '../../../pages/splash_screen/views/splash_screen_page.dart';
import '../route_names/route_names.dart';

class RoutePages {
  RoutePages._();

  static final List<GetPage<dynamic>> routes = [_splashScreen, _dashboard];

  static GetPage<SplashScreenPageController> get _splashScreen => GetPage(
    name: RouteNames.splashScreen.path,
    page: SplashScreenPage.new,
    binding: SplashScreenPageBinding(),
  );

  static GetPage<SplashScreenPageController> get _dashboard => GetPage(
    name: RouteNames.dashboard.path,
    page: DashboardPage.new,
    binding: DashboardBinding(),
  );
}
