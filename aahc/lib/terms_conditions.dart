import 'package:flutter/material.dart';

class TermsAndCond extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.pink),
        centerTitle: true,
        title: Image.asset(
          'images/aahclogo.png',
          fit: BoxFit.contain,
          width: 50,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              children: const [
                Text(
                  'Terms & Conditions',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                    'Solder jewellery will show variable results, if solder is not of the same quality.\nWe donot take any responsibility or guarantee, if the metal is not homogeneous.\nMaximum Tolerance +/- 0.50%, if metal is homogeneous.'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
