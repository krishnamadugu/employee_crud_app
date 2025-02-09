import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

import '../../../../feat/home/model/emp_model/employee_model.dart';
import 'hive_boxes.dart';
import 'hive_consts.dart';

class AppDatabase {
  AppDatabase._constructor();

  static final AppDatabase instance = AppDatabase._constructor();

  factory AppDatabase() => instance;

  Future<void> initialize() async {
    await Hive.initFlutter();
    Hive.registerAdapter(EmployeeModelAdapter());
    AppHiveBoxes.employeesBox = await Hive.openBox<EmployeeModel>(
      AppHiveConstants.empRecordsBox,
    );
  }

  Future<void> saveEmployee(EmployeeModel employee) async {
    await AppHiveBoxes.employeesBox.put(
      employee.id,
      employee,
    );

    debugPrint(AppHiveBoxes.employeesBox.values.toString());
  }

  Future<void> deleteEmpRecord(String name) async {
    await AppHiveBoxes.employeesBox.delete(name);
  }

  Future<void> deleteAllEmpRecords() async {
    await AppHiveBoxes.employeesBox.clear();
  }
}
