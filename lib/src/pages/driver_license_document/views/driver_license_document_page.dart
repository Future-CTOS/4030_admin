import 'package:app_4030_admin/src/infrastructures/utils/spacing.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../gen/assets.gen.dart';
import '../../../components/iran_plate.dart';
import '../../shared/widgets/custom_button.dart';
import '../controller/driver_license_document_controller.dart';

class DriverLicenseDocumentPage
    extends GetView<DriverLicenseDocumentController> {
  const DriverLicenseDocumentPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bool canPop = Navigator.of(context).canPop();
    return Scaffold(
      appBar: _appBar(theme: theme, canPop: canPop),
      body: SafeArea(child: _content(theme, context)),
    );
  }

  Widget _content(ThemeData theme, BuildContext context) =>
      SingleChildScrollView(
        child: Padding(
          padding: AppSpacing.mediumPadding,
          child: Column(
            children: [
              Row(
                children: [
                  AppSpacing.mediumHorizontalSpacer,
                  Image.asset(
                    Assets.pngs.profile.path,
                    color: theme.colorScheme.onPrimary,
                  ),
                  Text('اطلاعات هویتی', style: theme.textTheme.bodyMedium),
                ],
              ),
              Container(
                margin: AppSpacing.largePadding,
                padding: AppSpacing.largePadding,
                decoration: BoxDecoration(
                  color: Color(0xffF2F4FF),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    _buildRowInformation(
                      key: 'نام:',
                      value: controller.documentViewModel?.personalInfo.name ?? 'null',
                      context: context,
                    ),
                    AppSpacing.xxLargeVerticalSpacer,
                    _buildRowInformation(
                      key: 'نام خانوادگی:',
                      value: 'محمدی',
                      context: context,
                    ),
                    AppSpacing.xxLargeVerticalSpacer,
                    _buildRowInformation(
                      key: 'نام پدر:',
                      value: 'محمد',
                      context: context,
                    ),
                    AppSpacing.xxLargeVerticalSpacer,
                    _buildRowInformation(
                      key: 'شماره شناسنامه:',
                      value: '0123456789',
                      context: context,
                    ),
                    AppSpacing.xxLargeVerticalSpacer,
                    _buildRowInformation(
                      key: 'تاریخ تولد:',
                      value: '1385/10/10',
                      context: context,
                    ),
                    AppSpacing.xxLargeVerticalSpacer,
                    _buildRowInformation(
                      key: 'کد ملی:',
                      value: '0123456789',
                      context: context,
                    ),
                    AppSpacing.xxLargeVerticalSpacer,
                    _buildRowInformation(
                      key: 'آدرس:',
                      value: 'تهران زعفرانیه کوچه 2',
                      context: context,
                    ),
                    AppSpacing.xxLargeVerticalSpacer,
                    _buildRowInformation(
                      key: 'شهر محل فعالیت:',
                      value: 'تهران',
                      context: context,
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Image.asset(
                    Assets.pngs.car.path,
                    color: theme.colorScheme.onPrimary,
                  ),
                  AppSpacing.smallHorizontalSpacer,
                  Text('اطلاعات خودرو', style: theme.textTheme.bodyMedium),
                  AppSpacing.mediumHorizontalSpacer,
                ],
              ),
              Container(
                margin: AppSpacing.largePadding,
                padding: AppSpacing.largePadding,
                decoration: BoxDecoration(
                  color: Color(0xffF2F4FF),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    _buildRowInformation(
                      key: 'سیستم و تیپ خودرو:',
                      value: 'دنا پلاس',
                      context: context,
                    ),
                    AppSpacing.xxLargeVerticalSpacer,
                    _buildRowInformation(
                      key: 'مدل(سال تولید خودرو):',
                      value: '1385',
                      context: context,
                    ),
                    AppSpacing.xxLargeVerticalSpacer,
                    _buildRowInformation(
                      key: 'رنگ خودرو:',
                      value: 'مشکی',
                      context: context,
                    ),
                    AppSpacing.xxLargeVerticalSpacer,
                    Row(
                      children: [
                        Text('پلاک:', style: theme.textTheme.bodySmall),
                        const Spacer(),
                        IranPlate(
                          cityCode: '68',
                          firstPart: '85',
                          letter: 'الف',
                          secondPart: '751',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Image.asset(
                    Assets.pngs.document.path,
                    color: theme.colorScheme.onPrimary,
                  ),
                  AppSpacing.smallHorizontalSpacer,
                  Text('مدارک ارسالی', style: theme.textTheme.bodyMedium),
                  AppSpacing.mediumHorizontalSpacer,
                ],
              ),
              Container(
                margin: AppSpacing.largePadding,
                padding: AppSpacing.largePadding,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: theme.colorScheme.onPrimary),
                ),
                child: Column(
                  children: [
                    Text('گواهی نامه:', style: theme.textTheme.bodyMedium),
                    AppSpacing.largeVerticalSpacer,
                    Image.asset(Assets.pngs.frontCard.path),
                    AppSpacing.largeVerticalSpacer,
                    Image.asset(Assets.pngs.backCard.path),
                  ],
                ),
              ),
              Container(
                margin: AppSpacing.largePadding,
                padding: AppSpacing.largePadding,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: theme.colorScheme.onPrimary),
                ),
                child: Column(
                  children: [
                    Text('اطلاعات بیمه:', style: theme.textTheme.bodyMedium),
                    AppSpacing.largeVerticalSpacer,
                    Image.asset(Assets.pngs.media.path),
                  ],
                ),
              ),
              Container(
                margin: AppSpacing.largePadding,
                padding: AppSpacing.largePadding,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: theme.colorScheme.onPrimary),
                ),
                child: Column(
                  children: [
                    Text(
                      'ویدیو احراز هویت:',
                      style: theme.textTheme.bodyMedium,
                    ),
                    AppSpacing.largeVerticalSpacer,
                    Image.asset(Assets.pngs.media.path),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomButton(
                    action: () {},
                    forAccept: true,
                    isDisable: controller.isLoading.value,
                  ),
                  CustomButton(
                    action: () {},
                    forAccept: false,
                    isDisable: controller.isLoading.value,
                  ),
                ],
              ),
            ],
          ),
        ),
      );

  Widget _buildRowInformation({
    required String key,
    required String value,
    required BuildContext context,
  }) {
    final theme = Theme.of(context);
    return Row(
      children: [
        Expanded(
          child: Text(
            key,
            style: theme.textTheme.bodyMedium?.copyWith(fontSize: 12),
          ),
        ),
        Text(value, style: theme.textTheme.labelSmall),
      ],
    );
  }

  AppBar _appBar({required ThemeData theme, required bool canPop}) => AppBar(
    iconTheme: IconThemeData(color: theme.colorScheme.onPrimary),
    actions: [
      Text('مجید فرخ پور', style: theme.textTheme.bodyMedium),
      Container(
        margin: const EdgeInsets.all(6),
        padding: const EdgeInsets.all(3),
        child: CircleAvatar(
          backgroundImage: AssetImage(Assets.pngs.userIcon.path),
          backgroundColor: theme.scaffoldBackgroundColor,
        ),
      ),
      AppSpacing.mediumHorizontalSpacer,
    ],
  );
}
