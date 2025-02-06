import 'package:flutter/material.dart';

import '../../../../../core/constants/theme_constants/ui_constants/colors.dart';
import '../../../../../core/utils/common_widgets/text_widget.dart';

class EmployeeCardWidget extends StatelessWidget {
  const EmployeeCardWidget({
    super.key,
    required this.txtTheme,
    required this.empName,
    required this.designation,
    required this.empTimePeriod,
  });

  final TextTheme txtTheme;
  final String empName;
  final String designation;
  final String empTimePeriod;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          spacing: 10.0,
          children: [
            TextWidget(
              txtVal: empName,
              textStyle: txtTheme.titleLarge?.copyWith(
                color: AppColors.appTxtColor,
                fontWeight: FontWeight.w500,
                fontSize: 16.0,
              ),
            ),
            TextWidget(
              txtVal: designation,
              textStyle: txtTheme.titleLarge?.copyWith(
                color: AppColors.hintTxtColor,
                fontWeight: FontWeight.w400,
                fontSize: 14.0,
              ),
            ),
            TextWidget(
              txtVal: empTimePeriod,
              textStyle: txtTheme.titleLarge?.copyWith(
                color: AppColors.hintTxtColor,
                fontWeight: FontWeight.w400,
                fontSize: 12.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
