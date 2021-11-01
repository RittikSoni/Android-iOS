import 'package:aahc/constants.dart';
import 'package:flutter/material.dart';

class CustomAppBar {
  AppBar cutomAppBar() {
    return AppBar(
      centerTitle: true,
      title: Text('AASTHA HALLMARK',
          style: TextStyle(
              color: isADark ? Colors.black : Colors.amber,
              letterSpacing: 5,
              fontSize: 15)),
      leading: Image.asset(
        'images/aahclogo.png',
        alignment: Alignment.centerLeft,
      ),
      shadowColor: Colors.amber,
    );
  }
}
