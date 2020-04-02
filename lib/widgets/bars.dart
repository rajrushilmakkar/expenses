import 'package:flutter/material.dart';

class Bar extends StatelessWidget {
  final String label;
  final double amount;
  final per_amount;

  Bar(this.label, this.amount, this.per_amount);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context,constraint){
      return Column(
      children: <Widget>[
        Container(
          child: Container(
            height: constraint.maxHeight*0.15,
            child: FittedBox(
              child: Text(
                '₹' + amount.toStringAsFixed(0) + '  ',
                style: Theme.of(context).textTheme.title,
              ),
            ),
          ),
        ),
        SizedBox(
          height: constraint.maxHeight*0.05,
        ),
        Container(
              height: constraint.maxHeight*0.6,
              width: 9,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Stack(
                children: <Widget>[
        
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
          height: constraint.maxHeight*0.05,
        ),
        Container(
          height: constraint.maxHeight*0.15
          ,
          child: FittedBox(
            
                    child: Text(
              '${label}',
              style: Theme.of(context).textTheme.title,
            ),
          ),
        ),
      ],
    );

    },);
  }
}
