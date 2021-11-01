import 'package:aahc/constants.dart';
import 'package:aahc/models/getimage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ADGL extends StatefulWidget {
  @override
  State<ADGL> createState() => _ADGLState();
}

class _ADGLState extends State<ADGL> {
  // Widget appBarTitle = const Text(
  //   'ADGL Certificate',
  //   style: TextStyle(color: Colors.lightBlueAccent),
  // );
  Icon actionIcon = const Icon(
    Icons.search,
    color: Colors.pinkAccent,
  );

  final _controller = TextEditingController();
  String adglReportID = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          //*  A P P B A R /
          title: TextField(
              controller: _controller,
              // onChanged: (value) {
              //   setState(() {
              //     adglReportID = value;
              //   });
              // },

              decoration: kTextfieldDecoration.copyWith(
                  hintText: 'Enter your Certificate ID',
                  suffixIcon: IconButton(
                      onPressed: () {
                        if (_controller.text.isEmpty ||
                            _controller.text.contains(RegExp(
                                r'(\W\D)' // \W for not words and \D for non digit for more instructions check online regexp
                                //* r'(\:|\;|\{|\}|\]|\[|\$|\^|\(|\)|\\|\/|\.|\"|\=|\+|\-|\_|\@|\#|\!|\%|\*|\&)' | means or in regexp
                                ))) {
                          showDialog(
                              context: context,
                              builder: (BuildContext) {
                                return AlertDialog(
                                  title: Text(
                                    'Please Check your Certificate ID',
                                    style: TextStyle(
                                        color: isADark
                                            ? Colors.lightBlue
                                            : Colors.amber),
                                  ),
                                  content: Text(
                                      'If the problem continues, Please contact us. We apologize for the inconvenience'),
                                  actions: [
                                    ElevatedButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text('Ok'))
                                  ],
                                );
                              });
                        } else {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => GetImage(
                                        searchedText: _controller.text,
                                      )));
                        }
                      },
                      icon: const Icon(Icons.search)))),
          centerTitle: true,
        ),
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Wrap(
                children: [
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      height: 300,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('images/diamond.jpg'),
                              fit: BoxFit.cover,
                              colorFilter: ColorFilter.mode(
                                  Colors.lightBlue, BlendMode.overlay))),
                      child: Wrap(
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 20),
                            child: Text(
                              'ADGL',
                              style: TextStyle(
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 8.0,
                              right: 50,
                            ),
                            child: Container(
                              // color: Colors.black.withOpacity(0.5),
                              child: Text(
                                'AAHC is the diamond & gemological lab and hallmarking center serving consumer protection. We plan to remain a top choice of the jewelry industry and the consumer when it comes to reliability, integrity, and an absolute conviction to serve everyone who relies upon our judgments and services.',
                                style: TextStyle(
                                  color: Colors.white,
                                  backgroundColor:
                                      Colors.black.withOpacity(0.5),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Divider(
                    height: 30.0,
                    color: Colors.transparent,
                  ),
                  const Text(
                    'ADGL Services',
                    style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  CarouselSlider(
                    items: [
                      Container(
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            image: DecorationImage(
                                image: AssetImage(
                                    'images/adgl/AdglDiamondSample.PNG'),
                                fit: BoxFit.contain)),
                      ),
                      Container(
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            image: DecorationImage(
                                image: AssetImage('images/adgl/AdglSample.PNG'),
                                fit: BoxFit.contain)),
                      ),
                    ],
                    options: CarouselOptions(
                      height: 200.0,
                      autoPlay: true,
                      enlargeCenterPage: true,
                    ),
                  ),
                  const Divider(
                    height: 30.0,
                    color: Colors.transparent,
                  ),
                  const Text(
                    'General identification of Diamonds​',
                    style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  CarouselSlider(
                    items: [
                      Container(
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            image: DecorationImage(
                                image: AssetImage('images/adgl/article2.JPG'),
                                fit: BoxFit.contain)),
                      ),
                      Container(
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            image: DecorationImage(
                                image: AssetImage('images/adgl/article3.JPG'),
                                fit: BoxFit.contain)),
                      ),
                      Container(
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            image: DecorationImage(
                                image: AssetImage('images/adgl/article4.JPG'),
                                fit: BoxFit.cover)),
                      ),
                      Container(
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            image: DecorationImage(
                                image: AssetImage('images/adgl/article5.png'),
                                fit: BoxFit.contain)),
                      ),
                    ],
                    options: CarouselOptions(
                      height: 300.0,
                      autoPlay: true,
                      enlargeCenterPage: true,
                    ),
                  ),
                  const Divider(
                    height: 30.0,
                    indent: 50.0,
                    endIndent: 50.0,
                    color: Colors.lightBlue,
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
