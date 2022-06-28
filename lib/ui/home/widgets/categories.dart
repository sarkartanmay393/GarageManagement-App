import 'package:flutter/material.dart';

class Categories extends StatelessWidget {
  const Categories({Key? key}) : super(key: key);

  Widget cat(String n1) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
      child: InkWell(
        borderRadius: BorderRadius.circular(18),
        onTap: () {},
        child: Card(
          elevation: 2.5,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
          child: ListTile(
            tileColor: Colors.red,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),
            leading: const Icon(
              Icons.directions_bike_outlined,
              color: Colors.white,
            ),
            title: Row(
              children: [
                Text(
                  n1,
                  style: TextStyle(fontSize: 13, color: Colors.white),
                ),
              ],
            ),
            trailing: Stack(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.notifications_active_outlined),
                  color: Colors.white,
                ),
                const Positioned(
                    right: 6,
                    top: 8,
                    child: Icon(
                      Icons.album_outlined,
                      size: 8,
                      color: Colors.lightGreenAccent,
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "Categories",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        cat("Bike    |  Request : 01"),
        cat("Auto    |  Request : 01"),
        cat("Car    |  Request : 01"),
        cat("Truck    |  Request : 01"),
      ],
    );
  }
}
