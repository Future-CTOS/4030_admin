// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../../components/phone_number_filed.dart';
// import '../../../components/scaffold.dart';
// import '../../../infrastructures/utils/spacing.dart';
// import '../../../infrastructures/utils/validators.dart';
// import '../../../pages/shared/widgets/page_bottom_button.dart';
// import '../controller/auth_page_controller.dart';
//
// class PhoneInputPageView extends GetView<PhoneInputPageController> {
//   const PhoneInputPageView({super.key});
//
//   @override
//   Widget build(BuildContext context) => Scaffold(
//     bottomNavigationBar: Obx(
//       () => PageBottomButton(
//         label: 'دریافت کد',
//         onTap: () => controller.onSubmitPhoneNumberTap(context),
//         isActive: controller.isReceiveCodeActive.value,
//         isLoading: controller.isLoading.value,
//         transparentBackground: true,
//       ),
//     ),
//     body: _inputMobileNumber(context),
//   );
//
//   Widget _inputMobileNumber(BuildContext context) => Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//       Text(
//         'شماره موبایل خود را وارد کنید',
//         style: Theme.of(context).textTheme.bodyMedium,
//       ),
//       AppSpacing.largeVerticalSpacer,
//       AppSpacing.largeVerticalSpacer,
//       Text('شماره همراه', style: Theme.of(context).textTheme.bodySmall),
//       AppSpacing.mediumVerticalSpacer,
//       Obx(
//         () => Form(
//           key: controller.formKey,
//           child: PhoneNumberField(
//             textController: controller.phoneNumberTextController,
//             isHighlighted: controller.isReceiveCodeActive.value,
//             validator: Validators.validateMobile,
//             onChange: controller.onChangeTextField,
//           ),
//         ),
//       ),
//     ],
//   );
//
//   Widget _logo(BuildContext context) => Row(
//     children: [
//       Container(
//         width: 25,
//         height: 25,
//         decoration: BoxDecoration(color: Colors.grey, shape: BoxShape.circle),
//       ),
//       AppSpacing.mediumHorizontalSpacer,
//       Text('تاکسی 4030', style: Theme.of(context).textTheme.titleLarge),
//     ],
//   );
// }
