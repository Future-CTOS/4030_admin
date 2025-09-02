import 'package:app_4030_admin/src/infrastructures/utils/spacing.dart';
import 'package:flutter/material.dart';

import '../../../../gen/assets.gen.dart';

class DriverLicenseDocumentPage extends StatelessWidget {
  const DriverLicenseDocumentPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: _appBar(theme),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsetsGeometry.symmetric(
              horizontal: AppSpacing.mediumSpace,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('اطلاعات هویتی', style: theme.textTheme.bodyMedium),
                    Image.asset(
                      Assets.pngs.profile.path,
                      color: theme.colorScheme.onPrimary,
                    ),
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
                        key: ':نام',
                        value: 'بهراد',
                        context: context,
                      ),
                      AppSpacing.xxLargeVerticalSpacer,
                      _buildRowInformation(
                        key: ':نام خانوادگی',
                        value: 'محمدی',
                        context: context,
                      ),
                      AppSpacing.xxLargeVerticalSpacer,
                      _buildRowInformation(
                        key: ':نام پدر',
                        value: 'محمد',
                        context: context,
                      ),
                      AppSpacing.xxLargeVerticalSpacer,
                      _buildRowInformation(
                        key: ':شماره شناسنامه',
                        value: '0123456789',
                        context: context,
                      ),
                      AppSpacing.xxLargeVerticalSpacer,
                      _buildRowInformation(
                        key: ':تاریخ تولد',
                        value: '1385/10/10',
                        context: context,
                      ),
                      AppSpacing.xxLargeVerticalSpacer,
                      _buildRowInformation(
                        key: ':کد ملی',
                        value: '0123456789',
                        context: context,
                      ),
                      AppSpacing.xxLargeVerticalSpacer,
                      _buildRowInformation(
                        key: ':آدرس',
                        value: 'تهران زعفرانیه کوچه 2',
                        context: context,
                      ),
                      AppSpacing.xxLargeVerticalSpacer,
                      _buildRowInformation(
                        key: ':شهر محل فعالیت',
                        value: 'تهران',
                        context: context,
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('اطلاعات خودرو', style: theme.textTheme.bodyMedium),
                    AppSpacing.smallHorizontalSpacer,
                    Image.asset(
                      Assets.pngs.car.path,
                      color: theme.colorScheme.onPrimary,
                    ),
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
                        key: ':سیستم و تیپ خودرو',
                        value: 'دنا پلاس',
                        context: context,
                      ),
                      AppSpacing.xxLargeVerticalSpacer,
                      _buildRowInformation(
                        key: ':مدل(سال تولید خودرو)',
                        value: '1385',
                        context: context,
                      ),
                      AppSpacing.xxLargeVerticalSpacer,
                      _buildRowInformation(
                        key: ':رنگ خودرو',
                        value: 'مشکی',
                        context: context,
                      ),
                      AppSpacing.xxLargeVerticalSpacer,
                      _buildRowInformation(
                        key: ':پلاک',
                        value: '22 الف 222 (63 ایران)',
                        context: context,
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('مدارک ارسالی', style: theme.textTheme.bodyMedium),
                    AppSpacing.smallHorizontalSpacer,
                    Image.asset(
                      Assets.pngs.document.path,
                      color: theme.colorScheme.onPrimary,
                    ),
                  ],
                ),
                Container(
                  margin: AppSpacing.largePadding,
                  padding: AppSpacing.largePadding,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: theme.colorScheme.onPrimary),
                  ),
                  child: Column(
                    children: [
                      Text(':گواهی نامه', style: theme.textTheme.bodyMedium),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRowInformation({
    required String key,
    required String value,
    required BuildContext context,
  }) {
    Size sizeScreen = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    return Row(
      children: [
        SizedBox(width: sizeScreen.width / 2),
        Expanded(
          child: Text(
            value,
            style: theme.textTheme.bodyMedium?.copyWith(fontSize: 12),
          ),
        ),
        Text(key, style: theme.textTheme.labelSmall),
      ],
    );
  }

  AppBar _appBar(ThemeData theme) => AppBar(
    title: Text('مجید فرخ پور', style: theme.textTheme.bodyMedium),
    leading: Container(
      margin: const EdgeInsets.all(6),
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: theme.colorScheme.onPrimary,
      ),
      child: CircleAvatar(
        backgroundImage: AssetImage(Assets.pngs.profile.path),
        backgroundColor: theme.scaffoldBackgroundColor,
      ),
    ),
  );
}
