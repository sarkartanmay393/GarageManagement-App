import 'package:flutter/material.dart';

class TrackIndividualCard extends StatelessWidget {
  Map<String, String> info;
  TrackIndividualCard(this.info, {Key? key}) : super(key: key);

  Widget pdMaker(String n1, String n2, BuildContext ctx) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "$n1 : ",
          style: Theme.of(ctx).textTheme.displaySmall!.copyWith(
                color: Colors.black,
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
        ),
        Text(
          n2,
          style: Theme.of(ctx).textTheme.displaySmall!.copyWith(
                color: Colors.black,
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 0.2),
        borderRadius: BorderRadius.circular(12),
      ),
      height: size.height * 0.4,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            children: [
              const CircleAvatar(
                maxRadius: 30,
                minRadius: 26,
                backgroundImage: NetworkImage(
                    "https://tesla-cdn.thron.com/delivery/public/image/tesla/3863f3e5-546a-4b22-bcbc-1f8ee0479744/bvlatuR/std/1200x628/MX-Social"),
                // child: Container(
                //   width: size.width * 0.1,
                //   height: size.height * 0.08,
                // ),
              ),
              // Image.network(
              //   "src",
              //   width: size.width * 0.1,
              //   height: size.height * 0.08,
              // ),
              SizedBox(
                width: size.width * 0.05,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${info['vehicle']}",
                    style: Theme.of(context).textTheme.displaySmall!.copyWith(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  Text(
                    "${info['type']}",
                    style: Theme.of(context).textTheme.displaySmall!.copyWith(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                  ),
                ],
              ),
              const Spacer(),
              Text(
                "${info['issuedDate']}",
                style: Theme.of(context).textTheme.displaySmall!.copyWith(
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ],
          ),

          const Divider(),
          Wrap(
            children: [
              Text(
                "Pick Up Date",
                style: Theme.of(context).textTheme.displaySmall!.copyWith(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.timer,
                        color: Colors.black87,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        "02:00PM",
                        style:
                            Theme.of(context).textTheme.displaySmall!.copyWith(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.dataset,
                        color: Colors.black87,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        "22 JUN 2022",
                        style:
                            Theme.of(context).textTheme.displaySmall!.copyWith(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          const Divider(),
          Text(
            "Price Details",
            style: Theme.of(context).textTheme.displaySmall!.copyWith(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
          ),
          const SizedBox(
            height: 2,
          ),
          pdMaker("Total Service Charge", "Rs. 4000", context),
          pdMaker("Service Name", "Engine Checkup", context),
          pdMaker("Order ID", info['orderId']!, context),
          pdMaker("Payment Status", "Paid", context),
          pdMaker("Payment ID", "#34js234", context),
          //
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Total",
                style: Theme.of(context).textTheme.displaySmall!.copyWith(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
              ),
              Text(
                "Rs. 4000",
                style: Theme.of(context).textTheme.displaySmall!.copyWith(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
