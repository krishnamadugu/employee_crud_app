part of 'emp_record_bloc.dart';

sealed class EmpRecordEvent {}

class OnFetchEmpData extends EmpRecordEvent {}

class OnRecordDeleteEvent extends EmpRecordEvent {
  final String id;
  OnRecordDeleteEvent({required this.id});
}
