import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';

enum Option {
  None,
  Accept,
  Reject,
}

class ImageVerifyCard extends StatefulWidget {
  Size size;
  Map<String, String> info;
  ImageVerifyCard(this.size, this.info, {Key? key}) : super(key: key);

  @override
  State<ImageVerifyCard> createState() => _ImageVerifyCardState();
}

class _ImageVerifyCardState extends State<ImageVerifyCard> {
  Option srOpt = Option.None;
  // double cardHeight = 0;
  final _key = GlobalKey();
  //
  @override
  Widget build(BuildContext context) {
    // cardHeight = widget.size.height * 0.26;
    return Dismissible(
      key: _key,
      direction: DismissDirection.endToStart,
      onDismissed: (_) => ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Padding(
            padding: EdgeInsets.all(14.0),
            child: Text("Verification Rejected"),
          ),
        ),
      ),
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(4),
        height: widget.size.height * 0.24,
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(width: 0.25),
        ),
        child: Column(
          children: [
            Container(
              height: (widget.size.height * 0.26) * 0.12,
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
            SizedBox(
              height: (widget.size.height * 0.26) * 0.02,
            ),
            DottedBorder(
              color: Colors.black87,
              strokeWidth: 0.2,
              child: Container(
                height: (widget.size.height * 0.26) * 0.12,
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
                      style: Theme.of(context).textTheme.displaySmall!.copyWith(
                            color: Colors.black,
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                    Text(
                      widget.info['name']!,
                      style: Theme.of(context).textTheme.displaySmall!.copyWith(
                            color: Colors.black,
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                    Text(
                      widget.info['number']!,
                      style: Theme.of(context).textTheme.displaySmall!.copyWith(
                            color: Colors.black,
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                    Text(
                      widget.info['address']!,
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
            SizedBox(
              height: (widget.size.height * 0.26) * 0.01,
            ),
            Row(
              children: [
                DottedBorder(
                  color: Colors.black12,
                  strokeWidth: 0.8,
                  child: Container(
                    padding: const EdgeInsets.all(2.5),
                    height: (widget.size.height * 0.26) * 0.3,
                    width: widget.size.width * 0.4,
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
                        SizedBox(
                          height: (widget.size.height * 0.26) * 0.01,
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(1.0),
                              child: SizedBox(
                                height: (widget.size.height * 0.26) * 0.2,
                                width: widget.size.width * 0.4 * 0.5,
                                child: FittedBox(
                                  child: Image.network(
                                      widget.info["vehicalImage"]!,
                                      fit: BoxFit.fill),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: (widget.size.height * 0.26) * 0.01,
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
                SizedBox(
                  width: (widget.size.height * 0.26) * 0.02,
                ),
                Expanded(
                  child: DottedBorder(
                    color: Colors.black12,
                    strokeWidth: 0.8,
                    child: Container(
                        height: (widget.size.height * 0.26) * 0.3,
                        // width: 90,
                        child: FittedBox(
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(1.0),
                                child: SizedBox(
                                  height: (widget.size.height * 0.26) * 0.2,
                                  width: widget.size.width * 0.4 * 0.5,
                                  child: FittedBox(
                                    child: Image.network(
                                        widget.info["vehicalImage"]!,
                                        fit: BoxFit.fill),
                                  ),
                                ),
                              ),
                              // SizedBox(
                              //   width: widget.size.height * 0.01,
                              // ),
                              Padding(
                                padding: const EdgeInsets.all(1.0),
                                child: SizedBox(
                                  height: (widget.size.height * 0.26) * 0.2,
                                  width: widget.size.width * 0.4 * 0.5,
                                  child: FittedBox(
                                    child: Image.network(
                                        widget.info["vehicalImage"]!,
                                        fit: BoxFit.fill),
                                  ),
                                ),
                              ),
                              // SizedBox(
                              //   width: widget.size.height * 0.01,
                              // ),
                              Padding(
                                padding: const EdgeInsets.all(1.0),
                                child: SizedBox(
                                  height: (widget.size.height * 0.26) * 0.2,
                                  width: widget.size.width * 0.4 * 0.5,
                                  child: FittedBox(
                                    child: Image.network(
                                        widget.info["vehicalImage"]!,
                                        fit: BoxFit.fill),
                                  ),
                                ),
                              ),
                              // SizedBox(
                              //   width: widget.size.height * 0.01,
                              // ),
                              Padding(
                                padding: const EdgeInsets.all(1.0),
                                child: SizedBox(
                                  height: (widget.size.height * 0.26) * 0.2,
                                  width: widget.size.width * 0.4 * 0.5,
                                  child: FittedBox(
                                    child: Image.network(
                                        widget.info["vehicalImage"]!,
                                        fit: BoxFit.fill),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: (widget.size.height * 0.26) * 0.02,
            ),
            Expanded(
              child: FittedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Order Number : ${widget.info["orderId"]!}",
                      style: Theme.of(context).textTheme.displaySmall!.copyWith(
                            color: Colors.black54,
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                    SizedBox(
                      width: widget.size.width * 0.02,
                    ),
                    SizedBox(
                      height: widget.size.height * 0.04,
                      width: widget.size.width * 0.2,
                      child: FittedBox(
                        child: ElevatedButton.icon(
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
                            "Verify",
                            style: Theme.of(context)
                                .textTheme
                                .displaySmall!
                                .copyWith(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.red,
                            fixedSize: Size(
                              widget.size.width * 0.25,
                              widget.size.height * 0.01,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: widget.size.height * 0.01,
                    ),
                    SizedBox(
                      height: widget.size.height * 0.04,
                      width: widget.size.width * 0.2,
                      child: FittedBox(
                        child: ElevatedButton.icon(
                          onPressed: () {
                            setState(() {
                              srOpt = Option.Reject;

                              // cardHeight = widget.size.height * 0.3;
                            });
                          },
                          icon: const Icon(
                            Icons.abc,
                            size: 12,
                            color: Colors.white,
                          ),
                          label: Text(
                            "Reject",
                            style: Theme.of(context)
                                .textTheme
                                .displaySmall!
                                .copyWith(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.red,
                            fixedSize: Size(
                              widget.size.width * 0.25,
                              widget.size.height * 0.01,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ),
                    ),
                    //
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
