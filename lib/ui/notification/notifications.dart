import 'package:flutter/material.dart';

import 'widget/notification_card.dart';

// Not completed yet.

class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  var notificationCount = 50;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        Row(
          children: [
            IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.navigate_before_outlined,
                size: 28,
                color: Colors.black,
              ),
            ),
            Text(
              "Notifications",
              style: Theme.of(context).textTheme.displayMedium!.copyWith(
                    fontSize: 19,
                    color: Color.fromARGB(216, 20, 20, 20),
                    fontWeight: FontWeight.w600,
                  ),
            ),
            Spacer(),
            if (notificationCount > 0)
              IconButton(
                onPressed: () {
                  setState(() {
                    notificationCount = 0;
                  });
                },
                icon: const Icon(Icons.clear_all_outlined),
              ),
          ],
        ),
        const Divider(height: 0.5),
        Container(
          height: size.height - (size.height * 0.07 + 30) - 105,
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
    );
  }
}
