import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import 'widgets/detect_city.dart';
import 'widgets/posible_cities.dart';

class PickCity extends StatelessWidget {
  static const routeName = "pickcity";
  const PickCity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, size.height * 0.07),
        child: AppBar(
          backgroundColor: Colors.red,
          title: Text(
            "Select City",
            style: Theme.of(context).textTheme.displayMedium!.copyWith(
                  fontSize: 15,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
          ),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              size: 18,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          const DetectCity(),
          Container(
            alignment: AlignmentDirectional.center,
            margin: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 6,
            ),
            height: 36,
            color: Colors.grey.shade300,
            child: Text(
              "Cities we serve",
              style: Theme.of(context).textTheme.displayMedium!.copyWith(
                    color: const Color.fromARGB(212, 0, 0, 0),
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
            ),
          ),
          const PossibleCities(),
        ],
      ),
      resizeToAvoidBottomInset: true,
    );
  }
}
