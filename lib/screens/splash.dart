import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../onboarding.dart';

class SplashScreen extends StatefulWidget{
  const SplashScreen ({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState () {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Future.delayed(const Duration(seconds:2 ), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) => const OnboardingPage(),
        ),
      );
    });
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          color:Color.fromARGB(235, 0, 0, 0) ,
        ),
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            SizedBox(
              height: 250,
              width: 250,
              child: Image.asset('assets/images/ap_lo.jpg',),)

          ],) ,
      ),

    );
  }
}
