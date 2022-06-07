import 'package:flutter/material.dart';

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
            onPressed: () {},
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
            onPressed: () {},
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
            onPressed: () {},
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
            onPressed: () {},
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
