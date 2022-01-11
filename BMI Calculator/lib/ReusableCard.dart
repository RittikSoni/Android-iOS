import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard({this.r_Color, this.r_ContChild, this.r_OnTap});
  final Color? r_Color;
  final Widget? r_ContChild;
  final Function()? r_OnTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: r_OnTap,
      child: Container(
        child: r_ContChild,
        decoration: BoxDecoration(
          color: r_Color,
          borderRadius: BorderRadius.circular(10),
        ),
        margin: EdgeInsets.all(15.0),
      ),
    );
  }
}
