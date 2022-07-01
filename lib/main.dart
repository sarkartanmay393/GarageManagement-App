import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'state/provider.dart';
import 'ui/auth/login/login.dart';
import 'ui/auth/signup/rgstcheck.dart';
import 'ui/auth/signup/signup.dart';
import 'ui/booking/bookinghistory.dart';
import 'ui/completed/CompletedVehicle.dart';
import 'ui/home/homepage.dart';
import 'ui/inventory/AddNewPage.dart';
import 'ui/issues/issues.dart';
import 'ui/issues/widgets/manual.dart';
import 'ui/jobcard/jobcard.dart';
import 'ui/pickcity/pick_city.dart';
import 'ui/TabView.dart';
import 'ui/privacy/PrivacyPolicy.dart';
import 'ui/revenue/revenue_stats.dart';

import 'ui/services_request/addService.dart';
import 'ui/services_request/serviceManagement.dart';
import 'ui/services_request/services_request.dart';
import 'ui/terms/terms.dart';
import 'ui/track/IndividualTrack.dart';
import 'ui/track/track.dart';
import 'ui/verification/ImageVerification.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final auth = FirebaseAuth.instance;
  runApp(MyApp(auth));
}

class MyApp extends StatelessWidget {
  FirebaseAuth auth;
  MyApp(this.auth, {Key? key}) : super(key: key);

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
        home: StreamBuilder(
          stream: auth.authStateChanges(),
          builder: (ctx, ss) {
            if (ss.hasData) {
              return const TabView();
            }
            return const LoginPage();
          },
        ),

        routes: {
          LoginPage.routeName: (context) => const LoginPage(),
          SignupPage.routeName: (context) => const SignupPage(),
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
          // ignore: prefer_const_constructors
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
