import 'package:employee_info/feat/edit_emp_details/view_model/edit_calendar_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../core/constants/app_constants/text_values.dart';
import '../../bottom_action_widget/action_btn_widget.dart';

class CalendarActionsWidget extends StatelessWidget {
  const CalendarActionsWidget({
    super.key,
    required this.txtTheme,
    required this.isFromDate,
  });

  final TextTheme txtTheme;
  final bool isFromDate;

  @override
  Widget build(BuildContext context) {
    final calendarCubit = context.read<EditCalendarCubit>();

    return Row(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 12.0,
          children: [
            ActionButtonWidget(
              txtTheme: txtTheme,
              isBtnActive: false,
              btnText: AppTexts.kCancel,
              onTapPressed: () {
                /*      /// setting values to default
                calendarCubit.selectedDateValue = "";
                calendarCubit.selectedHeaderTypeVal = AppTexts.kNoDate;
                calendarCubit.focusedDay = DateTime.now();*/

                /// popping the screen
                context.pop();
              },
            ),
            ActionButtonWidget(
              txtTheme: txtTheme,
              isBtnActive: true,
              btnText: AppTexts.kSave,
              onTapPressed: () {
                calendarCubit.onSaveBtnPressed(
                  isFromDate: isFromDate,
                );
                context.pop();
              },
            ),
          ],
        ),
      ],
    );
  }
}
