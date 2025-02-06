part of 'emp_record_bloc.dart';

sealed class EmployeeRecordState {}

class EmployeeRecordInitialState extends EmployeeRecordState {}

class EmployeeRecordLoadingState extends EmployeeRecordState {}

class EmployeeRecordNoDataState extends EmployeeRecordState {}

class EmployeeRecordSuccessState extends EmployeeRecordState {
  final List<EmployeeModel> currEmpRecords;
  final List<EmployeeModel> prevEmpRecords;
  EmployeeRecordSuccessState({
    required this.currEmpRecords,
    required this.prevEmpRecords,
  });
}

class EmployeeRecordFailureState extends EmployeeRecordState {
  final String errorMsg;
  EmployeeRecordFailureState({required this.errorMsg});
}
