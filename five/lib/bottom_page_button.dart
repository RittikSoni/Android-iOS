import 'package:flutter/material.dart';
import 'Constants.dart';

class BottomPageButton extends StatelessWidget {
  BottomPageButton({this.name, this.ontap});
  final String? name;
  final Function()? ontap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        margin: EdgeInsets.only(top: 10),
        width: double.infinity,
        height: kBottonContainerHeight,
        color: Color(0xffeb1555),
        child: Center(
          child: Text(
            '$name',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
      ),
    );
  }
}
