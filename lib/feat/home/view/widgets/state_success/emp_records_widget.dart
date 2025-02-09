import 'package:employee_info/core/constants/app_constants/asset_paths.dart';
import 'package:employee_info/feat/home/view_model/emp_record_view_model/emp_record_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/constants/app_constants/text_values.dart';
import '../../../../../core/constants/theme_constants/ui_constants/colors.dart';
import '../../../../../core/utils/common_widgets/text_widget.dart';
import 'emp_card_widget.dart';
import 'emp_category_widget.dart';

class EmpRecordsFoundWidget extends StatelessWidget {
  const EmpRecordsFoundWidget({
    super.key,
    required this.screenSize,
    required this.defaultConstraints,
    required this.txtTheme,
  });

  final Size screenSize;
  final BoxConstraints defaultConstraints;
  final TextTheme txtTheme;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        /// current employee label
        BuildHeaderWidget(
          headerTitle: AppTexts.kCurrentEmployees,
          screenSize: screenSize,
          defaultConstraints: defaultConstraints,
          txtTheme: txtTheme,
        ),

        /// current employee list
        BlocBuilder<EmployeeRecordBloc, EmployeeRecordState>(
          builder: (BuildContext context, state) {
            return state is EmployeeRecordSuccessState &&
                    state.currEmpRecords.isNotEmpty
                ? ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.currEmpRecords.length,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      var emp = state.currEmpRecords[index];
                      return Slidable(
                        endActionPane: ActionPane(
                          motion: const ScrollMotion(),
                          extentRatio: 0.2,
                          children: [
                            CustomSlidableAction(
                              onPressed: (context) {
                                context.read<EmployeeRecordBloc>().add(
                                      OnRecordDeleteEvent(
                                        id: emp.id,
                                      ),
                                    );
                              },
                              backgroundColor: AppColors.errorColor,
                              foregroundColor: Colors.white,
                              child: SvgPicture.asset(
                                AppAssetPaths.kTrashIconSvg,
                                height: 20,
                                width: 18,
                              ),
                            ),
                          ],
                        ),
                        child: SizedBox(
                          width: screenSize.width,
                          child: EmployeeCardWidget(
                            txtTheme: txtTheme,
                            empName: emp.name,
                            designation: emp.designation,
                            empTimePeriod: 'From ${emp.fromDate}',
                          ),
                        ),
                      );
                    },
                  )
                : Container(
                    width: screenSize.width,
                    constraints: defaultConstraints.copyWith(
                      maxHeight: screenSize.height * 0.2,
                      maxWidth: screenSize.width * 0.8,
                    ),
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(16.0),
                    color: AppColors.whiteColor,
                    child: TextWidget(
                      txtVal: AppTexts.kNoCurrEmployeeRecordFound,
                      textStyle: txtTheme.titleLarge?.copyWith(
                        color: AppColors.hintTxtColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 14.0,
                      ),
                    ),
                  );
          },
        ),

        /// Previous employees label
        BuildHeaderWidget(
          headerTitle: AppTexts.kPreviousEmployees,
          screenSize: screenSize,
          defaultConstraints: defaultConstraints,
          txtTheme: txtTheme,
        ),

        /// previous employee list
        BlocBuilder<EmployeeRecordBloc, EmployeeRecordState>(
          builder: (BuildContext context, state) {
            return state is EmployeeRecordSuccessState &&
                    state.prevEmpRecords.isNotEmpty
                ? ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.prevEmpRecords.length,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      var emp = state.prevEmpRecords[index];
                      return Slidable(
                        endActionPane: ActionPane(
                          motion: const ScrollMotion(),
                          extentRatio: 0.2,
                          children: [
                            CustomSlidableAction(
                              onPressed: (context) {
                                context.read<EmployeeRecordBloc>().add(
                                      OnRecordDeleteEvent(
                                        id: emp.id,
                                      ),
                                    );
                              },
                              backgroundColor: AppColors.errorColor,
                              foregroundColor: Colors.white,
                              child: SvgPicture.asset(
                                AppAssetPaths.kTrashIconSvg,
                                height: 20,
                                width: 18,
                              ),
                            ),
                          ],
                        ),
                        child: SizedBox(
                          width: screenSize.width,
                          child: EmployeeCardWidget(
                            txtTheme: txtTheme,
                            empName: emp.name,
                            designation: emp.designation,
                            empTimePeriod:
                                'From ${emp.fromDate} - ${emp.toDate}',
                          ),
                        ),
                      );
                    },
                  )
                : Container(
                    width: screenSize.width,
                    constraints: defaultConstraints.copyWith(
                      maxHeight: screenSize.height * 0.5,
                      maxWidth: screenSize.width * 0.8,
                    ),
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(16.0),
                    color: AppColors.whiteColor,
                    child: TextWidget(
                      txtVal: AppTexts.kNoPrevEmployeeRecordFound,
                      textStyle: txtTheme.titleLarge?.copyWith(
                        color: AppColors.hintTxtColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 14.0,
                      ),
                    ),
                  );
          },
        ),

        const SizedBox(height: 10.0),
      ],
    );
  }
}
