import "package:flutter/material.dart";
import 'package:intl/intl.dart';

class TransactionInputs extends StatefulWidget {
  final Function(String text, double amount, DateTime chosenDate)
      addNewTransaction;

  const TransactionInputs({Key? key, required this.addNewTransaction})
      : super(key: key);

  @override
  State<TransactionInputs> createState() => _TransactionInputsState();
}

class _TransactionInputsState extends State<TransactionInputs> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;

  void _submitData() {
    String? newTitle = _titleController.text;
    double? newAmount = _amountController.text.isNotEmpty
        ? double.parse(_amountController.text)
        : null;

    if (newTitle.isNotEmpty &&
        newAmount != null &&
        newAmount > 0 &&
        _selectedDate != null) {
      widget.addNewTransaction(newTitle, newAmount, _selectedDate as DateTime);
      Navigator.of(context).pop();
    }
  }

  void _presentDatePicker() async {
    final DateTime? selectedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2019),
        lastDate: DateTime.now());
    setState(() {
      _selectedDate = selectedDate;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
          TextField(
              decoration: const InputDecoration(labelText: "Title"),
              onSubmitted: (_) => _submitData(),
              controller: _titleController),
          TextField(
            decoration: const InputDecoration(labelText: "Amount"),
            onSubmitted: (_) => _submitData(),
            controller: _amountController,
            keyboardType: TextInputType.number,
          ),
          Row(
            children: [
              Expanded(
                child: Text(_selectedDate == null
                    ? "No Date Chosen!"
                    : "Picked Date: " +
                        DateFormat.yMd().format(_selectedDate as DateTime)),
              ),
              TextButton(
                onPressed: _presentDatePicker,
                child: const Text("Choose Date"),
              ),
            ],
          ),
          TextButton(
              child: const Text("Add Transaction"),
              onPressed: _submitData,
              style: TextButton.styleFrom(
                backgroundColor: Theme.of(context).primaryColor,
                primary: Colors.white,
              )),
        ]),
      ),
    );
  }
}
