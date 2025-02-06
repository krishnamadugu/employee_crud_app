import 'package:employee_info/core/constants/theme_constants/ui_constants/colors.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/app_constants/text_values.dart';
import '../../../../core/utils/common_widgets/app_bar_widget.dart';

class AddEmpDetailsScreen extends StatelessWidget {
  AddEmpDetailsScreen({super.key});

  /// properties
  final TextEditingController _empName = TextEditingController();
  final GlobalKey _formKey = GlobalKey();
  final _empTextFieldKey = GlobalKey<FormState>();
  final FocusNode _empFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    /// adaptive ui properties
    final screenSize = MediaQuery.of(context).size;
    final TextTheme txtTheme = Theme.of(context).textTheme;
    final BoxConstraints appBarDefConstraints = BoxConstraints(
      maxWidth: screenSize.width * 0.6,
    );

    return Scaffold(
      /// app bar widget
      appBar: commonAppBarWidget(
        appBarDefConstraints: appBarDefConstraints,
        txtTheme: txtTheme,
        appBarTitle: AppTexts.kAddEmployeeDetails,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.symmetric(
            horizontal: 12.0,
            vertical: 20.0,
          ),
          children: [
            /// emp name text form field
            SizedBox(
              height: screenSize.height * 0.2,
              child: TextFormField(
                key: _empTextFieldKey,
                focusNode: _empFocusNode,
                style: txtTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w400,
                ),
                controller: _empName,
                cursorHeight: 12.0,
                cursorColor: AppColors.greyColor,
                decoration: InputDecoration(
                  hintText: AppTexts.kEmployeeName,
                  hintStyle: txtTheme.bodyMedium?.copyWith(
                    color: AppColors.hintTxtColor,
                    fontWeight: FontWeight.w400,
                    fontSize: 14.0,
                  ),
                  prefixIcon: Icon(
                    Icons.person_3_outlined,
                    color: AppColors.appThemeColor,
                    size: 16.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
