part of 'no_network_bloc.dart';

sealed class NoNetworkEvent {}

class NoNetworkObserve extends NoNetworkEvent {}

class NoNetworkNotify extends NoNetworkEvent {
  final bool isConnected;

  NoNetworkNotify({this.isConnected = false});
}
