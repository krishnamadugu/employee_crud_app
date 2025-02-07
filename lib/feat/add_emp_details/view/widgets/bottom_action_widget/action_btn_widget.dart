import 'package:flutter/material.dart';

import '../../../../../core/constants/theme_constants/ui_constants/colors.dart';
import '../../../../../core/utils/common_widgets/text_widget.dart';

class ActionButtonWidget extends StatelessWidget {
  const ActionButtonWidget({
    super.key,
    required this.txtTheme,
    required this.isBtnActive,
    required this.btnText,
    required this.onTapPressed,
  });

  final TextTheme txtTheme;
  final bool isBtnActive;
  final String btnText;
  final void Function()? onTapPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapPressed,
      child: Container(
        width: 74,
        height: 40,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isBtnActive
              ? AppColors.appThemeColor
              : AppColors.appThemeColor.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(6.0),
        ),
        child: TextWidget(
          txtVal: btnText,
          textStyle: txtTheme.bodyMedium?.copyWith(
            color: isBtnActive ? AppColors.whiteColor : AppColors.appThemeColor,
            fontSize: 14.0,
          ),
        ),
      ),
    );
  }
}
