import 'dart:math' as math;

import 'package:employee_info/core/constants/app_constants/text_values.dart';
import 'package:employee_info/feat/edit_emp_details/view_model/edit_calendar_cubit.dart';
import 'package:employee_info/feat/edit_emp_details/view_model/edit_update_month_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../../../core/constants/theme_constants/ui_constants/colors.dart';
import '../../../../../../core/utils/common_widgets/text_widget.dart';

class CustomCalendarWidget extends StatelessWidget {
  const CustomCalendarWidget({
    super.key,
    required this.txtTheme,
    required this.isFromDate,
  });

  final TextTheme txtTheme;
  final bool isFromDate;

  @override
  Widget build(BuildContext context) {
    final editCalendarCubit = context.read<EditCalendarCubit>();
    final editUpdateMonthCubit = context.read<EditUpdateMonthCubit>();

    return BlocBuilder<EditCalendarCubit, DateTime>(
      bloc: editCalendarCubit,
      builder: (context, state) {
        return Column(
          spacing: 10.0,
          children: [
            BlocBuilder<EditUpdateMonthCubit, DateTime>(
              builder: (context, state) {
                return CalendarHeader(
                  focusedDay: editUpdateMonthCubit.currentMonth,
                  clearButtonVisible: false,
                  onTodayButtonTap: () {},
                  onClearButtonTap: () {},
                  onLeftArrowTap: () {
                    editCalendarCubit.pageController.previousPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeOut,
                    );
                  },
                  onRightArrowTap: () {
                    editCalendarCubit.pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeOut,
                    );
                  },
                );
              },
            ),
            TableCalendar(
              firstDay: editCalendarCubit.firstDay,
              lastDay: editCalendarCubit.lastDay,
              focusedDay: editCalendarCubit.focusedDay,
              currentDay: DateTime.now(),
              headerVisible: false,
              selectedDayPredicate: (day) {
                return editCalendarCubit.selectedHeaderTypeVal ==
                        AppTexts.kNoDate
                    ? false
                    : isSameDay(editCalendarCubit.focusedDay, day);
              },
              onCalendarCreated: (controller) =>
                  editCalendarCubit.pageController = controller,
              onPageChanged: (focusedDay) {
                editUpdateMonthCubit.updateCurrentMonth(focusedDay);
              },
              onDaySelected: (selectedDay, focusedDay) {
                editCalendarCubit.onCalendarDateSelected(
                  selectedHeaderType: "",
                  selectedDate: selectedDay,
                  isFromDate: isFromDate,
                );
              },
              calendarStyle: CalendarStyle(
                outsideDaysVisible: false,
                cellMargin: EdgeInsets.all(6.0),
                selectedDecoration: BoxDecoration(
                  color: AppColors.appThemeColor,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppColors.appThemeColor,
                  ),
                ),
                selectedTextStyle: txtTheme.bodyMedium!.copyWith(
                  color: AppColors.whiteColor,
                ),
                todayDecoration: BoxDecoration(
                  color: Colors.transparent,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppColors.appThemeColor,
                  ),
                ),
                todayTextStyle: txtTheme.bodyMedium!,
              ),
            ),
          ],
        );
      },
    );
  }
}

class CalendarHeader extends StatelessWidget {
  final DateTime focusedDay;
  final VoidCallback onLeftArrowTap;
  final VoidCallback onRightArrowTap;
  final VoidCallback onTodayButtonTap;
  final VoidCallback onClearButtonTap;
  final bool clearButtonVisible;

  const CalendarHeader({
    super.key,
    required this.focusedDay,
    required this.onLeftArrowTap,
    required this.onRightArrowTap,
    required this.onTodayButtonTap,
    required this.onClearButtonTap,
    required this.clearButtonVisible,
  });

  @override
  Widget build(BuildContext context) {
    var formatter = DateFormat('MMMM yyyy');
    final headerText = formatter.format(focusedDay);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          splashColor: AppColors.whiteColor,
          icon: Transform(
            alignment: Alignment.center,
            transform: Matrix4.rotationY(math.pi),
            child: Icon(
              Icons.play_arrow_rounded,
              color: AppColors.greyColor,
            ),
          ),
          onPressed: onLeftArrowTap,
        ),
        TextWidget(
          txtVal: headerText,
          textStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontSize: 18.0,
              ),
        ),
        IconButton(
          splashColor: AppColors.whiteColor,
          icon: Icon(
            Icons.play_arrow_rounded,
            color: AppColors.greyColor,
          ),
          onPressed: onRightArrowTap,
        ),
      ],
    );
  }
}
