import 'package:flutter/material.dart';

import 'widgets/processing_card.dart';

class Processing extends StatelessWidget {
  Processing({Key? key}) : super(key: key);
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
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ListView.builder(
        itemCount: 10,
        itemBuilder: (ctx, i) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: processing_card(size, info),
          );
        });
  }
}
