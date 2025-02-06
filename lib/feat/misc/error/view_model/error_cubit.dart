import 'package:bloc/bloc.dart';

/// Cubit for the error message value
class ErrorCubit extends Cubit<String> {
  final String errorMsg;
  ErrorCubit({required this.errorMsg}) : super("");
}
