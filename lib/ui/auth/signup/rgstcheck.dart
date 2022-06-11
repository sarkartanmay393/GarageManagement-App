import 'package:flutter/material.dart';

import '../../TabView.dart';

class RgstCheck extends StatefulWidget {
  const RgstCheck({Key? key}) : super(key: key);

  @override
  State<RgstCheck> createState() => _RgstCheckState();
}

class _RgstCheckState extends State<RgstCheck> {
  final List<String> _choices = [
    "Towing Van",
    "Garage",
  ];
  var userPref = "";
  var _choiceIndex = 0;

  Widget chipBuilder(String name, int index) {
    // builds each chip for selection.
    return ChoiceChip(
      label: Text(_choices[index]),
      selected: _choiceIndex == index,
      selectedColor: Colors.red,
      onSelected: (bool selected) {
        setState(() {
          _choiceIndex = selected ? index : 0;
        });
      },
      backgroundColor: Colors.white,
      pressElevation: 52,
      elevation: 5,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      labelStyle: Theme.of(context).textTheme.displayMedium!.copyWith(
            color: _choiceIndex == index ? Colors.white : Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
      labelPadding: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 16,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    );
  }

  void submitButton() {
    if (_choiceIndex == 0) {
      print("Towing Van");
      // Navigator.of(context)
      //     .popAndPushNamed(TowingTabView.routeName, arguments: userPref);
    } else {
      print("Garage");
    }
    // print(userPref);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    //

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Theme.of(context).primaryColor, Colors.white],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: const [0.5, 0],
          ),
        ),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                SizedBox(
                  height: size.height * 0.12,
                ),
                Text(
                  "BEE",
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                Text(
                  "We Keep Your Engine",
                  style: Theme.of(context)
                      .textTheme
                      .displayMedium!
                      .copyWith(fontSize: 12, fontWeight: FontWeight.w500),
                ),
                Text(
                  "Running",
                  style: Theme.of(context)
                      .textTheme
                      .displayMedium!
                      .copyWith(fontSize: 12, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: size.height * 0.2,
                ),
                Text(
                  "Register",
                  style: Theme.of(context).textTheme.displayMedium!.copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.3,
                        // shadows: [
                        //   Shadow(),
                        // ],
                      ),
                ),
                SizedBox(
                  height: size.height * 0.04,
                ),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Spacer(
                      flex: 1,
                    ),
                    chipBuilder("Garage", 0),
                    const Spacer(
                      flex: 1,
                    ),
                    chipBuilder("Towing Van", 1),
                    const Spacer(
                      flex: 1,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                ElevatedButton(
                  onPressed: submitButton,
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      Theme.of(context).primaryColor,
                    ),
                    minimumSize: MaterialStateProperty.all(
                      Size(size.width * 0.8, size.height * 0.05),
                    ),
                    maximumSize: MaterialStateProperty.all(
                      Size(size.width * 0.9, size.height * 0.08),
                    ),
                    elevation: MaterialStateProperty.all(6),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        side: const BorderSide(color: Colors.red),
                      ),
                    ),
                  ),
                  child: Text(
                    "SUBMIT",
                    style: Theme.of(context).textTheme.displaySmall!.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
