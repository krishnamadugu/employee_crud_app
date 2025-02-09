import 'package:employee_info/core/constants/app_constants/asset_paths.dart';
import 'package:employee_info/core/constants/app_constants/text_values.dart';
import 'package:employee_info/core/utils/common_widgets/text_widget.dart';
import 'package:flutter/material.dart';

class NoRecordFoundWidget extends StatelessWidget {
  const NoRecordFoundWidget({
    super.key,
    required this.screenSize,
    required this.defaultConstraints,
    required this.txtTheme,
  });

  final Size screenSize;
  final BoxConstraints defaultConstraints;
  final TextTheme txtTheme;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: screenSize.height,
      width: screenSize.width,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            AppAssetPaths.kNoEmployeeRecordFound,
            fit: BoxFit.cover,
          ),
          TextWidget(
            txtVal: AppTexts.kNoEmployeeRecordFound,
            textStyle: txtTheme.labelLarge?.copyWith(
              fontSize: 18.0,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 10.0),
        ],
      ),
    );
  }
}
