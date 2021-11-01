import 'package:aahc/components/url_launcher.dart';
import 'package:aahc/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:fluttertoast/fluttertoast.dart';

final _firestore = FirebaseFirestore.instance;

class Jobs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.amber,
        shadowColor: Colors.amber,
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.lightBlueAccent),
        title: Text(
          'AASTHA HALLMARK',
          style: TextStyle(color: isADark ? Colors.black : Colors.white),
        ),
      ),
      body: SafeArea(
          child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            color: Colors.amber,
            child: const Center(
              child: Text(
                'BECOME A PART OF OUR STORY',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.pinkAccent, fontSize: 30),
              ),
            ),
          ),
          MessagesStream(),
        ],
      )),
    );
  }
}

class MessagesStream extends StatefulWidget {
  @override
  State<MessagesStream> createState() => _MessagesStreamState();
}

class _MessagesStreamState extends State<MessagesStream> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore
          .collection('jobs')
          .orderBy('timestamp', descending: false)
          .snapshots(),
      builder: (context, snapshot) {
        List<MessageBubble> messageBubbles = [];

        if (!snapshot.hasData) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Text(
                  'No jobs are available at this momment.Please check later.',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                CircularProgressIndicator(
                  backgroundColor: Colors.lightBlueAccent,
                ),
              ],
            ),
          );
        }

        final messages = snapshot.data!.docs.reversed;

        for (var message in messages) {
          final postText = message['postName'];
          final postDes = message['Description'];
          // final currentUser = loggedInUser!.email;

          final messageBubble = MessageBubble(
            sender: postDes,
            text: postText,
          );
          messageBubbles.add(messageBubble);
        }

        return Expanded(
          child: ListView(
            // reverse: true,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            children: messageBubbles,
          ),
        );
      },
    );
  }
}

class MessageBubble extends StatefulWidget {
  MessageBubble({
    required this.sender,
    required this.text,
  });
  final String sender;
  final String text;

  @override
  State<MessageBubble> createState() => _MessageBubbleState();
}

class _MessageBubbleState extends State<MessageBubble> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          ListTile(
            tileColor: Colors.pinkAccent,
            title: Text(
              widget.text,
              style: const TextStyle(
                  color: Colors.amber,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
            contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            subtitle: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: RichText(
                  text: TextSpan(children: <TextSpan>[
                    TextSpan(
                      text: 'Qualifications:\n',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    TextSpan(
                      text: '${widget.sender}',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    )
                  ]),
                )),
            trailing: TextButton(
              onPressed: () {
                setState(() {
                  UrlLauncher(
                          url:
                              "https://wa.me/919582792574?text=Hello%20,%20My%20Name%20is%20")
                      .launchInWebViewWithJavaScript();
                });
              },
              child: Text(
                'Apply',
                style: TextStyle(color: Colors.white),
              ),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue)),
            ),
          ),
        ],
      ),
    );
  }
}
