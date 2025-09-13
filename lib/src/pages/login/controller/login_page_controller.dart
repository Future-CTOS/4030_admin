import 'package:app_4030_admin/src/infrastructures/commons/storage_handler.dart';
import 'package:app_4030_admin/src/infrastructures/utils/validators.dart';
import 'package:either_dart/either.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../infrastructures/commons/app_controller.dart';
import '../../../infrastructures/models/enums/status_enum.dart';
import '../../../infrastructures/routes/route_names/route_names.dart';
import '../../../infrastructures/utils/utils.dart';
import '../models/login_dto.dart';
import '../models/login_view_model.dart';
import '../repository/login_repository.dart';

class LoginPageController extends GetxController {
  final _repository = LoginRepository();
  final _storage = StorageHandler();
  final RxString countryCode = '+98'.obs;

  final TextEditingController phoneNumberTextController =
      TextEditingController();
  final TextEditingController passwordTextController = TextEditingController();

  RxBool isReceiveCodeActive = false.obs;
  RxBool isLoading = false.obs;

  int? otpCode;
  final formKey = GlobalKey<FormState>();

  void onChangeTextField(String? text) {
    if (!Utils.isMobileValid(text?.trim() ?? '')) {
      isReceiveCodeActive.value = false;
      return;
    }
    isReceiveCodeActive.value = true;
  }

  Future<void> onSubmitPhoneNumberTap(BuildContext context) async {
    if (formKey.currentState?.validate() ?? false) {
      await _login(context);
    }
  }

  Future<void> _login(BuildContext context) async {
    isLoading.value = true;
    final AdminLoginDto registerDto = AdminLoginDto(
      phone: phoneNumberTextController.text,
      password: passwordTextController.text,
    );
    final Either<String, LoginViewModel> resultOrException = await _repository
        .login(dto: registerDto);
    isLoading.value = false;
    resultOrException.fold(
      (final error) =>
          Utils.showSnackBar(context, text: error, status: StatusEnum.danger),
      (final response) {
        _storage.setPhoneNumber(phoneNumberTextController.text);
        _storage.setToken(response.accessToken);
        Get.toNamed(RouteNames.dashboard.uri);
      },
    );
  }

  void _checkFormStatus() {
    final phoneNumber =
        Validators.validateMobile(phoneNumberTextController.text) == null;
    final password = passwordTextController.text.isNotEmpty;

    isReceiveCodeActive.value = phoneNumber && password;
  }

  @override
  void onInit() {
    passwordTextController.addListener(_checkFormStatus);
    phoneNumberTextController.addListener(_checkFormStatus);
    super.onInit();
  }
}
