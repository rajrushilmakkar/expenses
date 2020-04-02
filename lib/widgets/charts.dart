import 'package:expenses/widgets/bars.dart';
import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class charts extends StatelessWidget {
  final List<transaction> txns;

  charts(this.txns);

  double get week_amount {
    return daily_data.fold(0.0, (sum, item) {
      return sum + item['amount'];
    });
  }

  List<Map<String, Object>> get daily_data {
    return List.generate(7, (index) {
      final day = DateTime.now().subtract(Duration(days: index));
      var total_amount = 0.0;
      for (var i in txns) {
        if (i.date.day == day.day &&
            i.date.month == day.month &&
            i.date.year == day.year) {
          total_amount += i.price;
        }
      }
      //print(total_amount);
      //print(DateFormat.E().format(day));

      return {
        'day': DateFormat.E().format(day).substring(0, 1),
        'amount': total_amount
      };
    }).reversed.toList();
  }

  @override
  Widget build(BuildContext context) {
    //print(txns[0].price+txns[1].price);
    //print(daily_data);
    return Card(
        elevation: 7,
        margin: EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: daily_data.map((d_txn) {
      if (week_amount != 0) {
        return Bar(d_txn['day'], d_txn['amount'],
            (d_txn['amount'] as double) / (week_amount));
      } else {
        return Bar(d_txn['day'], d_txn['amount'], 0.0);
      }
    }).toList(),
        ),
      );
  }
}
