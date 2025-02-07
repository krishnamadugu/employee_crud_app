import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/constants/app_constants/asset_paths.dart';
import '../../../../../core/constants/app_constants/text_values.dart';
import '../../../../../core/constants/theme_constants/ui_constants/colors.dart';
import 'calendar_widget/calendar_dialog.dart';

class TimeLineFieldWidget extends StatelessWidget {
  const TimeLineFieldWidget({
    super.key,
    required GlobalKey<FormState> fromFieldKey,
    required FocusNode fromFocusNode,
    required this.txtTheme,
    required TextEditingController fromDate,
  })  : _fromFieldKey = fromFieldKey,
        _fromFocusNode = fromFocusNode,
        _fromDate = fromDate;

  final GlobalKey<FormState> _fromFieldKey;
  final FocusNode _fromFocusNode;
  final TextTheme txtTheme;
  final TextEditingController _fromDate;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: _fromFieldKey,
      focusNode: _fromFocusNode,
      readOnly: true,
      style: txtTheme.bodyMedium?.copyWith(
        fontWeight: FontWeight.w400,
      ),
      onTap: () async {
        await showTimeLineCalendarDialog(
          context: context,
          selectedDate: '',
        );
      },
      controller: _fromDate,
      cursorHeight: 12.0,
      cursorColor: AppColors.greyColor,
      decoration: InputDecoration(
        hintText: AppTexts.kFromDate,
        hintStyle: txtTheme.bodyMedium?.copyWith(
          color: AppColors.hintTxtColor,
          fontWeight: FontWeight.w400,
          fontSize: 14.0,
        ),
        prefixIcon: Transform.scale(
          scale: 0.4,
          child: SvgPicture.asset(
            AppAssetPaths.kCalendarIconSvg,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
