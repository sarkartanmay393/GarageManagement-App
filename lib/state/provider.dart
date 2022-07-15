import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';

import '../helper/LocationGetter.dart';

enum UserType {
  TowingVan,
  Garage,
} // Self made datas.

class JobCard {
  String title;
  String description;
  String id;
  JobCard({required this.title, required this.description, required this.id});
} // Self made structures.

class Notification {
  String headline;
  String description;
  Notification({required this.headline, required this.description});
}

class City {
  String name;
  String imgLink;
  City({required this.name, required this.imgLink});
}

class Services {
  String id;
  String name;
  String category;
  String specification;
  String timeToComplete;
  String actualPrice;
  String discountedPrice;
  List<String> photos;
  Services(
      {required this.id,
      required this.name,
      required this.category,
      required this.actualPrice,
      required this.discountedPrice,
      required this.photos,
      required this.specification,
      required this.timeToComplete});
}

class InfoFlower with ChangeNotifier {
  // Declared variables and datas .
  var _isLogin = false;
  UserType _userType = UserType.TowingVan;
  Map<String, String> _profileInformationsTV = {
    "DriverName": "",
    "DriverPhone": "",
    "OwnerName": "",
    "OwnerPhone": "",
    "OwnerLicense": "",
    "Gender": "",
    "Birthday": "",
    "Email": "",
  }; // Holds informations for Towing Van.
  Map<String, String> _profileInformationsGR = {
    "GarageName": "",
    "PersonName": "",
    "Gender": "",
    "Birthday": "",
    "Email": "",
    "Phone": "",
    "GarageRegistetrationNumber": "",
    "GarageAddress": "",
    "State": "",
    "City": "",
  }; // Holds informations about Garage.
  List<Notification> _notifications = [
    Notification(headline: "headline", description: "description"),
    Notification(headline: "headline", description: "description"),
    Notification(headline: "headline", description: "description"),
    Notification(headline: "headline", description: "description"),
  ]; // Holds informations about Notifications.
  List<JobCard> _jobcards = [
    JobCard(title: "Qwert Jioasdf", description: "description", id: "ajsdf"),
    JobCard(title: "Qwert Jioasdf", description: "description", id: "ajsdf"),
    JobCard(title: "Qwert Jioasdf", description: "description", id: "ajsdf"),
    JobCard(title: "Qwert Jioasdf", description: "description", id: "ajsdf"),
  ]; // Holds informations about Issues and Job cards.

  List<bool> _checkBoxes = [
    false,
    false,
    false,
    false,
  ];

  Placemark _currentLocation = Placemark(locality: "\n");

  List<City> _cities = [
    City(
      name: "Dhupguri",
      imgLink:
          "https://st.indiarailinfo.com/kjfdsuiemjvcya24/0/9/6/6/4755966/0/img1357copy2114570.jpg",
    ),
  ];

  List<Services> _services = [
    Services(
      id: DateTime.now().toIso8601String(),
      name: "Complete Checkup",
      category: "",
      specification: "",
      timeToComplete: "3 Hours",
      actualPrice: "999",
      discountedPrice: "499",
      photos: ["imgLink", "imgLink"],
    ),
  ];

  // Getting info from datas.

  bool get isLogin {
    return _isLogin;
  }

  int get notificationCount {
    return _notifications.length;
  }

  UserType get userType {
    return _userType;
  }

  String profileInfoTowingVan(String key) {
    return _profileInformationsTV[key]!;
  }

  String profileInfoGarage(String key) {
    return _profileInformationsGR[key]!;
  }

  List<Notification> get notifications {
    return [..._notifications];
  } // Returns a cloned value of _notifications list.

  List<JobCard> get jobcards {
    return [..._jobcards];
  } // Returns a cloned value of _jobcards list.

  bool jobCardCheckBoxValue(int index) {
    return _checkBoxes[index];
  }

  Placemark get currentLocation {
    return _currentLocation;
  }

  List<City> get cities {
    return [..._cities];
  }

  List<Services> get getServices {
    return [..._services];
  }

  // Setting info to datas.

  void loginStateChanger() {
    _isLogin = !_isLogin;
    notifyListeners();
  }

  void userTypeChanger(int index) {
    if (index == 1) {
      _userType = UserType.Garage;
    } else if (index == 0) {
      _userType = UserType.TowingVan;
    }
    notifyListeners();
  }

  void notificationsAdder(String headline, String description) {
    _notifications.add(
      Notification(
        headline: headline,
        description: description,
      ),
    );
    notifyListeners();
  }

  void notificationClearer() {
    _notifications.clear();
    notifyListeners();
  } // Notification clears in one shot.

  void addValueTowingVan({required String key, required String val}) {
    _profileInformationsTV.update(
      key,
      (value) => val,
      ifAbsent: () => val,
    );
    notifyListeners();
  }

  void addValueGarage({required String key, required String val}) {
    _profileInformationsGR.update(
      key,
      (value) => val,
      ifAbsent: () => val,
    );
    notifyListeners();
  }

  void addJobCard(String title, String description) {
    _jobcards.add(
      JobCard(
        title: title,
        description: description,
        id: DateTime.now().toString(),
      ),
    );
    _checkBoxes.add(false);
    notifyListeners();
  }

  void jobCardCheckboxChanger(int i, bool val) {
    _checkBoxes[i] = val;
    notifyListeners();
  }

  void removeJobCard(String id) {
    jobcards.removeWhere((element) => element.id == id);
    notifyListeners();
  } // Removes a job card by id.

  bool possibleToFetch = true;
  Future<void> fetchAndSetLocation() async {
    // if (possibleToFetch) {
    _currentLocation = await CurrentLocation.getLocation();
    possibleToFetch = false;
    debugPrint("Location fetched and setted.");
    notifyListeners();
    // }
    // debugPrint("Location is fetched once.");
  }

  void clearOneInfoDatabase(String point) {
    if (point == "tv") {
      _profileInformationsTV.clear();
    } else if (point == "gr") {
      _profileInformationsGR.clear();
    }
  }

  void addNewCity(City val) {
    _cities.add(val);
    notifyListeners();
  }

  void manualLocationSet() {
    // need to complete.
    notifyListeners();
  }

  void addService(Services srv) {
    _services.add(srv);
    notifyListeners();
  }

  void removeService(String id) {
    _services.removeWhere((element) => element.id == id);
    notifyListeners();
  }

//
}
