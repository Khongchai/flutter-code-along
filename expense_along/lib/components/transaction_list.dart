import 'package:expense/types/transaction.dart';
import "package:flutter/material.dart";
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> userTransactions;

  const TransactionList({Key? key, required this.userTransactions})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemBuilder: (ctx, i) {
          return (Card(
            child: Row(children: [
              Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        color: Theme.of(context).primaryColorDark,
                        width: 1,
                      )),
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 7),
                  child: Text(
                      "\$" + userTransactions[i].amount.toStringAsFixed(2),
                      style: Theme.of(context).textTheme.headline6)),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(userTransactions[i].title,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColorDark)),
                Text(DateFormat().format(userTransactions[i].date),
                    style: Theme.of(context).textTheme.headline6),
              ])
            ]),
          ));
        },
        itemCount: userTransactions.length,
      ),
    );
  }
}
