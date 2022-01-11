import 'package:five/ReusableCard.dart';
import 'package:five/bottom_page_button.dart';
import 'package:flutter/material.dart';
import 'Constants.dart';

class Results extends StatelessWidget {
  Results(
      {required this.bmiResult,
      required this.interpretation,
      required this.result});
  final String bmiResult;
  final String result;
  final String interpretation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('V ス V'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.all(15),
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Your Result',
                  style: kBigTextStyle,
                ),
              ),
            ),
            Expanded(
                flex: 5,
                child: ReusableCard(
                  r_Color: kActiveCardColor,
                  r_ContChild: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(result.toUpperCase(),
                          style: TextStyle(color: Colors.green, fontSize: 25)),
                      Text(bmiResult, style: kNumberTextStyle),
                      Text(
                        interpretation,
                        style: TextStyle(color: Colors.white, fontSize: 20),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                )),
            BottomPageButton(
              name: 'Re-Calculate',
              ontap: () {
                Navigator.pop(context);
              },
            )
          ],
        ));
  }
}
