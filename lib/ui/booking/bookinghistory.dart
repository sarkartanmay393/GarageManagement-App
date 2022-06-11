import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';

import '../notification/notifications.dart';
import '../pickcity/pick_city.dart';
import 'widgets/completed.dart';
import 'widgets/processing.dart';
import 'widgets/rejected.dart';

class BookingHistory extends StatelessWidget {
  BookingHistory({Key? key}) : super(key: key);

  Placemark pm = Placemark(locality: "Jalpaiguri");
  var notificationCount = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, size.height * 0.07),
        child: AppBar(
          backgroundColor: Colors.red,
          title: Row(
            children: [
              Text(
                "BEE",
                style: Theme.of(context).textTheme.displayMedium!.copyWith(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (ctx) => Notifications()),
                  );
                },
                icon: notificationCount != 0
                    ? const Icon(Icons.notifications_active_outlined)
                    : const Icon(Icons.notifications_none_outlined),
                color: Colors.white,
                iconSize: 20,
                tooltip: "Notifications",
              ),
            ],
          ),
          leading: IconButton(
            onPressed: () {
              // _key.currentState!.openDrawer();
            },
            icon: const Icon(
              Icons.menu_book_rounded,
              color: Colors.white,
            ),
          ),
          actions: [
            TextButton.icon(
              onPressed: () {
                Navigator.of(context).pushNamed(PickCity.routeName);
              },
              icon: const Icon(
                Icons.maps_home_work,
                size: 12,
                color: Colors.white,
              ),
              label: Text(
                "${pm.locality}",
                style: Theme.of(context).textTheme.displaySmall!.copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
              ),
              style: const ButtonStyle(
                  // fixedSize: MaterialStateProperty.all(Size(32, 2)),
                  ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 18,
          ),
          Row(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(
                  Icons.navigate_before_outlined,
                  size: 28,
                  color: Colors.black,
                ),
              ),
              Text(
                "Booking History",
                style: Theme.of(context).textTheme.displayMedium!.copyWith(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.35,
                    ),
              ),
            ],
          ),
          //
          TabBar(
            tabs: [
              processing(),
              completed(),
              rejected(),
            ],
            // controller: ,
          )
        ],
      ),
    );
  }
}
