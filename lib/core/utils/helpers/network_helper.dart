import 'package:connectivity_plus/connectivity_plus.dart';

import '../../../feat/misc/no_network/view_model/no_network_bloc.dart';

class NetworkHelper {
  static void observeNetwork() {
    Connectivity().onConnectivityChanged.listen(
      (List<ConnectivityResult> result) {
        if (result.contains(ConnectivityResult.none)) {
          NoNetworkBloc().add(NoNetworkNotify(isConnected: false));
        } else {
          NoNetworkBloc().add(NoNetworkNotify(isConnected: true));
        }
      },
    );
  }
}
