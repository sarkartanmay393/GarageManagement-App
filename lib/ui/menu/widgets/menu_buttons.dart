import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import '../../booking/bookinghistory.dart';
import '../../privacy/PrivacyPolicy.dart';
import '../../revenue/revenue_stats.dart';
import '../../terms/terms.dart';

class MenuButtons extends StatelessWidget {
  const MenuButtons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 18,
        vertical: 6,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextButton(
            onPressed: () {
              // Navigator.of(context).pushNamed(BookingHistory.routeName);
              pushNewScreenWithRouteSettings(
                context,
                settings: const RouteSettings(name: BookingHistory.routeName),
                screen: BookingHistory(),
                withNavBar: true,
                pageTransitionAnimation: PageTransitionAnimation.cupertino,
              );
            },
            style: ButtonStyle(
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                // splashFactory: NoSplash.splashFactory,
                elevation: MaterialStateProperty.all(500)),
            child: Text(
              "BOOKING HISTORY",
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: Colors.grey.shade700,
              ),
            ),
          ),
          TextButton(
            onPressed: () {},
            style: ButtonStyle(
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                // splashFactory: NoSplash.splashFactory,
                elevation: MaterialStateProperty.all(500)),
            child: Text(
              "COMPLETED VEHICLE",
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: Colors.grey.shade700,
              ),
            ),
          ),
          TextButton(
            onPressed: () {},
            style: ButtonStyle(
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                // splashFactory: NoSplash.splashFactory,
                elevation: MaterialStateProperty.all(500)),
            child: Text(
              "JOB CARD",
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: Colors.grey.shade700,
              ),
            ),
          ),
          TextButton(
            onPressed: () {},
            style: ButtonStyle(
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                // splashFactory: NoSplash.splashFactory,
                elevation: MaterialStateProperty.all(500)),
            child: Text(
              "TRACK",
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: Colors.grey.shade700,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              pushNewScreenWithRouteSettings(
                context,
                settings: const RouteSettings(name: RevenueStats.routeName),
                screen: RevenueStats(),
                withNavBar: true,
                pageTransitionAnimation: PageTransitionAnimation.cupertino,
              );
            },
            style: ButtonStyle(
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                // splashFactory: NoSplash.splashFactory,
                elevation: MaterialStateProperty.all(500)),
            child: Text(
              "REVENUE STATS",
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: Colors.grey.shade700,
              ),
            ),
          ),
          TextButton(
            onPressed: () {},
            style: ButtonStyle(
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                // splashFactory: NoSplash.splashFactory,
                elevation: MaterialStateProperty.all(500)),
            child: Text(
              "ADD/SUBSTRACT SERVICES",
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: Colors.grey.shade700,
              ),
            ),
          ),
          TextButton(
            onPressed: () {},
            style: ButtonStyle(
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                // splashFactory: NoSplash.splashFactory,
                elevation: MaterialStateProperty.all(500)),
            child: Text(
              "IMAGE VERIFICATION",
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: Colors.grey.shade700,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              pushNewScreenWithRouteSettings(
                context,
                screen: TermsAndConditions(),
                settings: const RouteSettings(
                  name: TermsAndConditions.routeName,
                ),
              );
            },
            style: ButtonStyle(
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                // splashFactory: NoSplash.splashFactory,
                elevation: MaterialStateProperty.all(500)),
            child: Text(
              "TERMS OF SERVICE",
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: Colors.grey.shade700,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              pushNewScreenWithRouteSettings(
                context,
                screen: PrivacyPolicy(),
                settings: const RouteSettings(name: PrivacyPolicy.routeName),
              );
            },
            style: ButtonStyle(
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                // splashFactory: NoSplash.splashFactory,
                elevation: MaterialStateProperty.all(500)),
            child: Text(
              "PRIVACY POLICY",
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: Colors.grey.shade700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
