import 'package:bee/helper/LocationGetter.dart';
import 'package:bee/ui/notification/notifications.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:navigation_history_observer/navigation_history_observer.dart';

import 'help/helppage.dart';
import 'home/homepage.dart';
import 'inventory/inventory.dart';
import 'menu/menu.dart';
import 'pickcity/pick_city.dart';
import 'profiles/vanprofile.dart';

class TowingTabView extends StatefulWidget {
  static const routeName = "TowingVanTab";
  const TowingTabView({Key? key}) : super(key: key);

  @override
  State<TowingTabView> createState() => _TowingTabView();
}

class _TowingTabView extends State<TowingTabView> {
  //
  NavigationHistoryObserver navHistory = NavigationHistoryObserver();

  final _key = GlobalKey<ScaffoldState>();
  int selectedIndex = 0;

  //

  void selecter(int value) {
    setState(() {
      selectedIndex = value;
    });
  }

  Placemark pm = Placemark(locality: "Jalpaiguri");

  // to get the next page from rgst check.

  List<Widget> diffItems = [
    HomePage(), // 0
    HelpPage(), // 1
    InventoryPage(), // 2
    VanProfilePage(), // 3
    // porblem here
  ];

  @override
  void initState() {
    try {
      if (navHistory.next!.settings.name == "rgstcheck") {
        selectedIndex = 3;
      }
      pm = CurrentLocation.getLocation() as Placemark;
    } catch (err) {
      print(err);
    }
    super.initState();
  }

  var notificationCount = 10;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    //
    return Scaffold(
      key: _key,
      resizeToAvoidBottomInset: false,
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
                    ? Icon(Icons.notifications_active_outlined)
                    : Icon(Icons.notifications_none_outlined),
                color: Colors.white,
                iconSize: 20,
                tooltip: "Notifications",
              ),
            ],
          ),
          leading: IconButton(
            onPressed: () {
              _key.currentState!.openDrawer();
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
      drawer: Menu(),
      body: diffItems[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 2,
        backgroundColor: Colors.white,
        currentIndex: selectedIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (val) => selecter(val),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.help_center_outlined),
            label: "Get Help",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.inventory_2_outlined),
            label: "Inventory",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined),
            label: "Account",
          ),
        ],
      ),
    );
  }
}
