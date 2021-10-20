import "package:flutter/material.dart";

class TransactionInputs extends StatefulWidget {
  final bool Function(String text, double amount) addNewTransaction;

  const TransactionInputs({Key? key, required this.addNewTransaction})
      : super(key: key);

  @override
  State<TransactionInputs> createState() => _TransactionInputsState();
}

class _TransactionInputsState extends State<TransactionInputs> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  void submitData() {
    String newTitle = titleController.text;
    double newAmount = double.parse(amountController.text);

    if (newTitle.isNotEmpty &&
        newAmount > 0 &&
        widget.addNewTransaction(newTitle, newAmount)) {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
          TextField(
              decoration: const InputDecoration(labelText: "Title"),
              onSubmitted: (_) => submitData(),
              controller: titleController),
          TextField(
            decoration: const InputDecoration(labelText: "Amount"),
            onSubmitted: (_) => submitData(),
            controller: amountController,
            keyboardType: TextInputType.number,
          ),
          TextButton(
              child: const Text("Add Transaction"),
              onPressed: submitData,
              style: TextButton.styleFrom(
                primary: Colors.purple,
              )),
        ]),
      ),
    );
  }
}
