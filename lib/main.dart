import 'package:bee/ui/tabview_towing.dart';
import 'package:flutter/material.dart';
import 'package:navigation_history_observer/navigation_history_observer.dart';

import 'ui/auth/login/login.dart';
import 'ui/auth/signup/rgstcheck.dart';
import 'ui/auth/signup/signup.dart';
import 'ui/home/homepage.dart';
import 'ui/pickcity/pick_city.dart';
import 'ui/tabview_garage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BEE',
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: const Color.fromARGB(255, 255, 42, 42),
        backgroundColor: Colors.grey.shade100,
        canvasColor: Colors.grey.shade100,
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
          displayMedium: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
          displaySmall: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w300,
            color: Colors.white,
          ),
        ),
      ),
      home: LoginPage(),
      routes: {
        LoginPage.routeName: (context) => LoginPage(),
        SignupPage.routeName: (context) => SignupPage(),
        RgstCheck.routeName: (context) => RgstCheck(),
        GarageTabView.routeName: (context) => GarageTabView(),
        TowingTabView.routeName: (context) => TowingTabView(),
        HomePage.routeName: (context) => HomePage(),
        PickCity.routeName: (context) => PickCity(),
      },
      navigatorObservers: [NavigationHistoryObserver()],
      debugShowCheckedModeBanner: false,
    );
  }
}
