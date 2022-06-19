import 'package:flutter/material.dart';

import '../../../helper/formBarMaker.dart';

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
              FormBar.inputBar(
                name: "your name",
                context: context,
                onSaveStorage: "",
                initVal: "",
              ),
              FormBar.inputBar(
                name: "your email",
                context: context,
                onSaveStorage: "",
                initVal: "",
              ),
              FormBar.inputBar(
                name: "Subject",
                context: context,
                onSaveStorage: "",
                initVal: "",
                // readOnlyRef: true,
              ),
              FormBar.inputBar(
                name: "your message here",
                context: context,
                onSaveStorage: "",
                initVal: "",
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
              fixedSize: Size(size.width * 0.95, size.height * 0.05),
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
          height: 18,
        ),
      ],
    );
  }
}
