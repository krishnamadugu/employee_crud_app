import 'dart:math' as math;

import 'package:employee_info/core/constants/app_constants/text_values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../../../core/constants/theme_constants/ui_constants/colors.dart';
import '../../../../../../core/utils/common_widgets/text_widget.dart';
import '../../../../view_model/calendar_cubit.dart';

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
    final calendarCubit = context.read<CalendarCubit>();

    return BlocBuilder<CalendarCubit, DateTime>(
      bloc: calendarCubit,
      builder: (context, state) {
        return Column(
          spacing: 10.0,
          children: [
            CalendarHeader(
              focusedDay: calendarCubit.currentMonth,
              clearButtonVisible: false,
              onTodayButtonTap: () {},
              onClearButtonTap: () {},
              onLeftArrowTap: () {
                calendarCubit.pageController.previousPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeOut,
                );
              },
              onRightArrowTap: () {
                calendarCubit.pageController.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeOut,
                );
              },
            ),
            TableCalendar(
              firstDay: calendarCubit.firstDay,
              lastDay: calendarCubit.lastDay,
              focusedDay: calendarCubit.focusedDay,
              currentDay: DateTime.now(),
              headerVisible: false,
              selectedDayPredicate: (day) {
                return calendarCubit.selectedHeaderTypeVal == AppTexts.kNoDate
                    ? false
                    : isSameDay(calendarCubit.focusedDay, day);
              },
              onCalendarCreated: (controller) =>
                  calendarCubit.pageController = controller,
              onPageChanged: (focusedDay) {
                calendarCubit.updateCurrentMonth(focusedDay);
              },
              onDaySelected: (selectedDay, focusedDay) {
                calendarCubit.onCalendarDateSelected(
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
