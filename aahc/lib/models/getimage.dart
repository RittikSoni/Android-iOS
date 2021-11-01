import 'dart:io';

import 'package:aahc/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:loading_overlay/loading_overlay.dart';

class GetImage extends StatefulWidget {
  String? searchedText;
  GetImage({this.searchedText});

  @override
  State<GetImage> createState() => _GetImageState();
}

class _GetImageState extends State<GetImage> {
  bool showSpinner = false;
  int rotate = 0;
  @override
  void initState() {
    getdetails();
    print(widget.searchedText);
    super.initState();
  }

  final _firestore = FirebaseFirestore.instance;
  String bgimg = 'https://www.w3schools.com/howto/img_nature_wide.jpg';
  String status =
      'Please Check your Certificate ID & if the problem continues, contact us';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.amber,
        shadowColor: Colors.amber,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.lightBlueAccent),
        title: Text(
          'AASTHA HALLMARK',
          style: TextStyle(color: isADark ? Colors.black : Colors.white),
        ),
      ),
      body: SafeArea(
          child: LoadingOverlay(
        isLoading: showSpinner,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 5,
              child: RotatedBox(
                quarterTurns: rotate,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  width: double.infinity,
                  child: Image.network(
                    bgimg,
                    errorBuilder: (context, e, a) {
                      return Center(
                          child: Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        direction: Axis.vertical,
                        children: const [
                          Icon(Icons.signal_wifi_connected_no_internet_4),
                          SizedBox(
                            height: 10,
                          ),
                          Text('Please Check your internet connection.'),
                        ],
                      ));
                    },
                    fit: rotate == 0 ? BoxFit.fitWidth : BoxFit.contain,
                  ),
                ),
              ),
            ),
            Expanded(
                flex: 1,
                child: ListView(
                  // alignment: WrapAlignment.spaceEvenly,
                  // crossAxisAlignment: WrapCrossAlignment.center,
                  // spacing: 10,
                  children: [
                    ListBody(
                      children: [
                        ListTile(
                          title: Text(
                            status,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          trailing: IconButton(
                              onPressed: () {
                                setState(() {
                                  rotate == 0 ? rotate = 3 : rotate = 0;
                                });
                              },
                              icon: Icon(Icons.rotate_90_degrees_ccw)),
                        ),
                      ],
                    ),
                  ],
                )),
            // Expanded( //!reload or download button
            //   flex: 1,
            //   child: Container(
            //       decoration: BoxDecoration(color: Colors.lightBlueAccent),
            //       height: 400,
            //       width: double.infinity,
            //       child: IconButton(
            //         onPressed: () {
            //           getdetails();
            //         },
            //         icon: Icon(Icons.get_app),
            //       )),
            // )
          ],
        ),
      )),
    );
  }

  void getdetails() async {
    try {
      setState(() {
        showSpinner = true;
      });
      final imgs = await _firestore.collection('certDetails').get();

      for (var img in imgs.docs) {
        print(img.data());
        if (img.data().containsValue(widget.searchedText)) {
          setState(() {
            bgimg = img.get('imageURL');
            status = img.get('name');
          });
          setState(() {
            showSpinner = false;
          });
        } else {
          setState(() {
            showSpinner = false;
          });
          print(img.get('imageURL'));
        }
      }
    } on SocketException catch (e) {
      print('either no internet or sonthing went wrong.');
    }
  }
}
