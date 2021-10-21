import "dart:math";

import "package:flutter/material.dart";

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double spendingAsPercentage;

  const ChartBar(
      {Key? key,
      required this.label,
      required this.spendingAmount,
      required this.spendingAsPercentage})
      : super(key: key);

  //limit to only 4 digits
  get spendingAmountWidthLimit => spendingAmount > 9999
      ? spendingAmount.toStringAsFixed(0).substring(0, 3) + ".."
      : spendingAmount.toStringAsFixed(0);

  @override
  Widget build(BuildContext context) {
    final barsHeight = max(MediaQuery.of(context).size.height * 0.1, 70.0);

    return Column(children: [
      SizedBox(
        height: 20,
        child: Text("\$$spendingAmountWidthLimit",
            textAlign: TextAlign.center,
            style: const TextStyle(fontFamily: "OpenSans", fontSize: 12)),
      ),
      const SizedBox(height: 4),
      SizedBox(
        height: barsHeight,
        width: 10,
        child: Stack(children: [
          Container(
              decoration: BoxDecoration(
            border: Border.all(color: Colors.grey, width: 1.0),
            color: const Color.fromRGBO(227, 227, 224, 1.0),
            borderRadius: BorderRadius.circular(20),
          )),
          SizedBox(
            height: barsHeight,
            width: 10,
            child: FractionallySizedBox(
                heightFactor: spendingAsPercentage,
                alignment: Alignment.bottomCenter,
                child: Container(
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(20)))),
          ),
        ]),
      ),
      const SizedBox(height: 4),
      Text(label),
    ]);
  }
}
