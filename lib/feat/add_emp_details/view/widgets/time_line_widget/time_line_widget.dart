import 'package:employee_info/core/constants/theme_constants/ui_constants/colors.dart';
import 'package:employee_info/feat/add_emp_details/view_model/calendar_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/constants/app_constants/text_values.dart';
import 'calendar_widget/calendar_dialog.dart';
import 'time_line_field_widget.dart';

class TimeLineWidget extends StatelessWidget {
  const TimeLineWidget({
    super.key,
    required this.screenSize,
    required GlobalKey<FormState> fromFieldKey,
    required FocusNode fromFocusNode,
    required this.txtTheme,
    required TextEditingController fromDate,
    required GlobalKey<FormState> toTextFieldKey,
    required FocusNode toFocusNode,
    required TextEditingController toDate,
  })  : _fromFieldKey = fromFieldKey,
        _fromFocusNode = fromFocusNode,
        _fromDate = fromDate,
        _toTextFieldKey = toTextFieldKey,
        _toFocusNode = toFocusNode,
        _toDate = toDate;

  final Size screenSize;
  final GlobalKey<FormState> _fromFieldKey;
  final FocusNode _fromFocusNode;
  final TextTheme txtTheme;
  final TextEditingController _fromDate;
  final GlobalKey<FormState> _toTextFieldKey;
  final FocusNode _toFocusNode;
  final TextEditingController _toDate;

  @override
  Widget build(BuildContext context) {
    final calendarCubit = context.read<CalendarCubit>();
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: 10.0,
      children: [
        /// emp name text form field
        Expanded(
          child: SizedBox(
            height: screenSize.height * 0.07,
            child: TimeLineFieldWidget(
              fieldKey: _fromFieldKey,
              focusNode: _fromFocusNode,
              txtTheme: txtTheme,
              hintText: AppTexts.kFromDate,
              date: _fromDate,
              onTapPressed: () async {
                calendarCubit.firstDay = DateTime.utc(1800, 10, 16);
                calendarCubit.focusedDay = calendarCubit.joiningDate;
                await showTimeLineCalendarDialog(
                  context: context,
                  isFromDate: true,
                );
              },
            ),
          ),
        ),

        /// arrow icon widget
        Padding(
          padding: EdgeInsets.only(bottom: 10.0),
          child: Icon(
            Icons.arrow_forward,
            color: AppColors.appThemeColor,
            size: 16.0,
          ),
        ),

        /// emp name text form field
        Expanded(
          child: SizedBox(
            height: screenSize.height * 0.07,
            child: TimeLineFieldWidget(
              fieldKey: _toTextFieldKey,
              focusNode: _toFocusNode,
              txtTheme: txtTheme,
              hintText: AppTexts.kToDate,
              date: _toDate,
              onTapPressed: () async {
                calendarCubit.firstDay = calendarCubit.joiningDate;
                // calendarCubit.focusedDay = calendarCubit.exitedDate;

                await showTimeLineCalendarDialog(
                  context: context,
                  isFromDate: false,
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
