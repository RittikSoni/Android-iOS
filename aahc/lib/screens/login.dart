import 'package:aahc/components/rounded_button.dart';
import 'package:aahc/constants.dart';
import 'package:aahc/screens/login/login_card.dart';
import 'package:aahc/screens/login/login_nav.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:loading_overlay/loading_overlay.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _auth = FirebaseAuth.instance;
  bool isSecure = true;
  String Email = '';
  String password = '';
  bool showSpinner = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.amber,
        shadowColor: Colors.amber,
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.lightBlueAccent),
        title: Text(
          'AAHC Login',
          style: TextStyle(color: isADark ? Colors.black : Colors.white),
        ),
      ),
      body: SafeArea(
          child: LoadingOverlay(
        isLoading: showSpinner,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                      height: 300,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('images/aahclogo.png'),
                        ),
                      )),
                  const SizedBox(
                    height: 48,
                  ),
                  TextField(
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.emailAddress,
                    textAlign: TextAlign.center,
                    onChanged: (value) {
                      Email = value;
                    },
                    decoration:
                        kTextfieldDecoration.copyWith(hintText: 'AAHC UserID'),
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  TextField(
                    textAlign: TextAlign.center,
                    onChanged: (value) {
                      password = value;
                    },
                    decoration: kTextfieldDecoration.copyWith(
                      hintText: 'Password',
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isSecure ? isSecure = false : isSecure = true;
                          });
                        },
                        icon: Icon(
                          isSecure ? Icons.visibility_off : Icons.visibility,
                          size: 20,
                        ),
                      ),
                    ),
                    obscureText: isSecure,
                  ),
                  const SizedBox(
                    height: 24.0,
                  ),
                  RoundedButton(
                    shadowColour: Colors.white,
                    onTap: () async {
                      setState(() {
                        showSpinner = true;
                      });
                      try {
                        final user = await _auth.signInWithEmailAndPassword(
                            email: Email, password: password);
                        if (user != null) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginNav()));
                        }
                        setState(() {
                          showSpinner = false;
                        });
                      } catch (e) {
                        setState(() {
                          showSpinner = false;
                        });
                        print(e);
                      }
                    },
                    buttonText: 'Login',
                    colour: Colors.blueAccent,
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
