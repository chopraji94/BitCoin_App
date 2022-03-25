import 'package:bitcoinapp/home_page.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

void main() async {
  List currencies = await getCurrencies();
  runApp(new MyApp(currencies));
}

class MyApp extends StatelessWidget {
  final List _currencies;

  MyApp(this._currencies);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: new MyHomePage(_currencies),
        theme: new ThemeData(
            primarySwatch: Colors.lightBlue, brightness: Brightness.dark));
  }
}

Future<List> getCurrencies() async {
  String cryptoUrl =
      "https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest";

  Response response = await http.get(Uri.parse(cryptoUrl),
      headers: {'X-CMC_PRO_API_KEY': '387e7cc1-01a8-4463-bb5e-26d9cf6b29ed'});
  var jsonResponse = json.decode(response.body);
  var onlyData = jsonResponse['data'] as List;
  return onlyData;
}
