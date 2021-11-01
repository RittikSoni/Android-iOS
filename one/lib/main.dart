import 'dart:ui';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        appBar: AppBar(
          title: Center(
            child: Text("RS"),
          ),
          backgroundColor: Colors.blueGrey[900],
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(
                    'https://www.w3schools.com/css/rock600x400.jpg'),
              ),
              Text(
                '✨-RITTIK-✨',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '✨-One-✨',
                style: TextStyle(
                  color: Colors.white,
                  letterSpacing: 2.5,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                width: 200,
                child: Divider(
                  color: Colors.teal[100],
                ),
              ),
              Card(
                color: Colors.teal[300],
                margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                child: ListTile(
                  leading: Icon(
                    Icons.phone,
                    color: Colors.amber,
                  ),
                  title: Text(
                    '+91 8929980600',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                ),
              ),
              Card(
                color: Colors.teal[300],
                margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: ListTile(
                  leading: Icon(
                    Icons.email,
                    color: Colors.amber,
                  ),
                  title: Text(
                    'kingrittiksoni@gmail.com',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxIMAGExxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
Image(
          image: NetworkImage('https://www.w3schools.com/css/rock600x400.jpg'),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.red,
          onPressed: () {
            nTaps++;
          },
          child: Icon(Icons.add),
        ),
xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxENDxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx*/

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx CONTAINER// MARGIN // PADDING xxxxxxxxxxxxxxxxxxxx
SafeArea(
          child: Container(
            color: Colors.teal,
             height: 500,
            width: 100,
            margin: EdgeInsets.all(20),
            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 50),
            child: Text('HELLO GOLDI KEM CHO !!'),
          ),
        ),
xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxENDxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx*/

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxColumn //Circle avatarxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
Column(
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(
                    'https://www.w3schools.com/css/rock600x400.jpg'),
              ),
              Text(
                'Rittik',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'On e',
                style: TextStyle(
                  color: Colors.white,
                  letterSpacing: 2.5,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                color: Colors.teal[300],
                margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    Icon(
                      Icons.phone,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      '+91 8929980600',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                color: Colors.teal[300],
                margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    Icon(
                      Icons.email,
                      color: Colors.amber,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'kingrittiksoni@gmail.com',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                        fontSize: 16,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),

xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxENDxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx*/

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx MY_CARD // CONTAINER//COLUMN//CARD//DIVIDER/CIRCLE AVATAR/ICONS xxxxxxxxxxxxxxxxxxx
  home: Scaffold(
        backgroundColor: Colors.teal,
        appBar: AppBar(
          title: Center(
            child: Text("RS"),
          ),
          backgroundColor: Colors.blueGrey[900],
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(
                    'https://www.w3schools.com/css/rock600x400.jpg'),
              ),
              Text(
                'Rittik',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'One',
                style: TextStyle(
                  color: Colors.white,
                  letterSpacing: 2.5,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                width: 200,
                child: Divider(
                  color: Colors.teal[100],
                ),
              ),
              Card(
                color: Colors.teal[300],
                margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                child: ListTile(
                  leading: Icon(
                    Icons.phone,
                    color: Colors.amber,
                  ),
                  title: Text(
                    '+91 8929980600',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                ),
              ),
              Card(
                color: Colors.teal[300],
                margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: ListTile(
                  leading: Icon(
                    Icons.email,
                    color: Colors.amber,
                  ),
                  title: Text(
                    'kingrittiksoni@gmail.com',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxENDxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx*/

/* xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxIMAGExxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxENDxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx*/
