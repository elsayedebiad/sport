// ignore_for_file: prefer_const_constructors

import '/services/API.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:login/screens/home_page.dart';
import 'package:login/screens/login.dart';
import 'package:login/screens/signup.dart';
import 'package:login/screens/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
    apiKey: "AIzaSyB5wOHLSx0C1IqZfSmaM0CEsoJ5gMzQGKo",
    appId: "1:901628672455:android:b79f3f9fff95e77146c1e2",
    messagingSenderId: "scoreapp-9f137",
    projectId: "scoreapp-9f137",
  ));
  Service(Dio()).getCountries();
  runApp(
    ScoreApp(),
  );
}

class ScoreApp extends StatefulWidget {
  const ScoreApp({super.key});

  @override
  State<ScoreApp> createState() => _ScoreAppState();
}

class _ScoreAppState extends State<ScoreApp> {
  @override
  void initState() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print(
            '=================== User is currently signed out! ==============');
      } else {
        print('=========== User is signed in! =============');
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      routes: {
        "signup": (context) => SignupPage(),
        "login": (context) => LoginPage(),
        "home": (context) => HomePage(),
      },
    );
  }
}
