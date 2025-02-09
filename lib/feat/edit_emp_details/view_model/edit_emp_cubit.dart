import 'package:employee_info/core/services/storage_service/hive_storage/hive_boxes.dart';
import 'package:employee_info/feat/edit_emp_details/view_model/edit_calendar_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../core/utils/common_widgets/toast_msg.dart';
import '../../home/model/emp_model/employee_model.dart';

class EditEmpCubit extends Cubit<EmployeeModel> {
  /// properties
  final TextEditingController empName = TextEditingController();
  final GlobalKey formKey = GlobalKey();
  final empTextFieldKey = GlobalKey<FormState>();
  final FocusNode empFocusNode = FocusNode();

  final List<String> designationList = [
    "Product Designer",
    "Flutter Developer",
    "QA Tester",
    "Product Owner",
    "Full-Stack Developer",
    "Senior Software Developer"
  ];
  String selectedDesignationVal = "";

  String empId = "";

  DateTime? joiningDateTime;

  DateTime? exitedDateTime;

  EditEmpCubit()
      : super(EmployeeModel(
          name: "",
          designation: "",
          fromDate: "",
          toDate: "",
          id: "",
        ));

  /// on add emp btn selected
  void onEditEmpBtnPressed(BuildContext context) {
    if (empName.text.isEmpty) {
      showToastMsg("Please enter employee name");
    } else if (selectedDesignationVal.isEmpty) {
      showToastMsg("Please choose your designation");
    } else if (context.read<EditCalendarCubit>().fromDate.text.isEmpty) {
      showToastMsg("Please enter from date");
    } else {
      String joiningDate = context.read<EditCalendarCubit>().fromDate.text;
      String exitedDate = context.read<EditCalendarCubit>().toDate.text;

      var emp = EmployeeModel(
        name: empName.text,
        designation: selectedDesignationVal,
        fromDate: joiningDate,
        toDate: exitedDate,
        id: empId,
      );

      AppHiveBoxes.employeesBox.put(empId, emp);
      Navigator.of(context).pop();
    }
  }

  /// set default values
  void setDefaultValues() {
    empName.text = "";
    selectedDesignationVal = "";

    var emp = EmployeeModel(
      name: empName.text,
      designation: selectedDesignationVal,
      fromDate: "",
      toDate: "",
      id: "",
    );
    emit(emp);
  }

  /// get employee details
  void getEmployeeDetails(String empId) {
    var emp = AppHiveBoxes.employeesBox.get(empId)!;
    empName.text = emp.name;
    selectedDesignationVal = emp.designation;
    empId = empId;
    emit(emp);
  }

  /// on drop down value selected
  void onDropDownValSelected({required String roleSelected}) {
    /// date format for adding employee model to list

    var formatter = DateFormat('d MMM, yyyy');
    String joiningDate =
        joiningDateTime == null ? "" : formatter.format(joiningDateTime!);
    String exitedDate =
        exitedDateTime == null ? "" : formatter.format(exitedDateTime!);

    var emp = EmployeeModel(
      name: empName.text,
      designation: selectedDesignationVal,
      fromDate: joiningDate,
      toDate: exitedDate,
      id: empId,
    );

    emit(emp);
  }
}
