class AppController {
  AppController._();

  static final AppController instance = AppController._();

  late final String fullBaseUrl;
  String? userToken;
  String? phoneNumber;
}
