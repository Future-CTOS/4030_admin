import 'package:flutter/material.dart';
import 'colors.dart';
import 'typography.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    fontFamily: 'YekanBakh',
    brightness: Brightness.light,
    primaryColor: AppColors.primaryColor.shade300,
    scaffoldBackgroundColor: AppColors.backgroundColor,
    drawerTheme: DrawerThemeData(
      backgroundColor: AppColors.darkBackgroundColor,
    ),
    textTheme: TextTheme(
      titleLarge: AppTypography.headline,
      bodyLarge: AppTypography.bodyLarge,
      bodyMedium: AppTypography.body,
      bodySmall: AppTypography.caption,
      labelMedium: AppTypography.body.copyWith(color: AppColors.darkTextColor),
      labelSmall: AppTypography.body.copyWith(
        color: AppColors.secondaryColor.shade500,
        fontSize: 12,
      ),
    ),
    colorScheme: ColorScheme.light(
      primary: AppColors.primaryColor.shade300,
      surfaceContainer: AppColors.primaryColor.shade100,
      secondary: AppColors.primaryColor.shade200,
      onSecondary: AppColors.secondaryColor.shade500,
      onSurfaceVariant: AppColors.secondaryColor.shade400,
      onPrimary: AppColors.textColor,
      error: AppColors.errorColor,
      onSurface: AppColors.successColor,
      surface: Colors.white,
    ),
  );
}
