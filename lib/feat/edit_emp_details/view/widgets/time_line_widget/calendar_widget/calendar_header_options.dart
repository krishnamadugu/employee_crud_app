import 'package:employee_info/core/constants/app_constants/text_values.dart';
import 'package:employee_info/feat/edit_emp_details/view_model/edit_calendar_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bottom_action_widgets.dart';

class CalenderHeaderOptionsWidget extends StatelessWidget {
  const CalenderHeaderOptionsWidget({
    super.key,
    required this.txtTheme,
    required this.isFromDate,
  });

  final TextTheme txtTheme;
  final bool isFromDate;

  @override
  Widget build(BuildContext context) {
    final calendarCubit = context.read<EditCalendarCubit>();

    return BlocBuilder<EditCalendarCubit, DateTime>(
      bloc: calendarCubit,
      builder: (BuildContext context, state) {
        return Column(
          spacing: 10.0,
          children: [
            isFromDate
                ? Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    spacing: 18.0,
                    children: [
                      Expanded(
                        child: ActionButtonWidget(
                          txtTheme: txtTheme,
                          isBtnActive: calendarCubit.selectedHeaderTypeVal ==
                              AppTexts.kTodayValue,
                          btnText: AppTexts.kTodayValue,
                          onTapPressed: () {
                            /// on header option selected
                            calendarCubit.onCalendarDateSelected(
                              selectedHeaderType: AppTexts.kTodayValue,
                              isFromDate: isFromDate,
                              selectedDate: DateTime.now(),
                            );
                          },
                        ),
                      ),
                      Expanded(
                        child: ActionButtonWidget(
                          txtTheme: txtTheme,
                          isBtnActive: calendarCubit.selectedHeaderTypeVal ==
                              AppTexts.kNextMonday,
                          btnText: AppTexts.kNextMonday,
                          onTapPressed: () {
                            /// on header option selected
                            calendarCubit.onCalendarDateSelected(
                              selectedHeaderType: AppTexts.kNextMonday,
                              isFromDate: isFromDate,
                              selectedDate: DateTime.now(),
                            );
                          },
                        ),
                      ),
                    ],
                  )
                : Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    spacing: 18.0,
                    children: [
                      Expanded(
                        child: ActionButtonWidget(
                          txtTheme: txtTheme,
                          isBtnActive: calendarCubit.selectedHeaderTypeVal ==
                              AppTexts.kNoDate,
                          btnText: AppTexts.kNoDate,
                          onTapPressed: () {
                            /// on header option selected
                            calendarCubit.onCalendarDateSelected(
                              selectedHeaderType: AppTexts.kNoDate,
                              isFromDate: isFromDate,
                              selectedDate: DateTime.now(),
                            );
                          },
                        ),
                      ),
                      Expanded(
                        child: ActionButtonWidget(
                          txtTheme: txtTheme,
                          isBtnActive: calendarCubit.selectedHeaderTypeVal ==
                              AppTexts.kTodayValue,
                          btnText: AppTexts.kTodayValue,
                          onTapPressed: () {
                            /// on header option selected
                            calendarCubit.onCalendarDateSelected(
                              selectedHeaderType: AppTexts.kTodayValue,
                              isFromDate: isFromDate,
                              selectedDate: DateTime.now(),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
            isFromDate
                ?

                /// tuesday & one week  headers
                Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    spacing: 18.0,
                    children: [
                      Expanded(
                        child: ActionButtonWidget(
                          txtTheme: txtTheme,
                          isBtnActive: calendarCubit.selectedHeaderTypeVal ==
                              AppTexts.kNextTuesday,
                          btnText: AppTexts.kNextTuesday,
                          onTapPressed: () {
                            /// on header option selected
                            calendarCubit.onCalendarDateSelected(
                              selectedHeaderType: AppTexts.kNextTuesday,
                              isFromDate: isFromDate,
                              selectedDate: DateTime.now(),
                            );
                          },
                        ),
                      ),
                      Expanded(
                        child: ActionButtonWidget(
                          txtTheme: txtTheme,
                          isBtnActive: calendarCubit.selectedHeaderTypeVal ==
                              AppTexts.kAfterWeek,
                          btnText: AppTexts.kAfterWeek,
                          onTapPressed: () {
                            /// on header option selected
                            calendarCubit.onCalendarDateSelected(
                              selectedHeaderType: AppTexts.kAfterWeek,
                              isFromDate: isFromDate,
                              selectedDate: DateTime.now(),
                            );
                          },
                        ),
                      ),
                    ],
                  )
                : const SizedBox.shrink(),
          ],
        );
      },
    );
  }
}
