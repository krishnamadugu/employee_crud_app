import 'package:employee_info/core/constants/theme_constants/ui_constants/colors.dart';
import 'package:flutter/material.dart';

import 'text_widget.dart';

AppBar commonAppBarWidget({
  required BoxConstraints appBarDefConstraints,
  required TextTheme txtTheme,
  required String appBarTitle,
  List<Widget>? actionWidgets,
}) {
  return AppBar(
    automaticallyImplyLeading: false,
    surfaceTintColor: Colors.transparent,
    elevation: 20.0,

    /// title widget
    title: ConstrainedBox(
      constraints: appBarDefConstraints,
      child: TextWidget(
        txtVal: appBarTitle,
        textStyle: txtTheme.titleMedium?.copyWith(
          wordSpacing: 1.2,
          fontWeight: FontWeight.w600,
          color: AppColors.whiteColor,
        ),
      ),
    ),

    actions: actionWidgets,
  );
}
