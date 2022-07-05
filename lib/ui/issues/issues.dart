import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import '../../state/provider.dart';
import '../notification/notifications.dart';
import '../jobcard/jobcard.dart';
import 'widgets/manual.dart';

class IssuesPage extends StatefulWidget {
  static const routeName = "IssuesPage";
  const IssuesPage({Key? key}) : super(key: key);

  @override
  State<IssuesPage> createState() => _IssuesPageState();
}

class _IssuesPageState extends State<IssuesPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    var infoFlow = Provider.of<InfoFlower>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, size.height * 0.07),
        child: AppBar(
          backgroundColor: Colors.red,
          centerTitle: true,
          title: Text(
            "Popular Issues",
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
              icon: infoFlow.notificationCount != 0
                  ? const Icon(Icons.notifications_active_outlined)
                  : const Icon(Icons.notifications_none_outlined),
              color: Colors.white,
              iconSize: 20,
              tooltip: "Notifications",
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
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
                          hintText: "Search Services and Garages",
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                height: size.height - (size.height * 0.42),
                child: ListView.builder(
                  itemBuilder: (ctx, i) => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(infoFlow.jobcards[i].title),
                      // CustomCheckBox(
                      //   value: checkBoxes[i],
                      //   onChanged: (_) {
                      //     checkBoxes[i] = !checkBoxes[i];
                      //   },
                      //   borderRadius: 12,
                      //   borderColor: Colors.red,
                      // ),
                      Consumer<InfoFlower>(
                        builder: (ctx, info, _) => Checkbox(
                            value: info.jobCardCheckBoxValue(i),
                            onChanged: (val) {
                              info.jobCardCheckboxChanger(i, val!);
                            }),
                      ),
                    ],
                  ),
                  itemCount: infoFlow.jobcards.length,
                ),
              ),
              TextButton(
                onPressed: () {
                  pushNewScreenWithRouteSettings(
                    context,
                    screen: ManualCardPage(),
                    settings: const RouteSettings(
                      name: ManualCardPage.routeName,
                    ),
                    pageTransitionAnimation: PageTransitionAnimation.cupertino,
                  );
                },
                child: Text(
                  "Click here if your issues not listed",
                  style: Theme.of(context).textTheme.displayMedium!.copyWith(
                        fontSize: 14,
                        color: Colors.red,
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.underline,
                      ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      pushNewScreenWithRouteSettings(
                        context,
                        screen: JobCardPage(),
                        settings: const RouteSettings(
                          name: JobCardPage.routeName,
                        ),
                        pageTransitionAnimation:
                            PageTransitionAnimation.cupertino,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.grey.shade400,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      elevation: 2,
                      fixedSize: Size(
                        size.width * 0.3,
                        size.height * 0.01,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                    child: Text(
                      "Add More",
                      style:
                          Theme.of(context).textTheme.displayMedium!.copyWith(
                                fontSize: 15,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                    ),
                  ),
                  SizedBox(
                    width: size.width * 0.05,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      primary: Colors.grey.shade400,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      fixedSize: Size(
                        size.width * 0.3,
                        size.height * 0.01,
                      ),
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                    child: Text(
                      "Done",
                      style:
                          Theme.of(context).textTheme.displayMedium!.copyWith(
                                fontSize: 15,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
