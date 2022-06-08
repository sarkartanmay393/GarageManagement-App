import 'package:flutter/material.dart';

import 'widget/notification_card.dart';

// Not completed yet.

class Notifications extends StatefulWidget {
  static const routeName = "notifications";
  Notifications({Key? key}) : super(key: key);

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  var notificationCount = 50;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(double.infinity, size.height * 0.07),
          child: AppBar(
            backgroundColor: Colors.red,
            title: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Notifications",
                  style: Theme.of(context).textTheme.displayMedium!.copyWith(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.35,
                      ),
                ),
                // IconButton(
                //   onPressed: () {
                //     Navigator.of(context).pushReplacement(
                //       MaterialPageRoute(builder: (ctx) => Notifications()),
                //     );
                //   },
                //   icon: notificationCount != 0
                //       ? Icon(Icons.notifications_active_outlined)
                //       : Icon(Icons.notifications_none_outlined),
                //   color: Colors.white,
                //   iconSize: 20,
                //   tooltip: "Notifications",
                // ),
              ],
            ),
            centerTitle: false,
            leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.navigate_before_outlined,
                size: 28,
                color: Colors.white,
              ),
            ),
            actions: [
              if (notificationCount > 0)
                TextButton.icon(
                  onPressed: () {
                    // Navigator.of(context).pushNamed(PickCity.routeName);
                    setState(() {
                      notificationCount = 0;
                    });
                  },
                  icon: const Icon(
                    // Icons.maps_home_work,
                    Icons.clear_all_outlined,
                    size: 18,
                    color: Colors.white,
                  ),
                  label: Text(
                    "Clear All",
                    style: Theme.of(context).textTheme.displaySmall!.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  style: const ButtonStyle(
                      // fixedSize: MaterialStateProperty.all(Size(32, 2)),
                      ),
                ),
            ],
          )),
      body: Column(
        children: [
          // Row(
          //   children: [
          //     IconButton(
          //       onPressed: () {
          //         Navigator.of(context).pop();
          //       },
          //       icon: const Icon(
          //         Icons.navigate_before_outlined,
          //         size: 28,
          //         color: Colors.black,
          //       ),
          //     ),
          //     Text(
          //       "Notifications",
          //       style: Theme.of(context).textTheme.displayMedium!.copyWith(
          //             fontSize: 19,
          //             color: Color.fromARGB(216, 20, 20, 20),
          //             fontWeight: FontWeight.w600,
          //           ),
          //     ),
          //     Spacer(),
          //     if (notificationCount > 0)
          //       IconButton(
          //         onPressed: () {},
          //         icon: const Icon(Icons.clear_all_outlined),
          //       ),
          //   ],
          // ),
          const Divider(height: 0.5),
          Container(
            height: size.height - (size.height * 0.07 + 30),
            child: notificationCount > 0
                ? ListView.builder(
                    itemBuilder: (ctx, i) => NotificationCard(),
                    itemCount: notificationCount,
                  )
                : Center(
                    child: Text(
                      "No Notifications",
                      style: Theme.of(context).textTheme.displaySmall!.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.black87),
                    ),
                  ),
          )
        ],
      ),
    );
  }
}
