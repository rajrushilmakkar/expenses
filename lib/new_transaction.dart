//import 'dart:js';

import 'package:flutter/material.dart';
//import './users/transactions.dart';
import 'package:toast/toast.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addtxn;

  NewTransaction(this.addtxn);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  BuildContext context1;

  final titleController = TextEditingController();

  final amountController = TextEditingController();
  DateTime _selectedDate;
  void _selectDate() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2019),
            lastDate: DateTime.now())
        .then((date) {
      setState(() {
        _selectedDate = date;
      });
    });
  }

  void _callback(String s) {
    double amt = double.tryParse((s));
    if (titleController.text.isEmpty || amt == null || amt < 0) {
      //titleController.clear();
      //amountController.clear();
      return Toast.show("Please enter valid title or amount!", context,
          duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
    }
    if (_selectedDate == null) {
      return Toast.show("Please select a Date", context,
          duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
    }
    widget.addtxn(titleController.text, double.parse(s),_selectedDate);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    context1 = context;
    return Card(
      child: Container(
        padding: EdgeInsets.all(4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              onEditingComplete: () {},
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController,
              style: Theme.of(context).textTheme.title,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
              style: Theme.of(context).textTheme.title,
              keyboardType:
                  TextInputType.numberWithOptions(decimal: true, signed: false),
              onSubmitted: _callback,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    _selectedDate == null
                        ? 'No Date choosen'
                        : 'Picked Date: ' +
                            DateFormat.yMd().format(_selectedDate),
                    style: TextStyle(color: Colors.black),
                  ),
                  FlatButton(
                    child: Text(
                      "Select Date",
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold),
                    ),
                    onPressed: _selectDate,
                  ),
                ],
              ),
            ),
            RaisedButton(
              child: Text("Add transaction"),
              onPressed: () => _callback(amountController.text),
              color: Theme.of(context).primaryColor,
              textColor: Theme.of(context).textTheme.button.color,
            ),
          ],
        ),
      ),
    );
  }
}
