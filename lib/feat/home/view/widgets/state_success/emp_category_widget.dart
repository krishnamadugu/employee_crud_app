import 'package:flutter/material.dart';

import '../../../../../core/constants/theme_constants/ui_constants/colors.dart';
import '../../../../../core/utils/common_widgets/text_widget.dart';

class BuildHeaderWidget extends StatelessWidget {
  const BuildHeaderWidget({
    super.key,
    required this.screenSize,
    required this.defaultConstraints,
    required this.txtTheme,
    required this.headerTitle,
  });

  final Size screenSize;
  final BoxConstraints defaultConstraints;
  final TextTheme txtTheme;
  final String headerTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenSize.width,
      constraints: defaultConstraints.copyWith(
        maxHeight: screenSize.height * 0.1,
        maxWidth: screenSize.width * 0.8,
      ),
      padding: EdgeInsets.all(16.0),
      color: AppColors.paleWhiteColor,
      child: TextWidget(
        txtVal: headerTitle,
        textStyle: txtTheme.titleLarge?.copyWith(
          color: AppColors.appThemeColor,
          fontWeight: FontWeight.w500,
          fontSize: 16.0,
        ),
      ),
    );
  }
}
