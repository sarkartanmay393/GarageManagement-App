import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class Invoice extends StatelessWidget {
  Size size;
  Map<String, String> info;
  Invoice(this.size, this.info, {Key? key}) : super(key: key);

  Widget rows(BuildContext ctx, String n1, String n2) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '$n1 :',
          style: Theme.of(ctx).textTheme.displaySmall!.copyWith(
                color: Colors.black54,
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
        ),
        Text(
          n2,
          style: Theme.of(ctx).textTheme.displaySmall!.copyWith(
                color: Colors.black54,
                fontWeight: FontWeight.w400,
                fontSize: 13.5,
              ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Hero(
          tag: info['serialno']!,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 18),
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            // height: size.height * 0.3,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(width: 0.25),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Invoice",
                  style: Theme.of(context).textTheme.displaySmall!.copyWith(
                        color: Colors.green,
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      ),
                ),
                Text(
                  "22-03-2002",
                  style: Theme.of(context).textTheme.displaySmall!.copyWith(
                        color: Colors.black54,
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                      ),
                ),
                Divider(),
                rows(context, "Customer Name", "Tanmay Sarkar"),
                rows(context, "Vehicle", "Tesla Model X"),
                rows(context, "Technician Name", "Manoj Bachpai"),
                rows(context, "Garage Name", "Sudhama Garage"),
                rows(context, "Service", "AC Checkup"),
                rows(context, "Service Cose", "Rs. 9000"),
                Divider(),
                rows(context, "Total", "Rs. 9000"),
                Text(
                  "Payment Method",
                  style: Theme.of(context).textTheme.displaySmall!.copyWith(
                        color: Colors.black87,
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                ),
                Text(
                  "Offline",
                  style: Theme.of(context).textTheme.displaySmall!.copyWith(
                        color: Colors.black54,
                        fontWeight: FontWeight.w500,
                        fontSize: 13.5,
                      ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
