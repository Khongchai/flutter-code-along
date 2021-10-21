import 'package:expense/types/chart_data.dart';
import 'package:expense/types/transaction.dart';
import "package:flutter/material.dart";
import 'package:intl/intl.dart';

import "./chartbar.dart";

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  const Chart(this.recentTransactions, {Key? key}) : super(key: key);

  List<ChartData> get groupedTransactionsValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));

      double totalSum = 0.0;

      for (int i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].date.day == weekDay.day &&
            recentTransactions[i].date.month == weekDay.month &&
            recentTransactions[i].date.year == weekDay.year) {
          totalSum += recentTransactions[i].amount;
        }
      }

      return ChartData(DateFormat.E().format(weekDay), totalSum);
    }).reversed.toList();
  }

  //Right now, this is the sum of the spendings in the entire week.
  //Try to make this the maximum value in a week instead.
  double get totalSpending {
    return groupedTransactionsValues.fold(
        0.0, (sum, item) => sum + item.amount);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: const EdgeInsets.all(20),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTransactionsValues.map((obj) {
            return Flexible(
              fit: FlexFit.tight,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: ChartBar(
                    label: obj.day.substring(0, 2),
                    spendingAmount: obj.amount,
                    spendingAsPercentage:
                        totalSpending > 0 ? obj.amount / totalSpending : 0),
              ),
            );
          }).toList()),
    );
  }
}
