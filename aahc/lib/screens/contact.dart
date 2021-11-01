import 'dart:convert';
import 'package:aahc/components/url_launcher.dart';
import 'package:aahc/constants.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(Contact());

class Contact extends StatefulWidget {
  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  Future sendEmail({
    String? name,
    String? subject,
    String? email,
    String? fmessage,
  }) async {
    final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
    const serviceId = 'service_xdtmh28';
    const templateId = 'template_eg43bfb';
    const userId = 'user_cRFqAEERiq5CnVxHUEoqL';

    try {
      Fluttertoast.showToast(
        msg: 'Thanks! for your Feedback',
        backgroundColor: Colors.amber,
        textColor: Colors.black,
      );
      final response = await http.Client().post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode(
          {
            'service_id': serviceId,
            'template_id': templateId,
            'user_id': userId,
            'accessToken': '611cf11ed31b6b1328b0d64b83e5304b',
            'template_params': {
              'user_name': name,
              'user_email': email,
              'user_subject': subject,
              'user_message': fmessage,
            }
          },
        ),
      );
    } catch (e) {
      Fluttertoast.showToast(
        msg: 'Check Your Internet Connection!',
        backgroundColor: Colors.black.withOpacity(0.5),
        textColor: Colors.red,
      );
      print(e);
    }
    ;
  }

  ButtonStyle socialMediaButtonStyle = TextButton.styleFrom(
    primary: Colors.black,
    backgroundColor: Colors.white,
    shadowColor: Colors.amber,
    elevation: 5,
  );

  @override
  Widget build(BuildContext context) {
    RegExp emailValidator = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

    final _mcontroller = TextEditingController();

    final _econtroller = TextEditingController();
    final _scontroller = TextEditingController();
    final _ncontroller = TextEditingController();
    return Scaffold(
        body: PageView(
      scrollDirection: Axis.vertical,
      children: [
        ListView(
          children: [
            Container(
              decoration: const BoxDecoration(
                borderRadius:
                    BorderRadius.only(bottomRight: Radius.circular(50)),
                image: DecorationImage(
                  image: AssetImage('images/contact.jpg'),
                  fit: BoxFit.cover,
                  colorFilter:
                      ColorFilter.mode(Colors.black54, BlendMode.darken),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 20, bottom: 40),
                    child: Text(
                      'AASTHA ASSAYING & HALLMARKING CENTRE',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          letterSpacing: 5,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 0, bottom: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          '''1733,3rd Floor\nDariba kalan, Chandni chowk\nDelhi-110006\nIndia''',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                          textAlign: TextAlign.left,
                        ),
                        // SizedBox(
                        //   height: 10,
                        // ),
                        // TextButton(
                        //     onPressed: () {
                        //       setState(() {
                        //         UrlLauncher(url: 'tel:%20+91%209582792574')
                        //             .launchInWebViewWithJavaScript();
                        //       });
                        //     },
                        //     style: socialMediaButtonStyle,
                        //     child: const Text(
                        //       '+91-9582792574',
                        //       style: TextStyle(
                        //         color: Colors.black,
                        //         fontWeight: FontWeight.bold,
                        //         fontSize: 20,
                        //       ),
                        //     ))
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    'Follow Us',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  const Divider(
                    height: 30,
                    thickness: 1.5,
                    color: Colors.amber,
                    indent: 60.0,
                    endIndent: 60.0,
                  ),
                  Row(
                    //**social media */

                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            Future<void>
                                _launchInWebViewWithJavaScript() async {
                              if (await canLaunch(
                                  'https://www.facebook.com/profile.php?id=100013132985443')) {
                                await launch(
                                  'https://www.facebook.com/profile.php?id=100013132985443',
                                  // forceSafariVC: true,
                                  // forceWebView: true,
                                  // enableJavaScript: true,
                                  // enableDomStorage: true,
                                );
                              } else {
                                throw 'Could not launch';
                              }
                            }

                            _launchInWebViewWithJavaScript();
                          });
                        },
                        icon: const Icon(Icons.facebook),
                        iconSize: 35,
                        color: Colors.lightBlue,
                      ),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            UrlLauncher(
                                    url:
                                        'https://www.youtube.com/channel/UCK1zIQG6js6XSum6jHzbnww?sub_confirmation=1')
                                .launchInWebViewWithJavaScript();
                          });
                        },
                        child: Image(
                          image: AssetImage('images/social/youtube.png'),
                          width: 35,
                          height: 35,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            UrlLauncher(url: 'https://twitter.com/AHallmarking')
                                .launchInWebViewWithJavaScript();
                          });
                        },
                        child: Image(
                          image: AssetImage('images/social/twitter.png'),
                          width: 35,
                          height: 35,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            UrlLauncher(
                                    url:
                                        "https://wa.me/919582792574?text=Hello%20,%20")
                                .launchInWebViewWithJavaScript();
                          });
                        },
                        child: Image(
                          image: AssetImage('images/social/whatsapp (1).png'),
                          width: 35,
                          height: 35,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        UrlLauncher(
                                url:
                                    'https://www.google.com/maps/place/Aastha+Hallmarking+Centre/@28.6556217,77.2312871,17z/data=!3m1!4b1!4m5!3m4!1s0x390cfd1b9790e28d:0xc7efea93ad77ada0!8m2!3d28.6556237!4d77.2333993')
                            .launchInWebViewWithJavaScript();
                        // _launchInWebViewWithJavaScript();
                      });
                    },
                    child: const ListTile(
                      trailing: Icon(Icons.location_on),
                      tileColor: Colors.amber,
                      leading: Icon(
                        Icons.map,
                        color: Colors.green,
                      ),
                      title: Text(
                        'Get Direction',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    style: socialMediaButtonStyle,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                    child: Text(
                      'Need Us? Message Us.',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                  TextField(
                    textInputAction: TextInputAction.next,
                    controller: _ncontroller,
                    cursorColor: Colors.amber,
                    style: TextStyle(color: Colors.white),
                    decoration: kTextfieldDecoration.copyWith(
                      hintText: 'Name',
                      hintStyle: TextStyle(color: Colors.white),
                      helperStyle: TextStyle(color: Colors.white),
                    ),
                    maxLength: 30,
                  ),
                  TextField(
                    textInputAction: TextInputAction.next,
                    style: TextStyle(color: Colors.white),
                    controller: _scontroller,
                    cursorColor: Colors.amber,
                    decoration: kTextfieldDecoration.copyWith(
                      hintStyle: TextStyle(color: Colors.white),
                      helperStyle: TextStyle(color: Colors.white),
                    ),
                    maxLength: 100,
                  ),
                  TextField(
                    textInputAction: TextInputAction.next,
                    style: TextStyle(color: Colors.white),
                    controller: _econtroller,
                    cursorColor: Colors.amber,
                    decoration: kTextfieldDecoration.copyWith(
                      hintText: 'Email',
                      hintStyle: TextStyle(color: Colors.white),
                      helperStyle: TextStyle(color: Colors.white),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: _mcontroller,
                    style: TextStyle(color: Colors.white),
                    cursorColor: Colors.amber,
                    decoration: kTextfieldDecoration.copyWith(
                      hintText: 'Message',
                      hintStyle: TextStyle(color: Colors.white),
                      helperStyle: TextStyle(color: Colors.white),
                    ),
                    maxLines: 8,
                    maxLength: 4000,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 50, right: 50, top: 0),
                    child: TextButton(
                      onPressed: () {
                        if (_ncontroller.text.isEmpty ||
                            _econtroller.text.isEmpty) {
                          Fluttertoast.showToast(
                              msg: 'Please fill Name & Email');
                        } else if (!_econtroller.text
                            .contains(emailValidator)) {
                          Fluttertoast.showToast(
                              msg: 'Please fill Valid Email');
                        } else {
                          setState(() {
                            var message = _mcontroller.text;
                            var email = _econtroller.text;
                            var subject = _scontroller.text;
                            var name = _ncontroller.text;

                            sendEmail(
                                email: email,
                                fmessage: message,
                                subject: subject,
                                name: name);
                          });
                        }
                      },
                      child: Text('Send Message'),
                      style: TextButton.styleFrom(
                        primary: Colors.purple,
                        backgroundColor: Colors.amber,
                        shadowColor: Colors.amber,
                        elevation: 5,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ],
    ));
  }
}


































// import 'dart:convert';
// import 'package:aahc/components/url_launcher.dart';
// import 'package:aahc/constants.dart';
// import 'package:flutter/widgets.dart';
// import 'package:http/http.dart' as http;
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/painting.dart';
// import 'package:flutter/rendering.dart';
// import 'package:url_launcher/url_launcher.dart';

// void main() => runApp(Contact());

// class Contact extends StatefulWidget {
//   @override
//   State<Contact> createState() => _ContactState();
// }

// class _ContactState extends State<Contact> {
//   Future sendEmail({
//     String? name,
//     String? subject,
//     String? email,
//     String? fmessage,
//   }) async {
//     final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
//     const serviceId = 'service_xdtmh28';
//     const templateId = 'template_eg43bfb';
//     const userId = 'user_cRFqAEERiq5CnVxHUEoqL';
//     try {
//       final response = await http.Client().post(
//         url,
//         headers: {'Content-Type': 'application/json'},
//         body: json.encode(
//           {
//             'service_id': serviceId,
//             'template_id': templateId,
//             'user_id': userId,
//             'accessToken': '611cf11ed31b6b1328b0d64b83e5304b',
//             'template_params': {
//               'user_name': name,
//               'user_email': email,
//               'user_subject': subject,
//               'user_message': fmessage,
//             }
//           },
//         ),
//       );
//       print(response.body);
//       print(response.statusCode);
//     } catch (e) {
//       print(e);
//     }
//     ;
//   }

//   ButtonStyle socialMediaButtonStyle = TextButton.styleFrom(
//     primary: Colors.black,
//     backgroundColor: Colors.white,
//     shadowColor: Colors.amber,
//     elevation: 5,
//   );

//   @override
//   Widget build(BuildContext context) {
//     final _mcontroller = TextEditingController();
//     final _econtroller = TextEditingController();
//     final _scontroller = TextEditingController();
//     final _ncontroller = TextEditingController();
//     return Scaffold(
//         body: PageView(
//       scrollDirection: Axis.vertical,
//       children: [
//         Container(
//           decoration: const BoxDecoration(
//             borderRadius: BorderRadius.only(bottomRight: Radius.circular(50)),
//             image: DecorationImage(
//               image: AssetImage('images/contact.jpg'),
//               fit: BoxFit.cover,
//               colorFilter: ColorFilter.mode(Colors.black54, BlendMode.darken),
//             ),
//           ),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               const Padding(
//                 padding: EdgeInsets.only(top: 20, bottom: 40),
//                 child: Text(
//                   'AASTHA ASSAYING & HALLMARKING CENTRE',
//                   style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 20,
//                       letterSpacing: 5,
//                       fontWeight: FontWeight.bold),
//                   textAlign: TextAlign.center,
//                 ),
//               ),
//               Expanded(
//                 child: const SizedBox(
//                   height: 30,
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.only(top: 0, bottom: 10),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     const Text(
//                       '''1733,3rd Floor\nDariba kalan, Chandni chowk\nDelhi-110006\nIndia''',
//                       style: TextStyle(fontSize: 18, color: Colors.white),
//                       textAlign: TextAlign.left,
//                     ),
//                     // SizedBox(
//                     //   height: 10,
//                     // ),
//                     // TextButton(
//                     //     onPressed: () {
//                     //       setState(() {
//                     //         UrlLauncher(url: 'tel:%20+91%209582792574')
//                     //             .launchInWebViewWithJavaScript();
//                     //       });
//                     //     },
//                     //     style: socialMediaButtonStyle,
//                     //     child: const Text(
//                     //       '+91-9582792574',
//                     //       style: TextStyle(
//                     //         color: Colors.black,
//                     //         fontWeight: FontWeight.bold,
//                     //         fontSize: 20,
//                     //       ),
//                     //     ))
//                   ],
//                 ),
//               ),
//               Expanded(
//                 child: const SizedBox(
//                   height: 30,
//                 ),
//               ),
//               const Text(
//                 'Follow Us',
//                 style: TextStyle(
//                     fontSize: 30,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white),
//               ),
//               const Divider(
//                 height: 30,
//                 thickness: 1.5,
//                 color: Colors.amber,
//                 indent: 60.0,
//                 endIndent: 60.0,
//               ),
//               Row(
//                 //**social media */

//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   IconButton(
//                     onPressed: () {
//                       setState(() {
//                         Future<void> _launchInWebViewWithJavaScript() async {
//                           if (await canLaunch(
//                               'https://www.facebook.com/profile.php?id=100013132985443')) {
//                             await launch(
//                               'https://www.facebook.com/profile.php?id=100013132985443',
//                               // forceSafariVC: true,
//                               // forceWebView: true,
//                               // enableJavaScript: true,
//                               // enableDomStorage: true,
//                             );
//                           } else {
//                             throw 'Could not launch';
//                           }
//                         }

//                         _launchInWebViewWithJavaScript();
//                       });
//                     },
//                     icon: const Icon(Icons.facebook),
//                     iconSize: 35,
//                     color: Colors.lightBlue,
//                   ),
//                   TextButton(
//                     onPressed: () {
//                       setState(() {
//                         UrlLauncher(
//                                 url:
//                                     'https://www.youtube.com/channel/UCK1zIQG6js6XSum6jHzbnww?sub_confirmation=1')
//                             .launchInWebViewWithJavaScript();
//                       });
//                     },
//                     child: Image(
//                       image: AssetImage('images/social/youtube.png'),
//                       width: 35,
//                       height: 35,
//                     ),
//                   ),
//                   TextButton(
//                     onPressed: () {
//                       setState(() {
//                         UrlLauncher(url: 'https://twitter.com/AHallmarking')
//                             .launchInWebViewWithJavaScript();
//                       });
//                     },
//                     child: Image(
//                       image: AssetImage('images/social/twitter.png'),
//                       width: 35,
//                       height: 35,
//                     ),
//                   ),
//                   TextButton(
//                     onPressed: () {
//                       setState(() {
//                         UrlLauncher(
//                                 url:
//                                     "https://wa.me/919582792574?text=Hello%20,%20")
//                             .launchInWebViewWithJavaScript();
//                       });
//                     },
//                     child: Image(
//                       image: AssetImage('images/social/whatsapp (1).png'),
//                       width: 35,
//                       height: 35,
//                     ),
//                   ),
//                 ],
//               ),
//               Expanded(
//                 child: const SizedBox(
//                   height: 30,
//                 ),
//               ),
//               TextButton(
//                 onPressed: () {
//                   setState(() {
//                     UrlLauncher(
//                             url:
//                                 'https://www.google.com/maps/place/Aastha+Hallmarking+Centre/@28.6556217,77.2312871,17z/data=!3m1!4b1!4m5!3m4!1s0x390cfd1b9790e28d:0xc7efea93ad77ada0!8m2!3d28.6556237!4d77.2333993')
//                         .launchInWebViewWithJavaScript();
//                     // _launchInWebViewWithJavaScript();
//                   });
//                 },
//                 child: const ListTile(
//                   trailing: Icon(Icons.location_on),
//                   tileColor: Colors.amber,
//                   leading: Icon(
//                     Icons.map,
//                     color: Colors.green,
//                   ),
//                   title: Text(
//                     'Get Direction',
//                     style: TextStyle(
//                       color: Colors.black,
//                       fontWeight: FontWeight.bold,
//                     ),
//                     textAlign: TextAlign.center,
//                   ),
//                 ),
//                 style: socialMediaButtonStyle,
//               ),
//             ],
//           ),
//         ),
//         ListView(
//           //** F E E D B A C K     F O R M */
//           children: [
//             const Padding(
//               padding: EdgeInsets.all(20.0),
//               child: Text(
//                 'Need Us? Message Us.',
//                 style: TextStyle(fontSize: 20),
//               ),
//             ),
//             TextField(
//               textInputAction: TextInputAction.next,
//               controller: _ncontroller,
//               // onSubmitted: (value) {
//               //   sendEmail(name: value);
//               // },
//               cursorColor: Colors.amber,
//               decoration: kTextfieldDecoration.copyWith(hintText: 'Name'),
//               maxLength: 20,
//             ),
//             TextField(
//               textInputAction: TextInputAction.next,
//               // onSubmitted: (value) => sendEmail(subject: value),

//               controller: _scontroller,
//               cursorColor: Colors.amber,
//               decoration: kTextfieldDecoration,
//               maxLength: 100,
//             ),
//             TextField(
//               textInputAction: TextInputAction.next,
//               // onFieldSubmitted: (value) {
//               //   sendEmail(
//               //     email: value,
//               //   );
//               //   _mcontroller.clear();
//               // },
//               controller: _econtroller,

//               cursorColor: Colors.amber,
//               decoration: kTextfieldDecoration.copyWith(hintText: 'Email'),
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//             TextField(
//               controller: _mcontroller,
//               // onSubmitted: (text) {
//               //   sendEmail(fmessage: text);
//               //   _mcontroller.clear();
//               // },
//               cursorColor: Colors.amber,
//               decoration: kTextfieldDecoration.copyWith(hintText: 'Message'),
//               maxLines: 10,
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//             Padding(
//               padding: const EdgeInsets.only(left: 50, right: 50, top: 20),
//               child: TextButton(
//                 onPressed: () {
//                   setState(() {
//                     var message = _mcontroller.text;
//                     var email = _econtroller.text;
//                     var subject = _scontroller.text;
//                     var name = _ncontroller.text;

//                     sendEmail(
//                         email: email,
//                         fmessage: message,
//                         subject: subject,
//                         name: name);
//                   });
//                 },
//                 child: Text('Send Message'),
//                 style: TextButton.styleFrom(
//                   primary: Colors.white,
//                   backgroundColor: Colors.amber,
//                   shadowColor: Colors.amber,
//                   elevation: 5,
//                 ),
//               ),
//             )
//           ],
//         )
//       ],
//     ));
//   }
// }
