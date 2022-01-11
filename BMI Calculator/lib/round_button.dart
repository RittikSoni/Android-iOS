import 'package:flutter/material.dart';

class R_RoundIconButton extends StatelessWidget {
  R_RoundIconButton({this.r_icon, this.r_OnTap2});
  final IconData? r_icon;
  final Function()? r_OnTap2;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(r_icon),
      onPressed: r_OnTap2,
      constraints: BoxConstraints.tightFor(width: 56, height: 56),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}
