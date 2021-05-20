import 'dart:math';
import 'resultpage.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  State createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  double height = 0.0, weight = 0.0;
  double bmi = 0.0;
  String desc, value;
  final TextEditingController t1 = new TextEditingController();
  final TextEditingController t2 = new TextEditingController();
  @override
  double roundDouble(double value, int places) {
    double mod = pow(10.0, places);
    return ((value * mod).round().toDouble() / mod);
  }

  void clear() {
    setState(() {
      height = 0.0;
      weight = 0.0;
      bmi = 0.0;
      t1.text = "";
      t2.text = "";
    });
  }

  calculateBMI() {
    height = double.parse(t1.text);
    weight = double.parse(t2.text);
    setState(() {
      bmi = weight / pow(height, 2);
      bmi = roundDouble(bmi, 2);
      if (bmi < 18.5) {
        value = "Underweight";
        desc = "OH!!! try to eat more my friend";
      } else if (bmi >= 18.5 && bmi <= 24.9) {
        value = "Normal";
        desc = "Superb your are on perfect track keep it up";
      } else if (bmi >= 25.0 && bmi <= 29.9) {
        value = "Overweight";
        desc = "OH!! try to reduce weight my friend";
      } else if (bmi > 30.0) {
        value = "Obese";
        desc = "OH!! try to reduce weight my friend";
      }
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          centerTitle: true,
          title: new Text("BMI-HOMEPAGE"),
        ),
        body: new Container(
          padding: EdgeInsets.all(25.0),
          child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(hintText: "height in m"),
                  controller: t1,
                ),
                new Padding(padding: EdgeInsets.only(top: 20.0)),
                new TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(hintText: "weight in kg"),
                  controller: t2,
                ),
                new Padding(padding: EdgeInsets.only(top: 35.0)),
                new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new RaisedButton(
                          child: new Text("CACULATE"),
                          color: Colors.purpleAccent,
                          onPressed: () {
                            calculateBMI();
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ResultPage(
                                          result: bmi,
                                          val: value,
                                          description: desc,
                                        )));
                          }),
                      new Padding(padding: EdgeInsets.only(right: 20.0)),
                      new RaisedButton(
                          child: new Text("CLEAR"),
                          color: Colors.purpleAccent,
                          onPressed: clear),
                    ])
              ]),
        ));
  }
}
