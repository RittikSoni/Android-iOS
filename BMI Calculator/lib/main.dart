import 'package:flutter/material.dart';
import 'InputPage.dart';

void main() {
  runApp(Five());
}

class Five extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
      ),
      title: 'five',
      home: InputPage(),
    );
  }
}
