import 'package:app_4030_admin/src/infrastructures/commons/app_controller.dart';
import 'package:app_4030_admin/src/infrastructures/routes/route_names/route_names.dart';
import 'package:app_4030_admin/src/pages/dashboard/controllers/dashboard_controller.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:get/get.dart';

import '../../../../gen/assets.gen.dart';
import '../../../components/custom_data_table.dart';
import '../../../infrastructures/utils/spacing.dart';
import 'widgets/weekly_chart.dart';

class DashboardPage extends GetView<DashboardController> {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
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
      body: SingleChildScrollView(
        padding: AppSpacing.largePadding,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              DashboardHeader(theme: theme),
              AppSpacing.largeVerticalSpacer,
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('سفر های لغو شده', style: theme.textTheme.bodySmall),
                      AppSpacing.mediumHorizontalSpacer,
                      Container(
                        height: 10,
                        width: 10,
                        decoration: BoxDecoration(
                          color: theme.colorScheme.error,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ],
                  ),
                  AppSpacing.largeHorizontalSpacer,
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('سفر ها', style: theme.textTheme.bodySmall),
                      AppSpacing.mediumHorizontalSpacer,
                      Container(
                        height: 10,
                        width: 10,
                        decoration: BoxDecoration(
                          color: theme.colorScheme.surfaceContainer,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              AppSpacing.largeVerticalSpacer,
              WeeklyChart(),
              AppSpacing.largeVerticalSpacer,
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('%40', style: theme.textTheme.bodySmall),
                  AppSpacing.smallHorizontalSpacer,
                  Text('سواری', style: theme.textTheme.bodySmall),
                  AppSpacing.smallHorizontalSpacer,
                  Container(
                    height: 10,
                    width: 10,
                    decoration: BoxDecoration(
                      color: theme.primaryColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('%20', style: theme.textTheme.bodySmall),
                  AppSpacing.smallHorizontalSpacer,
                  Text('موتور', style: theme.textTheme.bodySmall),
                  AppSpacing.smallHorizontalSpacer,
                  Container(
                    height: 10,
                    width: 10,
                    decoration: BoxDecoration(
                      color: theme.colorScheme.surfaceContainer,
                      shape: BoxShape.circle,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('%35', style: theme.textTheme.bodySmall),
                  AppSpacing.smallHorizontalSpacer,
                  Text('وانت', style: theme.textTheme.bodySmall),
                  AppSpacing.smallHorizontalSpacer,
                  Container(
                    height: 10,
                    width: 10,
                    decoration: BoxDecoration(
                      color: theme.colorScheme.secondary,
                      shape: BoxShape.circle,
                    ),
                  ),
                ],
              ),
              AppSpacing.largeVerticalSpacer,
              DashboardPieChart(),
              AppSpacing.largeVerticalSpacer,
              AppSpacing.largeVerticalSpacer,
              AppSpacing.largeVerticalSpacer,
              Text('فعالیت های اخیر', style: theme.textTheme.bodyMedium),
              AppSpacing.smallVerticalSpacer,
              // CustomDataTable(data: controller.mockData),
            ],
          ),
        ),
      ),
    );
  }

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
          Get.toNamed(RouteNames.passengerManagement.uri);
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

class DashboardHeader extends StatelessWidget {
  const DashboardHeader({super.key, required this.theme});

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    final items = [
      {'title': 'مسافران فعال امروز', 'value': '90', 'icon': Icons.people},
      {'title': 'رانندگان فعال امروز', 'value': '120', 'icon': Icons.person},
      {'title': 'درآمد امروز', 'value': '150', 'icon': Icons.shopping_bag},
      {
        'title': 'سفر های انجام شده امروز',
        'value': '5,000,000,000,000',
        'icon': Icons.monetization_on,
      },
    ];
    return GridView.builder(
      shrinkWrap: true,
      itemCount: items.length,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2.8,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      itemBuilder: (context, i) {
        final item = items[i];
        return Container(
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 4,
                offset: Offset(0, 2),
              ),
            ],
          ),
          padding: AppSpacing.mediumPadding,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Text(
                        item['title'] as String,
                        style: theme.textTheme.bodySmall,
                      ),
                    ),
                    Flexible(
                      child: Text(
                        item['value'] as String,
                        style: theme.textTheme.bodyMedium,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                item['icon'] as IconData,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ],
          ),
        );
      },
    );
  }
}

class DashboardLineChart extends StatelessWidget {
  const DashboardLineChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: LineChart(
        LineChartData(
          titlesData: FlTitlesData(
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, meta) {
                  switch (value.toInt()) {
                    case 0:
                      return const Text("شنبه");
                    case 1:
                      return const Text("یکشنبه");
                    case 2:
                      return const Text("دوشنبه");
                    case 3:
                      return const Text("سه‌شنبه");
                    case 4:
                      return const Text("چهارشنبه");
                    case 5:
                      return const Text("پنجشنبه");
                    case 6:
                      return const Text("جمعه");
                    default:
                      return const Text("");
                  }
                },
              ),
            ),
            leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: true)),
          ),
          lineBarsData: [
            LineChartBarData(
              spots: const [
                FlSpot(0, 1.5),
                FlSpot(1, 2.5),
                FlSpot(2, 2),
                FlSpot(3, 3),
                FlSpot(4, 2.2),
                FlSpot(5, 2.8),
                FlSpot(6, 3.5),
              ],
              isCurved: true,
              color: Colors.amber,
              barWidth: 3,
            ),
            LineChartBarData(
              spots: const [
                FlSpot(0, 0.8),
                FlSpot(1, 1.2),
                FlSpot(2, 1.7),
                FlSpot(3, 2.2),
                FlSpot(4, 1.9),
                FlSpot(5, 2.5),
                FlSpot(6, 2.7),
              ],
              isCurved: true,
              color: Colors.redAccent,
              barWidth: 3,
            ),
          ],
        ),
      ),
    );
  }
}

class DashboardPieChart extends StatelessWidget {
  const DashboardPieChart({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      height: 50,
      child: PieChart(
        PieChartData(
          sections: [
            PieChartSectionData(
              value: 40,
              color: theme.primaryColor,
              title: '',
            ),
            PieChartSectionData(
              value: 30,
              color: theme.colorScheme.surfaceContainer,
              title: '',
            ),
            PieChartSectionData(
              value: 20,
              color: theme.colorScheme.secondary,
              title: '',
            ),
          ],
          sectionsSpace: 0,
          centerSpaceRadius: 40,
        ),
      ),
    );
  }
}
