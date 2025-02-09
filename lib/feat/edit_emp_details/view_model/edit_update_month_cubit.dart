import 'package:bloc/bloc.dart';

class EditUpdateMonthCubit extends Cubit<DateTime> {
  EditUpdateMonthCubit() : super(DateTime.now());

  DateTime currentMonth = DateTime.now();

  /// update currentMonth
  void updateCurrentMonth(DateTime currMonth) {
    currentMonth = currMonth;
    emit(currentMonth);
  }
}
