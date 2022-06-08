import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:navigation_history_observer/navigation_history_observer.dart';

import 'widgets/topcontainer.dart';

class VanProfilePage extends StatefulWidget {
  static const routeName = "VanProfilePage";

  const VanProfilePage({Key? key}) : super(key: key);

  @override
  State<VanProfilePage> createState() => _VanProfilePageState();
}

class _VanProfilePageState extends State<VanProfilePage> {
  NavigationHistoryObserver navHistory = NavigationHistoryObserver();

  bool currentEditState = false;
  bool fromCheck = false;

  void setterState() {
    setState(() {
      currentEditState = !currentEditState;
    });
  }

  Map<String, String> ProfileInfo = {
    "Driver Name": "",
    "Driver Phone": "",
    "Owner Name": "",
    "Owner Phone": "",
    "Owner License": "",
    "Gender": "",
    "Birthday": "",
    "Email": "dumydata@tanmay.com",
  };

  final _picker = ImagePicker();

  XFile? profileImage;
  void profileImageSelecter() async {
    var dp = await _picker.pickImage(source: ImageSource.gallery);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          "Profile Picture Updated !",
          style: Theme.of(context).textTheme.displaySmall!.copyWith(
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
        ),
        elevation: 2,
        duration: Duration(milliseconds: 1500),
      ),
    );
    // showing snackbar code.
    setState(() {
      if (dp != null) profileImage = dp;
    });
  }

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

  final _formKey = GlobalKey<FormState>();

  void FormSaver() {
    // _formKey.currentState?.validate();
    _formKey.currentState!.save();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          "Details Updated !",
          style: Theme.of(context).textTheme.displaySmall!.copyWith(
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
        ),
        elevation: 2,
        duration: const Duration(milliseconds: 1500),
      ),
    );
    // showing snackbar code.
    setState(() {
      fromCheck = false;
      setterState();
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return currentEditState
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
                          child: IconButton(
                            splashColor: Colors.red,
                            icon: const Icon(
                              Icons.arrow_back_ios_new_outlined,
                            ),
                            iconSize: 12,
                            onPressed: setterState,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.04,
                      ),
                      const Text(
                        "Fill details",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500),
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
                      Padding(
                        padding:
                            EdgeInsets.only(left: size.width * 0.05, bottom: 2),
                        child: const Text(
                          "Driver Name",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(width: 0.2),
                        ),
                        margin: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 5,
                        ),
                        // padding: const EdgeInsets.symmetric(vertical: 16),
                        height: size.height * 0.065,
                        child: TextFormField(
                          decoration: const InputDecoration(
                            hintText: "Tanmay Sarkar",
                            hintStyle: TextStyle(fontSize: 14),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 12,
                              horizontal: 12,
                            ),
                          ),
                          onSaved: (val) {
                            if (val != null) {
                              ProfileInfo['Driver Name'] = val;
                            }
                          },
                          validator: (val) {
                            return null;
                          },
                          initialValue: ProfileInfo["Driver Name"],
                        ),
                      ),

                      //
                      const Padding(
                        padding: EdgeInsets.only(
                          left: 18,
                          bottom: 2,
                          top: 8,
                        ),
                        child: Text(
                          "Driver Phone Number",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(width: 0.2),
                        ),
                        margin: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 5,
                        ),
                        // padding: const EdgeInsets.symmetric(vertical: 16),
                        height: size.height * 0.065,
                        child: TextFormField(
                          onSaved: (val) {
                            if (val != null) {
                              ProfileInfo['Driver Phone'] = val;
                            }
                          },
                          validator: (_) {
                            return null;
                          },
                          initialValue: ProfileInfo["Driver Phone"],
                          decoration: const InputDecoration(
                            hintText: "",
                            hintStyle: TextStyle(fontSize: 14),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 12,
                              horizontal: 12,
                            ),
                          ),
                        ),
                      ),

                      const Padding(
                        padding: EdgeInsets.only(
                          left: 18,
                          bottom: 2,
                          top: 8,
                        ),
                        child: Text(
                          "Owner Name",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(width: 0.2),
                        ),
                        margin: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 5,
                        ),
                        // padding: const EdgeInsets.symmetric(vertical: 16),
                        height: size.height * 0.065,
                        child: TextFormField(
                          onSaved: (val) {
                            if (val != null) {
                              ProfileInfo['Owner Name'] = val;
                            }
                          },
                          initialValue: ProfileInfo["Onwer Name"],
                          keyboardType: TextInputType.name,
                          decoration: const InputDecoration(
                            hintText: "",
                            hintStyle: TextStyle(fontSize: 14),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 12,
                              horizontal: 12,
                            ),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(
                          left: 18,
                          bottom: 2,
                          top: 8,
                        ),
                        child: Text(
                          "Owner Phone Number",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(width: 0.2),
                        ),
                        margin: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 5,
                        ),
                        // padding: const EdgeInsets.symmetric(vertical: 16),
                        height: size.height * 0.065,
                        child: TextFormField(
                          onSaved: (val) {
                            if (val != null) {
                              ProfileInfo['Owner Phone'] = val;
                            }
                          },
                          validator: (_) {
                            return null;
                          },
                          initialValue: ProfileInfo["Owner Phone"],
                          decoration: const InputDecoration(
                            hintText: "",
                            hintStyle: TextStyle(fontSize: 14),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 12,
                              horizontal: 12,
                            ),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(
                          left: 18,
                          bottom: 2,
                          top: 8,
                        ),
                        child: Text(
                          "Owner Driving License",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(width: 0.2),
                        ),
                        margin: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 5,
                        ),
                        // padding: const EdgeInsets.symmetric(vertical: 16),
                        height: size.height * 0.065,
                        child: TextFormField(
                          decoration: const InputDecoration(
                            hintText: "",
                            hintStyle: TextStyle(fontSize: 14),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 12,
                              horizontal: 12,
                            ),
                          ),
                          onSaved: (val) {
                            if (val != null) {
                              ProfileInfo['Owner License'] = val;
                            }
                          },
                          validator: (val) {
                            return null;
                          },
                          initialValue: ProfileInfo["Owner License"],
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
                          "Upload RC Image",
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
                          "Upload Vehicle Image",
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
                  onPressed: FormSaver,
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.red),
                    fixedSize: MaterialStateProperty.all(const Size(350, 12)),
                  ),
                  child: const Text(
                    "Update",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
              ],
            ),
          )
        : Column(
            children: [
              // const SizedBox(
              //   height: 8,
              // ),
              TopContainer(
                profileImageSelecter: profileImageSelecter,
                profileImage: profileImage,
              ),
              Column(
                //padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
                children: [
                  ListTile(
                    leading: const Icon(
                      Icons.car_crash_outlined,
                      color: Colors.red,
                    ),
                    title: const Text(
                      "Driver Name",
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
                            ProfileInfo['Driver Name']!,
                          ),
                          const Icon(Icons.navigate_next_outlined)
                        ],
                      ),
                    ),
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.question_mark_rounded,
                      color: Colors.red,
                    ),
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
                            ProfileInfo['Gender']!,
                          ),
                          const Icon(Icons.navigate_next_outlined)
                        ],
                      ),
                    ),
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.date_range_outlined,
                      color: Colors.red,
                    ),
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
                            ProfileInfo['Birthday']!,
                          ),
                          const Icon(Icons.navigate_next_outlined)
                        ],
                      ),
                    ),
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.email_outlined,
                      color: Colors.red,
                    ),
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
                            ProfileInfo['Email']!,
                          ),
                          const Icon(Icons.navigate_next_outlined)
                        ],
                      ),
                    ),
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.phone_callback_outlined,
                      color: Colors.red,
                    ),
                    title: const Text(
                      "Driver Number",
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
                            ProfileInfo['Driver Phone']!,
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
                          tapTargetSize: MaterialTapTargetSize.padded),
                    ),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  InkWell(
                    onTap: () {},
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
                        onPressed: () {},
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
          );
  }
}
