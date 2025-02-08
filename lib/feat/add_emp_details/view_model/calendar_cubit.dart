import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../core/constants/app_constants/text_values.dart';

class CalendarCubit extends Cubit<DateTime> {
  /// from date properties
  final TextEditingController fromDate = TextEditingController();
  final fromFieldKey = GlobalKey<FormState>();
  final FocusNode fromFocusNode = FocusNode();

  /// to date properties
  final TextEditingController toDate = TextEditingController();
  final toTextFieldKey = GlobalKey<FormState>();
  final FocusNode toFocusNode = FocusNode();

  /// ui properties
  PageController pageController = PageController();
  String selectedHeaderTypeVal = "";

  /// current selection properties
  DateTime currentMonth = DateTime.now();
  DateTime joiningDate = DateTime.now();
  DateTime exitedDate = DateTime.now();
  String selectedDateValue = "";

  /// calendar ui properties
  DateTime firstDay = DateTime.utc(1800, 10, 16);
  DateTime lastDay = DateTime.utc(2030, 3, 14);
  DateTime focusedDay = DateTime.now();

  CalendarCubit() : super(DateTime.now());

  /// update currentMonth
  void updateCurrentMonth(DateTime currMonth) {
    currentMonth = currMonth;
    emit(currentMonth);
  }

  DateTime getNextDate(DateTime currentDate, int weekday) {
    int daysToAdd = (weekday - currentDate.weekday + 7) % 7;
    if (daysToAdd == 0) {
      daysToAdd = 7;
    }
    return currentDate.add(Duration(days: daysToAdd));
  }

  void setDefaultValues({required bool isFromDate}) {
    if (isFromDate) {
      focusedDay = DateTime.now();
      selectedDateValue = "";
      selectedHeaderTypeVal = AppTexts.kTodayValue;
      fromDate.text = "";
    } else {
      focusedDay = DateTime.now();
      selectedDateValue = "";
      selectedHeaderTypeVal = AppTexts.kNoDate;
      toDate.text = "";
    }
  }

  /// on calendar date selected
  void onCalendarDateSelected({
    required String selectedHeaderType,
    required DateTime selectedDate,
    required bool isFromDate,
  }) async {
    if (isFromDate) {
      /// date time selection on calendar header selected
      if (selectedHeaderType == AppTexts.kTodayValue) {
        focusedDay = DateTime.now();
      } else if (selectedHeaderType == AppTexts.kNextMonday) {
        focusedDay = getNextDate(DateTime.now(), DateTime.monday);
      } else if (selectedHeaderType == AppTexts.kNextTuesday) {
        focusedDay = getNextDate(DateTime.now(), DateTime.tuesday);
      } else if (selectedHeaderType == AppTexts.kAfterWeek) {
        focusedDay = DateTime.now().add(Duration(days: 7));
      } else {
        focusedDay = selectedDate;
      }

      selectedHeaderTypeVal = selectedHeaderType;
      joiningDate = focusedDay;

      /// for showing
      var formatter = DateFormat('d MMM, yyyy');
      selectedDateValue = formatter.format(joiningDate);
    } else {
      if (selectedHeaderType == AppTexts.kTodayValue) {
        focusedDay = DateTime.now();
      } else if (selectedHeaderType == AppTexts.kNoDate) {
        focusedDay = DateTime.now();
      } else {
        focusedDay = selectedDate;
      }

      selectedHeaderTypeVal = selectedHeaderType;
      exitedDate = focusedDay;

      /// for showing
      var formatter = DateFormat('d MMM, yyyy');
      selectedDateValue = formatter.format(exitedDate);
    }

    emit(focusedDay);
  }

  /// on save date pressed
  void onSaveBtnPressed({
    required bool isFromDate,
  }) {
    var formatter = DateFormat('d MMM, yyyy');
    if (isFromDate) {
      fromDate.text = formatter.format(joiningDate);
    } else {
      toDate.text = formatter.format(exitedDate);
    }

    emit(focusedDay);
  }
}
