import 'package:flutter/material.dart';

import '../../../core/constants/theme_constants/global_constants/global_theme_constant.dart';
import '../../../core/constants/theme_constants/ui_constants/colors.dart';
import 'border_theme.dart';

class AppInputDecorationTheme {
  static InputDecorationTheme kInputDecorationTheme = InputDecorationTheme(
    /// text style  of input decoration theme
    labelStyle: GlobalThemeConstant.appTextTheme.labelMedium,
    hintStyle: GlobalThemeConstant.appTextTheme.bodyMedium,
    errorStyle: GlobalThemeConstant.appTextTheme.bodyMedium,
    prefixStyle: GlobalThemeConstant.appTextTheme.bodyMedium,
    suffixStyle: GlobalThemeConstant.appTextTheme.bodyMedium,

    /// ui properties
    isDense: true,
    constraints: BoxConstraints(maxHeight: 60.0),
    contentPadding: EdgeInsets.all(8.0),

    /// border properties
    border: AppBorderTheme.kDefaultBorderTheme,
    disabledBorder: AppBorderTheme.kDefaultBorderTheme,
    enabledBorder: AppBorderTheme.kDefaultBorderTheme.copyWith(
      borderSide: BorderSide(color: AppColors.borderColor),
    ),
    focusedBorder: AppBorderTheme.kDefaultBorderTheme.copyWith(
      borderSide: BorderSide(color: AppColors.borderColor),
    ),
    focusedErrorBorder: AppBorderTheme.kDefaultBorderTheme.copyWith(
      borderSide: BorderSide(color: AppColors.errorBorderColor),
    ),
    errorBorder: AppBorderTheme.kDefaultBorderTheme.copyWith(
      borderSide: BorderSide(color: AppColors.errorBorderColor),
    ),
  );
}
