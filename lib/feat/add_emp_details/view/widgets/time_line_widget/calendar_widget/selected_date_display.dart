import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../core/constants/app_constants/asset_paths.dart';
import '../../../../../../core/utils/common_widgets/text_widget.dart';

class SelectedDateDisplay extends StatelessWidget {
  const SelectedDateDisplay({
    super.key,
    required this.txtTheme,
    required this.dateVal,
  });

  final TextTheme txtTheme;
  final String dateVal;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10.0,
      children: [
        SvgPicture.asset(
          AppAssetPaths.kCalendarIconSvg,
          height: 18,
          width: 18,
        ),
        TextWidget(
          txtVal: dateVal,
          textStyle: txtTheme.bodyMedium?.copyWith(
            fontSize: 16.0,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
