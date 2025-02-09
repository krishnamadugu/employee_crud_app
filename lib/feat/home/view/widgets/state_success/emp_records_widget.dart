import 'package:employee_info/config/route_config/route_names.dart';
import 'package:employee_info/core/constants/app_constants/asset_paths.dart';
import 'package:employee_info/feat/home/view_model/emp_record_view_model/emp_record_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/constants/app_constants/text_values.dart';
import '../../../../../core/constants/theme_constants/ui_constants/colors.dart';
import '../../../../../core/services/storage_service/hive_storage/hive_boxes.dart';
import '../../../../../core/utils/common_widgets/text_widget.dart';
import 'emp_card_widget.dart';
import 'emp_category_widget.dart';

class EmpRecordsFoundWidget extends StatefulWidget {
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
  State<EmpRecordsFoundWidget> createState() => _EmpRecordsFoundWidgetState();
}

class _EmpRecordsFoundWidgetState extends State<EmpRecordsFoundWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        /// current employee label
        BuildHeaderWidget(
          headerTitle: AppTexts.kCurrentEmployees,
          screenSize: widget.screenSize,
          defaultConstraints: widget.defaultConstraints,
          txtTheme: widget.txtTheme,
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
                      return GestureDetector(
                        onTap: () {
                          context.pushNamed(RouteNames.editEmpScreen,
                              pathParameters: {
                                'empId': emp.id,
                              }).then((value) {
                            if (context.mounted) {
                              context
                                  .read<EmployeeRecordBloc>()
                                  .add(OnFetchEmpData());
                            }
                          });
                        },
                        child: Slidable(
                          endActionPane: ActionPane(
                            motion: const ScrollMotion(),
                            extentRatio: 0.2,
                            children: [
                              CustomSlidableAction(
                                onPressed: (context) {
                                  final previousEmpItem =
                                      AppHiveBoxes.employeesBox.get(emp.id);

                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                          "Employee data has been deleted"),
                                      action: SnackBarAction(
                                        label: 'Undo',
                                        textColor: AppColors.appThemeColor,
                                        onPressed: () {
                                          AppHiveBoxes.employeesBox.put(
                                            emp.id,
                                            previousEmpItem!,
                                          );

                                          if (context.mounted) {
                                            state.currEmpRecords.add(emp);
                                            setState(() {});
                                            context
                                                .read<EmployeeRecordBloc>()
                                                .add(OnFetchEmpData());
                                          }
                                        },
                                      ),
                                    ),
                                  );

                                  context.read<EmployeeRecordBloc>().add(
                                        OnRecordDeleteEvent(
                                            id: emp.id, context: context),
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
                            width: widget.screenSize.width,
                            child: EmployeeCardWidget(
                              txtTheme: widget.txtTheme,
                              empName: emp.name,
                              designation: emp.designation,
                              empTimePeriod: 'From ${emp.fromDate}',
                            ),
                          ),
                        ),
                      );
                    },
                  )
                : Container(
                    width: widget.screenSize.width,
                    constraints: widget.defaultConstraints.copyWith(
                      maxHeight: widget.screenSize.height * 0.2,
                      maxWidth: widget.screenSize.width * 0.8,
                    ),
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(16.0),
                    color: AppColors.whiteColor,
                    child: TextWidget(
                      txtVal: AppTexts.kNoCurrEmployeeRecordFound,
                      textStyle: widget.txtTheme.titleLarge?.copyWith(
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
          screenSize: widget.screenSize,
          defaultConstraints: widget.defaultConstraints,
          txtTheme: widget.txtTheme,
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
                      return GestureDetector(
                        onTap: () {
                          context.pushNamed(RouteNames.editEmpScreen,
                              pathParameters: {
                                'empId': emp.id,
                              }).then((value) {
                            if (context.mounted) {
                              context
                                  .read<EmployeeRecordBloc>()
                                  .add(OnFetchEmpData());
                            }
                          });
                        },
                        child: Slidable(
                          endActionPane: ActionPane(
                            motion: const ScrollMotion(),
                            extentRatio: 0.2,
                            children: [
                              CustomSlidableAction(
                                onPressed: (context) {
                                  final previousEmpItem =
                                      AppHiveBoxes.employeesBox.get(emp.id);

                                  context.read<EmployeeRecordBloc>().add(
                                        OnRecordDeleteEvent(
                                            id: emp.id, context: context),
                                      );

                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                          "Employee data has been deleted"),
                                      action: SnackBarAction(
                                        label: 'Undo',
                                        textColor: AppColors.appThemeColor,
                                        onPressed: () {
                                          AppHiveBoxes.employeesBox.put(
                                            emp.id,
                                            previousEmpItem!,
                                          );
                                        },
                                      ),
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
                            width: widget.screenSize.width,
                            child: EmployeeCardWidget(
                              txtTheme: widget.txtTheme,
                              empName: emp.name,
                              designation: emp.designation,
                              empTimePeriod:
                                  'From ${emp.fromDate} - ${emp.toDate}',
                            ),
                          ),
                        ),
                      );
                    },
                  )
                : Container(
                    width: widget.screenSize.width,
                    constraints: widget.defaultConstraints.copyWith(
                      maxHeight: widget.screenSize.height * 0.5,
                      maxWidth: widget.screenSize.width * 0.8,
                    ),
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(16.0),
                    color: AppColors.whiteColor,
                    child: TextWidget(
                      txtVal: AppTexts.kNoPrevEmployeeRecordFound,
                      textStyle: widget.txtTheme.titleLarge?.copyWith(
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
