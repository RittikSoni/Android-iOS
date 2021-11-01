import 'package:flutter/material.dart';
import 'Constants.dart';

class IconContent extends StatelessWidget {
  IconContent({this.r_IconImage, this.r_IconLabel});
  final IconData? r_IconImage;
  final String? r_IconLabel;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          r_IconImage,
          size: 80,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          '$r_IconLabel',
          style: labelTxtStyle,
        ),
      ],
    );
  }
}
