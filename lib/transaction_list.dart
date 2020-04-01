import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<transaction> transactions;
  final Function _deleteTransaction;

  TransactionList(this.transactions,this._deleteTransaction);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 570,
      child: transactions.isEmpty
          ? Container(
              height: 500,
              margin: EdgeInsets.all(40),
              child: Image.asset(
                "assets/images/no_data.png",
                fit: BoxFit.cover,
              ),
            )
          : ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          //backgroundColor: Colors.white,

                          //width: double.infinity,
                          radius: 35,
                          child: FittedBox(
                            child: Text(
                              'Rs. ${transactions[index].price.toStringAsFixed(2)}',
                              style: Theme.of(context).textTheme.title,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(8),
                        child: Column(
                          //crossAxisAlignment: CrossAxisAlignment.start,
                          //mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              transactions[index].name,
                              //textAlign: TextAlign.start,
                              style: Theme.of(context).textTheme.title,
                            ),
                            Text(
                              DateFormat.yMMMd()
                                  .format(transactions[index].date),
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 16),
                            )
                          ],
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed:()=> _deleteTransaction(transactions[index].id),
                        color: Theme.of(context).errorColor,
                      )
                    ],
                  ),
                );
              },
              //scrollDirection: Axis.vertical,
            ),
    );
  }
}
