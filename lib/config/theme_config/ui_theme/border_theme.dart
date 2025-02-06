import 'package:employee_info/core/constants/theme_constants/ui_constants/colors.dart';
import 'package:flutter/material.dart';

class AppBorderTheme {
  static final OutlineInputBorder kDefaultBorderTheme = OutlineInputBorder(
    borderRadius: BorderRadius.circular(14.0),
    borderSide: BorderSide(color: AppColors.borderColor),
  );
}
