import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'infrastructures/routes/route_names/route_names.dart';
import 'infrastructures/routes/route_pages/route_pages.dart';
import 'infrastructures/theme/app_theme.dart';
import 'infrastructures/theme/theme_controller.dart';

class AdminApp extends StatelessWidget {
  AdminApp({super.key});

  final ThemeController themeController = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) => GetMaterialApp(
    initialRoute: RouteNames.splashScreen.uri,
    theme: AppTheme.lightTheme,
    getPages: RoutePages.routes,
    locale: const Locale('fa', 'IR'),
    debugShowCheckedModeBanner: false,
    themeMode: themeController.themeMode.value,
  );
}
