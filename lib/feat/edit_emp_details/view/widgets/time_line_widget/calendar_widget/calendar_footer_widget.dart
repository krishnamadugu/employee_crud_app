import 'package:employee_info/feat/edit_emp_details/view_model/edit_calendar_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/constants/app_constants/text_values.dart';
import '../../../../../../core/constants/theme_constants/ui_constants/colors.dart';
import 'calendar_bottom_actions.dart';
import 'selected_date_display.dart';

class CalendarFooterWidget extends StatelessWidget {
  const CalendarFooterWidget({
    super.key,
    required this.txtTheme,
    required this.isFromDate,
  });

  final TextTheme txtTheme;
  final bool isFromDate;

  @override
  Widget build(BuildContext context) {
    final editCalendarCubit = context.read<EditCalendarCubit>();

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
          /// selected value display widget
          BlocBuilder<EditCalendarCubit, DateTime>(
            builder: (BuildContext context, state) {
              return SelectedDateDisplay(
                txtTheme: txtTheme,
                dateVal:
                    editCalendarCubit.selectedHeaderTypeVal == AppTexts.kNoDate
                        ? ""
                        : editCalendarCubit.selectedDateValue,
              );
            },
          ),

          /// cancel & save action buttons
          CalendarActionsWidget(
            txtTheme: txtTheme,
            isFromDate: isFromDate,
          ),
        ],
      ),
    );
  }
}
