import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/constants/app_constants/asset_paths.dart';
import '../../../../../core/constants/theme_constants/ui_constants/colors.dart';

class TimeLineFieldWidget extends StatelessWidget {
  const TimeLineFieldWidget({
    super.key,
    required GlobalKey<FormState> fieldKey,
    required FocusNode focusNode,
    required this.txtTheme,
    required this.hintText,
    required this.onTapPressed,
    required TextEditingController date,
  })  : _fromFieldKey = fieldKey,
        _fromFocusNode = focusNode,
        _fromDate = date;

  final GlobalKey<FormState> _fromFieldKey;
  final FocusNode _fromFocusNode;
  final TextTheme txtTheme;
  final TextEditingController _fromDate;
  final String hintText;
  final void Function()? onTapPressed;

  @override
  Widget build(BuildContext context) {
    // final addEmpCubit = context.read<AddEmpCubit>();
    return TextFormField(
      key: _fromFieldKey,
      focusNode: _fromFocusNode,
      readOnly: true,
      style: txtTheme.bodyMedium?.copyWith(
        fontWeight: FontWeight.w400,
      ),
      onTap: onTapPressed,
      controller: _fromDate,
      cursorHeight: 12.0,
      cursorColor: AppColors.greyColor,
      decoration: InputDecoration(
        hintText: hintText,
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
