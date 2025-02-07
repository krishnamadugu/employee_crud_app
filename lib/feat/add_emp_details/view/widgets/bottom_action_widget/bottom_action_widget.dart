import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/constants/app_constants/text_values.dart';
import '../../../../../core/constants/theme_constants/ui_constants/colors.dart';
import 'action_btn_widget.dart';

class BottomActionWidget extends StatelessWidget {
  const BottomActionWidget({
    super.key,
    required this.txtTheme,
  });

  final TextTheme txtTheme;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 18.0),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 2.0,
            spreadRadius: 0.0,
            offset: Offset(0.0, 0.0),
          ),
        ],
      ),
      child: Row(
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
    );
  }
}
