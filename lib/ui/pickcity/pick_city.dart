import 'package:flutter/material.dart';

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
          leading: Container(
            alignment: AlignmentDirectional.center,
            margin: const EdgeInsets.only(
              left: 12,
              right: 12,
              top: 11,
              bottom: 11,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(45),
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                  color: Color.fromARGB(111, 8, 8, 8),
                  blurRadius: 3,
                  spreadRadius: 1.2,
                )
              ],
            ),
            child: FittedBox(
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  print(Navigator.of(context).canPop());
                },
                icon: Icon(
                  Icons.navigate_before_rounded,
                  color: Colors.grey.shade600,
                ),
                splashColor: Colors.red,
              ),
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
