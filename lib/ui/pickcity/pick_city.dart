import 'package:flutter/material.dart';

import '../../helper/formBarMaker.dart';
import 'widgets/detect_city.dart';
import 'widgets/posible_cities.dart';

class PickCity extends StatefulWidget {
  static const routeName = "pickcity";
  const PickCity({Key? key}) : super(key: key);

  @override
  State<PickCity> createState() => _PickCityState();
}

class _PickCityState extends State<PickCity> {
  bool doSearch = false;
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
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            if (doSearch)
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Container(
                  margin: const EdgeInsets.only(
                      top: 8, bottom: 2, right: 8, left: 8),
                  decoration: BoxDecoration(
                    border: Border.all(width: 0.2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.only(left: 8),
                  child: Row(
                    children: [
                      SizedBox(
                        width: size.width * 0.8,
                        child: TextFormField(
                          keyboardType: TextInputType.streetAddress,
                          // readOnly: readOnlyRef != null ? true : false,
                          // initialValue: initVal,
                          // autofocus: autoFocusRef != null ? true : false,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Search Here",
                            hintStyle: Theme.of(context)
                                .textTheme
                                .displayMedium!
                                .copyWith(
                                  fontSize: 14,
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: IconButton(
                          tooltip: "Search",
                          onPressed: () {},
                          icon: const Icon(Icons.search),
                          iconSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            DetectCity(),
            Container(
              alignment: AlignmentDirectional.center,
              margin: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 6,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.grey.shade300,
              ),
              height: 36,
              child: Text(
                "Cities we serve",
                style: Theme.of(context).textTheme.displayMedium!.copyWith(
                      color: const Color.fromARGB(212, 0, 0, 0),
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
              ),
            ),
            PossibleCities(),
          ],
        ),
      ),
      resizeToAvoidBottomInset: true,
    );
  }
}
