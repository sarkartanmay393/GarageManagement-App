import 'package:flutter/material.dart';

import './routes/router.gr.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
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
      // home: LoginPage(),
      // routes: {
      //   LoginPage.routeName: (context) => LoginPage(),
      //   SignupPage.routeName: (context) => SignupPage(),
      //   RgstCheck.routeName: (context) => RgstCheck(),
      //   GarageTabView.routeName: (context) => GarageTabView(),
      //   TowingTabView.routeName: (context) => TowingTabView(),
      //   // HomePage.routeName: (context) => HomePage(),
      //   PickCity.routeName: (context) => PickCity(),
      //   // ServicesRequest.routeName: (context) => ServicesRequest(),
      //   BookingHistory.routeName: (context) => BookingHistory(),
      // },
      // navigatorObservers: [NavigationHistoryObserver()],
      debugShowCheckedModeBanner: false,
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
    );
  }
}
