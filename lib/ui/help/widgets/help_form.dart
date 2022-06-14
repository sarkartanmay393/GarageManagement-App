import 'package:flutter/material.dart';

class HelpForm extends StatelessWidget {
  HelpForm({Key? key}) : super(key: key);

  final _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 0.2),
                ),
                margin: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 5,
                ),
                // padding: const EdgeInsets.symmetric(vertical: 16),
                height: size.height * 0.045,
                child: TextFormField(
                  decoration: const InputDecoration(
                    hintText: "Enter your Name",
                    hintStyle: TextStyle(fontSize: 12),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 12,
                    ),
                  ),
                  onSaved: (val) {
                    // ProfileInfo["Person Name"] = val!;
                  },
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
                height: size.height * 0.045,
                child: TextFormField(
                  onSaved: (val) {
                    if (val != null) {
                      // ProfileInfo['Email'] = val;
                    }
                  },
                  validator: (val) {
                    if (!RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(val!)) {
                      return "Enter valid email.";
                    }
                    return null;
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    hintText: "Enter Email",
                    hintStyle: TextStyle(fontSize: 12),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 12,
                    ),
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
                height: size.height * 0.045,
                child: TextFormField(
                  validator: ((value) {
                    return null;
                  }),
                  onSaved: (val) {
                    if (val != null) {
                      // ProfileInfo['Phone'] = val;
                    }
                  },
                  decoration: const InputDecoration(
                    hintText: "Subject",
                    hintStyle: TextStyle(fontSize: 12),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 12,
                    ),
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
                  keyboardType: TextInputType.multiline,
                  onSaved: (val) {
                    if (val != null) {
                      // ProfileInfo['Garage Name'] = val;
                    }
                  },
                  validator: (val) {
                    return null;
                  },
                  decoration: const InputDecoration(
                    hintText: "Write your Message here",
                    hintStyle: TextStyle(fontSize: 12),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 12,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 12.0, right: 12.0),
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              primary: Colors.red,
              fixedSize: Size(size.width, 18),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            child: const Text(
              "Submit",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 12,
        ),
      ],
    );
  }
}
