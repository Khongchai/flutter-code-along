import 'package:expense/components/transaction_inputs.dart';
import 'package:expense/components/transaction_list.dart';
import 'package:expense/types/transaction.dart';
import 'package:flutter/material.dart';

import 'components/chart.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses',
      theme: ThemeData(
          primarySwatch: Colors.brown,
          fontFamily: "Quicksand",
          textTheme: ThemeData.light().textTheme.copyWith(
              headline6: const TextStyle(
                  fontFamily: "OpenSans",
                  fontSize: 18,
                  fontWeight: FontWeight.bold)),
          appBarTheme: AppBarTheme(
              textTheme: ThemeData.light().textTheme.copyWith(
                  headline6:
                      const TextStyle(fontFamily: "OpenSans", fontSize: 20)))),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransactions = [
/*
    Transaction(
        id: "t1", title: "New Shoes", amount: 69.99, date: DateTime.now()),
    Transaction(
        id: "t2", title: "New Dresses", amount: 29.99, date: DateTime.now()),
*/
  ];

  bool _showChart = true;
  List<Transaction> get _recentTransactions {
    return _userTransactions
        .where((tx) =>
            tx.date.isAfter(DateTime.now().subtract(const Duration(days: 7))))
        .toList();
  }

  void _addNewTransaction(String title, double amount, DateTime selectedDate) {
    final newTx = Transaction(
        title: title,
        amount: amount,
        date: selectedDate,
        id: selectedDate.toString());

    setState(() {
      _userTransactions.add(newTx);

      //For first load, show if in portrait mode.
      _showChart = MediaQuery.of(context).orientation == Orientation.portrait;
    });
  }

  void startAddingNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        isScrollControlled: true,
        builder: (_) {
          return GestureDetector(
              onTap: () {},
              behavior: HitTestBehavior.opaque,
              child: TransactionInputs(addNewTransaction: _addNewTransaction));
        });
  }

  void removeItemFromList(Transaction instanceToBeRemoved) {
    setState(() {
      _userTransactions.remove(instanceToBeRemoved);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Personal Expenses"), actions: [
        IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => startAddingNewTransaction(context))
      ]),
      body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        if (_showChart) Chart(_recentTransactions),
        TransactionList(
          userTransactions: _userTransactions,
          removeItemFromList: removeItemFromList,
        ),
      ]),
      floatingActionButton:
          Row(mainAxisAlignment: MainAxisAlignment.end, children: [
        FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () => startAddingNewTransaction(context)),
        const SizedBox(
          width: 20,
        ),
        FloatingActionButton(
            child: const Icon(Icons.bar_chart),
            onPressed: () => setState(() => _showChart = !_showChart))
      ]),
    );
  }
}
