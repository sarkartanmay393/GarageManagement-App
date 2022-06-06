import 'package:flutter/material.dart';

class homecard extends StatelessWidget {
  const homecard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(12),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(0),
          topRight: Radius.circular(32),
          bottomLeft: Radius.circular(32),
          bottomRight: Radius.circular(0),
        ),
      ),
      elevation: 5,
      child: Container(
        padding: const EdgeInsets.all(18),
        height: 120,
        width: double.infinity,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: const [
                    Text(
                      "Earned Today",
                      style: TextStyle(fontSize: 9),
                    ),
                    Text(
                      "RS.2000",
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
                const Text(
                  "Garage Name",
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: const [
                    Text(
                      "Vehicle in Garage",
                      style: TextStyle(fontSize: 9),
                    ),
                    Text(
                      "15",
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
                Column(
                  children: const [
                    Text(
                      "Completed Order",
                      style: TextStyle(fontSize: 9),
                    ),
                    Text(
                      "20",
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
                Column(
                  children: const [
                    Text(
                      "Rejected Order",
                      style: TextStyle(fontSize: 9),
                    ),
                    Text(
                      "0",
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
