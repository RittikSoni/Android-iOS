import 'package:aahc/constants.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BottomFonts extends StatefulWidget {
  @override
  _BottomFontsState createState() => _BottomFontsState();
}

class _BottomFontsState extends State<BottomFonts> {
  String fontStyle = 'Dancing Script';
  String inputFont = "Aastha Hallmark";
  CupertinoPicker getFontFamily() {
    List<Text> cupertinoItems = [];
    for (String items in fontFamily) {
      cupertinoItems.add(Text(items));
    }
    return CupertinoPicker(
      itemExtent: 30,
      onSelectedItemChanged: (selectedIndex) {
        setState(() {
          try {
            fontStyle = fontFamily[selectedIndex];
            print(fontStyle);
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
    return Column(children: [
      ListView.builder(
          itemCount: 1,
          itemBuilder: (BuildContext context, int index) {
            return Column(children: [
              Container(
                  color: Colors.white,
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
                              Padding(
                                //*Input text */
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 30, vertical: 10),
                                child: TextField(
                                    onChanged: (value) {
                                      setState(() {
                                        inputFont = value;
                                      });
                                    },
                                    cursorHeight: 30,
                                    style: const TextStyle(
                                      color: Colors.black,
                                    ),
                                    cursorColor: Colors.blue,
                                    decoration: const InputDecoration(
                                      // fillColor: Color(0xFF0E3311),
                                      // filled: true,
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.black),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.black),
                                      ),
                                      border: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.black),
                                      ),
                                      labelText: 'Type Here',
                                      labelStyle:
                                          TextStyle(color: Colors.black),
                                    )),
                              ),
                              Container(
                                height: 200,
                                alignment: Alignment.center,
                                // ignore: prefer_const_constructors

                                color: Colors.amber,
                                child: getFontFamily(),
                              )
                            ])
                      ]))
            ]);
          })
    ]);
  }
}
