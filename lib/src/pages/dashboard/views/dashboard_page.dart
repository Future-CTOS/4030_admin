import 'package:app_4030_admin/src/pages/dashboard/controllers/dashboard_controller.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:get/get.dart';

import '../../../../gen/assets.gen.dart';
import '../../../components/custom_data_table.dart';
import '../../../infrastructures/utils/spacing.dart';

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
              DashboardLineChart(),
              AppSpacing.largeVerticalSpacer,
              DashboardPieChart(),
              AppSpacing.largeVerticalSpacer,
              RecentActivities(),
              AppSpacing.largeVerticalSpacer,
              Text('فعالیت های اخیر', style: theme.textTheme.bodyMedium),
              AppSpacing.smallVerticalSpacer,
              CustomDataTable(data: controller.mockData),
            ],
          ),
        ),
      ),
    );
  }
}

class DashboardHeader extends StatelessWidget {
  const DashboardHeader({super.key, required this.theme});

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    final items = [
      {'title': 'مشتریان فعال امروز', 'value': '90', 'icon': Icons.people},
      {'title': 'کاربران فعال امروز', 'value': '120', 'icon': Icons.person},
      {
        'title': 'سفارش‌های ثبت‌شده امروز',
        'value': '150',
        'icon': Icons.shopping_bag,
      },
      {
        'title': 'درآمد امروز',
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
            color: const Color(0xFFFFF9C4),
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 4,
                offset: Offset(0, 2),
              ),
            ],
          ),
          padding: const EdgeInsets.all(12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Text(
                        item['title'] as String,
                        style: theme.textTheme.bodyMedium,
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
              const SizedBox(width: 12),
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
      ),
      child: LineChart(
        LineChartData(
          titlesData: FlTitlesData(
            bottomTitles: AxisTitles(sideTitles: SideTitles(showTitles: true)),
            leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: true)),
          ),
          lineBarsData: [
            LineChartBarData(
              spots: [
                FlSpot(0, 1),
                FlSpot(1, 1.5),
                FlSpot(2, 1.8),
                FlSpot(3, 2),
              ],
              isCurved: true,
              color: Colors.amber,
              barWidth: 3,
            ),
            LineChartBarData(
              spots: [
                FlSpot(0, 0.5),
                FlSpot(1, 0.8),
                FlSpot(2, 1.2),
                FlSpot(3, 1.5),
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
    return Container(
      height: 220,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
      ),
      child: PieChart(
        PieChartData(
          sections: [
            PieChartSectionData(value: 40, color: Colors.amber, title: '40%'),
            PieChartSectionData(value: 30, color: Colors.orange, title: '30%'),
            PieChartSectionData(value: 20, color: Colors.red, title: '20%'),
            PieChartSectionData(value: 10, color: Colors.grey, title: '10%'),
          ],
          sectionsSpace: 2,
          centerSpaceRadius: 40,
        ),
      ),
    );
  }
}

class RecentActivities extends StatelessWidget {
  const RecentActivities({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
      {
        'status': 'موفق',
        'color': Colors.green,
        'title': 'پرداخت انجام شد',
        'date': '1402/05/15',
      },
      {
        'status': 'لغو',
        'color': Colors.red,
        'title': 'سفارش لغو شد',
        'date': '1402/05/14',
      },
      {
        'status': 'در انتظار',
        'color': Colors.amber,
        'title': 'در انتظار تایید',
        'date': '1402/05/13',
      },
    ];
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: items.map((e) {
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 4),
            decoration: BoxDecoration(
              border: Border(
                left: BorderSide(color: e['color'] as Color, width: 4),
              ),
            ),
            child: ListTile(
              title: Text(e['title'] as String),
              subtitle: Text(e['date'] as String),
              trailing: Text(
                e['status'] as String,
                style: TextStyle(color: e['color'] as Color),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

Widget _endDrawerWidget(BuildContext context) => Drawer(
  child: Column(
    children: [
      _header(Theme.of(context)),
      Expanded(child: _menuItems(Theme.of(context))),
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
    _item(icon: Icons.dashboard, label: 'داشبورد', theme: theme),
    _item(icon: Icons.people_alt_rounded, label: 'مدیریت راننده', theme: theme),
    _item(icon: Icons.people_alt_rounded, label: 'مدیریت مسافر', theme: theme),
    _item(icon: Icons.analytics_outlined, label: 'مدریت مالی', theme: theme),
    _item(icon: Icons.bookmark, label: 'مدیریت کد تخفیف', theme: theme),
  ],
);

Widget _item({
  required IconData icon,
  required String label,
  required ThemeData theme,
}) => Row(
  mainAxisAlignment: MainAxisAlignment.end,
  children: [
    Text(label, style: theme.textTheme.labelMedium),
    Icon(icon,color: theme.textTheme.labelMedium?.color,),
  ],
);

Widget _header(ThemeData theme) => Padding(
  padding: const EdgeInsets.only(top: AppSpacing.giantSpace),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.center,
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
