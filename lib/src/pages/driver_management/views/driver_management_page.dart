import 'package:app_4030_admin/src/components/custom_data_table.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../gen/assets.gen.dart';
import '../../../components/drop_down.dart';
import '../../../infrastructures/routes/route_names/route_names.dart';
import '../../../infrastructures/utils/spacing.dart';
import '../controller/driver_management_controller.dart';
import 'widgets/custom_driver_management_table.dart';

class DriverManagementPage extends GetView<DriverManagementController> {
  const DriverManagementPage({super.key});

  @override
  Widget build(final BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      endDrawer: _endDrawerWidget(context),
      appBar: AppBar(
        title: Text('مجید فرخ پور', style: theme.textTheme.bodyMedium),
        leading: Container(
          margin: const EdgeInsets.all(3),
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
      ),
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SafeArea(child: _content(theme)),
    );
  }

  Widget _content(ThemeData theme) => Padding(
    padding: AppSpacing.largePadding,
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          GridView.builder(
            shrinkWrap: true,
            itemCount: controller.reportsItems.length,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 2.8,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
            ),
            itemBuilder: (context, i) {
              final item = controller.reportsItems[i];
              return Container(
                decoration: BoxDecoration(
                  color: item['color'] as Color,
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: const EdgeInsets.all(12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    DecoratedBox(
                      decoration: BoxDecoration(
                        color: item['backgroundColor'] as Color,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: AppSpacing.mediumPadding,
                        child: Image.asset(
                          item['iconPath'] as String,
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                      ),
                    ),
                    Spacer(),
                    Expanded(
                      child: Text(
                        item['title'] as String,
                        style: theme.textTheme.bodyMedium,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          AppSpacing.mediumVerticalSpacer,
          Text('لیست در خواست ها', style: theme.textTheme.bodyLarge),
          AppSpacing.mediumVerticalSpacer,
          Column(
            children: [
              TextField(
                textAlign: TextAlign.end,
                decoration: InputDecoration(
                  hintText: "جستجو بر اساس نام، شماره موبایل یا کد ملی",
                  hintStyle: theme.textTheme.bodyMedium,
                  prefixIcon: Container(
                    margin: const EdgeInsets.all(6),
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.secondary,
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset(Assets.pngs.search.path),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(
                      color: theme.colorScheme.secondary,
                      width: 0.3,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(
                      color: theme.colorScheme.onSecondary,
                      width: 0.3,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(
                      color: theme.colorScheme.onSecondary,
                      width: 0.3,
                    ),
                  ),
                ),
              ),
              AppSpacing.mediumVerticalSpacer,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('اعمال فیلتر', style: theme.textTheme.bodySmall),
                  Flexible(
                    child: CustomDropDown(
                      items: [],
                      getTitle: (item) => item,
                      hint: 'همه وضعیت ها',
                      onSelectItem: (final value) {},
                      value: null,
                    ),
                  ),
                  DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(
                        color: theme.colorScheme.onSecondary,
                        width: 0.3,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsetsGeometry.symmetric(vertical: AppSpacing.tinySpace),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: const EdgeInsets.all(6),
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: theme.colorScheme.secondary,
                              shape: BoxShape.circle,
                            ),
                            child: Image.asset(Assets.pngs.filter.path),
                          ),
                          AppSpacing.mediumHorizontalSpacer,
                          Text('وسیله نقلیه', style: theme.textTheme.bodySmall),
                          SizedBox(width: 12),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          AppSpacing.mediumVerticalSpacer,
          CustomDriverManagementTable(data: controller.mockTableData)
        ],
      ),
    ),
  );

  Widget _endDrawerWidget(BuildContext context) => Drawer(
    child: Column(
      children: [
        _header(Theme.of(context)),
        AppSpacing.largeVerticalSpacer,
        Expanded(child: Obx(() => _menuItems(Theme.of(context)))),
        _logout(),
      ],
    ),
  );

  Widget _logout() => Padding(
    padding: const EdgeInsets.only(bottom: AppSpacing.largeSpace),
    child: Column(
      children: [
        const Divider(),
        AppSpacing.mediumVerticalSpacer,
        InkWell(
          onTap: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.logout_outlined, color: Colors.white),
              AppSpacing.mediumHorizontalSpacer,
              Text('خروج'),
            ],
          ),
        ),
      ],
    ),
  );

  Widget _menuItems(ThemeData theme) => Column(
    children: [
      _item(
        icon: Icons.dashboard,
        label: 'داشبورد',
        theme: theme,
        isSelected: controller.selectedId.value == 1,
        onTap: () {
          controller.selectedId.value = 1;
          Get.back();
          Get.toNamed(RouteNames.dashboard.uri);
        },
      ),
      _item(
        isSelected: controller.selectedId.value == 2,
        onTap: () {
          controller.selectedId.value = 2;
          Get.back();
        },
        icon: Icons.people_alt_rounded,
        label: 'مدیریت راننده',
        theme: theme,
      ),
      _item(
        isSelected: controller.selectedId.value == 3,
        onTap: () {
          controller.selectedId.value = 3;
        },
        icon: Icons.people_alt_rounded,
        label: 'مدیریت مسافر',
        theme: theme,
      ),
      _item(
        isSelected: controller.selectedId.value == 4,
        icon: Icons.analytics_outlined,
        label: 'مدریت مالی',
        theme: theme,
        onTap: () {
          controller.selectedId.value = 4;
        },
      ),
      _item(
        isSelected: controller.selectedId.value == 5,
        icon: Icons.bookmark,
        label: 'مدیریت کد تخفیف',
        theme: theme,
        onTap: () {
          controller.selectedId.value = 5;
        },
      ),
    ],
  );

  Widget _item({
    required IconData icon,
    required String label,
    required ThemeData theme,
    required void Function() onTap,
    required bool isSelected,
  }) => InkWell(
    onTap: onTap,
    child: Padding(
      padding: AppSpacing.largePadding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            label,
            style: theme.textTheme.labelMedium?.copyWith(
              color: isSelected ? theme.colorScheme.surfaceContainer : null,
            ),
          ),
          AppSpacing.mediumHorizontalSpacer,
          Icon(
            icon,
            color: isSelected
                ? theme.colorScheme.surfaceContainer
                : theme.textTheme.labelMedium?.color,
          ),
        ],
      ),
    ),
  );

  Widget _header(ThemeData theme) => Padding(
    padding: const EdgeInsets.only(
      top: AppSpacing.giantSpace,
      right: AppSpacing.giantSpace,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text('پنل مدیریت', style: theme.textTheme.labelMedium),
        AppSpacing.mediumHorizontalSpacer,
        CircleAvatar(
          backgroundImage: AssetImage(Assets.appLogo.path),
          backgroundColor: theme.scaffoldBackgroundColor,
        ),
      ],
    ),
  );
}
