import 'package:expense/types/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  final List<Transaction> transactions = [
    Transaction(
        id: "t1", title: "New Shoes", amount: 69.99, date: DateTime.now()),
    Transaction(
        id: "t2", title: "New Dresses", amount: 29.99, date: DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Flutter App"),
        ),
        body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          const SizedBox(
            child: Card(
              color: Colors.blue,
              child: Text("chart"),
              elevation: 5,
            ),
          ),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child:
                  Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                TextField(decoration: InputDecoration(labelText: "Title")),
                TextField(decoration: InputDecoration(labelText: "Amount")),
                TextButton(
                    child: Text("Add Transaction"),
                    onPressed: () => print("button clicked"),
                    style: TextButton.styleFrom(
                      primary: Colors.purple,
                    ))
              ]),
            ),
          ),
          Column(children: [
            ...transactions
                .map((tx) => Card(
                      child: Row(children: [
                        Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                  color: Colors.purple,
                                  width: 1,
                                )),
                            margin: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 15),
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 7),
                            child: Text("\$" + tx.amount.toString(),
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.purple,
                                ))),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(tx.title,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold)),
                              Text(DateFormat().format(tx.date),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 12,
                                      color: Colors.grey)),
                            ])
                      ]),
                    ))
                .toList()
          ]),
        ]));
  }
}
