import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../gen/assets.gen.dart';
import '../../../components/drop_down.dart';
import '../../../infrastructures/commons/app_controller.dart';
import '../../../infrastructures/routes/route_names/route_names.dart';
import '../../../infrastructures/utils/spacing.dart';
import '../../driver_management/model/enums/user_status.dart';
import '../../driver_management/views/widgets/custom_driver_management_table.dart';
import '../controller/passenger_management_controller.dart';

class PassengerManagementPage extends GetView<PassengerManagementController> {
  const PassengerManagementPage({super.key});

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
          child: CircleAvatar(
            backgroundImage: AssetImage(Assets.pngs.userIcon.path),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('لیست در خواست ها', style: theme.textTheme.bodyLarge),
          AppSpacing.mediumVerticalSpacer,
          TextField(
            decoration: InputDecoration(
              hintText: "جستجو بر اساس نام، شماره موبایل یا کد ملی",
              hintStyle: theme.textTheme.bodySmall,
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
          _customTable(theme),
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
        isSelected: AppController.instance.drawerSelectedId.value == 1,
        onTap: () {
          AppController.instance.drawerSelectedId.value = 1;
          Get.back();
          Get.toNamed(RouteNames.dashboard.uri);
        },
      ),
      _item(
        isSelected: AppController.instance.drawerSelectedId.value == 2,
        onTap: () {
          AppController.instance.drawerSelectedId.value = 2;
          Get.back();
          Get.toNamed(RouteNames.driverManagement.uri);
        },
        icon: Icons.people_alt_rounded,
        label: 'مدیریت راننده',
        theme: theme,
      ),
      _item(
        isSelected: AppController.instance.drawerSelectedId.value == 3,
        onTap: () {
          AppController.instance.drawerSelectedId.value = 3;
          Get.back();
        },
        icon: Icons.people_alt_rounded,
        label: 'مدیریت مسافر',
        theme: theme,
      ),
      _item(
        isSelected: AppController.instance.drawerSelectedId.value == 4,
        icon: Icons.analytics_outlined,
        label: 'مدریت مالی',
        theme: theme,
        onTap: () {
          AppController.instance.drawerSelectedId.value = 4;
        },
      ),
      _item(
        isSelected: AppController.instance.drawerSelectedId.value == 5,
        icon: Icons.bookmark,
        label: 'مدیریت کد تخفیف',
        theme: theme,
        onTap: () {
          AppController.instance.drawerSelectedId.value == 4;
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

  Widget _customTable(ThemeData theme) => Container(
    margin: const EdgeInsets.all(12),
    padding: const EdgeInsets.all(8),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      border: Border.all(color: Colors.blue.shade200, width: 1),
      color: Colors.white,
    ),
    child: SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Table(
          border: const TableBorder(
            horizontalInside: BorderSide(color: Colors.black12, width: 0.5),
            verticalInside: BorderSide(color: Colors.black12, width: 0.5),
          ),
          defaultColumnWidth: const FixedColumnWidth(140),
          children: [
            TableRow(
              decoration: BoxDecoration(color: Color(0xfff5f5f5)),
              children: [
                _buildHeaderCell("تاریخ ثبت‌نام"),
                _buildHeaderCell("نام"),
                _buildHeaderCell("شماره موبایل"),
                _buildHeaderCell("کد ملی"),
                _buildHeaderCell("سفرها"),
                _buildHeaderCell("موقعیت"),
              ],
            ),
            ...controller.mockTableData.map((row) {
              return TableRow(
                children: [
                  _buildCell(row["date"] ?? ""),
                  _buildCell(row["name"] ?? ""),
                  _buildCell(row["phoneNumber"] ?? ""),
                  _buildCell(row["nationalCode"] ?? ""),
                  _buildCell(row["trips"] ?? ""),
                  Padding(
                    padding: const EdgeInsets.all(6),
                    child: InkWell(
                      onTap: controller.onDeletePassenger,
                      child: Text(
                        row["status"] ?? "",
                        textAlign: TextAlign.center,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: theme.colorScheme.error,
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }),
          ],
        ),
      ),
    ),
  );

  static Widget _buildHeaderCell(String text) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }

  static Widget _buildCell(String text) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Text(text, textAlign: TextAlign.center),
    );
  }
}
