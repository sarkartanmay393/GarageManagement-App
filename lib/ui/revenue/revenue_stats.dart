import 'package:bee/ui/revenue/widgets/daliy.dart';
import 'package:bee/ui/revenue/widgets/monthly.dart';
import 'package:bee/ui/revenue/widgets/weekly.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:provider/provider.dart';

import '../../state/provider.dart';
import '../menu/menu.dart';
import '../notification/notifications.dart';
import '../pickcity/pick_city.dart';

class RevenueStats extends StatelessWidget {
  static const routeName = "RevenueStats";
  RevenueStats({Key? key}) : super(key: key);

  //
  final _key = GlobalKey<ScaffoldState>();
  Placemark pm = Placemark(locality: "Jalpaiguri");
  var notificationsCount = 12;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    var InfoFlow = Provider.of<InfoFlower>(context);
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        key: _key,
        appBar: PreferredSize(
          preferredSize: Size(double.infinity, size.height * 0.12),
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
                    // Navigator.of(context).popUntil(ModalRoute.withName("/"));
                    // Navigator.of(context).popUntil(
                    //     (route) => route.settings.name == "ScreenToPopBackTo");
                    pushNewScreenWithRouteSettings(
                      context,
                      settings:
                          const RouteSettings(name: Notifications.routeName),
                      screen: const Notifications(),
                      withNavBar: true,
                      pageTransitionAnimation:
                          PageTransitionAnimation.cupertino,
                    );
                    // Navigator.of(context).push(
                    //   MaterialPageRoute(builder: (ctx) => Notifications()),
                    // );
                  },
                  icon: InfoFlow.notificationCount != 0
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
                Icons.menu_rounded,
                color: Colors.white,
              ),
            ),
            actions: [
              TextButton.icon(
                onPressed: () {
                  pushNewScreenWithRouteSettings(
                    context,
                    settings: const RouteSettings(name: PickCity.routeName),
                    screen: const PickCity(),
                    withNavBar: true,
                    pageTransitionAnimation: PageTransitionAnimation.cupertino,
                  );
                  // Navigator.of(context).pushNamed(PickCity.routeName);
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
            bottom: TabBar(
                labelStyle: Theme.of(context).textTheme.displaySmall!.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                tabs: const [
                  Tab(
                    text: "Daily",
                  ),
                  Tab(
                    text: "Weekly",
                  ),
                  Tab(
                    text: "Monthly",
                  )
                ]),
          ),
        ),
        drawer: Menu(),
        body: TabBarView(children: [
          Daily(),
          Weekly(),
          Monthly(),
        ]),
      ),
    );
  }
}
