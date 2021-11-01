import 'package:aahc/constants.dart';
import 'package:aahc/screens/login/login_card.dart';
import 'package:aahc/screens/login/login_gallery.dart';
import 'package:aahc/screens/login/login_jobs.dart';
import 'package:aahc/screens/login/login_testing.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class LoginNav extends StatefulWidget {
  @override
  State<LoginNav> createState() => _LoginNavState();
}

class _LoginNavState extends State<LoginNav> {
  int _index = 0;

  List screens = [
    LoginTesting(),
    LoginCard(),
    LoginGallery(),
    LoginJobs(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens.elementAt(_index),
      bottomNavigationBar: GNav(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        gap: 10,
        tabBackgroundGradient: const LinearGradient(
            colors: [Colors.lightBlueAccent, Colors.pinkAccent, Colors.amber]),
        rippleColor: Colors.amber,
        color: isADark ? Colors.black : Colors.amber,
        activeColor: isADark ? Colors.black : Colors.white,
        tabs: const [
          GButton(
            icon: Icons.surfing,
            text: 'Testing',
          ),
          GButton(
            icon: Icons.credit_card,
            text: 'CARD',
          ),
          GButton(
            icon: Icons.slideshow,
            text: 'GALLERY',
          ),
          GButton(icon: Icons.card_travel, text: 'JOBS'),
        ],
        selectedIndex: _index,
        onTabChange: (index) {
          setState(() {
            _index = index;
          });
        },
      ),
    );
  }
}
