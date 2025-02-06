import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/helpers/network_helper.dart';

part 'no_network_event.dart';
part 'no_network_state.dart';

class NoNetworkBloc extends Bloc<NoNetworkEvent, NoNetworkState> {
  NoNetworkBloc._() : super(NoNetworkInitial()) {
    on<NoNetworkObserve>(_observe);
    on<NoNetworkNotify>(_notifyStatus);
  }

  static final NoNetworkBloc _instance = NoNetworkBloc._();

  factory NoNetworkBloc() => _instance;

  void _observe(event, emit) {
    NetworkHelper.observeNetwork();
  }

  void _notifyStatus(NoNetworkNotify event, emit) {
    event.isConnected ? emit(NoNetworkSuccess()) : emit(NoNetworkFailure());
  }
}
