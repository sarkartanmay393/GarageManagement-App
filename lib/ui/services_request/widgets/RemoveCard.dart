import 'package:flutter/material.dart';

enum Option {
  None,
  Remove,
  Disable,
}

class RemoveCard extends StatefulWidget {
  Size size;
  Map<String, String> ServiceInfo;
  RemoveCard(this.size, this.ServiceInfo, {Key? key}) : super(key: key);

  @override
  State<RemoveCard> createState() => _RemoveCardState();
}

class _RemoveCardState extends State<RemoveCard> {
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
        border: Border.all(width: 0.25),
      ),
      child: Row(
        children: [
          Container(
            width: widget.size.width * 0.35,
            height: widget.size.height * 0.248,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                bottomLeft: Radius.circular(12),
              ),
              image: DecorationImage(
                fit: BoxFit.fitHeight,
                image: NetworkImage(widget.ServiceInfo['imageLink']!),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            child: Column(
              children: [
                Row(
                  children: [
                    FittedBox(
                      child: Wrap(
                        spacing: 5,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.ServiceInfo['name']!,
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium!
                                    .copyWith(
                                      fontSize: 16,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                              SizedBox(
                                height: widget.size.height * 0.02,
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Rs. ${widget.ServiceInfo['price']!}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayMedium!
                                        .copyWith(
                                          fontSize: 14,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500,
                                          decoration:
                                              TextDecoration.lineThrough,
                                        ),
                                  ),
                                  const SizedBox(
                                    width: 12,
                                  ),
                                  Text(
                                    "Rs. ${widget.ServiceInfo['discountedPrice']!}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayMedium!
                                        .copyWith(
                                          fontSize: 15,
                                          color: Colors.red,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const Spacer(),
                          CircleAvatar(
                            minRadius: 26,
                            maxRadius: 30,
                            backgroundColor: Theme.of(context).backgroundColor,
                            child: FittedBox(
                              child: Column(
                                children: [
                                  const Icon(
                                    Icons.timer_outlined,
                                  ),
                                  Text(
                                    widget.ServiceInfo['timeTakes']!,
                                    style: Theme.of(context)
                                        .textTheme
                                        .displaySmall!
                                        .copyWith(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 9),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                const Divider(),
                SizedBox(
                  height: widget.size.height * 0.08,
                  width: widget.size.width * 0.5,
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3),
                    itemBuilder: (_, i) => Text(
                      widget.ServiceInfo['features']!,
                      style: Theme.of(context).textTheme.displaySmall!.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 9),
                    ),
                    itemCount: 1,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      // height: widget.size.height * 0.5,
                      width: widget.size.width * 0.1,
                      child: FittedBox(
                        child: ElevatedButton.icon(
                          onPressed: () {
                            setState(() {
                              // srOpt = Option.Accept;
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                content: Padding(
                                  padding: EdgeInsets.all(12.0),
                                  child: Text("Verification Accepted"),
                                ),
                              ));
                              // cardHeight = widget.size.height * 0.3;
                            });
                          },
                          icon: const Icon(
                            Icons.abc,
                            size: 12,
                            color: Colors.white,
                          ),
                          label: Text(
                            "Remove",
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
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            primary: Colors.red,
                            fixedSize: Size(
                              widget.size.width * 0.25,
                              widget.size.height * 0.01,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: widget.size.height * 0.01,
                    ),
                    SizedBox(
                      // height: widget.size.height * 0.04,
                      width: widget.size.width * 0.1,
                      child: FittedBox(
                        child: ElevatedButton.icon(
                          onPressed: () {
                            setState(() {
                              // srOpt = Option.Reject;
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                content: Padding(
                                  padding: EdgeInsets.all(12.0),
                                  child: Text("Verification Rejected"),
                                ),
                              ));
                              // cardHeight = widget.size.height * 0.3;
                            });
                          },
                          icon: const Icon(
                            Icons.abc,
                            size: 12,
                            color: Colors.white,
                          ),
                          label: Text(
                            "Disable",
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
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            primary: Colors.red,
                            fixedSize: Size(
                              widget.size.width * 0.25,
                              widget.size.height * 0.01,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                        ),
                      ),
                    ),
                    //
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
