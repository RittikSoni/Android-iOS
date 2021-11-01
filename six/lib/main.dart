import 'package:flutter/material.dart';
import 'package:six/screens/loading_screen.dart';

void main() => runApp(Six());

class Six extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: LoadingScreen(),
    );
  }
}
