import 'package:get/get.dart';

class AppController {
  factory AppController() => _instance;

  AppController._();

  static final AppController _instance = AppController._();

  late final String fullBaseUrl;
  RxInt drawerSelectedId = 1.obs;
}
