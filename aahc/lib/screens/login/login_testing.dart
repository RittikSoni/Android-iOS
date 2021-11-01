import 'dart:io';

import 'package:aahc/components/custom_appbar.dart';
import 'package:aahc/constants.dart';
import 'package:aahc/models/gallery_images_info.dart';
import 'package:aahc/screens/login/login_testing_list.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class LoginTesting extends StatefulWidget {
  @override
  _LoginTestingState createState() => _LoginTestingState();
}

class _LoginTestingState extends State<LoginTesting> {
  final _idController = TextEditingController();
  final _auController = TextEditingController();
  final _agController = TextEditingController();
  final _otherController = TextEditingController();
  final _remarkController = TextEditingController();
  final _weightController = TextEditingController();
  final _caratController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _fireStore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  final _fireStorage = FirebaseStorage.instance;
  File? _imageFile;
  List<GImages> listGImages = [];
  String? docId;
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
        appBar: AppBar(
          backgroundColor: Colors.orange,
          leading: IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => LoginTestingList()));
              },
              icon: Icon(
                Icons.list,
              )),
          title: Text('AAHC'),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                _auth.signOut();
                Navigator.pop(context);
              },
              icon: Icon(Icons.logout),
            ),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: Container(
                child: ListView(
                  children: [
                    TextField(
                      textInputAction: TextInputAction.next,
                      controller: _idController,
                      decoration:
                          kTextfieldDecoration.copyWith(hintText: 'testID'),
                    ),
                    TextField(
                      textInputAction: TextInputAction.next,
                      controller: _descriptionController,
                      decoration: kTextfieldDecoration.copyWith(
                          hintText: 'Description'),
                    ),
                    TextField(
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.phone,
                      controller: _weightController,
                      decoration: kTextfieldDecoration.copyWith(
                          hintText: 'Weight(in gms)'),
                    ),
                    TextField(
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.phone,
                      controller: _caratController,
                      decoration:
                          kTextfieldDecoration.copyWith(hintText: 'Carat'),
                    ),
                    TextField(
                      textInputAction: TextInputAction.next,
                      controller: _auController,
                      keyboardType: TextInputType.phone,
                      decoration:
                          kTextfieldDecoration.copyWith(hintText: 'AU%'),
                    ),
                    TextField(
                      textInputAction: TextInputAction.next,
                      controller: _agController,
                      keyboardType: TextInputType.phone,
                      decoration:
                          kTextfieldDecoration.copyWith(hintText: 'AG%'),
                    ),
                    TextField(
                      textInputAction: TextInputAction.next,
                      controller: _otherController,
                      keyboardType: TextInputType.phone,
                      decoration:
                          kTextfieldDecoration.copyWith(hintText: 'Other%'),
                    ),
                    TextField(
                      controller: _remarkController,
                      decoration:
                          kTextfieldDecoration.copyWith(hintText: 'Remarks'),
                      maxLines: 5,
                    ),
                    Container(
                      height: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                        image: DecorationImage(
                          image: _imageFile == null
                              ? AssetImage('images/aahclogo.png')
                              : FileImage(_imageFile!) as ImageProvider,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        _upload();
                      },
                      child: Text('Upload'),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            Colors.lightBlue.withOpacity(0.5)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
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

  Future<void> _upload() async {
    if (_idController.text.isEmpty ||
        _auController.text.isEmpty ||
        _agController.text.isEmpty ||
        _otherController.text.isEmpty ||
        _weightController.text.isEmpty ||
        _descriptionController.text.isEmpty ||
        _imageFile == null) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text(
                'Fields are Empty\nकृपया सभी आवश्यक रिक्त स्थान भरें',
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
    } else {
      final ref = _fireStorage.ref('testing').child(_idController.text);
      UploadTask uploading = ref.putFile(_imageFile!);
      String? url;
      await uploading.whenComplete(() async {
        url = await uploading.snapshot.ref.getDownloadURL();
      });
      _fireStore.collection('testing').add({
        'imageUrl': url,
        'testID': _idController.text,
        'AU': _auController.text,
        'AG': _agController.text,
        'other': _otherController.text,
        'Remarks': _remarkController.text,
        'Weight': _weightController.text,
        'Carat': _caratController.text,
        'Description': _descriptionController.text,
        'timestamp': DateTime.now().toUtc().millisecondsSinceEpoch,
      });
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text(
                'AAHC',
                style: TextStyle(color: Colors.lightBlue),
              ),
              content: Text('\n Successfully Uploaded!!'),
              actions: [
                ElevatedButton(
                    onPressed: () {
                      _caratController.clear();
                      _agController.clear();
                      _auController.clear();
                      _descriptionController.clear();
                      _idController.clear();
                      _otherController.clear();
                      _remarkController.clear();
                      _weightController.clear();
                    },
                    child: Text('Add another "Clear all"')),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('OK'))
              ],
            );
          });
    }
  }
}
