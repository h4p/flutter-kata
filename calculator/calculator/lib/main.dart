import 'package:flutter/material.dart';
import 'calculation.dart';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Flutter Basic Calculator",
        home: Scaffold(
          body: SafeArea(child: Calculation()),
        ));
  }
}
