import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:provider/provider.dart';

import '../state/provider.dart';
import 'help/helppage.dart';
import 'home/homepage.dart';
import 'inventory/inventory.dart';
import 'profiles/profilepage.dart';
import 'profiles/vanprofile.dart';

class TabView extends StatefulWidget {
  static const routeName = "TowingVanTab";
  const TabView({Key? key}) : super(key: key);

  @override
  State<TabView> createState() => _TabView();
}

class _TabView extends State<TabView> {
  final _firebaseAuthInstance = FirebaseAuth.instance;

  @override
  void initState() {
    _firebaseAuthInstance.currentUser!.reload();
    super.initState();
  }
  // NavigationHistoryObserver navHistory = NavigationHistoryObserver();

  // final _key = GlobalKey<ScaffoldState>();

  // int selectedIndex = 0;

  // void selecter(int value) {
  //   setState(() {
  //     selectedIndex = value;
  //   });
  // }

  // Placemark pm = Placemark(locality: "Jalpaiguri");

  // List<Widget> diffItems = [
  //   HomePage(), // 0
  //   HelpPage(), // 1
  //   InventoryPage(), // 2
  //   VanProfilePage(), // 3
  //   // porblem here
  // ];

  // @override
  // void initState() {
  //   try {
  //     if (navHistory.next!.settings.name == "rgstcheck") {
  //       selectedIndex = 3;
  //     }
  //     pm = CurrentLocation.getLocation() as Placemark;
  //   } catch (err) {
  //     print(err);
  //   }
  //   super.initState();
  // }

  // var notificationCount = 10;

  final _controller = PersistentTabController(initialIndex: 0);

  @override
  Widget build(BuildContext context) {
    var IF = Provider.of<InfoFlower>(context, listen: false);
    return PersistentTabView(
      context,
      controller: _controller,
      screens: [
        HomePage(), // 0
        HelpPage(), // 1
        InventoryPage(), // 2
        IF.userType.index == 0 ? const ProfilePage() : const VanProfilePage()
      ],
      items: [
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.home_outlined),
          title: "Home",
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.help_center_outlined),
          title: "Get Help",
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.inventory_2_outlined),
          title: "Inventory",
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.account_circle_outlined),
          title: "Account",
        ),
      ],
      confineInSafeArea: true,
      // backgroundColor: Colors.white, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows:
          true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style3,
    );
  }
}
