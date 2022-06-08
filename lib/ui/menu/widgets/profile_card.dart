import 'package:flutter/material.dart';

class ProfileCard extends StatefulWidget {
  bool isOnline;
  ProfileCard(this.isOnline, {Key? key}) : super(key: key);

  @override
  State<ProfileCard> createState() => _ProfileCardState();
}

class _ProfileCardState extends State<ProfileCard> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          margin: const EdgeInsets.only(left: 12, top: 2),
          decoration: BoxDecoration(
            color: Colors.red,
            shape: BoxShape.circle,
            boxShadow: const [
              BoxShadow(
                blurRadius: 4,
                color: Color.fromARGB(177, 34, 34, 33),
                spreadRadius: 1.2,
              )
            ],
            border: Border.all(
              width: 0.1,
            ),
          ),
          child: const CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(
              "https://avatars.githubusercontent.com/u/84321236?v=4",
            ),
          ),
        ),
        SizedBox(
          width: size.width * 0.035,
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Tanmay Sarkar",
              style: Theme.of(context).textTheme.displaySmall!.copyWith(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              "+91 9234789432",
              style: Theme.of(context).textTheme.displaySmall!.copyWith(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
            )
          ],
        ),
        SizedBox(
          width: size.width * 0.02,
        ),
        TextButton.icon(
          onPressed: () {
            setState(() {
              widget.isOnline = !widget.isOnline;
            });
          },
          icon: widget.isOnline
              ? const Icon(
                  Icons.circle_rounded,
                  color: Colors.green,
                  size: 12,
                )
              : const Icon(
                  Icons.circle_outlined,
                  color: Colors.grey,
                  size: 12,
                ),
          label: Text(
            widget.isOnline ? "Online" : "Offline",
            style: Theme.of(context).textTheme.displaySmall!.copyWith(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
          ),
        )
      ],
    );
  }
}
