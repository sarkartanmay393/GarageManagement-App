import 'package:bee/ui/auth/login/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geocoding/geocoding.dart' as geo;
import 'package:location/location.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'widgets/menu_buttons.dart';
import 'widgets/profile_card.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  void initState() {
    super.initState();
  }

  bool isOnline = false;
  Location location = Location();
  String currentLocation = "";
  final _authInstance = FirebaseAuth.instance;
  bool _isLoading = false;

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
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          duration: Duration(milliseconds: 500),
          content: SizedBox(
              height: 16, child: Center(child: Text("Location Fetched"))),
          padding: EdgeInsets.symmetric(vertical: 8),
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
                        fontSize: 11.2,
                        overflow: TextOverflow.clip,
                      ),
                    ),
                  )
                ],
              ),
            ),
            const MenuButtons(),
            const Spacer(),
            Container(
              height: size.height * 0.06,
              width: double.infinity,
              // color: Colors.white,
              alignment: AlignmentDirectional.center,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      // elevation: 1,
                      primary: Colors.black12,
                      minimumSize: Size(size.width * 0.8, size.height * 0.06),
                      maximumSize: Size(size.width * 0.9, size.height * 0.08),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                    onPressed: () async {
                      setState(() {
                        _isLoading = true;
                      });
                      _authInstance.signOut().then((value) {
                        Navigator.of(context)
                            .popAndPushNamed(LoginPage.routeName);
                      });
                    },
                    child: _isLoading
                        ? SizedBox(
                            height: size.height * 0.04,
                            width: size.width * 0.04,
                            child: const FittedBox(
                              fit: BoxFit.scaleDown,
                              child: CircularProgressIndicator(
                                strokeWidth: 2.8,
                                color: Colors.white,
                              ),
                            ),
                          )
                        : Text(
                            "Log Out",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                          )),
              ),
            ),
            SizedBox(
              height: size.height * 0.015,
            )
          ],
        ));
  }
}
