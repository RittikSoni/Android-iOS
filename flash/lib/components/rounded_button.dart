import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  RoundedButton({this.colour, required this.onTap, required this.buttonText});
  final Color? colour;
  final String buttonText;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        // color: Colors.lightBlueAccent,
        color: colour,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: onTap,
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            '$buttonText',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
