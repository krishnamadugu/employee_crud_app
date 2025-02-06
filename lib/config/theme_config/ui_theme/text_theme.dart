import 'package:flutter/material.dart';

import '../../../core/constants/theme_constants/ui_constants/styles.dart';

class AppTextTheme {
  static final TextTheme defaultTextTheme = TextTheme(
    /// large display style
    displayLarge: AppStyles.defaultTxtStyle.copyWith(
      fontSize: 56.0,
      fontWeight: FontWeight.w700,
    ),

    /// medium display style
    displayMedium: AppStyles.defaultTxtStyle.copyWith(
      fontSize: 46.0,
      fontWeight: FontWeight.normal,
    ),

    /// small display style
    displaySmall: AppStyles.defaultTxtStyle.copyWith(
      fontSize: 36.0,
      fontWeight: FontWeight.w300,
    ),

    /// headline large style
    headlineLarge: AppStyles.defaultTxtStyle.copyWith(
      fontSize: 32.0,
      fontWeight: FontWeight.w700,
    ),

    /// headline medium style
    headlineMedium: AppStyles.defaultTxtStyle.copyWith(
      fontSize: 28.0,
      fontWeight: FontWeight.normal,
    ),

    /// headline small style
    headlineSmall: AppStyles.defaultTxtStyle.copyWith(
      fontSize: 24.0,
      fontWeight: FontWeight.w300,
    ),

    /// title large style
    titleLarge: AppStyles.defaultTxtStyle.copyWith(
      fontSize: 22.0,
      fontWeight: FontWeight.w700,
    ),

    /// title medium style
    titleMedium: AppStyles.defaultTxtStyle.copyWith(
      fontSize: 16.0,
      fontWeight: FontWeight.normal,
    ),

    /// title small style
    titleSmall: AppStyles.defaultTxtStyle.copyWith(
      fontSize: 14.0,
      fontWeight: FontWeight.w300,
    ),

    /// label large style
    labelLarge: AppStyles.defaultTxtStyle.copyWith(
      fontSize: 14.0,
      fontWeight: FontWeight.w700,
    ),

    /// label medium style
    labelMedium: AppStyles.defaultTxtStyle.copyWith(
      fontSize: 12.0,
      fontWeight: FontWeight.normal,
    ),

    /// label small style
    labelSmall: AppStyles.defaultTxtStyle.copyWith(
      fontSize: 10.0,
      fontWeight: FontWeight.w300,
    ),

    /// body large style
    bodyLarge: AppStyles.defaultTxtStyle.copyWith(
      fontSize: 16.0,
      fontWeight: FontWeight.w700,
    ),

    /// body medium style
    bodyMedium: AppStyles.defaultTxtStyle.copyWith(
      fontSize: 14.0,
      fontWeight: FontWeight.normal,
    ),

    /// body small style
    bodySmall: AppStyles.defaultTxtStyle.copyWith(
      fontSize: 10.0,
      fontWeight: FontWeight.w300,
    ),
  );
}
