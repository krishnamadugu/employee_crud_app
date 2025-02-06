import 'package:flutter/material.dart';

import '../../../core/constants/theme_constants/global_constants/global_theme_constant.dart';
import '../../../core/constants/theme_constants/ui_constants/colors.dart';
import '../ui_theme/app_bar_theme.dart';
import '../ui_theme/input_decoration_theme.dart';
import '../ui_theme/text_theme.dart';

class DarkTheme {
  static final ThemeData kThemeConfig = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.blackColor,
    textTheme: AppTextTheme.defaultTextTheme.apply(
      displayColor: AppColors.whiteColor,
      bodyColor: AppColors.whiteColor,
      fontFamily: GlobalThemeConstant.fontFamilyVal,
    ),
    inputDecorationTheme: AppInputDecorationTheme.kInputDecorationTheme,
    cardTheme: CardTheme(
      elevation: 1.5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      color: AppColors.blackColor.withValues(alpha: 0.9),
    ),
    appBarTheme: AppsAppBarTheme.kDefaultAppBarTheme.copyWith(
      foregroundColor: AppColors.blackColor,
      backgroundColor: AppColors.blackColor,
    ),
  );
}
