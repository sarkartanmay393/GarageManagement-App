import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../state/provider.dart';
import 'widgets/menu_buttons.dart';
import 'widgets/profile_card.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  bool isOnline = true;
  bool _locationUpdateLoader = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Drawer(
      width: size.width * 0.7,
      elevation: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            // Profile Bar
            height: size.height * 0.15,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Theme.of(context).primaryColor, Colors.white],
                begin: Alignment.topCenter,
                end: Alignment.bottomRight,
                stops: const [0.5, 0],
              ),
            ),
            padding: const EdgeInsets.only(top: 13),
            child: ProfileCard(isOnline),
          ),
          SizedBox(
            height: size.width * 0.03,
          ),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(horizontal: size.width * 0.05),
            height: size.height * 0.045,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              border: Border.all(
                width: 0.8,
                color: Colors.grey.shade600,
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Text(
                    "Update Location",
                    style: Theme.of(context).textTheme.displaySmall!.copyWith(
                          fontSize: 11.2,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                  ),
                ),
                // SizedBox(
                //   width: size.width * 0.15,
                // ),
                Consumer<InfoFlower>(
                  builder: (ctx, infoFlow, _) => TextButton.icon(
                    onPressed: () async {
                      setState(() {
                        _locationUpdateLoader = true;
                      });
                      await infoFlow.fetchAndSetLocation();
                      setState(() {
                        _locationUpdateLoader = false;
                      });
                    },
                    icon: const Icon(
                      Icons.location_on,
                      size: 12,
                    ),
                    label: _locationUpdateLoader
                        ? const SizedBox(
                            height: 8,
                            width: 8,
                            child: FittedBox(
                              child: CircularProgressIndicator(
                                strokeWidth: 1.8,
                              ),
                            ),
                          )
                        : Text(
                            infoFlow.currentLocation.locality!,
                            style: const TextStyle(
                              fontSize: 11.2,
                              overflow: TextOverflow.clip,
                            ),
                          ),
                  ),
                ),
              ],
            ),
          ),
          const MenuButtons(),
          const Spacer(),
        ],
      ),
    );
  }
}
