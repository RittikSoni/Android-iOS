import 'dart:io';
import 'package:aahc/components/custom_appbar.dart';
import 'package:aahc/constants.dart';
import 'package:aahc/models/gallery_images_info.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class LoginGallery extends StatefulWidget {
  @override
  State<LoginGallery> createState() => _LoginGalleryState();
}

class _LoginGalleryState extends State<LoginGallery> {
  @override
  void initState() {
    loading();
    super.initState();
  }

  final _fireStorage = FirebaseStorage.instance;
  final _fireStore = FirebaseFirestore.instance;
  List<GImages> listGImages = [];
  String? docId;
  final _gimgname = TextEditingController();
  File? _imageFile;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _showDialog();
          },
          child: Icon(Icons.add),
        ),
        appBar: CustomAppBar().cutomAppBar(),
        body: SafeArea(
          child: Column(
            children: [
              // TextButton(
              //     onPressed: () {
              //       print(listGImages[0]);
              //       print(listGImages[0].gImgUrl);
              //       print(listGImages[0].name);
              //     },
              //     child: Text('check')),
              Expanded(
                child: Container(
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemCount: listGImages.length,
                    itemBuilder: (BuildContext context, int index) {
                      return RawMaterialButton(
                        onPressed: () {},
                        child: Stack(
                          children: [
                            Positioned(
                              child: Image(
                                image:
                                    NetworkImage(listGImages[index].gImgUrl!),
                                fit: BoxFit.fill,
                                width: 150,
                                height: 150,
                              ),
                            ),
                            Positioned(
                                child: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        _fireStore
                                            .collection('gallery')
                                            .doc(listGImages[index].docId)
                                            .delete();
                                        _fireStorage
                                            .ref('gallery')
                                            .child(listGImages[index].name!)
                                            .delete();

                                        // listGImages.clear();
                                        loading();
                                        dialog();
                                      });
                                    },
                                    icon: Icon(
                                      Icons.delete_forever,
                                    )))
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
              Container(
                height: 100,
                width: 200,
                alignment: Alignment.bottomCenter,
                decoration: BoxDecoration(
                    border: Border.all(width: 5, color: Colors.pinkAccent),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: _imageFile == null
                    ? const Text(
                        'nothing is selected',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      )
                    : Image.file(_imageFile!),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 70),
                child: TextField(
                    controller: _gimgname,
                    decoration:
                        kTextfieldDecoration.copyWith(hintText: 'Image Name')),
              ),
              TextButton(
                  onPressed: () {
                    upload();
                  },
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.lightBlueAccent)),
                  child: Text(
                    'Upload',
                    style: TextStyle(color: Colors.white),
                  )),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> upload() async {
    if (_gimgname.text.isEmpty || _imageFile == null) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text(
                'Nothing is selected',
                style: TextStyle(color: Colors.blue),
              ),
            );
          });
    } else {
      final ref = _fireStorage.ref('gallery').child(_gimgname.text);
      UploadTask uploading = ref.putFile(_imageFile!);
      String? url;
      await uploading.whenComplete(() async {
        url = await uploading.snapshot.ref.getDownloadURL();
      });
      _fireStore.collection('gallery').add({
        'imageURL': url,
        'name': _gimgname.text,
        'timestamp': DateTime.now().toUtc().millisecondsSinceEpoch,
      });
      // final gStore = _fireStore
      //     .collection('jobs')
      //     .orderBy('timestamp', descending: false)
      //     .snapshots();
      setState(
        () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text(
                    'Successfully Uploaded. please reload window',
                    style: TextStyle(color: Colors.blue),
                  ),
                  actions: [
                    ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('OK'))
                  ],
                );
              });

          _gimgname.clear();
          // _imageFile = null;
          // listGImages.clear;
          loading();
        },
      );
    }
  }

  Future<void> loading() async {
    QuerySnapshot querySnapshot = await _fireStore
        .collection('gallery')
        .orderBy('timestamp', descending: true)
        .get();

    final allData2 = querySnapshot.docs.map((doc) => doc.data()).toList();
    for (var data in querySnapshot.docs) {
      setState(() {
        // docId = data.id;
        listGImages.add(GImages(
            gImgUrl: data.get('imageURL'),
            name: data.get('name'),
            docId: data.id));
      });
    }
  }

  Future dialog() {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              'Deleted. Please Relaod window',
              style: TextStyle(
                color: Colors.blue,
              ),
            ),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('OK'))
            ],
          );
        });
  }

  Future<void> _showDialog() {
    return showDialog(
        context: context,
        builder: (BuildContext) {
          return AlertDialog(
            title: Text(
              'choose',
              style: TextStyle(color: Colors.blue),
            ),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  GestureDetector(
                      child: Text('gallery'),
                      onTap: () {
                        openGallery();
                      }),
                  Padding(padding: EdgeInsets.all(8)),
                  GestureDetector(
                      child: Text('camera'),
                      onTap: () {
                        openCamera();
                      })
                ],
              ),
            ),
          );
        });
  }

  Future<void> openGallery() async {
    _imageFile = File(await ImagePicker()
        .pickImage(source: ImageSource.gallery)
        .then((pickedFile) {
      setState(() {
        pickedFile!.path;
      });
      return pickedFile!.path;
    }));
  }

  Future<void> openCamera() async {
    _imageFile = File(
      await ImagePicker().pickImage(source: ImageSource.camera).then(
        (pickedFile) {
          setState(() {
            pickedFile!.path;
          });
          return pickedFile!.path;
        },
      ),
    );
  }
}
