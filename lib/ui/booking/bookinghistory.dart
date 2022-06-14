import 'package:bee/state/provider.dart';
import 'package:bee/ui/booking/widgets/Rejected.dart';
import 'package:bee/ui/booking/widgets/completed.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:provider/provider.dart';

import '../notification/notifications.dart';
import 'widgets/Proccessing.dart';

class BookingHistory extends StatelessWidget {
  static const routeName = 'booking';
  BookingHistory({Key? key}) : super(key: key);

  Placemark pm = Placemark(locality: "Jalpaiguri");
  var notificationCount = 0;
  final _pages = [];

  Widget _tabBuilder(String name) {
    return Tab(
      text: name,
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    var InfoFlow = Provider.of<InfoFlower>(context);
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(double.infinity, size.height * 0.12),
          child: AppBar(
            backgroundColor: Colors.red,
            centerTitle: true,
            title: Text(
              "Booking History",
              style: Theme.of(context).textTheme.displayMedium!.copyWith(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
            ),
            leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.arrow_back_ios_new_outlined,
                color: Colors.white,
                size: 18,
              ),
            ),
            actions: [
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
                    pageTransitionAnimation: PageTransitionAnimation.cupertino,
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
            bottom: TabBar(
              tabs: [
                _tabBuilder("Processing"),
                _tabBuilder("Completed"),
                _tabBuilder("Rejected"),
              ],
            ),
          ),
        ),
        body: TabBarView(
          children: [
            Processing(),
            Completed(),
            Rejected(),
          ],
        ),
      ),
    );
  }
}

// Tab(
//                   child: Card(
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(2),
//                     ),
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: 12.0, vertical: 5.5),
//                       child: Text(
//                         "Rejected",
//                         style:
//                             Theme.of(context).textTheme.displaySmall!.copyWith(
//                                   color: Colors.black,
//                                   fontSize: 13,
//                                   fontWeight: FontWeight.normal,
//                                 ),
//                       ),
//                     ),
//                   ),
//                 ),
