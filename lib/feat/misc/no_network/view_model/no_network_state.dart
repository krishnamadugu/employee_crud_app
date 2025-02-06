part of 'no_network_bloc.dart';

sealed class NoNetworkState {}

class NoNetworkInitial extends NoNetworkState {}

class NoNetworkSuccess extends NoNetworkState {}

class NoNetworkFailure extends NoNetworkState {}
