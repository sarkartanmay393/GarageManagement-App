import 'package:bee/ui/completed/widgets/invoice.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class cc_vehicle extends StatelessWidget {
  Size size;
  Map<String, String> info;
  cc_vehicle(this.size, this.info, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(4),
      height: size.height * 0.26,
      decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(width: 0.25)),
      child: Column(
        children: [
          Container(
            height: 22,
            padding: const EdgeInsets.only(
              top: 5,
              left: 5,
              right: 5,
              bottom: 5,
            ),
            decoration: BoxDecoration(
                color: Colors.red, borderRadius: BorderRadius.circular(6)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "SR. No",
                  style: Theme.of(context).textTheme.displaySmall!.copyWith(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                ),
                Text(
                  "Name",
                  style: Theme.of(context).textTheme.displaySmall!.copyWith(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                ),
                Text(
                  "Mobile Number",
                  style: Theme.of(context).textTheme.displaySmall!.copyWith(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                ),
                Text(
                  "Address",
                  style: Theme.of(context).textTheme.displaySmall!.copyWith(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          DottedBorder(
            color: Colors.black87,
            strokeWidth: 0.2,
            child: Container(
              height: 22,
              padding: const EdgeInsets.only(
                top: 5,
                left: 5,
                right: 5,
                bottom: 5,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    info['serialno']!,
                    style: Theme.of(context).textTheme.displaySmall!.copyWith(
                          color: Colors.black,
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  Text(
                    info['name']!,
                    style: Theme.of(context).textTheme.displaySmall!.copyWith(
                          color: Colors.black,
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  Text(
                    info['number']!,
                    style: Theme.of(context).textTheme.displaySmall!.copyWith(
                          color: Colors.black,
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  Text(
                    info['address']!,
                    style: Theme.of(context).textTheme.displaySmall!.copyWith(
                          color: Colors.black,
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                        ),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 2,
          ),
          Row(
            children: [
              DottedBorder(
                color: Colors.black12,
                strokeWidth: 0.8,
                child: Container(
                  padding: const EdgeInsets.all(2.5),
                  height: 60,
                  width: 90,
                  // color: Colors.black12,
                  child: Column(
                    children: [
                      Text(
                        'Vehicle',
                        style:
                            Theme.of(context).textTheme.displaySmall!.copyWith(
                                  color: Colors.black,
                                  fontSize: 9.8,
                                  fontWeight: FontWeight.w500,
                                ),
                      ),
                      const SizedBox(
                        height: 2.5,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            height: 35,
                            width: 45,
                            child: Image.network(info["vehicalImage"]!,
                                fit: BoxFit.fill),
                          ),
                          const SizedBox(
                            width: 2.5,
                          ),
                          Column(
                            children: [
                              Text(
                                info["vehicle"]!,
                                softWrap: true,
                                style: Theme.of(context)
                                    .textTheme
                                    .displaySmall!
                                    .copyWith(
                                      overflow: TextOverflow.clip,
                                      color: Colors.black,
                                      fontSize: 5.4,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                              Text(
                                info["type"]!,
                                softWrap: true,
                                style: Theme.of(context)
                                    .textTheme
                                    .displaySmall!
                                    .copyWith(
                                      color: Colors.black54,
                                      fontSize: 7,
                                      fontWeight: FontWeight.w400,
                                    ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 6,
              ),
              Expanded(
                child: DottedBorder(
                  color: Colors.black12,
                  strokeWidth: 0.8,
                  child: SizedBox(
                    height: 60,
                    // width: 90,
                    child: Column(
                      children: [
                        Text(
                          'Selected Service',
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall!
                              .copyWith(
                                color: Colors.black54,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                        ),
                        const Divider(height: 1),
                        const SizedBox(
                          height: 2,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.electric_car_outlined,
                              size: 17,
                            ),
                            const SizedBox(
                              width: 3,
                            ),
                            Text(
                              'Battery Checkup',
                              style: Theme.of(context)
                                  .textTheme
                                  .displaySmall!
                                  .copyWith(
                                    color: Colors.black54,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          // const SizedBox(
          //   height: 2,
          // ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Completed",
                  style: Theme.of(context).textTheme.displaySmall!.copyWith(
                      color: Colors.green,
                      fontWeight: FontWeight.w500,
                      fontSize: 15),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => Invoice(size, info),
                      ),
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.red),
                  ),
                  child: Text(
                    "View Invoice",
                    style: Theme.of(context)
                        .textTheme
                        .displaySmall!
                        .copyWith(fontWeight: FontWeight.w500, fontSize: 9),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
