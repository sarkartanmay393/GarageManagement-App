import 'package:bee/state/provider.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:provider/provider.dart';

import '../../../helper/formBarMaker.dart';
import '../../notification/notifications.dart';

class ManualCardPage extends StatelessWidget {
  static const routeName = 'ManualCardPage';
  ManualCardPage({Key? key}) : super(key: key);

  Map<String, String> info = {
    "title": "",
    "description": "",
  };
  Placemark pm = Placemark(locality: "Jalpaiguri");

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    var InfoFlow = Provider.of<InfoFlower>(context);
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(double.infinity, size.height * 0.07),
          child: AppBar(
            backgroundColor: Colors.red,
            centerTitle: true,
            title: Text(
              "Add Manually",
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
                    settings:
                        const RouteSettings(name: Notifications.routeName),
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
        body: Column(
          children: [
            FormBar.inputBar(
              name: "Title",
              context: context,
              initVal: "",
              onSaveStorage: info['title']!,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
              decoration: BoxDecoration(
                border: Border.all(width: 0.2),
                borderRadius: BorderRadius.circular(12),
              ),
              height: 200,
              padding: const EdgeInsets.only(left: 8),
              child: TextFormField(
                // minLines: 2,
                onSaved: (val) => info['description'] = val!,
                validator: (val) {
                  return null;
                },
                maxLines: null,
                initialValue: info['description'],
                keyboardType: TextInputType.multiline,
                expands: true,
                decoration: InputDecoration(
                  // isCollapsed: true,
                  border: InputBorder.none,
                  hintText: "Enter Description",
                  hintStyle:
                      Theme.of(context).textTheme.displayMedium!.copyWith(
                            fontSize: 14,
                            color: Colors.black54,
                            fontWeight: FontWeight.w500,
                          ),
                ),
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12.0, right: 12.0),
              child: ElevatedButton(
                onPressed: () {
                  InfoFlow.addJobCard(info['title']!, info['description']!);
                  Navigator.of(context).pop();
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                  fixedSize: Size(size.width * 0.3, size.height * 0.05),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                child: Text(
                  "Save",
                  style: Theme.of(context)
                      .textTheme
                      .displayMedium!
                      .copyWith(fontWeight: FontWeight.w500, fontSize: 16),
                ),
              ),
            ),
          ],
        ));
  }
}
