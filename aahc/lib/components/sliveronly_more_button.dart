import 'package:aahc/components/rounded_button.dart';
import 'package:flutter/material.dart';

class MoreButton extends StatelessWidget {
  Widget screen;
  String buttonName;
  Color btncolor;
  MoreButton({
    required this.screen,
    required this.buttonName,
    this.btncolor = Colors.lightBlueAccent,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: RoundedButton(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => screen));
        },
        buttonText: buttonName,
        colour: btncolor,
      ),
    );
  }
}
