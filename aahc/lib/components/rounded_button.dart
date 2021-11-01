import 'package:aahc/constants.dart';
import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  RoundedButton(
      {this.colour,
      required this.onTap,
      required this.buttonText,
      this.shadowColour = Colors.amber});
  final Color? colour;
  final String buttonText;
  final Function() onTap;
  final Color shadowColour;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        shadowColor: shadowColour,
        elevation: 6.0,
        // color: Colors.lightBlueAccent,
        color: colour,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: onTap,
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            '$buttonText',
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
