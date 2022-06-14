import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

enum Option {
  None,
  Accept,
  Reject,
}

class SRCard extends StatefulWidget {
  Size size;
  Map<String, String> info;
  SRCard(this.size, this.info, {Key? key}) : super(key: key);

  @override
  State<SRCard> createState() => _SRCardState();
}

class _SRCardState extends State<SRCard> {
  Option srOpt = Option.None;
  // double cardHeight = 0;

  @override
  Widget build(BuildContext context) {
    // cardHeight = widget.size.height * 0.26;
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(4),
      height: widget.size.height * 0.26,
      decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(width: 0.25)),
      child: srOpt == Option.Reject
          ? Column(
              children: [
                const Text("Reason : "),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 60,
                    child: DottedBorder(
                      strokeWidth: 0.4,
                      child: TextFormField(
                        keyboardType: TextInputType.multiline,
                        decoration: InputDecoration(
                          hintText: "Enter stated reason",
                          hintStyle: Theme.of(context)
                              .textTheme
                              .displaySmall!
                              .copyWith(
                                color: Colors.black,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 2, vertical: 2),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.red),
                  ),
                  child: Text(
                    "Sumbit",
                    style: Theme.of(context).textTheme.displaySmall!.copyWith(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ),
              ],
            )
          : Column(
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
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(6)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "SR. No",
                        style:
                            Theme.of(context).textTheme.displaySmall!.copyWith(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                      ),
                      Text(
                        "Name",
                        style:
                            Theme.of(context).textTheme.displaySmall!.copyWith(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                      ),
                      Text(
                        "Mobile Number",
                        style:
                            Theme.of(context).textTheme.displaySmall!.copyWith(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                      ),
                      Text(
                        "Address",
                        style:
                            Theme.of(context).textTheme.displaySmall!.copyWith(
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
                          widget.info['serialno']!,
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall!
                              .copyWith(
                                color: Colors.black,
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                              ),
                        ),
                        Text(
                          widget.info['name']!,
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall!
                              .copyWith(
                                color: Colors.black,
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                              ),
                        ),
                        Text(
                          widget.info['number']!,
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall!
                              .copyWith(
                                color: Colors.black,
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                              ),
                        ),
                        Text(
                          widget.info['address']!,
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall!
                              .copyWith(
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
                              style: Theme.of(context)
                                  .textTheme
                                  .displaySmall!
                                  .copyWith(
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
                                  child: Image.network(
                                      widget.info["vehicalImage"]!,
                                      fit: BoxFit.fill),
                                ),
                                const SizedBox(
                                  width: 2.5,
                                ),
                                Column(
                                  children: [
                                    Text(
                                      widget.info["vehicle"]!,
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
                                      widget.info["type"]!,
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
                        child: Container(
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
                const SizedBox(
                  height: 4,
                ),
                if (srOpt == Option.None)
                  Wrap(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Order Number : ${widget.info["orderId"]!}",
                            style: Theme.of(context)
                                .textTheme
                                .displaySmall!
                                .copyWith(
                                  color: Colors.black54,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                          Text(
                            "Self-Deliver",
                            style: Theme.of(context)
                                .textTheme
                                .displaySmall!
                                .copyWith(
                                  color: Colors.black54,
                                  fontSize: 11,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton.icon(
                            onPressed: () {
                              setState(() {
                                srOpt = Option.Accept;
                                // cardHeight = widget.size.height * 0.3;
                              });
                            },
                            icon: const Icon(
                              Icons.abc,
                              size: 12,
                              color: Colors.white,
                            ),
                            label: Text(
                              "Accept",
                              style: Theme.of(context)
                                  .textTheme
                                  .displaySmall!
                                  .copyWith(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                            style: ButtonStyle(
                              // fixedSize: MaterialStateProperty.all(Size(40, 10)),
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.red),
                            ),
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          ElevatedButton.icon(
                            onPressed: () {
                              setState(() {
                                srOpt = Option.Reject;
                              });
                            },
                            icon: const Icon(
                              Icons.abc,
                              color: Colors.white,
                              size: 12,
                            ),
                            label: Text(
                              "Reject",
                              style: Theme.of(context)
                                  .textTheme
                                  .displaySmall!
                                  .copyWith(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                            style: ButtonStyle(
                              // fixedSize: MaterialStateProperty.all(Size(40, 15)),
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.red),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                else
                  Wrap(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "Self-Deliver",
                            style: Theme.of(context)
                                .textTheme
                                .displaySmall!
                                .copyWith(
                                  color: Colors.black54,
                                  fontSize: 11,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                        ],
                      ),
                      // const SizedBox(
                      //   height: 8,
                      // ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            DottedBorder(
                              strokeWidth: 0.5,
                              color: Colors.black54,
                              child: Container(
                                height: 28,
                                width: widget.size.height * 0.25,
                                // padding: const EdgeInsets.symmetric(horizontal: ),
                                alignment: Alignment.center,
                                child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText:
                                        "Enter OTP which sent to customer",
                                    hintStyle: Theme.of(context)
                                        .textTheme
                                        .displaySmall!
                                        .copyWith(
                                          color: Colors.black,
                                          fontSize: 8,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            SizedBox(
                              height: 25,
                              // width: ,
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.red),
                                ),
                                child: Text(
                                  "Sumbit",
                                  style: Theme.of(context)
                                      .textTheme
                                      .displaySmall!
                                      .copyWith(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
              ],
            ),
    );
  }
}
