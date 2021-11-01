import 'package:aahc/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Faq extends StatefulWidget {
  @override
  _FaqState createState() => _FaqState();
}

class _FaqState extends State<Faq> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.pinkAccent),
        title: const Text(
          'AASTHA HALLMARK - FAQ',
          style: TextStyle(color: Colors.lightBlue),
        ),
        bottom: PreferredSize(
          child: Text('Frequently Asked Questions'),
          preferredSize: Size.fromHeight(0),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: ListView.builder(
          itemCount: itemData.length,
          itemBuilder: (BuildContext context, int index) {
            return ExpansionPanelList(
              animationDuration: const Duration(milliseconds: 800),
              dividerColor: Colors.black,
              elevation: 1,
              children: [
                ExpansionPanel(
                  canTapOnHeader: true,
                  body: Container(
                    padding: const EdgeInsets.only(
                        top: 0, bottom: 10, left: 10, right: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        // ClipOval(
                        //   child: CircleAvatar(
                        //     child: Image.asset(
                        //       itemData[index].img,
                        //       fit: BoxFit.cover,
                        //     ),
                        //   ),
                        // ),
                        // const SizedBox(
                        //   height: 30,
                        // ),
                        Text(
                          itemData[index].discription,
                          style: TextStyle(
                              color: isADark ? Colors.black54 : Colors.white60,
                              fontSize: 15,
                              letterSpacing: 0.3,
                              height: 1.3),
                        ),
                        Divider(
                          color:
                              isADark ? Colors.pinkAccent : Colors.pinkAccent,
                          height: 30,
                          endIndent: 60,
                          indent: 60,
                          thickness: 2,
                        ),
                      ],
                    ),
                  ),
                  headerBuilder: (BuildContext context, bool isExpanded) {
                    return Container(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        itemData[index].headerItem,
                        style: TextStyle(
                          // color: itemData[index].colorsItem,
                          fontSize: 18,
                        ),
                      ),
                    );
                  },
                  isExpanded: itemData[index].expanded,
                )
              ],
              expansionCallback: (int item, bool status) {
                setState(() {
                  itemData[index].expanded = !itemData[index].expanded;
                });
              },
            );
          },
        ),
      ),
    );
  }
}
