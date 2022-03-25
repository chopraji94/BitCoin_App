import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  final List currencies;

  MyHomePage(this.currencies);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<MaterialColor> _colors = [Colors.blue, Colors.indigo, Colors.red];

  Widget avatarWidget(int index, MaterialColor color) {
    return new CircleAvatar(
      backgroundColor: color,
      child: Text(widget.currencies[index]['name'][0],style: new TextStyle(color: Theme.of(context).accentColor),),
    );
  }

  Widget coinNameWidget(int index) {
    return new Text(
      widget.currencies[index]['name'],
      style: Theme.of(context).textTheme.subtitle1,
    );
  }

  Widget coinPriceWidget(String price, String percentageChange) {
    return new Container(
      margin: const EdgeInsets.only(top: 5.0),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Row(
            children: <Widget>[
              new Text(price),
              coinArrowWidget(percentageChange)
            ],
          ),
          coinTextPRiceWIdget(percentageChange)
        ],
      ),
    );
  }

  Widget coinArrowWidget(String percentageChange) {
    if (double.parse(percentageChange) > 0) {
      return new Icon(Icons.arrow_circle_up, color: Colors.green);
    } else {
      return new Icon(Icons.arrow_circle_down, color: Colors.red);
    }
  }

  Widget coinTextPRiceWIdget(String percentageChange) {
    if (double.parse(percentageChange) > 0) {
      return new Text(percentageChange,
          style: new TextStyle(color: Colors.green));
    } else {
      return new Text(percentageChange,
          style: new TextStyle(color: Colors.red));
    }
  }

  Widget _textWidgetComposer() {
    return new ListView.builder(
        itemCount: widget.currencies.length,
        itemBuilder: (context, int index) {
          return new Container(
            margin: const EdgeInsets.symmetric(vertical: 15.0),
            child: new Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Container(
                    margin: const EdgeInsets.only(left: 8.0, right: 10.0),
                    child:
                        avatarWidget(index, _colors[index % _colors.length])),
                new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    coinNameWidget(index),
                    coinPriceWidget(
                        widget.currencies[index]['quote']['USD']['price']
                            .toString(),
                        widget.currencies[index]['quote']['USD']
                                ['percent_change_1h']
                            .toString())
                  ],
                ),
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text(
          "Digital currency detail's",
          style: new TextStyle(color: Colors.white),
        ),
      ),
      body: _textWidgetComposer(),
    );
  }
}
