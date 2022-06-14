import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:geocoding/geocoding.dart' as geo;
import 'package:location/location.dart';

import 'widgets/menu_buttons.dart';
import 'widgets/profile_card.dart';

class Menu extends StatefulWidget {
  Menu({Key? key}) : super(key: key);

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  bool isOnline = false;
  Location location = Location();
  String currentLocation = "";

  Future<void> changeLocationButton() async {
    String error;
    try {
      LocationData currentPostion = await location.getLocation();
      List<geo.Placemark> placemarks = await geo.placemarkFromCoordinates(
          currentPostion.latitude!, currentPostion.longitude!);
      geo.Placemark place = placemarks[0];
      setState(() {
        currentLocation = place.locality.toString();
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Location fetched."),
          duration: Duration(milliseconds: 1000),
        ),
      );
      // var s = await gc.reverseGeocoding(
      //     latitude: myLocation.latitude!, longitude: myLocation.longitude!);
      // print(s);
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
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Drawer(
        width: size.width * 0.7,
        elevation: 2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              // Profile Bar
              height: size.height * 0.15,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Theme.of(context).primaryColor, Colors.white],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomRight,
                  stops: const [0.5, 0],
                ),
              ),
              padding: const EdgeInsets.only(top: 13),
              child: ProfileCard(isOnline),
            ),
            SizedBox(
              height: size.width * 0.03,
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: size.width * 0.05),
              height: size.height * 0.045,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                border: Border.all(
                  width: 0.8,
                  color: Colors.grey.shade600,
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text(
                      "Change Location",
                      style: Theme.of(context).textTheme.displaySmall!.copyWith(
                            fontSize: 11.2,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                    ),
                  ),
                  // SizedBox(
                  //   width: size.width * 0.15,
                  // ),
                  TextButton.icon(
                    onPressed: changeLocationButton,
                    icon: const Icon(
                      Icons.location_on,
                      size: 12,
                    ),
                    label: Text(
                      currentLocation,
                      style: const TextStyle(
                          fontSize: 11.2, overflow: TextOverflow.clip),
                    ),
                  )
                ],
              ),
            ),
            const MenuButtons(),
          ],
        ));
  }
}
