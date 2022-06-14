import 'package:flutter/material.dart';

class Weekly extends StatelessWidget {
  Weekly({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      child: Text("Weekly"),
    );
  }
}
