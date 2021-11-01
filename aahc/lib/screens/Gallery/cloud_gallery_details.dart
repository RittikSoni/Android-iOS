import 'package:flutter/material.dart';

class CloudGalleryDetails extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String details;
  final int index;
  CloudGalleryDetails(
      {required this.imageUrl,
      this.title = 'AAHC',
      this.details =
          'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nihil error aspernatur, sequi inventore eligendi vitae dolorem animi suscipit. Nobis, cumque.',
      required this.index});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Hero(
                tag: 'gallery$index',
                child: Padding(
                  padding: const EdgeInsets.only(top: 100),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30),
                          topRight: Radius.circular(30),
                          topLeft: Radius.circular(30)),
                      image: DecorationImage(
                        image: NetworkImage(imageUrl),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              height: 260,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          title,
                          style: const TextStyle(
                            color: Colors.lightBlueAccent,
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          details,
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: FlatButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          color: Colors.lightBlueAccent,
                          child: const Text(
                            'Back',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: FlatButton(
                          onPressed: () {},
                          padding: EdgeInsets.symmetric(vertical: 15),
                          color: Colors.lightBlueAccent,
                          child: const Text(
                            'Details',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
