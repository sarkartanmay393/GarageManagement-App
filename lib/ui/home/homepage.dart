import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:provider/provider.dart';

import '../../state/provider.dart';
import '../menu/menu.dart';
import '../notification/notifications.dart';
import '../pickcity/pick_city.dart';
import './widgets/services.dart';
import './widgets/categories.dart';
import './widgets/homecard.dart';

class HomePage extends StatefulWidget {
  static const routeName = "HomePage";
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _key = GlobalKey<ScaffoldState>();

  // final _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return FutureBuilder(
      future:
          Provider.of<InfoFlower>(context, listen: false).fetchAndSetLocation(),
      builder: (ctx, ss) {
        if (ss.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(
              strokeWidth: 3.5,
              semanticsLabel: "Waiting for Location",
            ),
          );
        } else {
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
                      style:
                          Theme.of(context).textTheme.displayMedium!.copyWith(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                    ),
                    Consumer<InfoFlower>(
                      builder: (ctx, infoFlower, _) => IconButton(
                        onPressed: () {
                          pushNewScreenWithRouteSettings(
                            context,
                            settings: const RouteSettings(
                                name: Notifications.routeName),
                            screen: const Notifications(),
                            withNavBar: true,
                            pageTransitionAnimation:
                                PageTransitionAnimation.cupertino,
                          );
                        },
                        icon: infoFlower.notificationCount != 0
                            ? const Icon(Icons.notifications_active_outlined)
                            : const Icon(Icons.notifications_none_outlined),
                        color: Colors.white,
                        iconSize: 20,
                        tooltip: "Notifications",
                      ),
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
                        pageTransitionAnimation:
                            PageTransitionAnimation.cupertino,
                      );
                      // Navigator.of(context).pushNamed(PickCity.routeName);
                    },
                    icon: const Icon(
                      Icons.maps_home_work,
                      size: 12,
                      color: Colors.white,
                    ),
                    label: Consumer<InfoFlower>(
                      builder: (ctx, infoFlow, _) => Text(
                        "${infoFlow.currentLocation.locality}",
                        style:
                            Theme.of(context).textTheme.displaySmall!.copyWith(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
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
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        border: Border.all(
                          width: 0.8,
                        ),
                        borderRadius: BorderRadius.circular(12)),
                    child: Stack(
                      alignment: Alignment.centerRight,
                      children: [
                        TextFormField(
                          // controller: _searchController,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: "Search Here",
                            hintStyle: TextStyle(
                              fontSize: 12,
                              // fontWeight: FontWeight.w300,
                            ),
                            contentPadding: EdgeInsets.only(
                              left: 10,
                            ),
                          ),
                          // textInputAction: TextInputAction.search,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(
                              width: 0.5,
                            ),
                            color: Colors.grey.shade300,
                          ),
                          height: 30,
                          width: 30,
                          margin: const EdgeInsets.symmetric(
                            horizontal: 9,
                          ),
                          child: IconButton(
                            iconSize: 15,
                            onPressed: () {},
                            icon: const Icon(Icons.search_outlined),
                            tooltip: "Search",
                          ),
                        ),
                      ],
                    ),
                  ),
                  const homecard(),
                  const Categories(),
                  const Services(),
                ],
              ),
            ),
          );
        }
      },
    );
  }

  @override
  void dispose() {
    // _searchController.dispose();
    super.dispose();
  }
}
