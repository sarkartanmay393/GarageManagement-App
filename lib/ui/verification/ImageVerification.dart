import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:provider/provider.dart';

import '../../state/provider.dart';
import '../notification/notifications.dart';
import 'widgets/imgVerifyCard.dart';

class ImageVerificationPage extends StatefulWidget {
  static const routeName = "ImageVerificationPage";
  const ImageVerificationPage({Key? key}) : super(key: key);

  @override
  State<ImageVerificationPage> createState() => _ImageVerificationPageState();
}

class _ImageVerificationPageState extends State<ImageVerificationPage> {
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

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    var InfoFlow = Provider.of<InfoFlower>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, size.height * 0.07),
        child: AppBar(
          backgroundColor: Colors.red,
          centerTitle: true,
          title: Text(
            "Image Verification ",
            style: Theme.of(context).textTheme.displayMedium!.copyWith(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back_ios_new_outlined,
              color: Colors.white,
              size: 18,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                // Navigator.of(context).popUntil(ModalRoute.withName("/"));
                // Navigator.of(context).popUntil(
                //     (route) => route.settings.name == "ScreenToPopBackTo");
                pushNewScreenWithRouteSettings(
                  context,
                  settings: const RouteSettings(name: Notifications.routeName),
                  screen: const Notifications(),
                  withNavBar: true,
                  pageTransitionAnimation: PageTransitionAnimation.cupertino,
                );
                // Navigator.of(context).push(
                //   MaterialPageRoute(builder: (ctx) => Notifications()),
                // );
              },
              icon: InfoFlow.notificationCount != 0
                  ? const Icon(Icons.notifications_active_outlined)
                  : const Icon(Icons.notifications_none_outlined),
              color: Colors.white,
              iconSize: 20,
              tooltip: "Notifications",
            ),
          ],
        ),
      ),
      body: SizedBox(
        height: size.height - (size.height * 0.1),
        // padding: const EdgeInsets.all(12),
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
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              height: size.height - (size.height * 0.25),
              child: ListView.builder(
                itemBuilder: (ctx, i) => ImageVerifyCard(size, info),
                itemCount: 5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
