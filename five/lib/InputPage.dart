import 'package:five/ResultPage.dart';
import 'package:five/ReusableCard.dart';
import 'package:flutter/material.dart';
import 'IconContent.dart';
import 'Constants.dart';
import 'bottom_page_button.dart';
import 'round_button.dart';
import 'calculator_Brain.dart';

enum Gender {
  Male,
  Female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

int height = 180;
int weight = 60;
int age = 20;
Gender selectedGender = Gender.Male;

class _InputPageState extends State<InputPage> {
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
              child: Row(
            children: [
              Expanded(
                child: ReusableCard(
                  r_OnTap: () {
                    setState(() {
                      selectedGender = Gender.Male;
                    });
                  },
                  r_Color: selectedGender == Gender.Male
                      ? kInactiveCardColor
                      : kActiveCardColor,
                  r_ContChild: IconContent(
                    r_IconImage: Icons.male,
                    r_IconLabel: 'Male',
                  ),
                ),
              ),
              Expanded(
                child: ReusableCard(
                  r_OnTap: () {
                    setState(() {
                      selectedGender = Gender.Female;
                    });
                  },
                  r_Color: selectedGender == Gender.Female
                      ? kInactiveCardColor
                      : kActiveCardColor,
                  r_ContChild: IconContent(
                    r_IconImage: Icons.female,
                    r_IconLabel: 'Female',
                  ),
                ),
              ),
            ],
          )),
          Expanded(
            child: ReusableCard(
              r_Color: Color(0xFF1D1E33),
              r_ContChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'HEIGHT',
                    style: labelTxtStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: kNumberTextStyle,
                      ),
                      Text('cm'),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                        inactiveTrackColor: Color(0xFF8D8E98),
                        activeTrackColor: Colors.white,
                        overlayColor: Color(0x29EB1555),
                        thumbColor: Color(0xFFEB1555),
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 9.0),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 25)),
                    child: Slider(
                        value: height.toDouble(),
                        min: 120,
                        max: 220,
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue.round();
                          });
                        }),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    r_Color: kActiveCardColor,
                    r_ContChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('WEIGHT'),
                        Text(weight.toString(), style: kNumberTextStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            R_RoundIconButton(
                              r_OnTap2: () {
                                setState(() {
                                  weight--;
                                });
                              },
                              r_icon: Icons.remove,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            R_RoundIconButton(
                              r_OnTap2: () {
                                setState(() {
                                  weight++;
                                });
                              },
                              r_icon: Icons.add,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    r_Color: kActiveCardColor,
                    r_ContChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('AGE'),
                        Text(age.toString(), style: kNumberTextStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            R_RoundIconButton(
                              r_OnTap2: () {
                                setState(() {
                                  age--;
                                });
                              },
                              r_icon: Icons.remove,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            R_RoundIconButton(
                              r_OnTap2: () {
                                setState(() {
                                  age++;
                                });
                              },
                              r_icon: Icons.add,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomPageButton(
            ontap: () {
              Calc_brain calc = Calc_brain(bheight: height, bweight: weight);
              print(calc.bmiResult());
              print(height);
              print(weight);
              print(calc.bheight);
              print(calc.bweight);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Results(
                            bmiResult: calc.bmiResult(),
                            interpretation: calc.interpretation(),
                            result: calc.getResult(),
                          )));
            },
            name: 'CALCULATE',
          )
        ],
      ),
    );
  }
}
