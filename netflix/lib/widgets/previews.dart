import 'package:netflix/models/content_model.dart';
import 'package:netflix/screens/home_screen.dart';
import 'package:flutter/material.dart';

class Previews extends StatefulWidget {
  final String title;
  final List<Content> contentList;
  Previews({Key? key, required this.title, required this.contentList})
      : super(key: key);

  @override
  State<Previews> createState() => _PreviewsState();
}

class _PreviewsState extends State<Previews> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            widget.title,
            style: const TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          height: 165.0,
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
            itemCount: widget.contentList.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              final Content content = widget.contentList[index];

              return GestureDetector(
                onTap: () => print(content.name),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 16),
                      height: 130,
                      width: 130,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(content.imageUrl),
                              fit: BoxFit.cover),
                          shape: BoxShape.circle,
                          border: Border.all(color: content.color, width: 4.0)),
                    ),
                    Container(
                      height: 130,
                      width: 130,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                            colors: [
                              Colors.black87,
                              Colors.black45,
                              Colors.transparent
                            ],
                            stops: [
                              0,
                              0.25,
                              1
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter),
                        shape: BoxShape.circle,
                        border: Border.all(color: content.color, width: 4.0),
                      ),
                    ),
                    Positioned(
                      child: SizedBox(
                        height: 60,
                        child: Image.asset(content.titleImageUrl),
                      ),
                      left: 0,
                      right: 0,
                      bottom: 0,
                    )
                  ],
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
