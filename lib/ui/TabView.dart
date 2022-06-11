import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:geocoding/geocoding.dart';

import '../routes/router.gr.dart';
import 'menu/menu.dart';

class TabView extends StatefulWidget {
  const TabView({Key? key}) : super(key: key);

  @override
  State<TabView> createState() => _TabView();
}

class _TabView extends State<TabView> {
  final _key = GlobalKey<ScaffoldState>();
  var notificationCount = 10;
  Placemark pm = Placemark(locality: "Jalpaigiuri");

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return AutoTabsScaffold(
      scaffoldKey: _key,
      resizeToAvoidBottomInset: false,
      appBarBuilder: (_, tab) => PreferredSize(
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
                  context.router.isRoot
                      ? context.router.push(const Notifications())
                      : context.router.popAndPush(const Notifications());
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
              style: const ButtonStyle(),
            ),
          ],
        ),
      ),
      routes: const [
        HomeRouter(),
        HelpsRouter(),
        InventoryRouter(),
        VProfileRouter(),
      ],
      drawer: Menu(),
      bottomNavigationBuilder: (_, tabsRouter) => BottomNavigationBar(
        elevation: 2,
        backgroundColor: Colors.white,
        currentIndex: tabsRouter.activeIndex,
        onTap: tabsRouter.setActiveIndex,
        type: BottomNavigationBarType.fixed,
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
