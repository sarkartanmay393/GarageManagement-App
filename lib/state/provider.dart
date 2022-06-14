import 'package:flutter/material.dart';

enum UserType {
  Garage,
  TowingVan,
}

class InfoFlower with ChangeNotifier {
  bool _isLogin = false;
  int _notificationsCount = 12;
  UserType _userType = UserType.TowingVan;

  bool get isLogin {
    return _isLogin;
  }

  int get notificationCount {
    return _notificationsCount;
  }

  UserType get userType {
    return _userType;
  }

  void userTypeSetter(String type) {
    if (type == "Garage") {
      _userType = UserType.Garage;
    }
  }

  void notificationClearer() {
    _notificationsCount = 0;
    notifyListeners();
  }

  void stateChanger() {
    _isLogin = !_isLogin;
    notifyListeners();
  }
}
