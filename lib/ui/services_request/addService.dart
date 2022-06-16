import 'dart:io';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:image_picker/image_picker.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:provider/provider.dart';

import '../../state/provider.dart';
import '../pickcity/pick_city.dart';

class AddServicePage extends StatefulWidget {
  static const routeName = "AddServicePage";
  AddServicePage({Key? key}) : super(key: key);

  @override
  State<AddServicePage> createState() => _AddServicePageState();
}

class _AddServicePageState extends State<AddServicePage> {
  final _key = GlobalKey<ScaffoldState>();

  Placemark pm = Placemark(locality: "Jalpaiguri");

  final _picker = ImagePicker();

  File? image1;

  bool image1marker = false;

  void selectImage1() async {
    var img = await _picker.pickImage(
      source: ImageSource.gallery,
    );
    setState(() {
      if (img != null) {
        image1 = File(img.path);
        image1marker = true;
      }
    });
  }

  Widget inputBar(String name, BuildContext context) {
    return Wrap(
      children: [
        Text(
          name,
          style: Theme.of(context).textTheme.displayMedium!.copyWith(
                fontSize: 14,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 7, bottom: 12, right: 8),
          decoration: BoxDecoration(
            border: Border.all(width: 0.2),
          ),
          padding: const EdgeInsets.only(left: 8),
          child: TextFormField(
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "Enter $name",
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    var InfoFlow = Provider.of<InfoFlower>(context);
    return Scaffold(
      key: _key,
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, size.height * 0.07),
        child: AppBar(
          backgroundColor: Colors.red,
          centerTitle: true,
          title: Text(
            "Add Service Page",
            style: Theme.of(context).textTheme.displayMedium!.copyWith(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.navigate_before,
              color: Colors.white,
            ),
          ),
          actions: [
            TextButton.icon(
              onPressed: () {
                pushNewScreenWithRouteSettings(
                  context,
                  settings: const RouteSettings(name: PickCity.routeName),
                  screen: const PickCity(),
                  withNavBar: true,
                  pageTransitionAnimation: PageTransitionAnimation.cupertino,
                );
                // Navigator.of(context).pushNamed(PickCity.routeName);
              },
              icon: const Icon(
                Icons.maps_home_work,
                size: 10,
                color: Colors.white,
              ),
              label: Text(
                "${pm.locality}",
                style: Theme.of(context).textTheme.displaySmall!.copyWith(
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                    ),
              ),
              style: const ButtonStyle(
                  // fixedSize: MaterialStateProperty.all(Size(32, 2)),
                  ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(12),
          child: Column(
            children: [
              inputBar("Service Name", context),
              Wrap(
                children: [
                  Text(
                    "Service Category",
                    style: Theme.of(context).textTheme.displayMedium!.copyWith(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 7, bottom: 12, right: 8),
                    decoration: BoxDecoration(
                      border: Border.all(width: 0.2),
                    ),
                    padding: const EdgeInsets.only(left: 8),
                    child: TextFormField(
                      readOnly: true,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "Select Category",
                      ),
                    ),
                  ),
                ],
              ),
              inputBar("Service Specification", context),
              inputBar("Time Taken for Completion", context),
              inputBar("Actual Price", context),
              inputBar("Discounted Price", context),
              Text(
                "Add Photos",
                style: Theme.of(context).textTheme.displayMedium!.copyWith(
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
              ),
              InkWell(
                onTap: selectImage1,
                child: Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 9,
                  ),
                  height: 75,
                  width: 75,
                  decoration: BoxDecoration(
                    border: Border.all(width: 0.8),
                  ),
                  child: image1marker
                      ? Image.file(
                          image1!,
                          fit: BoxFit.cover,
                        )
                      : const Icon(Icons.add),
                ),
              ),
              Container(
                height: size.height * 0.05,
                margin: const EdgeInsets.symmetric(vertical: 5),
                decoration: BoxDecoration(
                  border: Border.all(width: 0.1),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total : ",
                        style:
                            Theme.of(context).textTheme.displayMedium!.copyWith(
                                  fontSize: 12,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                ),
                      ),
                      Text("Rs. 4000"),
                    ],
                  ),
                ),
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(size.width * 0.8, size.height * 0.05),
                    primary: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(2),
                    ),
                    alignment: AlignmentDirectional.center,
                  ),
                  child: Text(
                    "Add Service",
                    style: Theme.of(context).textTheme.displayMedium!.copyWith(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
