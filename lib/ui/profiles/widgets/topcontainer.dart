import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class TopContainer extends StatelessWidget {
  Function profileImageSelecter;
  XFile? profileImage;
  TopContainer({
    Key? key,
    required this.profileImageSelecter,
    required this.profileImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 190,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.white, Colors.red],
          stops: [0.49, 0.0],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      // color: Colors.red,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextButton.icon(
            onPressed: () {
              // if (Navigator.of(context).canPop())
              //   Navigator.of(context).pop();
            },
            icon: const Icon(Icons.navigate_before_outlined),
            label: const Text("Account Details"),
            style: ButtonStyle(
              tapTargetSize: MaterialTapTargetSize.padded,
              foregroundColor: MaterialStateProperty.all(Colors.grey.shade800),
            ),
          ),
          Center(
            child: Column(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.black,
                  radius: 45,
                  child: CircleAvatar(
                    radius: 43.5,
                    backgroundColor: Colors.white,
                    backgroundImage: profileImage != null
                        ? FileImage(File(profileImage!.path))
                        : null,
                    child: Stack(
                      children: [
                        Positioned(
                          bottom: -12,
                          right: -12,
                          child: IconButton(
                            color: Colors.white,
                            highlightColor: Colors.amber,
                            splashColor: Colors.red,
                            tooltip: "Change Profile Picture",
                            onPressed: () {
                              profileImageSelecter();
                              // image selecter func.
                            },
                            icon: const Icon(
                              Icons.camera_alt_sharp,
                              size: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
