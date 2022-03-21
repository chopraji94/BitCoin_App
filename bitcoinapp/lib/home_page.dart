import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Widget _textWidgetComposer() {
    return new ListView.builder(
      itemCount: 1,
      itemBuilder: (context,int index){
        return new Container(
          margin: const EdgeInsets.symmetric(vertical: 15.0),
          child: new Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Container(
                margin: const EdgeInsets.only(right: 10.0),
                child: new CircleAvatar(child: Text("P")),
              ),
              new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Text(
                    "Pranav Chopra",
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  new Container(
                    margin: const EdgeInsets.only(top: 5.0),
                    child: Text("Hello, How are you"),
                  ),
                ],
              ),
            ],
          ),
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Digital currency detail's",style: new TextStyle(color: Colors.white),),
      ),
      body: _textWidgetComposer(),
    );
  }
}
