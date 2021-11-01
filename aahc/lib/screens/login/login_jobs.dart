import 'package:aahc/constants.dart';
import 'package:aahc/screens/jobs.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';

final _fireStore = FirebaseFirestore.instance;
User? loggedInUser;

class LoginJobs extends StatefulWidget {
  static String id = 'chat_screen';
  @override
  _LoginJobsState createState() => _LoginJobsState();
}

class _LoginJobsState extends State<LoginJobs> {
  final messageController = TextEditingController();
  final postController = TextEditingController();
  String messageText = '';
  String postName = '';
  String jobId = '';
  final _auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
        print(loggedInUser!.email);
      }
    } catch (e) {
      print('chat error');
      print(e);
    }
  }

  void messagesStream() async {
    await for (var snapshot
        in _fireStore.collection('messages').orderBy("field").snapshots()) {
      for (var message in snapshot.docs) {
        print(message.data());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.logout),
              onPressed: () {
                _auth.signOut();
                Navigator.pop(context);
              }),
        ],
        title: Text('AAHC JOBS'),
        centerTitle: true,
        backgroundColor: Colors.indigo[900],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (context) {
                return ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: Expanded(
                        child: TextField(
                          controller: postController,
                          onChanged: (value) {
                            postName = value;
                          },
                          decoration: kTextfieldDecoration.copyWith(
                              hintText: 'Job Title'),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: Expanded(
                        child: TextField(
                          controller: messageController,
                          onChanged: (value) {
                            messageText = value;
                          },
                          decoration: kTextfieldDecoration.copyWith(
                              hintText: 'Qualification'),
                          maxLines: 15,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        if (messageController.text.isEmpty ||
                            postController.text.isEmpty) {
                          Fluttertoast.showToast(
                              msg:
                                  'Please add both qualification and job title');
                        } else {
                          messageController.clear();
                          postController.clear();
                          _fireStore.collection('jobs').add({
                            'Description': messageText,
                            'postName': postName,
                            'timestamp':
                                DateTime.now().toUtc().millisecondsSinceEpoch,
                          });
                        }
                        //Implement send functionality.
                      },
                      child: Text(
                        'ADD',
                        style:
                            kSendButtonTextStyle.copyWith(color: Colors.white),
                      ),
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.indigo)),
                    ),
                  ],
                );
              });
        },
        child: Icon(Icons.card_travel),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            MessagesStream(),
            // Container(
            //   decoration: kMessageContainerDecoration,
            //   child: Row(
            //     crossAxisAlignment: CrossAxisAlignment.center,
            //     children: <Widget>[
            //       Expanded(
            //         child: TextField(
            //           controller: postController,
            //           onChanged: (value) {
            //             postName = value;
            //           },
            //           decoration:
            //               kTextfieldDecoration.copyWith(hintText: 'Post Name'),
            //         ),
            //       ),
            //       Expanded(
            //         child: TextField(
            //           controller: messageController,
            //           onChanged: (value) {
            //             messageText = value;
            //           },
            //           decoration: kTextfieldDecoration.copyWith(
            //               hintText: 'Description'),
            //         ),
            //       ),
            //       TextButton(
            //         onPressed: () {
            //           messageController.clear();

            //           _fireStore.collection('jobs').add({
            //             'Description': messageText,
            //             'postName': postName,
            //             'timestamp':
            //                 DateTime.now().toUtc().millisecondsSinceEpoch,
            //           });
            //           //Implement send functionality.
            //         },
            //         child: Text(
            //           'Send',
            //           style: kSendButtonTextStyle,
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

class MessagesStream extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _fireStore
          .collection('jobs')
          .orderBy('timestamp', descending: false)
          .snapshots(),
      builder: (context, snapshot) {
        List<MessageBubble> messageBubbles = [];

        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.lightBlueAccent,
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
            jobId: message.id,
            // isMe: currentUser == messageSender
          );
          messageBubbles.add(messageBubble);
        }

        return Expanded(
          child: ListView(
            // reverse: true,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            // children: messageBubbles,
            children: messageBubbles,
          ),
        );
      },
    );
  }
}

class MessageBubble extends StatelessWidget {
  MessageBubble({required this.sender, required this.text, this.jobId = ''});
  final String sender;
  final String text;
  final String jobId;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        // crossAxisAlignment:
        //     isMe! ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          ListTile(
            title: Text(text),
            subtitle: Text(sender),
            trailing: IconButton(
                onPressed: () {
                  _fireStore.collection('jobs').doc(jobId).delete();
                },
                icon: const Icon(Icons.delete)),
          ),
          // Text(
          //   sender,
          //   style: TextStyle(fontSize: 12, color: Colors.black54),
          // ),
          // IconButton(
          //     onPressed: () {
          //       _fireStore.collection('jobs').doc(jobId).delete();
          //     },
          //     icon: Icon(Icons.delete)),
          // Material(
          //   borderRadius: BorderRadius.only(
          //       topRight: Radius.circular(30),
          //       bottomLeft: Radius.circular(30),
          //       bottomRight: Radius.circular(30)),
          //   elevation: 5,
          //   color: Colors.white,
          //   child: Padding(
          //     padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          //     child: Text(
          //       '$text',
          //       style: TextStyle(fontSize: 15, color: Colors.black),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
