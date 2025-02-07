import 'package:flutter/material.dart';

import '../../../../../../core/constants/theme_constants/ui_constants/colors.dart';
import 'calendar_footer_widget.dart';
import 'calendar_header_options.dart';
import 'table_calendar_widget.dart';

Future<void> showTimeLineCalendarDialog({
  required BuildContext context,
  required String selectedDate,
}) async {
  bool isTodayBtnActive = false;
  bool isNextMondayActive = false;
  bool isNextTuesdayActive = false;
  bool isAfterOneWeekActive = false;

  final TextTheme txtTheme = Theme.of(context).textTheme;

  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        backgroundColor: AppColors.whiteColor,
        insetPadding: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 24.0,
                  vertical: 24.0,
                ),
                child: Column(
                  spacing: 18.0,
                  children: [
                    /// header
                    CalenderHeaderOptionsWidget(
                      txtTheme: txtTheme,
                      isTodayBtnActive: isTodayBtnActive,
                      isNextTuesdayActive: isNextTuesdayActive,
                      isNextMondayActive: isNextMondayActive,
                      isAfterOneWeekActive: isAfterOneWeekActive,
                    ),

                    /// calendar
                    CustomCalendarWidget(
                      txtTheme: txtTheme,
                    ),
                  ],
                ),
              ),

              /// footer
              CalendarFooterWidget(
                txtTheme: txtTheme,
              ),
            ],
          ),
        ),
      );
    },
  );
}
