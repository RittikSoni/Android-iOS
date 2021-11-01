import 'package:aahc/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';

class GalleyFontD extends StatefulWidget {
  @override
  State<GalleyFontD> createState() => _GalleyFontDState();
}

class _GalleyFontDState extends State<GalleyFontD> {
  String fontStyle = 'Dancing Script';

  String inputFont = "Aastha Hallmark";

  CupertinoPicker getFontFamily() {
    List<Text> cupertinoItems = [];
    for (String items in fontFamily) {
      cupertinoItems
          .add(Text('AAHC - ${(items.hashCode / 10000).toStringAsFixed(0)}'));
    }
    return CupertinoPicker(
      itemExtent: 30,
      onSelectedItemChanged: (selectedIndex) {
        setState(() {
          try {
            fontStyle = fontFamily[selectedIndex];
          } catch (e) {
            print(e);
          }
        });
      },
      children: cupertinoItems,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              // decoration: const BoxDecoration(
              //     image: DecorationImage(
              //   image: AssetImage('images/aahc_logo1.png'),
              //   fit: BoxFit.contain,
              //   colorFilter: ColorFilter.mode(Colors.black54, BlendMode.darken),
              // )),
              // color: Colors.white,
              child: CustomScrollView(
                slivers: <Widget>[
                  SliverToBoxAdapter(
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                //*showingtext */
                                child: Text(
                                  inputFont,
                                  style: GoogleFonts.getFont(fontStyle,
                                      fontSize: 70, color: Colors.redAccent),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            //*Input text */
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: TextField(
                onChanged: (value) {
                  setState(() {
                    inputFont = value;
                  });
                },
                cursorHeight: 30,
                // style: const TextStyle(
                //   color: Colors.black,
                // ),
                cursorColor: Colors.blue,
                decoration: const InputDecoration(
                  // fillColor: Color(0xFF0E3311),
                  // filled: true,
                  // enabledBorder: UnderlineInputBorder(
                  //   borderSide: BorderSide(color: Colors.black),
                  // ),
                  // focusedBorder: UnderlineInputBorder(
                  //   borderSide: BorderSide(color: Colors.black),
                  // ),
                  // border: UnderlineInputBorder(
                  //   borderSide: BorderSide(color: Colors.black),
                  // ),
                  labelText: 'Type Here',
                  // labelStyle: TextStyle(color: Colors.black),
                )),
          ),
          Expanded(
            child: Container(
              //**cupertino selector */
              height: 200,
              alignment: Alignment.center,
              // ignore: prefer_const_constructors

              color: Colors.amber,
              child: getFontFamily(),
            ),
          ),
        ],
      ),
    );
  }
}











//  Column(
//                         children: [
//                           const SizedBox(
//                             height: 20,
//                           ),
//                           GestureDetector(
//                             onTap: () {
//                               setState(() {
//                                 try {
//                                   fontStyle = 'PT Serif';
//                                 } catch (e) {
//                                   print(e);
//                                 }
//                               });
//                             },
//                             child: Container(
//                               padding: EdgeInsets.symmetric(
//                                   horizontal: 50, vertical: 30),
//                               decoration: BoxDecoration(
//                                   // border: Border.all(),
//                                   // borderRadius: BorderRadius.circular(10),
//                                   color: Colors.black.withOpacity(0.2)),
//                               width: double.infinity,
//                               alignment: Alignment.center,
//                               child: Text(
//                                 'AASTHA HALLMARK',
//                                 style: GoogleFonts.getFont(
//                                   'PT Serif',
//                                   color: Colors.amber,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                       Column(
//                         children: [
//                           const SizedBox(
//                             height: 20,
//                           ),
//                           GestureDetector(
//                             onTap: () {
//                               setState(() {
//                                 fontStyle = 'Pacifico';
//                               });
//                             },
//                             child: Container(
//                               padding: EdgeInsets.symmetric(
//                                   horizontal: 50, vertical: 30),
//                               decoration: BoxDecoration(
//                                   color: Colors.black.withOpacity(0.2)),
//                               width: double.infinity,
//                               alignment: Alignment.center,
//                               child: Text(
//                                 'AASTHA HALLMARK',
//                                 style: GoogleFonts.getFont(
//                                   'Pacifico',
//                                   color: Colors.amber,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                       Column(
//                         children: [
//                           const SizedBox(
//                             height: 20,
//                           ),
//                           GestureDetector(
//                             onTap: () {
//                               setState(() {
//                                 fontStyle = 'Major Mono Display';
//                               });
//                             },
//                             child: Container(
//                               padding: EdgeInsets.symmetric(
//                                   horizontal: 50, vertical: 30),
//                               decoration: BoxDecoration(
//                                   color: Colors.black.withOpacity(0.2)),
//                               width: double.infinity,
//                               alignment: Alignment.center,
//                               child: Text(
//                                 'AASTHA HALLMARK',
//                                 style: GoogleFonts.getFont(
//                                   'Major Mono Display',
//                                   color: Colors.amber,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                       Column(
//                         children: [
//                           const SizedBox(
//                             height: 20,
//                           ),
//                           GestureDetector(
//                             onTap: () {
//                               setState(() {
//                                 try {
//                                   fontStyle = 'Syne Mono';
//                                 } catch (e) {
//                                   print(e);
//                                 }
//                               });
//                             },
//                             child: Container(
//                               padding: EdgeInsets.symmetric(
//                                   horizontal: 50, vertical: 30),
//                               decoration: BoxDecoration(
//                                   color: Colors.black.withOpacity(0.2)),
//                               width: double.infinity,
//                               alignment: Alignment.center,
//                               child: Text(
//                                 'AASTHA HALLMARK',
//                                 style: GoogleFonts.getFont(
//                                   'Syne Mono',
//                                   color: Colors.amber,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),