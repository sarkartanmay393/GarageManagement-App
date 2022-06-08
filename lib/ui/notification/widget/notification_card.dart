import 'package:flutter/material.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.5,
      margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 14),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          children: [
            Text(
              "Headline",
              style: Theme.of(context).textTheme.displayMedium!.copyWith(
                    fontSize: 19,
                    color: Color.fromARGB(216, 20, 20, 20),
                    fontWeight: FontWeight.w600,
                  ),
            ),
            Text(
              "Important Insights.",
              style: Theme.of(context).textTheme.displayMedium!.copyWith(
                    fontSize: 16,
                    color: Color.fromARGB(216, 20, 20, 20),
                    fontWeight: FontWeight.w400,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
