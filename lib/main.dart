import 'package:flutter/material.dart';
import 'input_page.dart';

void main() {
  runApp(BMICalculator());
}

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xff0a0e21),
        accentColor: Colors.red,
        scaffoldBackgroundColor: Color(0xff0a0e21),
        fontFamily: 'Audiowide',
        textTheme: TextTheme(
          headline1: TextStyle(
            fontSize: 32,
            color: Colors.white,
          ),
          bodyText1: TextStyle(
            fontSize: 22,
            color: Colors.white,
          ),
        ),
      ),
      home: SafeArea(child: InputPage()),
    );
  }
}

