import 'package:aahc/models/gallery_images_info.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginTestingList extends StatefulWidget {
  LoginTestingList({Key? key}) : super(key: key);

  @override
  _LoginTestingListState createState() => _LoginTestingListState();
}

class _LoginTestingListState extends State<LoginTestingList> {
  @override
  void initState() {
    _loading();
    super.initState();
  }

  final _fireStore = FirebaseFirestore.instance;
  final _fireStorage = FirebaseStorage.instance;
  List<GImages> TestList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text('aahc'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                  ),
                  itemCount: TestList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Stack(
                      children: [
                        Positioned(
                          child: Image.network(
                            TestList[index].gImgUrl!,
                            fit: BoxFit.cover,
                            height: 200,
                            width: 200,
                          ),
                        ),
                        Positioned(
                            right: 10,
                            bottom: 10,
                            child: Text(
                              TestList[index].name!,
                              style: TextStyle(
                                  color: Colors.indigo,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            )),
                        Positioned(
                          right: 0,
                          child: IconButton(
                            onPressed: () {
                              _fireStore
                                  .collection('testing')
                                  .doc(TestList[index].docId)
                                  .delete();
                              _fireStorage
                                  .ref('testing')
                                  .child(TestList[index].name!)
                                  .delete();
                              setState(() {
                                TestList.clear();
                                _loading();
                              });
                            },
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                          ),
                        )
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _loading() async {
    QuerySnapshot querySnapshot = await _fireStore
        .collection('testing')
        .orderBy('timestamp', descending: true)
        .get();
    for (var list in querySnapshot.docs) {
      setState(
        () {
          TestList.add(
            GImages(
              gImgUrl: list.get('imageUrl'),
              docId: list.id,
              name: list.get('testID'),
            ),
          );
        },
      );
    }
  }
}
