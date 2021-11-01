import 'dart:io';
import 'package:aahc/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

class LoginCard extends StatefulWidget {
  @override
  State<LoginCard> createState() => _LoginCardState();
}

TextEditingController controller = TextEditingController();

class _LoginCardState extends State<LoginCard> {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  File? imageFile;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.lightBlueAccent.withOpacity(0.3),
          actions: [
            IconButton(
              onPressed: () {
                _auth.signOut();
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.logout,
                color: Colors.red,
              ),
            ),
          ],
          title: Text(
            'AAHC',
            style: TextStyle(color: Colors.blue),
          ),
        ),
        body: ListView(
          children: [
            Container(
              child: imageFile == null
                  ? Image(
                      image: AssetImage('images/aahc_logo1.png'),
                      width: 200,
                      height: 200,
                    )
                  : Image.file(
                      imageFile!,
                      width: 400,
                      height: 400,
                    ),
            ),
            ElevatedButton(
              onPressed: () {
                if (imageFile == null) {
                  Fluttertoast.showToast(
                      msg: 'Select img',
                      gravity: ToastGravity.BOTTOM,
                      toastLength: Toast.LENGTH_LONG,
                      timeInSecForIosWeb: 2);
                } else {
                  upload();
                }
              },
              child: Text('Upload'),
            ),
            TextField(
              //* image name/

              controller: controller,
              decoration: kTextfieldDecoration.copyWith(
                hintText: 'Img name',
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _showDialog();
            print('emptyyyyy');
          },
          child: Icon(Icons.add_a_photo),
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
    imageFile = File(await ImagePicker()
        .pickImage(source: ImageSource.gallery)
        .then((pickedFile) {
      setState(() {
        pickedFile!.path;
      });
      return pickedFile!.path;
    }));
  }

  Future<void> openCamera() async {
    imageFile = File(
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

  Future<void> upload() async {
    if (controller.text.isEmpty ||
        controller.text.contains(RegExp(
            r'(\W\D)' // \W for not words and \D for non digit for more instructions check online regexp
            //* r'(\:|\;|\{|\}|\]|\[|\$|\^|\(|\)|\\|\/|\.|\"|\=|\+|\-|\_|\@|\#|\!|\%|\*|\&)' | means or in regexp
            ))) {
      print('image name null');
    } else {
      Reference reference = FirebaseStorage.instance
          .ref()
          .child('AAHC_Certs')
          .child(controller.text);

      UploadTask uploadTask = reference.putFile(imageFile!);
//**getting download url */
      String? url;
      await uploadTask.whenComplete(() async {
        url = await uploadTask.snapshot.ref.getDownloadURL();
      });
//** uploading url and name of img to firestore */
      _firestore
          .collection('certDetails')
          .add({'imageURL': url, 'name': controller.text});
      showDialog(
        context: context,
        builder: (BuildContext) {
          return AlertDialog(
            title: Text(
              'Successfully Uploaded!!',
              style: TextStyle(
                color: Colors.blue,
              ),
            ),
            actions: [
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: Text('Ok'),
              ),
            ],
          );
        },
      );
    }
  }
}
