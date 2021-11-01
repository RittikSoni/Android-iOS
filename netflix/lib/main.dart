import 'package:flutter/material.dart';
import 'screens/screens.dart';

void main() => runApp(NetflixUI());

class NetflixUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      title: 'Netflix',
      home: BottomNav(),
    );
    //sadsaf
  }
}
