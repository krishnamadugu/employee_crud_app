import 'package:flutter_bloc/flutter_bloc.dart';

class UpdateMonthCubit extends Cubit<DateTime> {
  UpdateMonthCubit() : super(DateTime.now());

  DateTime currentMonth = DateTime.now();

  /// update currentMonth
  void updateCurrentMonth(DateTime currMonth) {
    currentMonth = currMonth;
    emit(currentMonth);
  }
}
