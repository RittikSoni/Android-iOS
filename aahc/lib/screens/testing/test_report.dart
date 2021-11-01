import 'dart:io';

import 'package:aahc/components/custom_appbar.dart';
import 'package:aahc/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:loading_overlay/loading_overlay.dart';

class TestReport extends StatefulWidget {
  String? searchedTestId;
  TestReport({this.searchedTestId});

  @override
  _TestReportState createState() => _TestReportState();
}

class _TestReportState extends State<TestReport> {
  @override
  void initState() {
    _getdetails();
    super.initState();
  }

  String? au,
      ag,
      other,
      testID,
      imgUrl,
      remarks = '',
      weight = '',
      carat = '',
      description;
  bool showSpinner = false;
  final _fireStore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                Navigator.pop(context);
              });
            },
            icon: Icon(Icons.arrow_back_ios),
            color: Colors.lightBlue,
          ),
        ],
        centerTitle: true,
        title: Text('AASTHA HALLMARK',
            style: TextStyle(
                color: isADark ? Colors.black : Colors.amber,
                letterSpacing: 5,
                fontSize: 15)),
        leading: Image.asset(
          'images/aahclogo.png',
          alignment: Alignment.centerLeft,
        ),
        shadowColor: Colors.amber,
      ),
      body: SafeArea(
        child: LoadingOverlay(
          isLoading: showSpinner,
          child: Column(
            children: [
              Expanded(
                child: Container(
                  child: ListView(
                    children: [
                      Column(
                        children: [
                          RichText(
                              text: TextSpan(
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FontStyle.italic,
                                      color: Colors.lightBlue),
                                  children: [
                                au == null
                                    ? const TextSpan(text: 'Sample Report')
                                    : TextSpan(children: [
                                        const TextSpan(
                                            text: 'AAHC XRF Testing Report\n'),
                                        TextSpan(
                                          text: testID,
                                          style: const TextStyle(
                                            color: Colors.purple,
                                          ),
                                        ),
                                      ]),
                              ])),

                          Divider(
                            thickness: 2,
                            height: 10,
                            color: Colors.lightBlue,
                            indent: 80,
                            endIndent: 80,
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 20),
                            height: 200,
                            width: 200,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                              image: DecorationImage(
                                  image: imgUrl == null
                                      ? AssetImage('images/bangles.png')
                                      : NetworkImage(imgUrl!) as ImageProvider,
                                  fit: BoxFit.fill),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 0),
                            width: 200,
                            height: 250,
                            child: Stack(
                              children: [
                                PieChart(
                                  PieChartData(
                                    sectionsSpace: 0,
                                    startDegreeOffset: -90,
                                    pieTouchData: PieTouchData(
                                        enabled: true,
                                        touchCallback: (value) {
                                          setState(() {
                                            print(value.touchedSection);
                                          });
                                        }),
                                    sections: [
                                      PieChartSectionData(
                                        //**AU */
                                        radius: 50,
                                        color: Colors.amber,
                                        value: au == null
                                            ? 92.78
                                            : double.parse(au!),
                                      ),
                                      PieChartSectionData(
                                        //**AG */
                                        radius: 47,
                                        color: Colors.blue,
                                        value: ag == null
                                            ? 50.00
                                            : double.parse(ag!),
                                      ),
                                      PieChartSectionData(
                                        //**OTHER */
                                        radius: 44,
                                        color: Colors.red,
                                        value: other == null
                                            ? 50.00
                                            : double.parse(other!),
                                      ),
                                    ],
                                  ),
                                ),
                                Positioned.fill(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        carat == ''
                                            ? 'AAHC'
                                            : 'Carat\n$carat K',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 20),
                            child: Row(
                              children: const [
                                Icon(
                                  Icons.circle,
                                  color: Colors.blue,
                                ),
                                Text('Ag (Silver)'),
                                Spacer(),
                                Icon(
                                  Icons.circle,
                                  color: Colors.amber,
                                ),
                                Text('Au (Gold)'),
                                Spacer(),
                                Icon(
                                  Icons.circle,
                                  color: Colors.red,
                                ),
                                Text('other'),
                              ],
                            ),
                          ),
                          Table(
                            children: <TableRow>[
                              TableRow(
                                //! ROW 1
                                children: [
                                  TableCell(
                                    child: Container(
                                      height: 50,
                                      color: Colors.amber.withOpacity(0.2),
                                      child: Text('Description'),
                                      alignment: Alignment.center,
                                    ),
                                  ),
                                  TableCell(
                                    child: Container(
                                      height: 50,
                                      color: Colors.amber.withOpacity(0.2),
                                      child: Text(description == null
                                          ? 'Gold Bangles'
                                          : '$description'),
                                      alignment: Alignment.center,
                                    ),
                                  ),
                                ],
                              ),
                              TableRow(
                                //! ROW 2
                                children: [
                                  TableCell(
                                    child: Container(
                                      height: 50,
                                      color: Colors.purple.withOpacity(0.2),
                                      child: Text('Weight'),
                                      alignment: Alignment.center,
                                    ),
                                  ),
                                  TableCell(
                                    child: Container(
                                      height: 50,
                                      color: Colors.purple.withOpacity(0.2),
                                      child: Text(weight == ''
                                          ? '180.2980 gm'
                                          : '$weight gm'),
                                      alignment: Alignment.center,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          // Container(
                          //   padding: const EdgeInsets.only(
                          //       top: 10, right: 20, left: 10, bottom: 0),
                          //   width: double.infinity,
                          //   child: const Text(
                          //     'Description',
                          //     style: TextStyle(
                          //         fontWeight: FontWeight.bold, fontSize: 18),
                          //   ),
                          // ),
                          // Padding(
                          //   padding: const EdgeInsets.symmetric(
                          //       horizontal: 10, vertical: 5),
                          //   child: Container(
                          //       padding: EdgeInsets.all(8.0),
                          //       height: 50,
                          //       width: 200,
                          //       decoration: BoxDecoration(
                          //           border: Border.all(
                          //             width: 2,
                          //           ),
                          //           borderRadius:
                          //               BorderRadius.all(Radius.circular(10))),
                          //       child: Text(
                          //         description == null
                          //             ? 'Gold Bangles'
                          //             : '$description',
                          //         style: const TextStyle(
                          //             fontStyle: FontStyle.italic),
                          //       )),
                          // ),
                          // Container(
                          //   padding: const EdgeInsets.only(
                          //       top: 10, right: 20, left: 10, bottom: 0),
                          //   width: double.infinity,
                          //   child: const Text(
                          //     'Weight',
                          //     style: TextStyle(
                          //         fontWeight: FontWeight.bold, fontSize: 18),
                          //   ),
                          // ),
                          // Padding(
                          //   padding: const EdgeInsets.symmetric(
                          //       horizontal: 10, vertical: 5),
                          //   child: Container(
                          //       padding: EdgeInsets.all(8.0),
                          //       height: 50,
                          //       width: 200,
                          //       decoration: BoxDecoration(
                          //           border: Border.all(width: 2),
                          //           borderRadius:
                          //               BorderRadius.all(Radius.circular(10))),
                          //       child: Text(
                          //         weight == '' ? '180.2980 gm' : '$weight gm',
                          //         style: const TextStyle(
                          //             fontStyle: FontStyle.italic),
                          //       )),
                          // ),
                          Container(
                            padding: const EdgeInsets.only(
                                top: 10, right: 20, left: 10, bottom: 5),
                            width: double.infinity,
                            child: const Text(
                              'Remarks',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            child: Container(
                                padding: EdgeInsets.all(8.0),
                                height: 150,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 2,
                                        color: isADark
                                            ? Colors.purple
                                            : Colors.amber.withOpacity(0.5)),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                child: Text(
                                  remarks == ''
                                      ? 'Cd, Ni, & Cu are Present'
                                      : remarks!,
                                  style: const TextStyle(
                                      fontStyle: FontStyle.italic),
                                )),
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              style: kbuttonStyle.copyWith(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.blue),
                              ),
                              child: Text(
                                'Check Another Report',
                                style: TextStyle(color: Colors.white),
                              ))
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
    );
  }

  void _getdetails() async {
    try {
      setState(() {
        showSpinner = true;
      });
      final imgs = await _fireStore.collection('testing').get();

      for (var img in imgs.docs) {
        print(img.data());
        if (img.data().containsValue(widget.searchedTestId)) {
          setState(() {
            imgUrl = img.get('imageUrl');
            testID = img.get('testID');
            ag = img.get('AG');
            au = img.get('AU');
            other = img.get('other');
            remarks = img.get('Remarks');
            weight = img.get('Weight');
            carat = img.get('Carat');
            description = img.get('Description');
          });
          setState(() {
            showSpinner = false;
          });
        } else {
          setState(() {
            showSpinner = false;
          });
          print('ERRORRRR');
        }
      }
    } on SocketException catch (e) {
      print('either no internet or sonthing went wrong.');
    }
  }
}
