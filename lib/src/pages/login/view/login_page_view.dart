import 'package:app_4030_admin/src/components/text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../components/custom_scaffold.dart';
import '../../../components/phone_number_field.dart';
import '../../../infrastructures/utils/spacing.dart';
import '../../../infrastructures/utils/validators.dart';
import '../../../pages/shared/widgets/page_bottom_button.dart';
import '../controller/login_page_controller.dart';

class LoginPageView extends GetView<LoginPageController> {
  const LoginPageView({super.key});

  @override
  Widget build(BuildContext context) => CustomScaffold(
    bottomNavigationBar: Obx(
      () => PageBottomButton(
        label: 'ورود',
        onTap: () => controller.onSubmitPhoneNumberTap(context),
        isActive: controller.isReceiveCodeActive.value,
        isLoading: controller.isLoading.value,
        transparentBackground: true,
      ),
    ),
    body: Obx(() => _inputMobileNumber(context)),
  );

  Widget _inputMobileNumber(BuildContext context) => Form(
    key: controller.formKey,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'شماره همراه خود را وارد کنید',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        AppSpacing.mediumVerticalSpacer,
        PhoneNumberField(
          textController: controller.phoneNumberTextController,
          isHighlighted: controller.isReceiveCodeActive.value,
          validator: Validators.validateMobile,
          onChange: controller.onChangeTextField,
        ),
        AppSpacing.largeVerticalSpacer,
        CustomTextField(
          label: 'رمز ورود',
          hint: 'رمز ورود خود را وارد کنید',
          textController: controller.passwordTextController,
        ),
        AppSpacing.smallVerticalSpacer,
        Text(
          'رمز ورود باید بیش از 8 کارکتر باشد',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 12),
        ),
      ],
    ),
  );
}
