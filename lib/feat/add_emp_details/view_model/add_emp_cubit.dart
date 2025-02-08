import 'package:employee_info/core/services/storage_service/hive_storage/app_database.dart';
import 'package:employee_info/core/utils/common_widgets/toast_msg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

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
        ));

  /// on add emp btn selected
  void onAddEmpBtnPressed() {
    if (joiningDateTime == null) {
      showToastMsg("Please enter from date");
    } else if (exitedDateTime == null) {
      showToastMsg("Please enter to date");
    } else if (selectedDesignationVal.isEmpty) {
      showToastMsg("Please choose your designation");
    } else if (empName.text.isEmpty) {
      showToastMsg("Please enter employee name");
    } else {
      /// date format for adding employee model to list
      var formatter = DateFormat('d MMM, yyyy');
      String joiningDate = formatter.format(joiningDateTime!);
      String exitedDate = formatter.format(exitedDateTime!);

      var emp = EmployeeModel(
        name: empName.text,
        designation: selectedDesignationVal,
        fromDate: joiningDate ?? "",
        toDate: exitedDate ?? "",
      );

      AppDatabase.instance.saveEmployee(emp);
    }
  }
}
