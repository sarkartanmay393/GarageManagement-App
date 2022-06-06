import 'package:flutter/material.dart';

import './screens/login.dart';
import '/screens/rgstcheck.dart';
import './screens/signup.dart';
import 'screens/homepage.dart';
import 'screens/profilepage.dart';
import 'screens/tabview.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BEE',
      theme: ThemeData(
        primaryColor: const Color.fromARGB(255, 255, 42, 42),
        backgroundColor: Colors.grey.shade200,
        canvasColor: Colors.grey.shade200,
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
        TabView.routeName: (context) => TabView(),
        HomePage.routeName: (context) => HomePage(),
        ProfilePage.routeName: (context) => ProfilePage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
