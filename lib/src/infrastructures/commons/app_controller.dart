import 'package:get/get.dart';

class AppController {
  AppController._();

  static final AppController instance = AppController._();

  late final String fullBaseUrl;
  RxInt drawerSelectedId = 1.obs;

  String? phoneNumber;
  String? token;
}
