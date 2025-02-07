import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/constants/app_constants/asset_paths.dart';
import '../../../../../core/constants/theme_constants/ui_constants/colors.dart';
import '../../../../../core/utils/common_widgets/text_widget.dart';

class DesignationsDropDownWidget extends StatelessWidget {
  const DesignationsDropDownWidget({
    super.key,
    required this.selectedRole,
    required this.txtTheme,
  });

  final String? selectedRole;
  final TextTheme txtTheme;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2<String>(
        isExpanded: true,
        hint: Row(
          spacing: 14.0,
          children: [
            SvgPicture.asset(
              AppAssetPaths.kRoleIconSvg,
              fit: BoxFit.contain,
              height: 18.0,
              width: 18.0,
            ),
            TextWidget(
              txtVal: (selectedRole ?? "").isNotEmpty
                  ? selectedRole ?? ""
                  : 'Select Role',
              textStyle: txtTheme.bodyMedium?.copyWith(
                fontSize: 14,
                color: AppColors.hintTxtColor,
              ),
            ),
          ],
        ),
        items: null,
        value: selectedRole,
        iconStyleData: IconStyleData(
          iconDisabledColor: AppColors.appThemeColor,
          iconEnabledColor: AppColors.appThemeColor,
        ),
        buttonStyleData: ButtonStyleData(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12.0),
          height: 50,
          width: 140,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(
              color: AppColors.borderColor,
            ),
          ),
        ),
        menuItemStyleData: const MenuItemStyleData(
          height: 40,
        ),
      ),
    );
  }
}
