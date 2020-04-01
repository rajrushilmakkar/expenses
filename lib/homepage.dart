import 'package:expenses/models/transaction.dart';
import 'package:expenses/new_transaction.dart';
import 'package:expenses/transaction_list.dart';
//import 'package:expenses/user_transactions.dart';
import './charts.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class homepage extends StatefulWidget {
//String titleInput,amountInput;
  @override
  _homepageState createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  final List<transaction> _txns = [];

  void _addtxn(String txName, double txAmount, DateTime date) {
    //var txAmountp=double.tryParse(txAmount);
    final newtxn = transaction(
        date: date,
        name: txName,
        id: DateTime.now().toString(),
        price: txAmount);
    setState(() {
      _txns.add(newtxn);
    });
  }

  void _deleteTransaction(String id) {
    setState(() {
      _txns.removeWhere((txn) {
        if (txn.id == id) return true;
        else return false;
      });
    });
  }

  List<transaction> get lastWeektxns {
    return _txns.where((txn) {
      return txn.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  void _addingExpenses(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (ctx) {
          return GestureDetector(
            child: NewTransaction(_addtxn),
            behavior: HitTestBehavior.opaque,
            onTap: () {},
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Expenses Book"),
      ),
      body: SingleChildScrollView(
              child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            //: CrossAxisAlignment.center,
            children: <Widget>[
              charts(lastWeektxns),
              Column(
        children: <Widget>[
          //NewTransaction(_addtxn),
          TransactionList(_txns,_deleteTransaction),
        ],
              ),
            ],
          ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _addingExpenses(context),
      ),
    );
  }
}
