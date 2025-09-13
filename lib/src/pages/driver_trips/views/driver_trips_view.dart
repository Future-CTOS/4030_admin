import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../gen/assets.gen.dart';
import '../../../infrastructures/utils/spacing.dart';
import 'trip_card.dart';

class DriverTripsView extends StatelessWidget {
  const DriverTripsView({super.key});

  @override
  Widget build(final BuildContext context) {
    final theme = Theme.of(context);
    final bool canPop = Navigator.of(context).canPop();
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: _appBar(theme: theme, canPop: canPop),
      body: SafeArea(
        child: _content(theme: theme, context: context),
      ),
    );
  }

  Widget _content({required ThemeData theme, required BuildContext context}) =>
      Padding(
        padding: AppSpacing.largePadding,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  AppSpacing.mediumHorizontalSpacer,
                  Image.asset(
                    Assets.pngs.profile.path,
                    color: theme.colorScheme.onPrimary,
                  ),
                  Text('سفر ها', style: theme.textTheme.bodySmall),
                ],
              ),
              AppSpacing.mediumVerticalSpacer,
              TripCard(),
              TripCard(),
              TripCard(),
              TripCard(),
              TripCard(),
              TripCard(),
            ],
          ),
        ),
      );

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

  Widget _shimmerWidget() => Shimmer.fromColors(
    baseColor: Colors.grey.shade300,
    highlightColor: Colors.grey.shade100,
    child: SingleChildScrollView(
      padding: AppSpacing.largePadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(8, (index) {
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 8),
            height: 20,
            width: double.infinity,
            color: Colors.white,
          );
        }),
      ),
    ),
  );
}
