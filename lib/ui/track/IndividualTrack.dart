import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:provider/provider.dart';

import '../../state/provider.dart';
import '../notification/notifications.dart';
import '../pickcity/pick_city.dart';
import 'widgets/tiCard.dart';

// ignore: must_be_immutable
class IndividualTrackPage extends StatelessWidget {
  static const routeName = "IndividualTrackPage";
  IndividualTrackPage({Key? key}) : super(key: key);

  final _key = GlobalKey<ScaffoldState>();
  Placemark pm = Placemark(locality: "Jalpaiguri");

  Widget statusMaker(String name, String dateTime, bool status,
      BuildContext context, Size size) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: status ? Colors.red : Colors.grey,
            radius: 20,
            child: CircleAvatar(
              radius: 16,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                backgroundColor: status ? Colors.red : Colors.grey,
                radius: 13,
              ),
            ),
          ),
          SizedBox(
            width: size.width * 0.12,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: Theme.of(context).textTheme.displaySmall!.copyWith(
                      color: status ? Colors.black : Colors.black54,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
              ),
              if (dateTime.isNotEmpty)
                Text(
                  dateTime,
                  style: Theme.of(context).textTheme.displaySmall!.copyWith(
                        color: Colors.black87,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    var InfoFlow = Provider.of<InfoFlower>(context);
    Map<String, String>? info =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>?;

    //
    return Scaffold(
      key: _key,
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, size.height * 0.07),
        child: AppBar(
          backgroundColor: Colors.red,
          title: Row(
            children: [
              Text(
                "Track Order",
                style: Theme.of(context).textTheme.displayMedium!.copyWith(
                      fontSize: 18,
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
                iconSize: 18,
                tooltip: "Notifications",
              ),
            ],
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.navigate_before,
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
      body: SingleChildScrollView(
        child: Container(
          alignment: AlignmentDirectional.center,
          margin: const EdgeInsets.all(8),
          child: Column(
            children: [
              Text(
                "Order ID ${info!['orderId']}",
                style: Theme.of(context).textTheme.displaySmall!.copyWith(
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              TrackIndividualCard(info),
              SizedBox(
                height: size.height * 0.01,
              ),
              statusMaker(
                "Order Placed",
                "22 Jun 2022, 02:00PM",
                true,
                context,
                size,
              ),
              statusMaker(
                "At Workshop",
                "",
                false,
                context,
                size,
              ),
              statusMaker(
                "Inspection Mode",
                "",
                false,
                context,
                size,
              ),
              statusMaker(
                "Working",
                "",
                false,
                context,
                size,
              ),
              statusMaker(
                "Your Vehicle Ready for Drive !",
                "",
                false,
                context,
                size,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
