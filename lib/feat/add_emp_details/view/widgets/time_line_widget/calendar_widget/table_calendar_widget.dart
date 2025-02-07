import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../../../core/constants/theme_constants/ui_constants/colors.dart';
import '../../../../../../core/utils/common_widgets/text_widget.dart';

class CustomCalendarWidget extends StatelessWidget {
  const CustomCalendarWidget({
    super.key,
    required this.txtTheme,
  });

  final TextTheme txtTheme;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10.0,
      children: [
        CalendarHeader(
          focusedDay: DateTime.now(),
          clearButtonVisible: false,
          onTodayButtonTap: () {
            // setState(() => _focusedDay.value = DateTime.now());
          },
          onClearButtonTap: () {
            // setState(() {
            //   _rangeStart = null;
            //   _rangeEnd = null;
            //   _selectedDays.clear();
            //   _selectedEvents.value = [];
            // });
          },
          onLeftArrowTap: () {
            // _pageController.previousPage(
            //   duration: const Duration(milliseconds: 300),
            //   curve: Curves.easeOut,
            // );
          },
          onRightArrowTap: () {
            // _pageController.nextPage(
            //   duration: const Duration(milliseconds: 300),
            //   curve: Curves.easeOut,
            // );
          },
        ),
        TableCalendar(
          firstDay: DateTime.utc(2010, 10, 16),
          lastDay: DateTime.utc(2030, 3, 14),
          focusedDay: DateTime.utc(2025, 2, 10),
          currentDay: DateTime.utc(2025, 2, 10),
          headerVisible: false,
          selectedDayPredicate: (day) {
            return isSameDay(DateTime.now(), day);
          },
          // onCalendarCreated: (controller) => _pageController = controller,
          // onPageChanged: (focusedDay) => _focusedDay.value = focusedDay,
          onDaySelected: (selectedDay, focusedDay) {
            // setState(() {
            //   _selectedDay = selectedDay;
            //   _focusedDay = focusedDay; // update `_focusedDay` here as well
            // });
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
    final headerText = DateFormat.yMMM().format(focusedDay);

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
