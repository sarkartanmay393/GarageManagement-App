import 'package:flutter/material.dart';

class Daily extends StatelessWidget {
  Daily({Key? key}) : super(key: key);

  Widget RevRow(String amount, String name, Icon ic, Size sz, BuildContext ctx,
      Color? clr1, Color? clr2, Color? txt1, Color? txt2) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Card(
          color: clr1,
          child: SizedBox(
            height: sz.height * 0.08,
            width: sz.width * 0.55,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  ic,
                  Text(
                    name,
                    style: Theme.of(ctx).textTheme.displaySmall!.copyWith(
                          color: txt1,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Card(
          color: clr2,
          child: SizedBox(
            height: sz.height * 0.08,
            width: sz.width * 0.3,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    amount,
                    style: Theme.of(ctx).textTheme.displaySmall!.copyWith(
                          color: txt2,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        children: [
          RevRow(
            "0",
            "Total Service Completed",
            const Icon(Icons.settings),
            size,
            context,
            Colors.grey,
            Colors.grey,
            Colors.black,
            Colors.white,
          ),
          RevRow(
            "Rs. 0",
            "Total Earning",
            const Icon(
              Icons.currency_rupee_sharp,
              color: Colors.white,
            ),
            size,
            context,
            Colors.red,
            Colors.grey.shade200,
            Colors.white,
            Colors.black,
          ),
          RevRow(
            "Rs. 0",
            "Total Commission",
            const Icon(
              Icons.currency_rupee_sharp,
              color: Colors.white,
            ),
            size,
            context,
            Colors.red,
            Colors.grey.shade200,
            Colors.white,
            Colors.black,
          ),
          RevRow(
            "Rs. 0",
            "Total Card Payment",
            const Icon(
              Icons.currency_rupee_sharp,
              color: Colors.white,
            ),
            size,
            context,
            Colors.red,
            Colors.grey.shade200,
            Colors.white,
            Colors.black,
          ),
          RevRow(
            "Rs. 0",
            "Total Cash Payment",
            const Icon(
              Icons.currency_rupee_sharp,
              color: Colors.white,
            ),
            size,
            context,
            Colors.red,
            Colors.grey.shade200,
            Colors.white,
            Colors.black,
          ),
          RevRow(
            "Rs. 0",
            "Total Amount Payable",
            const Icon(
              Icons.currency_rupee_sharp,
              color: Colors.white,
            ),
            size,
            context,
            Colors.red,
            Colors.grey.shade200,
            Colors.white,
            Colors.black,
          ),
        ],
      ),
    );
  }
}
