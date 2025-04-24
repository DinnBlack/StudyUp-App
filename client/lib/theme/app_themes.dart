import 'package:flutter/material.dart';
import '../core/constants/constants.dart';

class AppThemes {
  // Light Theme
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.lightThemeBackground,
    appBarTheme: AppBarTheme(
      color: AppColors.primary,
      titleTextStyle: TextStyle(color: AppColors.darkTextColor, fontWeight: FontWeight.bold),
    ),
    textTheme: TextTheme(
      bodyLarge: TextStyle(color: AppColors.lightTextColor),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.lightThemeBackground,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        borderSide: BorderSide(color: AppColors.primary),
      ),
    ),
    colorScheme: ColorScheme.light(
      primary: AppColors.primary,
      onPrimary: AppColors.darkTextColor,
      surface: AppColors.lightThemeBackground,
      onSurface: AppColors.lightTextColor,
    ),
  );

  // Dark Theme
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.dartThemeBackground,
    appBarTheme: AppBarTheme(
      color: AppColors.dartThemeBackground,
      titleTextStyle: TextStyle(color: AppColors.darkTextColor, fontWeight: FontWeight.bold),
    ),
    textTheme: TextTheme(
      bodyLarge: TextStyle(color: AppColors.darkTextColor),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.dartThemeBackground,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        borderSide: BorderSide(color: AppColors.primary),
      ),
    ),
    colorScheme: ColorScheme.dark(
      primary: AppColors.primary,
      onPrimary: AppColors.darkTextColor,
      surface: AppColors.dartThemeBackground,
      onSurface: AppColors.darkTextColor,
    ),
  );
}
