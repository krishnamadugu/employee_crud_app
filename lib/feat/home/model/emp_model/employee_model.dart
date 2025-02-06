import 'package:hive/hive.dart';

part 'employee_model.g.dart';

@HiveType(typeId: 0)
class EmployeeModel {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String designation;
  @HiveField(2)
  final String fromDate;
  @HiveField(3)
  final String toDate;

  const EmployeeModel({
    required this.name,
    required this.designation,
    required this.fromDate,
    required this.toDate,
  });
}
