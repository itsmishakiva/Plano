import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

StateNotifierProvider<InternetConnectedState, bool>
    internetConnectedStateProvider =
    StateNotifierProvider<InternetConnectedState, bool>(
  (ref) => InternetConnectedState(true)..startInternetConnectionCheck(),
);

class InternetConnectedState extends StateNotifier<bool> {
  InternetConnectedState(super.state);

  void startInternetConnectionCheck() async {
    Timer.periodic(
      const Duration(seconds: 5),
      (timer) async {
        var connectivityResult = await (Connectivity().checkConnectivity());
        if (connectivityResult == ConnectivityResult.none) {
          state = false;
        } else {
          state = true;
        }
      },
    );
  }
}
