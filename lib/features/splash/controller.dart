import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

class SplashController extends ChangeNotifier {
  SplashState state = SplashState.initializing;
  void setSplashState(SplashState val) {
    state = val;
    notifyListeners();
  }

  void Function()? openContainer;

  void setAction(void Function() action) {
    openContainer = action;
  }

  void toggleState() {
    if (state == SplashState.initializing) {
      state = SplashState.connectionEstablished;
    } else {
      state = SplashState.initializing;
    }
    notifyListeners();
  }
}

enum SplashState {
  initializing,
  connectionEstablished,
  userFound,
  dataFetched,
  userNotFound,
  connectionNotEstablished,
}
