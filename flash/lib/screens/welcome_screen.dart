import 'package:flash/screens/login_screen.dart';
import 'package:flash/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flash/components/rounded_button.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = 'welcome_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: 60.0,
                  ),
                ),
                AnimatedTextKit(animatedTexts: [
                  TypewriterAnimatedText(
                    'Flash Chat',
                    textStyle: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.w900,
                      fontFamily: 'Horizon',
                    ),
                    speed: const Duration(milliseconds: 50),
                  )
                ]),
                Text(
                  '_',
                  style: TextStyle(
                    fontSize: 45.0,
                    fontWeight: FontWeight.w900,
                    fontFamily: 'Horizon',
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            RoundedButton(
              colour: Colors.lightBlueAccent,
              buttonText: 'Log In',
              onTap: () {
                Navigator.pushNamed(context, LoginScreen.id);
              },
            ),
            RoundedButton(
              onTap: () {
                Navigator.pushNamed(context, RegistrationScreen.id);
              },
              buttonText: 'Register',
              colour: Colors.blueAccent,
            )
          ],
        ),
      ),
    );
  }
}
