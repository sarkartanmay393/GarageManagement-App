import 'package:bee/state/provider.dart';
import 'package:bee/ui/booking/bookinghistory.dart';
import 'package:bee/ui/services_request/services_request.dart';
import 'package:bee/ui/TabView.dart';
import 'package:flutter/material.dart';
import 'package:navigation_history_observer/navigation_history_observer.dart';
import 'package:provider/provider.dart';

import 'ui/auth/login/login.dart';
import 'ui/auth/signup/rgstcheck.dart';
import 'ui/auth/signup/signup.dart';
import 'ui/home/homepage.dart';
import 'ui/pickcity/pick_city.dart';
import 'ui/TabView.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => InfoFlower(),
        ),
      ],
      child: MaterialApp(
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
        home: Consumer<InfoFlower>(
          builder: (ctx, IF, _) => IF.isLogin ? const TabView() : LoginPage(),
        ),
        routes: {
          LoginPage.routeName: (context) => LoginPage(),
          SignupPage.routeName: (context) => SignupPage(),
          RgstCheck.routeName: (context) => const RgstCheck(),
          TabView.routeName: (context) => const TabView(),
          HomePage.routeName: (context) => HomePage(),
          PickCity.routeName: (context) => const PickCity(),
          BookingHistory.routeName: (context) => BookingHistory(),
          ServicesRequest.routeName: (context) => const ServicesRequest(),
        },
        navigatorObservers: [NavigationHistoryObserver()],
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
