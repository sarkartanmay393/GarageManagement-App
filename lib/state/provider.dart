import 'package:flutter/material.dart';

enum UserType {
  Garage,
  TowingVan,
}

class JobCard {
  String title;
  String description;
  String id;

  JobCard({required this.title, required this.description, required this.id});
}

class InfoFlower with ChangeNotifier {
  bool _isLogin = false;
  int _notificationsCount = 12;
  UserType _userType = UserType.TowingVan;
  List<JobCard> jobcards = [
    JobCard(title: "Qwert Jioasdf", description: "description", id: "ajsdf"),
    JobCard(title: "Qwert Jioasdf", description: "description", id: "ajsdf"),
    JobCard(title: "Qwert Jioasdf", description: "description", id: "ajsdf"),
    JobCard(title: "Qwert Jioasdf", description: "description", id: "ajsdf"),
    JobCard(title: "Qwert Jioasdf", description: "description", id: "ajsdf"),
    JobCard(title: "Qwert Jioasdf", description: "description", id: "ajsdf"),
    JobCard(title: "Qwert Jioasdf", description: "description", id: "ajsdf"),
    JobCard(title: "Qwert Jioasdf", description: "description", id: "ajsdf"),
    JobCard(title: "Qwert Jioasdf", description: "description", id: "ajsdf"),
    JobCard(title: "Qwert Jioasdf", description: "description", id: "ajsdf"),
    JobCard(title: "Qwert Jioasdf", description: "description", id: "ajsdf"),
    JobCard(title: "Qwert Jioasdf", description: "description", id: "ajsdf"),
    JobCard(title: "Qwert Jioasdf", description: "description", id: "ajsdf"),
    JobCard(title: "Qwert Jioasdf", description: "description", id: "ajsdf"),
    JobCard(title: "Qwert Jioasdf", description: "description", id: "ajsdf"),
    JobCard(title: "Qwert Jioasdf", description: "description", id: "ajsdf"),
  ];

  void addJobCard(String title, String description) {
    jobcards.add(
      JobCard(
        title: title,
        description: description,
        id: DateTime.now().toString(),
      ),
    );
    notifyListeners();
  }

  void removeJobCard(String id) {
    jobcards.removeWhere((element) => element.id == id);
    notifyListeners();
  }

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
