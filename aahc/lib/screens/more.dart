import 'package:aahc/components/sliveronly_more_button.dart';
import 'package:aahc/components/rounded_button.dart';
import 'package:aahc/constants.dart';
import 'package:aahc/screens/about.dart';
import 'package:aahc/screens/faq.dart';
import 'package:aahc/screens/jobs.dart';
import 'package:aahc/screens/login.dart';
import 'package:aahc/screens/testing.dart';
import 'package:flutter/material.dart';

class More extends StatefulWidget {
  @override
  State<More> createState() => _MoreState();
}

class _MoreState extends State<More> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('images/secure.png'),
                      fit: BoxFit.cover,
                      alignment: Alignment.topCenter)),
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 10.0),
              child: CustomScrollView(
                slivers: <Widget>[
                  MoreButton(
                    screen: Login(),
                    buttonName: 'Login',
                    btncolor: Colors.amber,
                  ),
                  MoreButton(screen: About(), buttonName: 'About'),
                  MoreButton(
                    screen: Testing(),
                    buttonName: 'Testing Report',
                    btncolor: Colors.green,
                  ),
                  MoreButton(
                      screen: Faq(),
                      buttonName: 'Frequently Asked Questions (FAQ)'),
                  MoreButton(
                    screen: Jobs(),
                    buttonName: 'Join our Team',
                    btncolor: Colors.pinkAccent,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
