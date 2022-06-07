import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:geocoding/geocoding.dart' as geo;
import 'package:location/location.dart';

import 'widgets/menu_buttons.dart';

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
    //call this async method from whereever you need
    // GeoCode gc = GeoCode();
    String error;

    try {
      LocationData currentPostion = await location.getLocation();
      List<geo.Placemark> placemarks = await geo.placemarkFromCoordinates(
          currentPostion.latitude!, currentPostion.longitude!);
      geo.Placemark place = placemarks[0];
      setState(() {
        currentLocation = place.locality.toString();
      });
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
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Column(
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
                ),
                SizedBox(
                  height: size.width * 0.1,
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
                  child: FittedBox(
                    child: Row(
                      children: [
                        Text(
                          "Change Location",
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall!
                              .copyWith(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                        ),
                        // SizedBox(
                        //   width: size.width * 0.15,
                        // ),
                        TextButton.icon(
                          onPressed: changeLocationButton,
                          icon: const Icon(Icons.location_on),
                          label: Text(
                            currentLocation,
                            style: const TextStyle(
                                fontSize: 16, overflow: TextOverflow.clip),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                MenuButtons(),
              ],
            ),
            Positioned(
              left: size.width * 0.06,
              top: size.height * 0.11,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                      boxShadow: const [
                        BoxShadow(
                          blurRadius: 4,
                          color: Color.fromARGB(177, 34, 34, 33),
                          spreadRadius: 1.2,
                        )
                      ],
                      border: Border.all(
                        width: 0.1,
                      ),
                    ),
                    child: const CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(
                        "https://avatars.githubusercontent.com/u/84321236?v=4",
                      ),
                    ),
                  ),
                  SizedBox(
                    width: size.width * 0.035,
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Tanmay Sarkar",
                        style:
                            Theme.of(context).textTheme.displaySmall!.copyWith(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "+91 9234789432",
                        style:
                            Theme.of(context).textTheme.displaySmall!.copyWith(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                      )
                    ],
                  ),
                  SizedBox(
                    width: size.width * 0.02,
                  ),
                  TextButton.icon(
                    onPressed: () {
                      setState(() {
                        isOnline = !isOnline;
                      });
                    },
                    icon: isOnline
                        ? const Icon(
                            Icons.circle_rounded,
                            color: Colors.green,
                            size: 12,
                          )
                        : const Icon(
                            Icons.circle_outlined,
                            color: Colors.grey,
                            size: 12,
                          ),
                    label: Text(
                      isOnline ? "Online" : "Offline",
                      style: Theme.of(context).textTheme.displaySmall!.copyWith(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
