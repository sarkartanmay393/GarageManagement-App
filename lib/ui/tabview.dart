import 'package:flutter/material.dart';

import 'help/helppage.dart';
import 'home/homepage.dart';
import 'inventory/inventory.dart';
import 'profile/profilepage.dart';
import 'profile/vanprofile.dart';

class TabView extends StatefulWidget {
  static const routeName = "Tab";
  TabView({Key? key}) : super(key: key);

  @override
  State<TabView> createState() => _TabViewState();
}

class _TabViewState extends State<TabView> {
  int selectedIndex = 0;

  void selecter(int value) {
    setState(() {
      selectedIndex = value;
    });
  }

  static String ref = "";

  List<Widget> diffItems = [
    HomePage(), // 0
    HelpPage(), // 1
    InventoryPage(), // 2
    ProfilePage(), // 3
  ];

  final _key = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final idx = ModalRoute.of(context)!.settings.arguments;
    if (idx == 1) {
      diffItems.removeLast();
      diffItems.add(VanProfilePage());
    }
    idx != -1 ? selectedIndex = 3 : selectedIndex = 0;

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
        ),
      ),
      drawer: const Drawer(),
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
