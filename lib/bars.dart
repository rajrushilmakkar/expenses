import 'package:flutter/material.dart';

class Bar extends StatelessWidget {
  final String label;
  final double amount;
  final per_amount;

  Bar(this.label, this.amount, this.per_amount);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      fit: FlexFit.tight,
      child: Column(
        children: <Widget>[
          Container(
            child: Container(
              height: 20,
              child: FittedBox(
                child: Text(
                  '₹' + amount.toStringAsFixed(0) + '  ',
                  style: Theme.of(context).textTheme.title,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 4,
          ),
          Container(
            height: 65,
            width: 9,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Stack(
              children: <Widget>[
                Container(),
                FractionallySizedBox(
                  heightFactor: per_amount,
                  //heightFactor: per_amount,

                  child: Container(
                    //color: Colors.green,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.blue),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            '${label}',
            style: Theme.of(context).textTheme.title,
          ),
        ],
      ),
    );
  }
}
