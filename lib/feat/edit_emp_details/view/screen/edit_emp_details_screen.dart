import 'package:employee_info/core/constants/app_constants/asset_paths.dart';
import 'package:employee_info/feat/edit_emp_details/view_model/edit_calendar_cubit.dart';
import 'package:employee_info/feat/edit_emp_details/view_model/edit_emp_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_constants/text_values.dart';
import '../../../../core/utils/common_widgets/app_bar_widget.dart';
import '../../../home/model/emp_model/employee_model.dart';
import '../../../home/view_model/emp_record_view_model/emp_record_bloc.dart';
import '../widgets/bottom_action_widget/bottom_action_widget.dart';
import '../widgets/designation_widget/designation_bottom_sheet.dart';
import '../widgets/designation_widget/designation_widget.dart';
import '../widgets/emp_text_field_widget/emp_name_field_widget.dart';
import '../widgets/time_line_widget/time_line_widget.dart';

class EditEmpDetailsScreen extends StatelessWidget {
  const EditEmpDetailsScreen({super.key, required this.empId});

  final String empId;

  @override
  Widget build(BuildContext context) {
    /// adaptive ui properties
    final screenSize = MediaQuery.of(context).size;
    final TextTheme txtTheme = Theme.of(context).textTheme;
    final BoxConstraints appBarDefConstraints = BoxConstraints(
      maxWidth: screenSize.width * 0.6,
    );

    final editEmpCubit = context.read<EditEmpCubit>();
    final editCalendarCubit = context.read<EditCalendarCubit>();
    final empRecordBloc = context.read<EmployeeRecordBloc>();

    // Trigger event dispatch after the first frame is rendered
    Future.microtask(() {
      editEmpCubit.empId = empId;
      editEmpCubit.getEmployeeDetails(empId);
      editCalendarCubit.getCalendarValues(empId);
    });

    return BlocBuilder<EditEmpCubit, EmployeeModel>(
      bloc: editEmpCubit,
      builder: (context, state) {
        return Scaffold(
          /// app bar widget
          appBar: commonAppBarWidget(
            appBarDefConstraints: appBarDefConstraints,
            txtTheme: txtTheme,
            appBarTitle: AppTexts.kEditEmployeeDetails,
            actionWidgets: [
              Padding(
                padding: EdgeInsets.only(right: 25.0),
                child: GestureDetector(
                  onTap: () {
                    empRecordBloc.add(OnRecordDeleteEvent(id: empId));
                    context.pop(true);
                  },
                  child: SvgPicture.asset(
                    AppAssetPaths.kTrashIconSvg,
                    height: 18.0,
                    width: 18.0,
                  ),
                ),
              )
            ],
          ),
          body: Form(
            key: editEmpCubit.formKey,
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
                    empTextFieldKey: editEmpCubit.empTextFieldKey,
                    empFocusNode: editEmpCubit.empFocusNode,
                    txtTheme: txtTheme,
                    empName: editEmpCubit.empName,
                  ),
                ),

                /// emp designation dropdown widget
                GestureDetector(
                  onTap: () {
                    showDesignationBottomSheet(
                      context: context,
                      designations: editEmpCubit.designationList,
                    );
                  },
                  child: DesignationsDropDownWidget(
                    selectedRole: editEmpCubit.selectedDesignationVal,
                    txtTheme: txtTheme,
                  ),
                ),

                const SizedBox(height: 16.0),

                /// emp time period
                SizedBox(
                  height: screenSize.height * 0.07,
                  child: BlocBuilder<EditCalendarCubit, DateTime>(
                    bloc: editCalendarCubit,
                    builder: (context, stated) {
                      return TimeLineWidget(
                        screenSize: screenSize,
                        fromFieldKey: editCalendarCubit.fromFieldKey,
                        fromFocusNode: editCalendarCubit.fromFocusNode,
                        txtTheme: txtTheme,
                        fromDate: editCalendarCubit.fromDate,
                        toTextFieldKey: editCalendarCubit.toTextFieldKey,
                        toFocusNode: editCalendarCubit.toFocusNode,
                        toDate: editCalendarCubit.toDate,
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
