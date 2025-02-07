import 'package:employee_info/core/constants/app_constants/text_values.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../bottom_action_widgets.dart';

class CalenderHeaderOptionsWidget extends StatelessWidget {
  const CalenderHeaderOptionsWidget({
    super.key,
    required this.txtTheme,
    required this.isTodayBtnActive,
    required this.isNextTuesdayActive,
    required this.isNextMondayActive,
    required this.isAfterOneWeekActive,
  });

  final TextTheme txtTheme;
  final bool isTodayBtnActive;
  final bool isNextMondayActive;
  final bool isNextTuesdayActive;
  final bool isAfterOneWeekActive;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10.0,
      children: [
        /// today & monday headers
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          spacing: 18.0,
          children: [
            Expanded(
              child: ActionButtonWidget(
                txtTheme: txtTheme,
                isBtnActive: isTodayBtnActive,
                btnText: AppTexts.kTodayValue,
                onTapPressed: () {
                  context.pop();
                },
              ),
            ),
            Expanded(
              child: ActionButtonWidget(
                txtTheme: txtTheme,
                isBtnActive: isNextMondayActive,
                btnText: AppTexts.kNextMonday,
                onTapPressed: () {
                  context.pop();
                },
              ),
            ),
          ],
        ),

        /// tuesday & one week  headers
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          spacing: 18.0,
          children: [
            Expanded(
              child: ActionButtonWidget(
                txtTheme: txtTheme,
                isBtnActive: isNextTuesdayActive,
                btnText: AppTexts.kNextTuesday,
                onTapPressed: () {
                  context.pop();
                },
              ),
            ),
            Expanded(
              child: ActionButtonWidget(
                txtTheme: txtTheme,
                isBtnActive: isAfterOneWeekActive,
                btnText: AppTexts.kAfterWeek,
                onTapPressed: () {
                  context.pop();
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
