import 'package:flutter/material.dart';

class DetectCity extends StatelessWidget {
  const DetectCity({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Color.fromARGB(21, 81, 81, 80),
      onTap: () {},
      child: Container(
          margin: const EdgeInsets.symmetric(
            vertical: 12,
            horizontal: 16,
          ),
          child: Row(
            children: [
              const Icon(Icons.location_searching),
              const SizedBox(
                width: 13,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Detect My City",
                    style: Theme.of(context).textTheme.displayMedium!.copyWith(
                          color: const Color.fromARGB(212, 0, 0, 0),
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                  ),
                  Text(
                    "USING GPS",
                    style: Theme.of(context).textTheme.displayMedium!.copyWith(
                          color: const Color.fromARGB(194, 42, 41, 41),
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
