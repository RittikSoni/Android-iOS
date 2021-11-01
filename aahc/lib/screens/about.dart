import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'about/about_details.dart';

class About extends StatefulWidget {
  About({Key? key}) : super(key: key);

  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // bottom: PreferredSize(
        //     child: Text(
        //       'AAHC',
        //       style: TextStyle(color: isDark ? Colors.black : Colors.white),
        //     ),
        //     preferredSize: Size.fromHeight(0)),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.close,
            ),
            color: Colors.pinkAccent,
          )
        ],
        centerTitle: true,
        title: Text('AASTHA HALLMARK',
            style: TextStyle(
                letterSpacing: 5, fontSize: 15, color: Colors.pinkAccent)),
        leading: Image.asset(
          'images/aahclogo.png',
          alignment: Alignment.centerLeft,
        ),
        shadowColor: Colors.amber,
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisExtent: 300,
                ),
                itemCount: 2,
                itemBuilder: (BuildContext context, int index) {
                  return RawMaterialButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AboutDetailsPage(
                            imagePath: (_images[index].imagePath) ==
                                    'images/aahc_logo1.png'
                                ? 'images/aahcbcard.jpg'
                                : 'images/adglb.jpg',
                            title: _images[index].title,
                            details: _images[index].details,
                            index: index,
                          ),
                        ),
                      );
                    },
                    child: Hero(
                      tag: 'logo$index',
                      child: CircleAvatar(
                        radius: 82,
                        backgroundColor: Colors.amber,
                        child: CircleAvatar(
                            radius: 80,
                            backgroundImage:
                                AssetImage(_images[index].imagePath),
                            backgroundColor: Colors.white),
                      ),
                      // Container(
                      //   decoration: BoxDecoration(
                      //     // boxShadow: [
                      //     //   BoxShadow(
                      //     //     color: Colors.white,
                      //     //     blurRadius: 25.0, // soften the shadow
                      //     //     spreadRadius: 5.0, //extend the shadow
                      //     //     offset: Offset(
                      //     //       1.0, // Move to right 10  horizontally
                      //     //       1.0, // Move to bottom 10 Vertically
                      //     //     ),
                      //     //   ),
                      //     // ],
                      //     borderRadius: BorderRadius.circular(15),

                      //     image: DecorationImage(
                      //       image: AssetImage(_images[index].imagePath),
                      //       fit: BoxFit.contain,
                      //     ),
                      //   ),
                      // ),
                    ),
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20, left: 20, bottom: 20),
            child: Container(
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: Colors.amber,
                    width: 5,
                  ),
                  bottom: BorderSide(
                    color: Colors.blueAccent,
                    width: 5,
                  ),
                  right: BorderSide(
                    color: Colors.red,
                    width: 5,
                  ),
                  left: BorderSide(
                    color: Colors.green,
                    width: 5,
                  ),
                ),
              ),
              child: const Text(
                'AASTHA ASSAYING & HALLMARKING',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 20, right: 20, left: 20, bottom: 30),
            child: Text(
              'AAHC is the diamond & gemological lab and hallmarking center serving consumer protection. We plan to remain a top choice of the jewelry industry and the consumer when it comes to reliability, integrity, and an absolute conviction to serve everyone who relies upon our judgments and services.',
              style: TextStyle(
                fontSize: 20,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

final List<AboutImageDetails> _images = [
  AboutImageDetails(
    imagePath: 'images/aahc_logo1.png',
    title: 'AAHC',
    details:
        'AAHC is the diamond & gemological lab and hallmarking center serving consumer protection. We plan to remain a top choice of the jewelry industry and the consumer when it comes to reliability, integrity, and an absolute conviction to serve everyone who relies upon our judgments and services.',
  ),
  AboutImageDetails(
    imagePath: 'images/adgl_logo2.png',
    title: 'ADGL',
    details:
        'AAHC is the diamond & gemological lab and hallmarking center serving consumer protection. We plan to remain a top choice of the jewelry industry and the consumer when it comes to reliability, integrity, and an absolute conviction to serve everyone who relies upon our judgments and services.',
  ),
];

class AboutImageDetails {
  AboutImageDetails({
    required this.imagePath,
    required this.title,
    required this.details,
  });
  final String imagePath;

  final String title;
  final String details;
}
