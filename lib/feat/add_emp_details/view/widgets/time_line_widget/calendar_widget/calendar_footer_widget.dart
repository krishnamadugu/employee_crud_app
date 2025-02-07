import 'package:flutter/material.dart';

import '../../../../../../core/constants/theme_constants/ui_constants/colors.dart';
import 'calendar_bottom_actions.dart';
import 'selected_date_display.dart';

class CalendarFooterWidget extends StatelessWidget {
  const CalendarFooterWidget({
    super.key,
    required this.txtTheme,
  });

  final TextTheme txtTheme;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 18.0),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 1.0,
            spreadRadius: 0.0,
            offset: Offset(0.0, 0.0),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SelectedDateDisplay(
            txtTheme: txtTheme,
            dateVal: "5 Sep , 2024",
          ),
          CalendarActionsWidget(
            txtTheme: txtTheme,
          ),
        ],
      ),
    );
  }
}
