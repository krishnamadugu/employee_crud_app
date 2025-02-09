import 'package:employee_info/core/services/storage_service/hive_storage/app_database.dart';
import 'package:employee_info/core/utils/common_widgets/toast_msg.dart';
import 'package:employee_info/feat/add_emp_details/view_model/calendar_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

import '../../home/model/emp_model/employee_model.dart';

class AddEmpCubit extends Cubit<EmployeeModel> {
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

  DateTime? joiningDateTime;
  DateTime? exitedDateTime;

  AddEmpCubit()
      : super(EmployeeModel(
          name: "",
          designation: "",
          fromDate: "",
          toDate: "",
          id: "",
        ));

  /// on add emp btn selected
  void onAddEmpBtnPressed(BuildContext context) {
    if (empName.text.isEmpty) {
      showToastMsg("Please enter employee name");
    } else if (selectedDesignationVal.isEmpty) {
      showToastMsg("Please choose your designation");
    } else if (context.read<CalendarCubit>().fromDate.text.isEmpty) {
      showToastMsg("Please enter from date");
    } else {
      String joiningDate = context.read<CalendarCubit>().fromDate.text;
      String exitedDate = context.read<CalendarCubit>().toDate.text;

      String uuid = Uuid().v4();

      var emp = EmployeeModel(
        name: empName.text,
        designation: selectedDesignationVal,
        fromDate: joiningDate,
        toDate: exitedDate,
        id: uuid,
      );

      AppDatabase.instance.saveEmployee(emp);
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

  /// on drop down value selected
  void onDropDownValSelected({required String roleSelected}) {
    /// date format for adding employee model to list

    var formatter = DateFormat('d MMM, yyyy');
    String joiningDate =
        joiningDateTime == null ? "" : formatter.format(joiningDateTime!);
    String exitedDate =
        exitedDateTime == null ? "" : formatter.format(exitedDateTime!);

    String uuid = Uuid().v4();

    var emp = EmployeeModel(
      name: empName.text,
      designation: selectedDesignationVal,
      fromDate: joiningDate,
      toDate: exitedDate,
      id: uuid,
    );

    emit(emp);
  }
}
