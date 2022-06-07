import 'package:flutter/material.dart';

class Services extends StatelessWidget {
  const Services({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 14,
        ),
        const Text(
          "Services",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(
          height: 2,
        ),
        Container(
          margin: EdgeInsets.all(4),
          height: 250,
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5,
            ),
            itemBuilder: (_, i) => InkWell(
              borderRadius: BorderRadius.circular(20),
              onTap: () {},
              child: Card(
                elevation: 2.8,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  margin: EdgeInsets.all(6),
                  // color: Colors.amber,
                  child: Column(
                    children: [
                      Container(
                        height: 14,
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8),
                            topRight: Radius.circular(8),
                          ),
                          color: Colors.red,
                        ),
                        // color: Colors.red,
                        child: const FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            "Lorem S",
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            itemCount: 12,
          ),
        ),
      ],
    );
  }
}
