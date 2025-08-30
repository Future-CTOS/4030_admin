import 'package:flutter/material.dart';
import 'colors.dart';
import 'typography.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    fontFamily: 'YekanBakh',
    brightness: Brightness.light,
    primaryColor: AppColors.primaryColor.shade600,
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
    ),
    colorScheme: ColorScheme.light(
      primary: AppColors.primaryColor.shade600,
      surfaceContainer: AppColors.primaryColor.shade100,
      secondary: AppColors.secondaryColor.shade300,
      onSecondary: AppColors.secondaryColor.shade500,
      onPrimary: AppColors.textColor,
      error: AppColors.errorColor,
      surface: Colors.white,
    ),
  );
}
