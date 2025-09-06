import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../../../infrastructures/routes/route_names/route_names.dart';
import '../repositories/splash_screen_page_repository.dart';

class SplashScreenPageController extends GetxController {
  @override
  void onInit() {
    WidgetsBinding.instance.addPostFrameCallback(
      (final _) => _checkConnection(),
    );
    super.onInit();
  }

  final RxBool hasConnectionError = false.obs;
  final RxBool showRetryButton = false.obs;
  final _repository = SplashScreenPageRepository();
  RxBool isLoading = false.obs;

  Future<bool> _checkConnection() async {
    await Future<void>.delayed(3000.milliseconds);
    Get.offAllNamed(RouteNames.login.uri);
    return true;
  }
}
