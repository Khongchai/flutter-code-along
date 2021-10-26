import 'dart:math';

import 'package:expense/types/transaction.dart';
import "package:flutter/material.dart";
import 'package:intl/intl.dart';

class TransactionItem extends StatefulWidget {
  final Transaction userTransaction;
  final Function deleteAction;

  static const List<Color> availableColors = [
    Colors.red,
    Colors.black,
    Colors.blue,
    Colors.deepPurple
  ];

  const TransactionItem(
      {Key? key, required this.userTransaction, required this.deleteAction})
      : super(key: key);

  @override
  State<TransactionItem> createState() => _TransactionItemState();
}

class _TransactionItemState extends State<TransactionItem> {
  late Color _randomizedColor;

  @override
  void initState() {
    _randomizedColor = TransactionItem.availableColors[
        Random().nextInt(TransactionItem.availableColors.length)];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
      elevation: 5,
      child: (ListTile(
        leading: CircleAvatar(
            radius: 30,
            backgroundColor: _randomizedColor,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child:
                  FittedBox(child: Text("\$${widget.userTransaction.amount}")),
            )),
        title: Text(widget.userTransaction.title,
            style: Theme.of(context).textTheme.headline6),
        subtitle: Text(DateFormat.yMd().format(widget.userTransaction.date)),
        trailing: MediaQuery.of(context).size.width > 400
            ? FlatButton.icon(
                onPressed: () => widget.deleteAction(),
                icon: const Icon(Icons.delete),
                textColor: Colors.red,
                label: const Text("Delete"))
            : IconButton(
                icon: const Icon(Icons.delete),
                color: Colors.red,
                onPressed: () => widget.deleteAction(),
              ),
      )),
    );
  }
}
