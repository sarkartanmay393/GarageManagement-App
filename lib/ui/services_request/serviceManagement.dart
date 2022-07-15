import 'package:bee/ui/services_request/addService.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:provider/provider.dart';

import '../../state/provider.dart';

import '../pickcity/pick_city.dart';
import 'widgets/RemoveCard.dart';

class ServiceManagementPage extends StatefulWidget {
  static const routeName = "ServiceManagementPage";
  ServiceManagementPage({Key? key}) : super(key: key);

  @override
  State<ServiceManagementPage> createState() => _ServiceManagementPageState();
}

class _ServiceManagementPageState extends State<ServiceManagementPage> {
  final _key = GlobalKey<ScaffoldState>();

  Placemark pm = Placemark(locality: "Jalpaiguri");

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return true
        ? Scaffold(
            body: Center(
              child: Text("Underconstruction"),
            ),
          )
        : Scaffold(
            key: _key,
            appBar: PreferredSize(
              preferredSize: Size(double.infinity, size.height * 0.07),
              child: AppBar(
                backgroundColor: Colors.red,
                centerTitle: true,
                title: Text(
                  "Manage Services",
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
                        pageTransitionAnimation:
                            PageTransitionAnimation.cupertino,
                      );
                      // Navigator.of(context).pushNamed(PickCity.routeName);
                    },
                    icon: const Icon(
                      Icons.maps_home_work,
                      size: 10,
                      color: Colors.white,
                    ),
                    label: Consumer<InfoFlower>(
                      builder: (ctx, infoFlow, _) => Text(
                        infoFlow.currentLocation.locality!,
                        style:
                            Theme.of(context).textTheme.displaySmall!.copyWith(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500,
                                ),
                      ),
                    ),
                    style: const ButtonStyle(
                        // fixedSize: MaterialStateProperty.all(Size(32, 2)),
                        ),
                  ),
                ],
              ),
            ),
            body: Consumer<InfoFlower>(
              builder: (ctx, infoFlow, _) => SingleChildScrollView(
                physics: infoFlow.getServices.isEmpty
                    ? NeverScrollableScrollPhysics()
                    : ScrollPhysics(),
                child: Column(
                  children: [
                    Container(
                      height: size.height * 0.06,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 6),
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
                      height: size.height * 0.05,
                      margin: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 2,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: size.height * 0.03,
                            width: size.width * 0.4,
                            decoration: BoxDecoration(
                              border: Border.all(width: 0.2),
                            ),
                          ),
                          // Spacer(),
                          Row(
                            children: [
                              Container(
                                margin: EdgeInsets.symmetric(
                                  // horizontal: 12,
                                  vertical: size.height * 0.01,
                                ),
                                child: ElevatedButton(
                                  onPressed: () {
                                    pushNewScreenWithRouteSettings(
                                      context,
                                      settings: const RouteSettings(
                                          name: AddServicePage.routeName),
                                      screen: AddServicePage(),
                                      withNavBar: true,
                                      pageTransitionAnimation:
                                          PageTransitionAnimation.cupertino,
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.red,
                                    // fixedSize:
                                    //     Size(size.width * 0.2, size.height * 0.1),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                                  child: FittedBox(
                                    child: Text(
                                      "Add New",
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayMedium!
                                          .copyWith(
                                            fontSize: 14,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(
                                  // horizontal: 12,
                                  vertical: size.height * 0.01,
                                ),
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.red,
                                    // fixedSize:
                                    //     Size(size.width * 0.2, size.height * 0.1),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                                  child: FittedBox(
                                    child: Text(
                                      "Remove All",
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayMedium!
                                          .copyWith(
                                            fontSize: 14,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 2, horizontal: 12),
                      height: size.height * 0.77,
                      child: infoFlow.getServices.isEmpty
                          ? const Expanded(
                              child: Center(
                                child: Text("No Service Found"),
                              ),
                            )
                          : ListView.builder(
                              itemBuilder: (_, i) =>
                                  RemoveCard(size, infoFlow.getServices[i]),
                              itemCount: infoFlow.getServices.length,
                            ),
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
