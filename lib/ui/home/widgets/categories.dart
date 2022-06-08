import 'package:flutter/material.dart';

class Categories extends StatelessWidget {
  const Categories({Key? key}) : super(key: key);

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
        Container(
          padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
          child: InkWell(
            onTap: () {},
            borderRadius: BorderRadius.circular(15),
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
                children: const [
                  Text(
                    "Bike    |  Request : 01",
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
        Container(
          padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
          child: InkWell(
            onTap: () {},
            borderRadius: BorderRadius.circular(15),
            child: ListTile(
              tileColor: Colors.red,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
              leading: const Icon(
                Icons.car_crash_outlined,
                color: Colors.white,
              ),
              title: Row(
                children: const [
                  Text(
                    "Auto    |  Request : 01",
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
        Container(
          padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
          child: InkWell(
            onTap: () {},
            borderRadius: BorderRadius.circular(15),
            child: ListTile(
              tileColor: Colors.red,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
              leading: const Icon(
                Icons.car_repair_outlined,
                color: Colors.white,
              ),
              title: Row(
                children: const [
                  Text(
                    "Car    |  Request : 01",
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
        Container(
          padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
          child: InkWell(
            onTap: () {},
            borderRadius: BorderRadius.circular(15),
            child: ListTile(
              tileColor: Colors.red,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
              leading: const Icon(
                Icons.fire_truck_outlined,
                color: Colors.white,
              ),
              title: Row(
                children: const [
                  Text(
                    "Truck    |  Request : 01",
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
      ],
    );
  }
}
