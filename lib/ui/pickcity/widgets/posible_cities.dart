import 'package:bee/state/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PossibleCities extends StatelessWidget {
  PossibleCities({Key? key}) : super(key: key);

  List<City> availbleCities = [];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    availbleCities = Provider.of<InfoFlower>(context, listen: false).cities;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      height: size.height - 350,
      child: GridView.builder(
        // physics: NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
        ),
        itemBuilder: (_, i) => Card(
          child: InkWell(
            onTap: () {
              Provider.of<InfoFlower>(context, listen: false)
                  .manualLocationSet();
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
              ),
              margin: const EdgeInsets.all(6),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 45,
                    child: Image.network(availbleCities[i].imgLink),
                  ),
                  Text(availbleCities[i].name),
                ],
              ),
            ),
          ),
        ),
        itemCount: availbleCities.length,
      ),
    );
  }
}
