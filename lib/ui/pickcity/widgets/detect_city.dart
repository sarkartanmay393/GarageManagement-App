import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../state/provider.dart';

class DetectCity extends StatefulWidget {
  const DetectCity({
    Key? key,
  }) : super(key: key);

  @override
  State<DetectCity> createState() => _DetectCityState();
}

class _DetectCityState extends State<DetectCity> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Consumer<InfoFlower>(
      builder: (ctx, infoFlow, _) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: _isLoading
            ? const Center(
                child: SizedBox(
                  height: 24,
                  width: double.infinity,
                  child: FittedBox(
                    child: Padding(
                      padding: EdgeInsets.only(top: 12.0),
                      child: CircularProgressIndicator(
                        strokeWidth: 3.8,
                        value: 0.8,
                      ),
                    ),
                  ),
                ),
              )
            : InkWell(
                splashColor: const Color.fromARGB(21, 81, 81, 80),
                onTap: () async {
                  // setState(() {
                  //   _isLoading = true;
                  // });
                  await infoFlow.fetchAndSetLocation();
                  // sleep(const Duration(milliseconds: 500));
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: SizedBox(
                        height: 18,
                        child: FittedBox(
                          child: Center(
                            child: Text(
                              "Fetched",
                              style: Theme.of(context)
                                  .textTheme
                                  .displaySmall!
                                  .copyWith(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                            ),
                          ),
                        ),
                      ),
                      elevation: 0,
                      duration: const Duration(milliseconds: 1500),
                    ),
                  );
                  // setState(() {
                  //   _isLoading = false;
                  // });
                },
                child: Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 16,
                    ),
                    // decoration: BoxDecoration(
                    //   borderRadius: BorderRadius.circular(8),
                    // ),
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
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium!
                                  .copyWith(
                                    color: const Color.fromARGB(212, 0, 0, 0),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                  ),
                            ),
                            Text(
                              "USING GPS",
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium!
                                  .copyWith(
                                    color:
                                        const Color.fromARGB(194, 42, 41, 41),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                  ),
                            ),
                          ],
                        ),
                        // if (!_isLoading)
                        //   const CircularProgressIndicator(
                        //     strokeWidth: 2.9,
                        //     // value: 1,
                        //   ),
                      ],
                    )),
              ),
      ),
    );
  }
}
