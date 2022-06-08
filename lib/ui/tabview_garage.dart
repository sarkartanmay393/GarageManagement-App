import 'package:flutter/material.dart';
import 'package:navigation_history_observer/navigation_history_observer.dart';

import 'help/helppage.dart';
import 'home/homepage.dart';
import 'inventory/inventory.dart';
import 'menu/menu.dart';
import 'profiles/profilepage.dart';

class GarageTabView extends StatefulWidget {
  static const routeName = "GarageTab";
  const GarageTabView({Key? key}) : super(key: key);

  @override
  State<GarageTabView> createState() => _GarageTabView();
}

class _GarageTabView extends State<GarageTabView> {
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

  // to get the next page from rgst check.

  List<Widget> diffItems = [
    HomePage(), // 0
    HelpPage(), // 1
    InventoryPage(), // 2
    ProfilePage(), // 3
    // porblem here
  ];

  @override
  void initState() {
    if (navHistory.next!.settings.name == "rgstcheck") {
      selectedIndex = 3;
    }
    super.initState();
  }

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
          title: Text(
            "BEE",
            style: Theme.of(context).textTheme.displayMedium!.copyWith(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
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
              onPressed: () {},
              icon: Icon(Icons.maps_home_work),
              label: Text("Jalpaiguri"),
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
