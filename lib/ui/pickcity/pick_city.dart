import 'package:flutter/material.dart';

import 'widgets/detect_city.dart';
import 'widgets/posible_cities.dart';

class PickCity extends StatefulWidget {
  static const routeName = "pickcity";
  const PickCity({Key? key}) : super(key: key);

  @override
  State<PickCity> createState() => _PickCityState();
}

class _PickCityState extends State<PickCity> {
  bool doSearch = true;
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
          actions: [
            doSearch
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        doSearch = !doSearch;
                      });
                    },
                    icon: const Icon(
                      Icons.close,
                      color: Colors.white,
                      size: 18,
                    ),
                  )
                : IconButton(
                    onPressed: () {
                      setState(() {
                        doSearch = !doSearch;
                      });
                    },
                    icon: const Icon(
                      Icons.search,
                      color: Colors.white,
                      size: 18,
                    ),
                  ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            if (doSearch)
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  border: Border.all(width: 0.2),
                ),
                height: size.height * 0.05,
                child: Row(
                  children: [
                    SizedBox(
                        width: size.width * 0.815,
                        child: const TextField(
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Search Here",
                              contentPadding: EdgeInsets.all(5)),
                        )),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.search),
                    ),
                  ],
                ),
              ),
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
      ),
      resizeToAvoidBottomInset: true,
    );
  }
}
