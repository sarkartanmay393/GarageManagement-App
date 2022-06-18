import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:provider/provider.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';

import '../../state/provider.dart';
import '../menu/menu.dart';
import '../notification/notifications.dart';
import '../pickcity/pick_city.dart';
import 'widgets/help_form.dart';

class HelpPage extends StatefulWidget {
  static const routeName = "Help";
  HelpPage({Key? key}) : super(key: key);

  @override
  State<HelpPage> createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {
  final _key = GlobalKey<ScaffoldState>();

  Placemark pm = Placemark(locality: "Jalpaiguri");

  var notificationsCount = 12;

  bool loadMore = false;

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
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 3.0, horizontal: 12.0),
              child: ExpansionTileCard(
                elevation: 2,
                // contentPadding: EdgeInsets.symmetric(horizontal: 8),
                initialElevation: 2,
                title: Text("Lorem Ipsum Dolor Sit?"),
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.0,
                      vertical: 8,
                    ),
                    child: Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit ut aliquam, purus sit amet luctus venenatis, lectus magna  Lorem ipsum dolor sit amet, consectetur adipiscing elit ut Lorem ipsum dolor sit amet, consectetur adipiscing elit ut aliquam, purus sit amet luctus venenatis, lectus magna  Lorem ipsum dolor sit amet, consectetur adipiscing elit ut ",
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 3.0, horizontal: 12.0),
              child: ExpansionTileCard(
                elevation: 2,
                // contentPadding: EdgeInsets.symmetric(horizontal: 8),
                initialElevation: 2,
                title: Text("Lorem Ipsum Dolor Sit?"),
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.0,
                      vertical: 8,
                    ),
                    child: Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit ut aliquam, purus sit amet luctus venenatis, lectus magna  Lorem ipsum dolor sit amet, consectetur adipiscing elit ut Lorem ipsum dolor sit amet, consectetur adipiscing elit ut aliquam, purus sit amet luctus venenatis, lectus magna  Lorem ipsum dolor sit amet, consectetur adipiscing elit ut ",
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 3.0, horizontal: 12.0),
              child: ExpansionTileCard(
                elevation: 2,
                // contentPadding: EdgeInsets.symmetric(horizontal: 8),
                initialElevation: 2,
                title: Text("Lorem Ipsum Dolor Sit?"),
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.0,
                      vertical: 8,
                    ),
                    child: Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit ut aliquam, purus sit amet luctus venenatis, lectus magna  Lorem ipsum dolor sit amet, consectetur adipiscing elit ut Lorem ipsum dolor sit amet, consectetur adipiscing elit ut aliquam, purus sit amet luctus venenatis, lectus magna  Lorem ipsum dolor sit amet, consectetur adipiscing elit ut ",
                    ),
                  ),
                ],
              ),
            ),
            if (loadMore)
              Column(
                children: const [
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 3.0, horizontal: 12.0),
                    child: ExpansionTileCard(
                      elevation: 2,
                      // contentPadding: EdgeInsets.symmetric(horizontal: 8),
                      initialElevation: 2,
                      title: Text("Lorem Ipsum Dolor Sit?"),
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 12.0,
                            vertical: 8,
                          ),
                          child: Text(
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit ut aliquam, purus sit amet luctus venenatis, lectus magna  Lorem ipsum dolor sit amet, consectetur adipiscing elit ut Lorem ipsum dolor sit amet, consectetur adipiscing elit ut aliquam, purus sit amet luctus venenatis, lectus magna  Lorem ipsum dolor sit amet, consectetur adipiscing elit ut ",
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 3.0, horizontal: 12.0),
                    child: ExpansionTileCard(
                      elevation: 2,
                      // contentPadding: EdgeInsets.symmetric(horizontal: 8),
                      initialElevation: 2,
                      title: Text("Lorem Ipsum Dolor Sit?"),
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 12.0,
                            vertical: 8,
                          ),
                          child: Text(
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit ut aliquam, purus sit amet luctus venenatis, lectus magna  Lorem ipsum dolor sit amet, consectetur adipiscing elit ut Lorem ipsum dolor sit amet, consectetur adipiscing elit ut aliquam, purus sit amet luctus venenatis, lectus magna  Lorem ipsum dolor sit amet, consectetur adipiscing elit ut ",
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            const SizedBox(
              height: 6,
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  loadMore = !loadMore;
                });
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              child: Text(
                loadMore ? "Hide Extra" : "Load More",
                style: Theme.of(context).textTheme.displayMedium!.copyWith(
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              "Register your complaint here",
              style: Theme.of(context).textTheme.displayMedium!.copyWith(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
            ),
            Text(
              "Thank you for contacting us. Please fill the following forms below to complete the process.",
              style: Theme.of(context).textTheme.displayMedium!.copyWith(
                    fontSize: 12,
                    color: Colors.black,
                    fontWeight: FontWeight.w300,
                  ),
              textAlign: TextAlign.center,
            ),
            HelpForm(),
          ],
        ),
      ),
    );
  }
}
