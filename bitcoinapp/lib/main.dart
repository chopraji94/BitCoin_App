import 'package:bitcoinapp/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: new MyHomePage(),
        theme: new ThemeData(
            primarySwatch: Colors.lightBlue, brightness: Brightness.light));
  }
}
