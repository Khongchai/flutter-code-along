import 'package:expense/components/transaction_item.dart';
import 'package:expense/types/transaction.dart';
import "package:flutter/material.dart";

class TransactionList extends StatelessWidget {
  final List<Transaction> userTransactions;
  final Function(Transaction instanceToBeRemoved) removeItemFromList;

  const TransactionList(
      {Key? key,
      required this.userTransactions,
      required this.removeItemFromList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: userTransactions.isEmpty
            ? SizedBox(
                width: 1 / 0,
                child: SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "No transactions added yet",
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                            height: 200,
                            child: Image.asset("assets/images/waiting.png",
                                fit: BoxFit.cover)),
                      ]),
                ),
              )
            : ListView(
                children: userTransactions
                    .map((userTransaction) => TransactionItem(
                          key: ValueKey(userTransaction.id),
                          deleteAction: () =>
                              removeItemFromList(userTransaction),
                          userTransaction: userTransaction,
                        ))
                    .toList()));
  }
}

/*(
                    Card(
                  child: Row(children: [
                    Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                              color: Theme.of(context).primaryColorDark,
                              width: 1,
                            )),
                        margin: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 15),
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 7),
                        child: Text(
                            "\$" +
                                userTransactions[i].amount.toStringAsFixed(2),
                            style: Theme.of(context).textTheme.headline6)),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(userTransactions[i].title,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).primaryColorDark)),
                          Text(DateFormat().format(userTransactions[i].date),
                              style: const TextStyle(
                                  fontWeight: FontWeight.w300,
                                  color: Colors.grey)),
                        ])
                  ]),
                ));
              },
              itemCount: userTransactions.length,
            ),
    );
  }
}
*/
