import 'package:bee/state/provider.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:provider/provider.dart';

import '../notification/notifications.dart';
import './widgets/SRCard.dart';

class ServicesRequest extends StatefulWidget {
  static const routeName = "ServiceRequest";
  const ServicesRequest({Key? key}) : super(key: key);

  @override
  State<ServicesRequest> createState() => _ServicesRequestState();
}

class _ServicesRequestState extends State<ServicesRequest> {
  Map<String, String> info = {
    "serialno": "1",
    "name": "Tanmay Sarkar",
    "number": "7602462969",
    "address": "Dhupguri, WB, 735210",
    "vehicalImage":
        "https://tesla-cdn.thron.com/delivery/public/image/tesla/3863f3e5-546a-4b22-bcbc-1f8ee0479744/bvlatuR/std/1200x628/MX-Social",
    "vehicle": "Tesla Model X",
    "type": "Electric",
    "orderId": "#20314665521236623",
  };

  Placemark pm = Placemark(locality: "Jalpaiguri");
  var notificationCount = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    var InfoFlow = Provider.of<InfoFlower>(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, size.height * 0.07),
        child: AppBar(
          backgroundColor: Colors.red,
          centerTitle: true,
          title: Text(
            "Service Request",
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
                  settings: const RouteSettings(name: Notifications.routeName),
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
      ),
      body: SizedBox(
        height: size.height - (size.height * 0.1),
        // padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            // Row(
            //   children: [
            //     IconButton(
            //       onPressed: () {
            //         Navigator.of(context, rootNavigator: true).pop();
            //       },
            //       icon: const Icon(Icons.navigate_before_outlined),
            //     ),
            //     SizedBox(
            //       height: 40,
            //       width: 40,
            //       child: Card(
            //         margin:
            //             const EdgeInsets.symmetric(vertical: 2, horizontal: 0),
            //         child: IconButton(
            //           onPressed: () {},
            //           icon: const Icon(Icons.navigate_before_outlined),
            //         ),
            //       ),
            //     ),
            //     const SizedBox(
            //       width: 12,
            //     ),
            //     Text(
            //       "Services Request",
            //       style: Theme.of(context).textTheme.displaySmall!.copyWith(
            //             color: Colors.black87,
            //             fontSize: 14,
            //             fontWeight: FontWeight.w500,
            //           ),
            //     )
            //   ],
            // ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              height: size.height * 0.825,
              child: ListView.builder(
                itemBuilder: (ctx, i) => SRCard(size, info),
                itemCount: 5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
