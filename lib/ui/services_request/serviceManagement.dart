import 'package:bee/ui/inventory/AddNewPage.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:provider/provider.dart';

import '../../state/provider.dart';
import '../menu/menu.dart';
import '../notification/notifications.dart';
import '../pickcity/pick_city.dart';
import 'addService.dart';
import 'removeService.dart';

class ServiceManagementPage extends StatelessWidget {
  static const routeName = "ServiceManagementPage";
  ServiceManagementPage({Key? key}) : super(key: key);

  final _key = GlobalKey<ScaffoldState>();
  Placemark pm = Placemark(locality: "Jalpaiguri");
  var notificationsCount = 12;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    var InfoFlow = Provider.of<InfoFlower>(context);
    return Scaffold(
        key: _key,
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
          ),
        ),
        drawer: Menu(),
        body: Center(
          child: Container(
            height: size.height * 0.2,
            width: size.width * 0.7,
            decoration: BoxDecoration(
              border: Border.all(width: 0.1),
              gradient: LinearGradient(
                colors: [Colors.red, Colors.grey.shade100],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [0.3, 0.55],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () {
                          pushNewScreenWithRouteSettings(
                            context,
                            settings: const RouteSettings(
                                name: AddServicePage.routeName),
                            screen: AddServicePage(),
                            withNavBar: false,
                            pageTransitionAnimation:
                                PageTransitionAnimation.cupertino,
                          );
                        },
                        icon: const Icon(
                          Icons.add_circle_outline,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          pushNewScreenWithRouteSettings(
                            context,
                            settings: const RouteSettings(
                                name: AddServicePage.routeName),
                            screen: AddServicePage(),
                            withNavBar: false,
                            pageTransitionAnimation:
                                PageTransitionAnimation.cupertino,
                          );
                        },
                        child: Text(
                          "Add Service",
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall!
                              .copyWith(
                                color: Colors.black,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () {
                          pushNewScreenWithRouteSettings(
                            context,
                            settings: const RouteSettings(
                                name: RemoveServicePage.routeName),
                            screen: RemoveServicePage(),
                            withNavBar: false,
                            pageTransitionAnimation:
                                PageTransitionAnimation.cupertino,
                          );
                        },
                        icon: const Icon(
                          Icons.remove_circle_outline,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          pushNewScreenWithRouteSettings(
                            context,
                            settings: const RouteSettings(
                                name: RemoveServicePage.routeName),
                            screen: RemoveServicePage(),
                            withNavBar: false,
                            pageTransitionAnimation:
                                PageTransitionAnimation.cupertino,
                          );
                        },
                        child: Text(
                          "Remove Service",
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall!
                              .copyWith(
                                color: Colors.black,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
