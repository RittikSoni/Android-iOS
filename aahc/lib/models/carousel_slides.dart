import 'package:flutter/material.dart';

class CarouselImageSlides extends StatelessWidget {
  final String imgPath;

  CarouselImageSlides({required this.imgPath});

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: double.infinity,
      decoration: BoxDecoration(
        // borderRadius: BorderRadius.all(Radius.circular(20)),
        image: DecorationImage(
          image: AssetImage(imgPath),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
