part of 'emp_record_bloc.dart';

sealed class EmpRecordEvent {}

class OnFetchEmpData extends EmpRecordEvent {}

class OnRecordDeleteEvent extends EmpRecordEvent {
  final String id;
  final BuildContext context;
  OnRecordDeleteEvent({required this.id, required this.context});
}
