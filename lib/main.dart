//import 'package:expenses/user_transactions.dart';
import 'package:flutter/material.dart';
import './homepage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Expenses",
        themeMode: ThemeMode.dark,
        theme: ThemeData(
          primarySwatch: Colors.deepOrange,
          accentColor: Colors.amber,
          fontFamily: 'Baloo2',
          textTheme: ThemeData.light().textTheme.copyWith(
                title: TextStyle(
                  fontFamily: 'Quicksand',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                button: TextStyle(color: Colors.white),
              ),
          appBarTheme: AppBarTheme(
            textTheme: ThemeData.dark().textTheme.copyWith(
                title: TextStyle(
                    fontFamily: 'Baloo2',
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.black)),
          ),
        ),
        home: homepage());
  }
}
