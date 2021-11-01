import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/cupertino.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView(
          scrollDirection: Axis.vertical,
          children: [
            Container(
                decoration: const BoxDecoration(
                  // gradient: LinearGradient(
                  //     colors: [Colors.red, Colors.green],
                  //     begin: Alignment.bottomCenter,
                  //     end: Alignment.topCenter),
                  borderRadius:
                      BorderRadius.only(bottomRight: Radius.circular(50)),
                  image: DecorationImage(
                    alignment: Alignment.centerLeft,
                    image: AssetImage('images/office.jpg'),
                    fit: BoxFit.cover,
                    colorFilter:
                        ColorFilter.mode(Colors.black54, BlendMode.darken),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextLiquidFill(
                      loadDuration: const Duration(microseconds: 10),
                      loadUntil: 0.5,
                      boxHeight: 45,
                      boxWidth: 150,
                      text: 'AAHC',
                      waveColor: Colors.lightBlueAccent,
                      textStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          letterSpacing: 5,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const Text(
                      'AASTHA ASSAYING & HALLMARKING',
                      style: TextStyle(
                          fontSize: 25, letterSpacing: 5, color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ],
                )),
            Container(
              decoration: const BoxDecoration(color: Colors.white),
              child: Wrap(
                alignment: WrapAlignment.center,
                direction: Axis.horizontal,
                runAlignment: WrapAlignment.center,
                children: [
                  Image.asset(
                    'images/bis.png',
                    width: 200,
                  ),
                  const Center(
                      child: Padding(
                    padding: EdgeInsets.only(
                        left: 20, right: 40, top: 40, bottom: 0),
                    child: Text(
                      'AAHC is the diamond & gemological lab and hallmarking center serving consumer protection. We plan to remain a top choice of the jewelry industry and the consumer when it comes to reliability, integrity, and an absolute conviction to serve everyone who relies upon our judgments and services.',
                      style: TextStyle(color: Colors.black),
                      textAlign: TextAlign.center,
                    ),
                  )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
