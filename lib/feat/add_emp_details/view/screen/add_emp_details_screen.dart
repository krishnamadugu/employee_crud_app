import 'package:employee_info/feat/add_emp_details/view_model/calendar_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/app_constants/text_values.dart';
import '../../../../core/utils/common_widgets/app_bar_widget.dart';
import '../../../home/model/emp_model/employee_model.dart';
import '../../view_model/add_emp_cubit.dart';
import '../widgets/bottom_action_widget/bottom_action_widget.dart';
import '../widgets/designation_widget/designation_bottom_sheet.dart';
import '../widgets/designation_widget/designation_widget.dart';
import '../widgets/emp_text_field_widget/emp_name_field_widget.dart';
import '../widgets/time_line_widget/time_line_widget.dart';

class AddEmpDetailsScreen extends StatelessWidget {
  const AddEmpDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    /// adaptive ui properties
    final screenSize = MediaQuery.of(context).size;
    final TextTheme txtTheme = Theme.of(context).textTheme;
    final BoxConstraints appBarDefConstraints = BoxConstraints(
      maxWidth: screenSize.width * 0.6,
    );

    final addEmpCubit = context.read<AddEmpCubit>();
    final calendarCubit = context.read<CalendarCubit>();

    return BlocBuilder<AddEmpCubit, EmployeeModel>(
      bloc: addEmpCubit,
      builder: (context, employee) {
        return Scaffold(
          /// app bar widget
          appBar: commonAppBarWidget(
            appBarDefConstraints: appBarDefConstraints,
            txtTheme: txtTheme,
            appBarTitle: AppTexts.kAddEmployeeDetails,
          ),
          body: Form(
            key: addEmpCubit.formKey,
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
                    empTextFieldKey: addEmpCubit.empTextFieldKey,
                    empFocusNode: addEmpCubit.empFocusNode,
                    txtTheme: txtTheme,
                    empName: addEmpCubit.empName,
                  ),
                ),

                /// emp designation dropdown widget
                GestureDetector(
                  onTap: () {
                    showDesignationBottomSheet(
                      context: context,
                      designations: addEmpCubit.designationList,
                    );
                  },
                  child: DesignationsDropDownWidget(
                    selectedRole: addEmpCubit.selectedDesignationVal,
                    txtTheme: txtTheme,
                  ),
                ),

                const SizedBox(height: 16.0),

                /// emp time period
                SizedBox(
                  height: screenSize.height * 0.07,
                  child: BlocBuilder<CalendarCubit, DateTime>(
                    bloc: calendarCubit,
                    builder: (context, stated) {
                      return TimeLineWidget(
                        screenSize: screenSize,
                        fromFieldKey: calendarCubit.fromFieldKey,
                        fromFocusNode: calendarCubit.fromFocusNode,
                        txtTheme: txtTheme,
                        fromDate: calendarCubit.fromDate,
                        toTextFieldKey: calendarCubit.toTextFieldKey,
                        toFocusNode: calendarCubit.toFocusNode,
                        toDate: calendarCubit.toDate,
                      );
                    },
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
      },
    );
  }
}
