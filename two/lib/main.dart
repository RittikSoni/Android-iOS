import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  return runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'II RS II',
          ),
        ),
        backgroundColor: Colors.teal[900],
      ),
      body: DicePage(),
      backgroundColor: Colors.teal,
    ),
  ));
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  void ButtonPressed() {
    setState(() {
      if (leftNumber == 4) {
        leftNumber = 0;
      }
      leftNumber++;
      rightNumber = Random().nextInt(6) + 1;
    });
  }

  @override
  int leftNumber = 1;
  int rightNumber = 1;
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          Expanded(
              child: FlatButton(
                  onPressed: () {
                    ButtonPressed();
                  },
                  child: Image.asset('images/RS$leftNumber.jpg'))),
          Expanded(
              child: FlatButton(
                  onPressed: () {
                    ButtonPressed();
                  },
                  child: Image.asset('images/dice$rightNumber.png')))
        ],
      ),
    );
  }
}

/* xxxxxxxxxxxxxxxxxxxxxxxxxx stateless // statefull xxxxxxxxxxxxxxxxxxxxxxxxxxxx
stateless cant change state. 
statefull can change state.
xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx*/
