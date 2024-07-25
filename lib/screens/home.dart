// ignore_for_file: prefer_const_constructors, unnecessary_import, avoid_unnecessary_containers, use_full_hex_values_for_flutter_colors, use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
// import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:login/screens/home_page.dart';
import 'package:login/screens/login.dart';
import 'package:login/screens/otp.dart';
import 'package:login/screens/signup.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    if (googleUser == null) {
      return;
    }

    // Future<UserCredential> signInWithFacebook() async {
    //   // Trigger the sign-in flow
    //   final LoginResult loginResult = await FacebookAuth.instance.login();

    //   // Create a credential from the access token
    //   final OAuthCredential facebookAuthCredential =
    //       FacebookAuthProvider.credential(loginResult.accessToken!.token);

    //   // Once signed in, return the UserCredential
    //   return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
    // }

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    await FirebaseAuth.instance.signInWithCredential(credential);
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => RandomApp()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff191A1F),
      body: Column(
        children: [
          SizedBox(height: 15),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                      margin: EdgeInsets.only(left: 20, top: 10),
                      width: 30,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Image.asset(
                        "assets/image/icons8-arrow-back-50.png",
                        width: 30,
                      )),
                ],
              ),
            ),
          ),
          SizedBox(height: 85),
          Center(
            child: Text(
              "Let's you in",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 60),
          GestureDetector(
            onTap: () {},
            child: Container(
              width: 320,
              height: 50,
              decoration: BoxDecoration(
                color: Color(0xff31343B),
                borderRadius: BorderRadius.circular(17),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      margin: EdgeInsets.only(right: 10),
                      child: Image.asset(
                        "assets/image/icons8-facebook-48.png",
                        width: 30,
                      )),
                  Container(
                    child: Text(
                      "Continue with facebook",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(padding: EdgeInsets.only(bottom: 15)),
          GestureDetector(
            onTap: () {
              signInWithGoogle();
            },
            child: Container(
              width: 320,
              height: 50,
              decoration: BoxDecoration(
                color: Color(0xff31343B),
                borderRadius: BorderRadius.circular(17),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      margin: EdgeInsets.only(right: 15),
                      child: Image.asset(
                        "assets/image/icons8-google-48.png",
                        width: 30,
                      )),
                  Container(
                    child: Text(
                      "Continue with Google",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(padding: EdgeInsets.only(bottom: 15)),
          GestureDetector(
            onTap: () {},
            child: Container(
              width: 320,
              height: 50,
              decoration: BoxDecoration(
                color: Color(0xff31343B),
                borderRadius: BorderRadius.circular(17),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      margin: EdgeInsets.only(right: 19),
                      child: Image.asset(
                        "assets/image/icons8-apple-logo-50.png",
                        width: 30,
                      )),
                  Container(
                    child: Text(
                      "Continue with Apple",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 35,
          ),
          Row(
            children: [
              SizedBox(
                width: 40,
              ),
              Container(
                margin: EdgeInsets.only(left: 0, right: 10),
                width: 130,
                height: 1,
                color: Colors.white24,
              ),
              Text(
                'Or',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
              Container(
                margin: EdgeInsets.only(left: 10),
                width: 130,
                height: 1,
                color: Colors.white24,
              ),
            ],
          ),
          SizedBox(height: 35),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginPage(),
                  ));
            },
            child: Container(
              width: 320,
              height: 45,
              decoration: BoxDecoration(
                color: Color(0xffF63D67),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Text(
                      "Sign in with password",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Don't have an account?",
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.w300),
              ),
              const SizedBox(width: 10),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignupPage(),
                      ));
                },
                child: const Text(
                  'Sign up',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xffF63D67),
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
