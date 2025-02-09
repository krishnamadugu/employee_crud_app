import 'package:employee_info/feat/edit_emp_details/view_model/edit_emp_cubit.dart';
import 'package:employee_info/feat/home/model/emp_model/employee_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/constants/theme_constants/ui_constants/colors.dart';
import 'calendar_footer_widget.dart';
import 'calendar_header_options.dart';
import 'table_calendar_widget.dart';

Future<void> showTimeLineCalendarDialog({
  required BuildContext context,
  required bool isFromDate,
}) async {
  final TextTheme txtTheme = Theme.of(context).textTheme;

  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return BlocBuilder<EditEmpCubit, EmployeeModel>(
        builder: (BuildContext context, state) {
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
                          isFromDate: isFromDate,
                        ),

                        /// calendar
                        CustomCalendarWidget(
                          txtTheme: txtTheme,
                          isFromDate: isFromDate,
                        ),
                      ],
                    ),
                  ),

                  /// footer
                  CalendarFooterWidget(
                    txtTheme: txtTheme,
                    isFromDate: isFromDate,
                  ),
                ],
              ),
            ),
          );
        },
      );
    },
  );
}
