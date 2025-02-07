import 'package:employee_info/core/constants/theme_constants/ui_constants/colors.dart';
import 'package:flutter/material.dart';

import 'time_line_field_widget.dart';

class TimeLineWidget extends StatelessWidget {
  const TimeLineWidget({
    super.key,
    required this.screenSize,
    required GlobalKey<FormState> fromFieldKey,
    required FocusNode fromFocusNode,
    required this.txtTheme,
    required TextEditingController fromDate,
    required GlobalKey<FormState> toTextFieldKey,
    required FocusNode toFocusNode,
    required TextEditingController toDate,
  })  : _fromFieldKey = fromFieldKey,
        _fromFocusNode = fromFocusNode,
        _fromDate = fromDate,
        _toTextFieldKey = toTextFieldKey,
        _toFocusNode = toFocusNode,
        _toDate = toDate;

  final Size screenSize;
  final GlobalKey<FormState> _fromFieldKey;
  final FocusNode _fromFocusNode;
  final TextTheme txtTheme;
  final TextEditingController _fromDate;
  final GlobalKey<FormState> _toTextFieldKey;
  final FocusNode _toFocusNode;
  final TextEditingController _toDate;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: 10.0,
      children: [
        /// emp name text form field
        Expanded(
          child: SizedBox(
            height: screenSize.height * 0.07,
            child: TimeLineFieldWidget(
              fromFieldKey: _fromFieldKey,
              fromFocusNode: _fromFocusNode,
              txtTheme: txtTheme,
              fromDate: _fromDate,
            ),
          ),
        ),

        /// arrow icon widget
        Padding(
          padding: EdgeInsets.only(bottom: 10.0),
          child: Icon(
            Icons.arrow_forward,
            color: AppColors.appThemeColor,
            size: 16.0,
          ),
        ),

        /// emp name text form field
        Expanded(
          child: SizedBox(
            height: screenSize.height * 0.07,
            child: TimeLineFieldWidget(
              fromFieldKey: _toTextFieldKey,
              fromFocusNode: _toFocusNode,
              txtTheme: txtTheme,
              fromDate: _toDate,
            ),
          ),
        ),
      ],
    );
  }
}
