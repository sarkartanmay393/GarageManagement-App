import 'package:bee/ui/completed/CompletedVehicle.dart';
import 'package:bee/ui/services_request/addService.dart';
import 'package:bee/ui/track/track.dart';
import 'package:bee/ui/verification/ImageVerification.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'state/provider.dart';
import 'ui/auth/login/login.dart';
import 'ui/auth/signup/rgstcheck.dart';
import 'ui/auth/signup/signup.dart';
import 'ui/booking/bookinghistory.dart';
import 'ui/home/homepage.dart';
import 'ui/inventory/AddNewPage.dart';
import 'ui/issues/issues.dart';
import 'ui/issues/widgets/manual.dart';
import 'ui/jobcard/jobcard.dart';
import 'ui/pickcity/pick_city.dart';
import 'ui/TabView.dart';
import 'ui/privacy/PrivacyPolicy.dart';
import 'ui/revenue/revenue_stats.dart';

import 'ui/services_request/serviceManagement.dart';
import 'ui/services_request/services_request.dart';
import 'ui/terms/terms.dart';
import 'ui/track/IndividualTrack.dart';

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
          RevenueStats.routeName: (context) => RevenueStats(),
          TermsAndConditions.routeName: (context) => TermsAndConditions(),
          PrivacyPolicy.routeName: (context) => PrivacyPolicy(),
          CompletedVehicle.routeName: (context) => CompletedVehicle(),
          AddNewPage.routeName: (context) => AddNewPage(),
          Track.routeName: (context) => Track(),
          IndividualTrackPage.routeName: (context) => IndividualTrackPage(),
          ServiceManagementPage.routeName: (context) => ServiceManagementPage(),
          AddServicePage.routeName: (context) => AddServicePage(),
          ImageVerificationPage.routeName: (context) => ImageVerificationPage(),
          JobCardPage.routeName: (context) => JobCardPage(),
          IssuesPage.routeName: (context) => const IssuesPage(),
          ManualCardPage.routeName: (context) => ManualCardPage(),
        },
        // navigatorObservers: [NavigationHistoryObserver()],

        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
