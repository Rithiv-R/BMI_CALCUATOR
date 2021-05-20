import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final result;
  final val;
  final description;
  ResultPage({this.result, this.val, this.description});
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          centerTitle: true,
          title: Text("BMI-RESULTPAGE"),
          automaticallyImplyLeading: false,
        ),
        body: new Center(
            child: new Column(children: <Widget>[
          new Padding(padding: EdgeInsets.only(top: 130.0)),
          new Text(
            "$val",
            style: new TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.w500,
                color: Colors.orangeAccent),
          ),
          new Padding(padding: EdgeInsets.only(top: 130.0)),
          new Text(
            "BMI:$result",
            textAlign: TextAlign.center,
            style: new TextStyle(
                fontSize: 45.0,
                fontWeight: FontWeight.w500,
                color: Colors.purpleAccent),
          ),
          new Padding(padding: EdgeInsets.only(top: 130.0)),
          new Text(
            "$description",
            textAlign: TextAlign.center,
            style: new TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w500,
                color: Colors.orangeAccent),
          ),
          new Padding(padding: EdgeInsets.only(top: 70.0)),
          new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new RaisedButton(
                    child: new Text("RECALCULATE"),
                    color: Colors.purpleAccent,
                    onPressed: () {
                      Navigator.pop(context);
                    })
              ])
        ])));
  }
}
