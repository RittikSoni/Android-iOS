import 'package:aahc/screens/Gallery/new_cloud_gallery.dart';
import 'package:aahc/video/screens/video_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'Gallery/gallery_fonts.dart';

int _gindex = 0;
List tabs = [
  // const GalleryImages(),
  CloudGallery(),
  GalleyFontD(),
  VideoHome(),
];

class Gallery extends StatefulWidget {
  @override
  State<Gallery> createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: GNav(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          tabBackgroundGradient: const LinearGradient(
              colors: [Colors.cyan, Colors.blue],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter),
          rippleColor: Colors.amber,
          color: Colors.cyan,
          gap: 10,
          tabs: const [
            // GButton(
            //   icon: Icons.image,
            //   text: 'Images',
            // ),
            GButton(
              icon: Icons.image_search,
              text: 'Images',
            ),
            GButton(
              icon: Icons.design_services,
              text: 'Customize',
            ),
            GButton(
              icon: Icons.movie,
              text: 'Video',
            ),
          ],
          selectedIndex: _gindex,
          onTabChange: (index) {
            setState(() {
              _gindex = index;
            });
          },
        ),
      ),
      body: tabs.elementAt(_gindex),
    );
  }
}
