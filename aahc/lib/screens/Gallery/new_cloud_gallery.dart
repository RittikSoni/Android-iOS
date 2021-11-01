import 'dart:io';
import 'package:aahc/models/carousel_slides.dart';
import 'package:aahc/models/gallery_images_info.dart';
import 'package:aahc/screens/Gallery/cloud_gallery_details.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:loading_overlay/loading_overlay.dart';

class CloudGallery extends StatefulWidget {
  const CloudGallery({Key? key}) : super(key: key);

  @override
  State<CloudGallery> createState() => _CloudGalleryState();
}

class _CloudGalleryState extends State<CloudGallery> {
  @override
  void initState() {
    loading();
    super.initState();
  }

  final _fireStore = FirebaseFirestore.instance;
  List<GImages> listGImages = [];
  final _gimgname = TextEditingController();
  File? _imageFile;
  String? docId;
  bool showSpinner = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Expanded(
          flex: MediaQuery.of(context).orientation == Orientation.landscape
              ? 1
              : 0,
          child: CarouselSlider(
            items: [
              CarouselImageSlides(
                  imgPath: 'images/banners/aastha_hallmark.jpg'),
              CarouselImageSlides(imgPath: 'images/banners/aahc_banner.jpg'),
              CarouselImageSlides(imgPath: 'images/banners/engrave.gif'),
              CarouselImageSlides(imgPath: 'images/banners/get_hallmark.gif'),
              CarouselImageSlides(imgPath: 'images/banners/testing.gif'),
              CarouselImageSlides(imgPath: 'images/banners/aahc.gif'),
            ],
            options: CarouselOptions(
              height: 200.0,
              viewportFraction: 1,
              autoPlayInterval: Duration(seconds: 3),
              autoPlay: true,
              enlargeCenterPage: true,
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          'Make Sure that you are connected with Internet !',
          style: TextStyle(
            fontStyle: FontStyle.italic,
          ),
          textAlign: TextAlign.center,
        ),
        Expanded(
          child: Container(
            child: LoadingOverlay(
              isLoading: showSpinner,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: listGImages.length,
                itemBuilder: (BuildContext context, int index) {
                  return RawMaterialButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CloudGalleryDetails(
                            imageUrl: listGImages[index].gImgUrl!,
                            title: listGImages[index].name!,
                            index: index,
                          ),
                        ),
                      );
                    },
                    child: Hero(
                      tag: 'gallery$index',
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                            image: NetworkImage(listGImages[index].gImgUrl!),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ],
    ));
  }

  Future<void> loading() async {
    try {
      QuerySnapshot querySnapshot = await _fireStore
          .collection('gallery')
          .orderBy('timestamp', descending: true)
          .get();

      // Get data from docs and convert map to List
      // final allData =
      //     querySnapshot.docs.map((doc) => doc.get('imageURL')).toList();
      final allData2 = querySnapshot.docs.map((doc) => doc.data()).toList();
      for (var data in querySnapshot.docs) {
        setState(() {
          docId = data.id;
          listGImages.add(
              GImages(gImgUrl: data.get('imageURL'), name: data.get('name')));
          showSpinner = false;
        });
      }
    } catch (e) {
      print('Error in new cloud gallery');
    }

    // for (var rs in allData) {
    //   setState(() {
    //     listGImages.add(
    //       (GImages(
    //         gImgUrl: rs.toString(),
    //       )),
    //     );
    //   });
    // }
  }
}
