import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';

import './widgets/SRCard.dart';

class ServicesRequest extends StatefulWidget {
  // String serviceId; @PathParam() required this.serviceId
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
    return SizedBox(
      height: size.height - (size.height * 0.1),
      // padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.of(context, rootNavigator: true).pop();
                },
                icon: const Icon(Icons.navigate_before_outlined),
              ),
              SizedBox(
                height: 40,
                width: 40,
                child: Card(
                  margin:
                      const EdgeInsets.symmetric(vertical: 2, horizontal: 0),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.navigate_before_outlined),
                  ),
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              Text(
                "Services Request",
                style: Theme.of(context).textTheme.displaySmall!.copyWith(
                      color: Colors.black87,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
              )
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            height: size.height * 0.83,
            child: ListView.builder(
              itemBuilder: (ctx, i) => SRCard(size, info),
              itemCount: 5,
            ),
          ),
        ],
      ),
    );
  }
}
