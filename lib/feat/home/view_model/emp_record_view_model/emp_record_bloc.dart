import 'package:bloc/bloc.dart';
import 'package:employee_info/core/services/storage_service/hive_storage/hive_boxes.dart';
import 'package:flutter/material.dart';

import '../../model/emp_model/employee_model.dart';

part 'emp_record_event.dart';
part 'emp_record_state.dart';

class EmployeeRecordBloc extends Bloc<EmpRecordEvent, EmployeeRecordState> {
  EmployeeRecordBloc() : super(EmployeeRecordInitialState()) {
    on<OnFetchEmpData>(fetchEmpRecords);
    on<OnRecordDeleteEvent>(onDeleteRecordPressed);
  }

  void onDeleteRecordPressed(
      OnRecordDeleteEvent event, Emitter<EmployeeRecordState> emit) async {
    AppHiveBoxes.employeesBox.delete(event.id);

    final empRecordList = AppHiveBoxes.employeesBox.values.toList();
    List<EmployeeModel> currEmpRecordsVal = [];
    List<EmployeeModel> prevEmpRecordsVal = [];

    if (empRecordList.isNotEmpty) {
      for (var emp in empRecordList) {
        if (emp.toDate.isNotEmpty) {
          prevEmpRecordsVal.add(emp);
        } else if (emp.toDate.isEmpty) {
          currEmpRecordsVal.add(emp);
        }
      }

      /// emitting success state
      emit(
        EmployeeRecordSuccessState(
          currEmpRecords: [...currEmpRecordsVal],
          prevEmpRecords: [...prevEmpRecordsVal],
        ),
      );
    } else {
      /// emit no record found state
      emit(
        EmployeeRecordNoDataState(),
      );
    }
  }

  void fetchEmpRecords(
      EmpRecordEvent event, Emitter<EmployeeRecordState> emit) async {
    /// emitting loading state
    emit(
      EmployeeRecordLoadingState(),
    );
    try {
      final empRecordList = AppHiveBoxes.employeesBox.values.toList();
      List<EmployeeModel> currEmpRecordsVal = [];
      List<EmployeeModel> prevEmpRecordsVal = [];

      if (empRecordList.isNotEmpty) {
        for (var emp in empRecordList) {
          if (emp.toDate.isNotEmpty) {
            prevEmpRecordsVal.add(emp);
          } else if (emp.toDate.isEmpty) {
            currEmpRecordsVal.add(emp);
          }
        }

        /// emitting success state
        emit(
          EmployeeRecordSuccessState(
            currEmpRecords: [...currEmpRecordsVal],
            prevEmpRecords: [...prevEmpRecordsVal],
          ),
        );
      } else {
        /// emit no record found state
        emit(
          EmployeeRecordNoDataState(),
        );
      }
    } catch (error, stacktrace) {
      debugPrint(stacktrace.toString());

      /// emitting error state
      emit(
        EmployeeRecordFailureState(
          errorMsg: stacktrace.toString(),
        ),
      );
    }
  }
}
