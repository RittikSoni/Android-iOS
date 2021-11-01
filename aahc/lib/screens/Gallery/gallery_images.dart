import 'package:flutter/material.dart';
import 'gallery_details.dart';

void main() => runApp(const GalleryImages());

class GalleryImages extends StatefulWidget {
  const GalleryImages({Key? key}) : super(key: key);

  @override
  State<GalleryImages> createState() => _GalleryImagesState();
}

class _GalleryImagesState extends State<GalleryImages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xFF0A0E21),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(
                    left: 20, right: 20, top: 30, bottom: 5),
                decoration: const BoxDecoration(
                  // color: Color(0xFF0c1230),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) {
                    return RawMaterialButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailsPage(
                              imagePath: _images[index].imagePath,
                              title: _images[index].title,
                              photographer: _images[index].photographer,
                              price: _images[index].price,
                              details: _images[index].details,
                              index: index,
                            ),
                          ),
                        );
                      },
                      child: Hero(
                        tag: 'logo$index',
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                              image: AssetImage(_images[index].imagePath),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: _images.length,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

final List<ImageDetails> _images = [
  ImageDetails(
    imagePath: 'images/gallery/product (8).jpg',
    price: 'AAHC',
    photographer: 'AAHC',
    title: 'Engraved Jewellery',
    details:
        'This image was taken during a party in Engraved Jewellery on new years eve. Quite a colorful shot.',
  ),
  ImageDetails(
    imagePath: 'images/gallery/product2.png',
    price: 'AAHC',
    photographer: 'AAHC',
    title: 'Engraved Jewellery',
    details:
        'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nihil error aspernatur, sequi inventore eligendi vitae dolorem animi suscipit. Nobis, cumque.',
  ),
  ImageDetails(
    imagePath: 'images/gallery/product (3).png',
    price: 'AAHC',
    photographer: 'AAHC',
    title: 'Engraved Jewellery',
    details:
        'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nihil error aspernatur, sequi inventore eligendi vitae dolorem animi suscipit. Nobis, cumque.',
  ),
  ImageDetails(
    imagePath: 'images/gallery/product (11).jpg',
    price: 'AAHC',
    photographer: 'AAHC',
    title: 'Engraved Jewellery',
    details:
        'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nihil error aspernatur, sequi inventore eligendi vitae dolorem animi suscipit. Nobis, cumque.',
  ),
  ImageDetails(
    imagePath: 'images/gallery/product (4).png',
    price: 'AAHC',
    photographer: 'AAHC',
    title: 'Engraved Jewellery',
    details:
        'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nihil error aspernatur, sequi inventore eligendi vitae dolorem animi suscipit. Nobis, cumque.',
  ),
  ImageDetails(
    imagePath: 'images/gallery/product (5).jpg',
    price: 'AAHC',
    photographer: 'AAHC',
    title: 'Engraved Jewellery',
    details:
        'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nihil error aspernatur, sequi inventore eligendi vitae dolorem animi suscipit. Nobis, cumque.',
  ),
  ImageDetails(
    imagePath: 'images/gallery/product (6).png',
    price: 'AAHC',
    photographer: 'AAHC',
    title: 'Engraved Jewellery',
    details:
        'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nihil error aspernatur, sequi inventore eligendi vitae dolorem animi suscipit. Nobis, cumque.',
  ),
  ImageDetails(
    imagePath: 'images/gallery/product (6).jpg',
    price: 'AAHC',
    photographer: 'AAHC',
    title: 'Engraved Jewellery',
    details:
        'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nihil error aspernatur, sequi inventore eligendi vitae dolorem animi suscipit. Nobis, cumque.',
  ),
  ImageDetails(
    imagePath: 'images/gallery/product (7).jpg',
    price: 'AAHC',
    photographer: 'AAHC',
    title: 'Engraved Jewellery',
    details:
        'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nihil error aspernatur, sequi inventore eligendi vitae dolorem animi suscipit. Nobis, cumque.',
  ),
  ImageDetails(
    imagePath: 'images/gallery/product (3).jpg',
    price: 'AAHC',
    photographer: 'AAHC',
    title: 'Engraved Jewellery',
    details:
        'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nihil error aspernatur, sequi inventore eligendi vitae dolorem animi suscipit. Nobis, cumque.',
  ),
  ImageDetails(
    imagePath: 'images/gallery/product (9).jpg',
    price: 'AAHC',
    photographer: 'AAHC',
    title: 'Engraved Jewellery',
    details:
        'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nihil error aspernatur, sequi inventore eligendi vitae dolorem animi suscipit. Nobis, cumque.',
  ),
  ImageDetails(
    imagePath: 'images/gallery/product (10).jpg',
    price: 'AAHC',
    photographer: 'AAHC',
    title: 'Engraved Jewellery',
    details:
        'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nihil error aspernatur, sequi inventore eligendi vitae dolorem animi suscipit. Nobis, cumque.',
  ),
  ImageDetails(
    imagePath: 'images/gallery/product (4).jpg',
    price: 'AAHC',
    photographer: 'AAHC',
    title: 'Engraved Jewellery',
    details:
        'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nihil error aspernatur, sequi inventore eligendi vitae dolorem animi suscipit. Nobis, cumque.',
  ),
  ImageDetails(
    imagePath: 'images/gallery/product1.jpg',
    price: 'AAHC',
    photographer: 'AAHC',
    title: 'Engraved Jewellery',
    details:
        'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nihil error aspernatur, sequi inventore eligendi vitae dolorem animi suscipit. Nobis, cumque.',
  ),
  // ImageDetails(
  //   imagePath: 'images/gallery/product2.png',
  //   price: 'AAHC',
  //   photographer: 'AAHC',
  //   title: 'Engraved Jewellery',
  //   details:
  //       'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nihil error aspernatur, sequi inventore eligendi vitae dolorem animi suscipit. Nobis, cumque.',
  // ),
  ImageDetails(
    imagePath: 'images/gallery/product3.png',
    price: 'AAHC',
    photographer: 'AAHC',
    title: 'Engraved Jewellery',
    details:
        'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nihil error aspernatur, sequi inventore eligendi vitae dolorem animi suscipit. Nobis, cumque.',
  ),
];

class ImageDetails {
  ImageDetails({
    required this.imagePath,
    required this.price,
    required this.photographer,
    required this.title,
    required this.details,
  });
  final String imagePath;
  final String price;
  final String photographer;
  final String title;
  final String details;
}
