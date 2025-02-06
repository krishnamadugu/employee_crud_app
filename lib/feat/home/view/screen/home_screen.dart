import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../config/route_config/route_names.dart';
import '../../../../core/constants/app_constants/text_values.dart';
import '../../../../core/constants/theme_constants/ui_constants/colors.dart';
import '../../../../core/utils/common_widgets/app_bar_widget.dart';
import '../../../misc/error/view/screen/error_screen.dart';
import '../../view_model/emp_record_view_model/emp_record_bloc.dart';
import '../widgets/state_no_record/no_record_found_widget.dart';
import '../widgets/state_success/emp_records_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    /// adaptive ui properties
    final screenSize = MediaQuery.of(context).size;
    final TextTheme txtTheme = Theme.of(context).textTheme;
    final BoxConstraints defaultConstraints = BoxConstraints(
      maxHeight: screenSize.height * 0.3,
      maxWidth: screenSize.width * 0.8,
    );
    final BoxConstraints appBarDefConstraints = BoxConstraints(
      maxWidth: screenSize.width * 0.3,
    );

    return Scaffold(
      appBar: commonAppBarWidget(
        appBarDefConstraints: appBarDefConstraints,
        txtTheme: txtTheme,
        appBarTitle: AppTexts.kEmployeeList,
      ),
      body: BlocBuilder<EmployeeRecordBloc, EmployeeRecordState>(
        builder: (context, state) {
          return state is EmployeeRecordLoadingState
              ? Center(
                  child: CircularProgressIndicator(
                    color: AppColors.appThemeColor,
                  ),
                )
              : state is EmployeeRecordNoDataState
                  ? NoRecordFoundWidget(
                      screenSize: screenSize,
                      defaultConstraints: defaultConstraints,
                      txtTheme: txtTheme,
                    )
                  : state is EmployeeRecordSuccessState
                      ? EmpRecordsFoundWidget(
                          screenSize: screenSize,
                          defaultConstraints: defaultConstraints,
                          txtTheme: txtTheme,
                        )
                      : state is EmployeeRecordFailureState
                          ? ErrorScreen()
                          : const SizedBox.shrink();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.pushNamed(RouteNames.addEmpScreen);
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        backgroundColor: AppColors.appThemeColor,
        child: Icon(
          Icons.add,
          color: AppColors.whiteColor,
          size: 24.0,
        ),
      ),
    );
  }
}
