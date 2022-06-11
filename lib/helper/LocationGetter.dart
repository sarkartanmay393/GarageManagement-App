import 'package:flutter/services.dart' show PlatformException;
import 'package:location/location.dart';
import 'package:geocoding/geocoding.dart' as geo;

class CurrentLocation {
  static Future<geo.Placemark> getLocation() async {
    Location location = Location();
    String error;
    try {
      LocationData currentPostion = await location.getLocation();
      List<geo.Placemark> placemarks = await geo.placemarkFromCoordinates(
          currentPostion.latitude!, currentPostion.longitude!);
      geo.Placemark place = placemarks[0];

      return place;
    } on PlatformException catch (e) {
      if (e.code == 'PERMISSION_DENIED') {
        error = 'please grant permission';
        print(error);
      }
      if (e.code == 'PERMISSION_DENIED_NEVER_ASK') {
        error = 'permission denied- please enable it from app settings';
        print(error);
      }
    }
    return geo.Placemark();
  }
}
