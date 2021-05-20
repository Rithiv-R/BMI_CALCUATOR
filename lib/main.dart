import 'package:flutter/material.dart';
import 'homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "BMI CALCULATOR",
      theme: new ThemeData(primarySwatch: Colors.purple),
      home: HomePage(),
    );
  }
}
