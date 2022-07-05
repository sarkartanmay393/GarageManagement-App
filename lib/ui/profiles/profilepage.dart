import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';


import '../../state/provider.dart';
import '../auth/login/login.dart';
import '../menu/menu.dart';
import '../notification/notifications.dart';
import '../pickcity/pick_city.dart';
import 'widgets/topcontainer.dart';

class ProfilePage extends StatefulWidget {
  static const routeName = "ProfilePage";

  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _authInstance = FirebaseAuth.instance;
  bool currentEditState = false;
  bool _isLoading = false;

  void setterState() {
    setState(() {
      currentEditState = !currentEditState;
    });
  }

  // Map<String, String> infoFlow.profileInformationsGR = {
  String GarageName = "";
  String PersonName = "";
  String Gender = "";
  String Birthday = "";
  String Email = "";
  String Phone = "";
  String GarageRegistetrationNumber = "";
  String GarageAddress = "";
  String State = "";
  String City = "";
  // };

  final _picker = ImagePicker();

  XFile? profileImage;
  void profileImageSelecter() async {
    var dp = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (dp != null) profileImage = dp;
    });
  }

  // I used unique func for each image selection.

  File? image1;
  bool image1marker = false;
  void selectImage1() async {
    var img = await _picker.pickImage(
      source: ImageSource.gallery,
    );
    setState(() {
      if (img != null) {
        image1 = File(img.path);
        print(img.path);
        image1marker = true;
      }
    });
  }

  File? image2;
  bool image2marker = false;
  void selectImage2() async {
    var img = await _picker.pickImage(
      source: ImageSource.gallery,
    );
    setState(() {
      if (img != null) {
        image2 = File(img.path);
        image2marker = true;
      }
    });
  }

  File? image3;
  bool image3marker = false;
  void selectImage3() async {
    var img = await _picker.pickImage(
      source: ImageSource.gallery,
    );
    setState(() {
      if (img != null) {
        image3 = File(img.path);
        image3marker = true;
      }
    });
  }
  // Image Selection Upto //

  final _formKey = GlobalKey<FormState>();

  void formSaver() {
    // _formKey.currentState?.validate();
    _formKey.currentState!.save();

    // push the new values in InfoFlow provider.
    var providerInstance = Provider.of<InfoFlower>(context, listen: false);
    providerInstance.addValueTowingVan(key: "GarageName", val: GarageName);
    providerInstance.addValueTowingVan(key: "PersonName", val: PersonName);
    providerInstance.addValueTowingVan(key: "Gender", val: Gender);
    providerInstance.addValueTowingVan(key: "Birthday", val: Birthday);
    providerInstance.addValueTowingVan(key: "Email", val: Email);
    providerInstance.addValueTowingVan(key: "Phone", val: Phone);
    providerInstance.addValueTowingVan(
        key: "GarageRegistetrationNumber", val: GarageRegistetrationNumber);
    providerInstance.addValueTowingVan(
        key: "GarageAddress", val: GarageAddress);
    providerInstance.addValueTowingVan(key: "State", val: State);
    providerInstance.addValueTowingVan(key: "City", val: City);
    //

    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: SizedBox(
          height: 22,
          child: Center(
            child: Text(
              "Details Updated",
              style: Theme.of(context).textTheme.displaySmall!.copyWith(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
            ),
          ),
        ),
        elevation: 0,
        duration: const Duration(milliseconds: 1500),
      ),
    );
    // showing snackbar code.
    setState(() {
      setterState();
    });
  }

  final _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // var infoFlow = Provider.of<InfoFlower>(context);
    return FutureBuilder(
      future: Future.delayed(const Duration(milliseconds: 100), () async {
        // push the new values in InfoFlow provider.
        var providerInstance = Provider.of<InfoFlower>(context, listen: false);
        if (providerInstance.profileInfoTowingVan("GarageName").length > 1) {
          GarageName = providerInstance.profileInfoTowingVan("GarageName");
        }
        if (providerInstance.profileInfoTowingVan("PersonName").length > 1) {
          PersonName = providerInstance.profileInfoTowingVan("PersonName");
        }
        if (providerInstance.profileInfoTowingVan("Gender").length > 1) {
          Gender = providerInstance.profileInfoTowingVan("Gender");
        }
        if (providerInstance.profileInfoTowingVan("Birthday").length > 1) {
          Birthday = providerInstance.profileInfoTowingVan("Birthday");
        }
        if (providerInstance.profileInfoTowingVan("Email").length > 1) {
          Email = providerInstance.profileInfoTowingVan("Email");
        }
        if (providerInstance.profileInfoTowingVan("Phone").length > 1) {
          Phone = providerInstance.profileInfoTowingVan("Phone");
        }
        if (providerInstance.profileInfoTowingVan("Birthday").length > 1) {
          Birthday = providerInstance.profileInfoTowingVan("Birthday");
        }
        if (providerInstance
                .profileInfoTowingVan("GarageRegistetrationNumber")
                .length >
            1) {
          GarageRegistetrationNumber = providerInstance
              .profileInfoTowingVan("GarageRegistetrationNumber");
        }
        if (providerInstance.profileInfoTowingVan("GarageAddress").length > 1) {
          GarageAddress =
              providerInstance.profileInfoTowingVan("GarageAddress");
        }
        if (providerInstance.profileInfoTowingVan("City").length > 1) {
          City = providerInstance.profileInfoTowingVan("City");
        }
        if (providerInstance.profileInfoTowingVan("State").length > 1) {
          State = providerInstance.profileInfoTowingVan("State");
        } //
      }),
      builder: (ctx, ss) => ss.connectionState == ConnectionState.waiting
          ? const Center(
              child: CircularProgressIndicator(
                strokeWidth: 3.5,
                semanticsLabel: "Waiting for Location",
              ),
            )
          : Scaffold(
              key: _key,
              appBar: PreferredSize(
                preferredSize: Size(double.infinity, size.height * 0.07),
                child: AppBar(
                  backgroundColor: Colors.red,
                  title: Row(
                    children: [
                      Text(
                        "BEE",
                        style:
                            Theme.of(context).textTheme.displayMedium!.copyWith(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                      ),
                      Consumer<InfoFlower>(
                        builder: (ctx, infoFlow, _) => IconButton(
                          onPressed: () {
                            // Navigator.of(context).popUntil(ModalRoute.withName("/"));
                            // Navigator.of(context).popUntil(
                            //     (route) => route.settings.name == "ScreenToPopBackTo");
                            pushNewScreenWithRouteSettings(
                              context,
                              settings: const RouteSettings(
                                  name: Notifications.routeName),
                              screen: const Notifications(),
                              withNavBar: true,
                              pageTransitionAnimation:
                                  PageTransitionAnimation.cupertino,
                            );
                            // Navigator.of(context).push(
                            //   MaterialPageRoute(builder: (ctx) => Notifications()),
                            // );
                          },
                          icon: infoFlow.notificationCount != 0
                              ? const Icon(Icons.notifications_active_outlined)
                              : const Icon(Icons.notifications_none_outlined),
                          color: Colors.white,
                          iconSize: 20,
                          tooltip: "Notifications",
                        ),
                      ),
                    ],
                  ),
                  leading: IconButton(
                    onPressed: () {
                      _key.currentState!.openDrawer();
                    },
                    icon: const Icon(
                      Icons.menu_rounded,
                      color: Colors.white,
                    ),
                  ),
                  actions: [
                    Consumer<InfoFlower>(
                      builder: (ctx, infoFlow, _) => TextButton.icon(
                        onPressed: () {
                          pushNewScreenWithRouteSettings(
                            context,
                            settings:
                                const RouteSettings(name: PickCity.routeName),
                            screen: const PickCity(),
                            withNavBar: true,
                            pageTransitionAnimation:
                                PageTransitionAnimation.cupertino,
                          );
                          // Navigator.of(context).pushNamed(PickCity.routeName);
                        },
                        icon: const Icon(
                          Icons.maps_home_work,
                          size: 12,
                          color: Colors.white,
                        ),
                        label: Text(
                          infoFlow.currentLocation.locality!,
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall!
                              .copyWith(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                        ),
                        style: const ButtonStyle(
                            // fixedSize: MaterialStateProperty.all(Size(32, 2)),
                            ),
                      ),
                    ),
                  ],
                ),
              ),
              drawer: const Menu(),
              body: (currentEditState)
                  ? SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(
                              horizontal: size.width * 0.05,
                              vertical: size.height * 0.02,
                            ),
                            child: Row(
                              children: [
                                SizedBox(
                                  height: size.width * 0.1,
                                  width: size.height * 0.053,
                                  child: Card(
                                    elevation: 0,
                                    color: Colors.black45,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      side: const BorderSide(
                                        color: Colors.black45,
                                        width: 1.2,
                                      ),
                                    ),
                                    child: IconButton(
                                      splashColor: Colors.red,
                                      icon: const Icon(
                                        Icons.arrow_back_ios_new_outlined,
                                        color: Colors.white,
                                        shadows: [
                                          Shadow(
                                            color: Colors.white,
                                            blurRadius: 12,
                                            offset: Offset(1, 1),
                                          ),
                                        ],
                                      ),
                                      iconSize: 12,
                                      onPressed: setterState,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: size.width * 0.04,
                                ),
                                Text(
                                  "Fill details",
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium!
                                      .copyWith(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ],
                            ),
                          ),
                          Form(
                            key: _formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                //
                                Container(
                                  margin: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 2,
                                  ),
                                  child: inputBarWithLabel(
                                    context: context,
                                    initVal: PersonName,
                                    name: "Full Name",
                                    onSaved: (String value) {
                                      PersonName = value;
                                    },
                                  ),
                                ),

                                Container(
                                  margin: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 2,
                                  ),
                                  child: inputBarWithLabel(
                                    context: context,
                                    initVal: Phone,
                                    name: "Phone Number",
                                    onSaved: (String value) {
                                      Phone = value;
                                    },
                                  ),
                                ),

                                //
                                Container(
                                  margin: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 2,
                                  ),
                                  child: inputBarWithLabel(
                                    context: context,
                                    initVal: Email,
                                    name: "Email Address",
                                    onSaved: (String value) {
                                      Email = value;
                                    },
                                  ),
                                ),
                                //
                                Container(
                                  margin: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 2,
                                  ),
                                  child: inputBarWithLabel(
                                    context: context,
                                    initVal: GarageName,
                                    name: "Garage Name",
                                    onSaved: (String value) {
                                      GarageName = value;
                                    },
                                  ),
                                ),
                                //
                                Container(
                                  margin: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 2,
                                  ),
                                  child: inputBarWithLabel(
                                    context: context,
                                    initVal: GarageRegistetrationNumber,
                                    name: "Garage Registetration Number",
                                    onSaved: (String value) {
                                      GarageRegistetrationNumber = value;
                                    },
                                  ),
                                ),
                                //
                                Container(
                                  margin: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 2,
                                  ),
                                  child: inputBarWithLabel(
                                    context: context,
                                    initVal: GarageAddress,
                                    name: "Garage Address",
                                    onSaved: (String value) {
                                      GarageAddress = value;
                                    },
                                  ),
                                ),
                                //
                                Container(
                                  margin: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 2,
                                  ),
                                  child: inputBarWithLabel(
                                    context: context,
                                    initVal: State,
                                    name: "State",
                                    onSaved: (String value) {
                                      State = value;
                                    },
                                  ),
                                ),
                                //
                                Container(
                                  margin: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 2,
                                  ),
                                  child: inputBarWithLabel(
                                    context: context,
                                    initVal: City,
                                    name: "City",
                                    onSaved: (String value) {
                                      City = value;
                                    },
                                  ),
                                ),

                                // Image Inputs

                                const Padding(
                                  padding: EdgeInsets.only(
                                    left: 18,
                                    bottom: 2,
                                    top: 8,
                                  ),
                                  child: Text(
                                    "Add Garage Image",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                // image row
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 10,
                                    top: 5,
                                  ),
                                  child: Row(
                                    children: [
                                      InkWell(
                                        onTap: selectImage1,
                                        child: Container(
                                          margin: const EdgeInsets.symmetric(
                                            vertical: 2,
                                            horizontal: 5,
                                          ),
                                          height: 75,
                                          width: 75,
                                          decoration: BoxDecoration(
                                            border: Border.all(width: 0.8),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          child: image1marker
                                              ? Image.file(
                                                  image1!,
                                                  fit: BoxFit.cover,
                                                )
                                              : const Icon(Icons.add),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: selectImage2,
                                        child: Container(
                                          margin: const EdgeInsets.symmetric(
                                            vertical: 2,
                                            horizontal: 5,
                                          ),
                                          height: 75,
                                          width: 75,
                                          decoration: BoxDecoration(
                                            border: Border.all(width: 0.8),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          child: image2marker
                                              ? Image.file(
                                                  image2!,
                                                  fit: BoxFit.cover,
                                                )
                                              : const Icon(Icons.add),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: selectImage3,
                                        child: Container(
                                          margin: const EdgeInsets.symmetric(
                                            vertical: 2,
                                            horizontal: 5,
                                          ),
                                          height: 75,
                                          width: 75,
                                          decoration: BoxDecoration(
                                            border: Border.all(width: 0.8),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          child: image3marker
                                              ? Image.file(
                                                  image1!,
                                                  fit: BoxFit.cover,
                                                )
                                              : const Icon(Icons.add),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                // extras
                                const Padding(
                                  padding: EdgeInsets.only(
                                    left: 18,
                                    bottom: 2,
                                    top: 8,
                                  ),
                                  child: Text(
                                    "Add Documents",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 10,
                                    top: 5,
                                  ),
                                  child: Row(
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.symmetric(
                                          vertical: 2,
                                          horizontal: 5,
                                        ),
                                        height: 75,
                                        width: 75,
                                        decoration: BoxDecoration(
                                          border: Border.all(width: 0.8),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: const Icon(Icons.add),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.symmetric(
                                          vertical: 2,
                                          horizontal: 5,
                                        ),
                                        height: 75,
                                        width: 75,
                                        decoration: BoxDecoration(
                                          border: Border.all(width: 0.8),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: const Icon(Icons.add),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.symmetric(
                                          vertical: 2,
                                          horizontal: 5,
                                        ),
                                        height: 75,
                                        width: 75,
                                        decoration: BoxDecoration(
                                          border: Border.all(width: 0.8),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: const Icon(Icons.add),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          ElevatedButton(
                            onPressed: formSaver,
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.red),
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              fixedSize: MaterialStateProperty.all(Size(
                                size.width * 0.85,
                                size.height * 0.05,
                              )),
                            ),
                            child: const Text(
                              "Update",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 22,
                          ),
                        ],
                      ),
                    )
                  : Column(
                      children: [
                        TopContainer(
                          profileImageSelecter: profileImageSelecter,
                          profileImage: profileImage,
                        ),
                        Column(
                          //padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
                          children: [
                            ListTile(
                              leading: const Icon(Icons.car_crash_outlined),
                              title: const Text(
                                "Garage Name",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black87,
                                ),
                              ),
                              trailing: InkWell(
                                onTap: setterState,
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      GarageName,
                                    ),
                                    const Icon(Icons.navigate_next_outlined)
                                  ],
                                ),
                              ),
                            ),
                            ListTile(
                              leading: const Icon(Icons.question_mark_rounded),
                              title: const Text(
                                "Gender",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black87,
                                ),
                              ),
                              trailing: InkWell(
                                onTap: setterState,
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      Gender,
                                    ),
                                    const Icon(Icons.navigate_next_outlined)
                                  ],
                                ),
                              ),
                            ),
                            ListTile(
                              leading: const Icon(Icons.date_range_outlined),
                              title: const Text(
                                "Birthdate",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black87,
                                ),
                              ),
                              trailing: InkWell(
                                onTap: setterState,
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      Birthday,
                                    ),
                                    const Icon(Icons.navigate_next_outlined)
                                  ],
                                ),
                              ),
                            ),
                            ListTile(
                              leading: const Icon(Icons.email_outlined),
                              title: const Text(
                                "Email",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black87,
                                ),
                              ),
                              trailing: InkWell(
                                onTap: setterState,
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      Email,
                                    ),
                                    const Icon(Icons.navigate_next_outlined)
                                  ],
                                ),
                              ),
                            ),
                            ListTile(
                              leading:
                                  const Icon(Icons.phone_callback_outlined),
                              title: const Text(
                                "Phone Number",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black87,
                                ),
                              ),
                              trailing: InkWell(
                                onTap: setterState,
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      Phone,
                                    ),
                                    const Icon(Icons.navigate_next_outlined)
                                  ],
                                ),
                              ),
                            ),
                            Center(
                              child: TextButton.icon(
                                label: const Text(
                                  "Edit",
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                                onPressed: setterState,
                                icon: const Icon(
                                  Icons.edit_outlined,
                                  color: Colors.black,
                                ),
                                style: const ButtonStyle(
                                    tapTargetSize:
                                        MaterialTapTargetSize.padded),
                              ),
                            ),
                            SizedBox(
                              height: size.height * 0.015,
                            ),
                            InkWell(
                              onTap: () async {
                                setState(() {
                                  _isLoading = true;
                                });
                                _authInstance.signOut();
                                //.then((value) {
                                //Navigator.of(context).pushNamed(LoginPage.routeName);
                                //});
                              },
                              child: Container(
                                margin: const EdgeInsets.symmetric(
                                  vertical: 2,
                                  horizontal: 18,
                                ),
                                decoration: BoxDecoration(
                                  border: Border.all(width: 1),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                width: double.infinity,
                                height: 50,
                                child: TextButton.icon(
                                  onPressed: () async {
                                    setState(() {
                                      _isLoading = true;
                                    });
                                    _authInstance.signOut().then(
                                          (value) => pushNewScreen(context,
                                              screen: const LoginPage()),
                                        );
                                    //.then((value) {
                                    //Navigator.of(context).pushNamed(LoginPage.routeName);
                                    //});
                                  },
                                  icon: const Icon(
                                    Icons.logout_outlined,
                                    color: Colors.red,
                                  ),
                                  label: const Text(
                                    "Logout",
                                    style: TextStyle(color: Colors.red),
                                  ),
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

  Widget inputBarWithLabel({
    required String name,
    required BuildContext context,
    required Function onSaved,
    required String initVal,
    bool? readOnlyRef,
    bool? autoFocusRef,
    TextInputType? keyboardTypeRef,
  }) {
    return Wrap(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 4.0),
          child: Text(
            name,
            style: Theme.of(context).textTheme.displayMedium!.copyWith(
                  fontSize: 15,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 8, bottom: 12, right: 8),
          decoration: BoxDecoration(
            border: Border.all(width: 0.2),
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.only(left: 8),
          child: TextFormField(
            onSaved: (val) => onSaved(val),
            validator: (val) {
              return null;
            },
            readOnly: readOnlyRef != null ? true : false,
            initialValue: initVal,
            autofocus: autoFocusRef != null ? true : false,
            keyboardType: keyboardTypeRef,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "Enter $name",
              hintStyle: Theme.of(context).textTheme.displayMedium!.copyWith(
                    fontSize: 14,
                    color: Colors.black54,
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ),
        ),
      ],
    );
  }
}
