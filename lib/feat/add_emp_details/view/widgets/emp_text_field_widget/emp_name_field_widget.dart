import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/constants/app_constants/asset_paths.dart';
import '../../../../../core/constants/app_constants/text_values.dart';
import '../../../../../core/constants/theme_constants/ui_constants/colors.dart';

class EmpNameTextFieldWidget extends StatelessWidget {
  const EmpNameTextFieldWidget({
    super.key,
    required GlobalKey<FormState> empTextFieldKey,
    required FocusNode empFocusNode,
    required this.txtTheme,
    required TextEditingController empName,
  })  : _empTextFieldKey = empTextFieldKey,
        _empFocusNode = empFocusNode,
        _empName = empName;

  final GlobalKey<FormState> _empTextFieldKey;
  final FocusNode _empFocusNode;
  final TextTheme txtTheme;
  final TextEditingController _empName;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: _empTextFieldKey,
      focusNode: _empFocusNode,
      style: txtTheme.bodyMedium?.copyWith(
        fontWeight: FontWeight.w400,
      ),
      controller: _empName,
      cursorHeight: 12.0,
      inputFormatters: <TextInputFormatter>[
        LengthLimitingTextInputFormatter(70),
        FilteringTextInputFormatter.allow(RegExp("[a-zA-Z ]")),
      ],
      cursorColor: AppColors.greyColor,
      decoration: InputDecoration(
        hintText: AppTexts.kEmployeeName,
        hintStyle: txtTheme.bodyMedium?.copyWith(
          color: AppColors.hintTxtColor,
          fontWeight: FontWeight.w400,
          fontSize: 14.0,
        ),
        prefixIcon: Transform.scale(
          scale: 0.38,
          child: SvgPicture.asset(
            AppAssetPaths.kPersonIconSvg,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
