import 'package:flutter/material.dart';

class Edit extends StatefulWidget {
  static const routeName = "Edit";
  final void Function()? setterState;
  Edit(this.setterState, {Key? key}) : super(key: key);

  @override
  State<Edit> createState() => _EditState();
}

class _EditState extends State<Edit> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 16,
          ),
          child: Row(
            children: [
              IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios_new_outlined,
                ),
                iconSize: 16,
                onPressed: widget.setterState,
              ),
              const SizedBox(
                width: 12,
              ),
              const Text(
                "Fill details",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
