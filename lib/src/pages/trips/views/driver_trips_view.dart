import 'package:flutter/material.dart';

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
      body: SafeArea(child: _content(theme)),
    );
  }

  Widget _content(ThemeData theme) => Padding(
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
}
