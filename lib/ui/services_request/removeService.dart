import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:provider/provider.dart';

import '../../state/provider.dart';

import '../pickcity/pick_city.dart';
import 'widgets/RemoveCard.dart';

class RemoveServicePage extends StatelessWidget {
  static const routeName = "RemoveServicePage";
  RemoveServicePage({Key? key}) : super(key: key);

  final _key = GlobalKey<ScaffoldState>();
  Placemark pm = Placemark(locality: "Jalpaiguri");

  Map<String, String> ServiceInfo = {
    "imageLink":
        "https://tesla-cdn.thron.com/delivery/public/image/tesla/3863f3e5-546a-4b22-bcbc-1f8ee0479744/bvlatuR/std/1200x628/MX-Social",
    "name": "Complete Checkup",
    "price": "999",
    "discountedPrice": "499",
    "timeTakes": "3Hours",
    "features": "Losem Somes",
  };

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    var InfoFlow = Provider.of<InfoFlower>(context);
    return Scaffold(
      key: _key,
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, size.height * 0.07),
        child: AppBar(
          backgroundColor: Colors.red,
          centerTitle: true,
          title: Text(
            "Remove Service Page",
            style: Theme.of(context).textTheme.displayMedium!.copyWith(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.navigate_before,
              color: Colors.white,
            ),
          ),
          actions: [
            TextButton.icon(
              onPressed: () {
                pushNewScreenWithRouteSettings(
                  context,
                  settings: const RouteSettings(name: PickCity.routeName),
                  screen: const PickCity(),
                  withNavBar: true,
                  pageTransitionAnimation: PageTransitionAnimation.cupertino,
                );
                // Navigator.of(context).pushNamed(PickCity.routeName);
              },
              icon: const Icon(
                Icons.maps_home_work,
                size: 10,
                color: Colors.white,
              ),
              label: Text(
                "${pm.locality}",
                style: Theme.of(context).textTheme.displaySmall!.copyWith(
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                    ),
              ),
              style: const ButtonStyle(
                  // fixedSize: MaterialStateProperty.all(Size(32, 2)),
                  ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: size.height * 0.06,
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              decoration: BoxDecoration(
                border: Border.all(width: 0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              alignment: Alignment.center,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: size.width * 0.8,
                    child: TextFormField(
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "Search by Order ID",
                        hintStyle: TextStyle(
                          fontSize: 12,
                          // fontWeight: FontWeight.w300,
                        ),
                        contentPadding: EdgeInsets.only(
                          left: 10,
                          // bottom: 11,
                        ),
                      ),
                      // textInputAction: TextInputAction.search,
                    ),
                  ),
                  Expanded(
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.search_rounded),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 12),
              height: size.height * 0.82,
              child: ListView.builder(
                itemBuilder: (_, i) => RemoveCard(size, ServiceInfo),
                itemCount: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
