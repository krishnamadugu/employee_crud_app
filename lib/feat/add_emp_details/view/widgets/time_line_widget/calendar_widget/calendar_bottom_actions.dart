import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../core/constants/app_constants/text_values.dart';
import '../../bottom_action_widget/action_btn_widget.dart';

class CalendarActionsWidget extends StatelessWidget {
  const CalendarActionsWidget({
    super.key,
    required this.txtTheme,
  });

  final TextTheme txtTheme;

  @override
  Widget build(BuildContext context) {
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
                context.pop();
              },
            ),
            ActionButtonWidget(
              txtTheme: txtTheme,
              isBtnActive: true,
              btnText: AppTexts.kSave,
              onTapPressed: () {
                context.pop();
              },
            ),
          ],
        ),
      ],
    );
  }
}
