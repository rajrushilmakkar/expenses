import 'package:flutter/cupertino.dart';

class transaction {
  final double price;
  final String id;
  final DateTime date;
  final String name;

  transaction({@required this.date, @required this.id, @required this.price,@required this.name});
}
