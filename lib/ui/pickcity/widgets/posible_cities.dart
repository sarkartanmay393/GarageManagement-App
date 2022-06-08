import 'package:flutter/material.dart';

class PossibleCities extends StatelessWidget {
  const PossibleCities({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      height: size.height - 2 * (size.height * 0.07) - 100,
      child: GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
        ),
        itemBuilder: (_, i) => Card(
          child: InkWell(
            onTap: () {},
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
              ),
              margin: EdgeInsets.all(6),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FittedBox(
                    child: Container(
                      child: Image.network("src"),
                    ),
                  ),
                  Text("Dhupguri"),
                ],
              ),
            ),
          ),
        ),
        itemCount: 12,
      ),
    );
  }
}
