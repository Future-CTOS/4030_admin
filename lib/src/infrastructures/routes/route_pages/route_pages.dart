import 'package:app_4030_admin/src/pages/driver_license_document/common/driver_license_document_binding.dart';
import 'package:get/get.dart';

import '../../../pages/dashboard/commons/dashboard_binding.dart';
import '../../../pages/dashboard/views/dashboard_page.dart';
import '../../../pages/driver_license_document/views/driver_license_document_page.dart';
import '../../../pages/driver_management/common/driver_management_binding.dart';
import '../../../pages/driver_management/views/driver_management_page.dart';
import '../../../pages/splash_screen/bindings/splash_screen_page_binding.dart';
import '../../../pages/splash_screen/controllers/splash_screen_page_controller.dart';
import '../../../pages/splash_screen/views/splash_screen_page.dart';
import '../route_names/route_names.dart';

class RoutePages {
  RoutePages._();

  static final List<GetPage<dynamic>> routes = [
    _splashScreen,
    _dashboard,
    _driverManagement,
  ];

  static GetPage<SplashScreenPageController> get _splashScreen => GetPage(
    name: RouteNames.splashScreen.path,
    page: SplashScreenPage.new,
    binding: SplashScreenPageBinding(),
  );

  static GetPage get _dashboard => GetPage(
    name: RouteNames.dashboard.path,
    page: DashboardPage.new,
    binding: DashboardBinding(),
  );

  static GetPage get _driverManagement => GetPage(
    name: RouteNames.driverManagement.path,
    page: DriverManagementPage.new,
    binding: DriverManagementBinding(),
    children: [_driverLicenseDocument],
  );

  static GetPage get _driverLicenseDocument => GetPage(
    name: RouteNames.driverLicenseDocument.path,
    page: DriverLicenseDocumentPage.new,
    binding: DriverLicenseDocumentBinding(),
  );
}
