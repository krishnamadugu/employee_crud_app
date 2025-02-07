import 'package:flutter/material.dart';

import '../../../../core/constants/app_constants/text_values.dart';
import '../../../../core/utils/common_widgets/app_bar_widget.dart';
import '../widgets/bottom_action_widget/bottom_action_widget.dart';
import '../widgets/designation_widget/designation_bottom_sheet.dart';
import '../widgets/designation_widget/designation_widget.dart';
import '../widgets/emp_text_field_widget/emp_name_field_widget.dart';
import '../widgets/time_line_widget/time_line_widget.dart';

class AddEmpDetailsScreen extends StatelessWidget {
  AddEmpDetailsScreen({super.key});

  /// properties
  final TextEditingController _empName = TextEditingController();
  final GlobalKey _formKey = GlobalKey();
  final _empTextFieldKey = GlobalKey<FormState>();
  final FocusNode _empFocusNode = FocusNode();

  final TextEditingController _fromDate = TextEditingController();
  final _fromFieldKey = GlobalKey<FormState>();
  final FocusNode _fromFocusNode = FocusNode();

  final TextEditingController _toDate = TextEditingController();
  final _toTextFieldKey = GlobalKey<FormState>();
  final FocusNode _toFocusNode = FocusNode();

  final List<String> designationList = [
    "Product Designer",
    "Flutter Developer",
    "QA Tester",
    "Product Owner",
    "Full-Stack Developer",
    "Senior Software Developer"
  ];
  final List<String> items = [
    'Item1',
    'Item2',
    'Item3',
    'Item4',
  ];
  String? selectedDesignationVal;

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
              height: screenSize.height * 0.07,
              child: EmpNameTextFieldWidget(
                empTextFieldKey: _empTextFieldKey,
                empFocusNode: _empFocusNode,
                txtTheme: txtTheme,
                empName: _empName,
              ),
            ),

            /// emp designation dropdown widget
            GestureDetector(
              onTap: () {
                showDesignationBottomSheet(
                    context: context, designations: [], selectedString: '');
              },
              child: DesignationsDropDownWidget(
                selectedRole: selectedDesignationVal,
                txtTheme: txtTheme,
              ),
            ),

            const SizedBox(height: 16.0),

            /// emp time period
            SizedBox(
              height: screenSize.height * 0.07,
              child: TimeLineWidget(
                screenSize: screenSize,
                fromFieldKey: _fromFieldKey,
                fromFocusNode: _fromFocusNode,
                txtTheme: txtTheme,
                fromDate: _fromDate,
                toTextFieldKey: _toTextFieldKey,
                toFocusNode: _toFocusNode,
                toDate: _toDate,
              ),
            ),

            // customCalendarWidget(txtTheme: txtTheme),
          ],
        ),
      ),

      bottomNavigationBar: Padding(
        padding: MediaQuery.of(context).viewInsets,

        /// cancel save actions widget
        child: BottomActionWidget(
          txtTheme: txtTheme,
        ),
      ),
    );
  }
}
