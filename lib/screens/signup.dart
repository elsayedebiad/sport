// ignore_for_file: prefer_const_constructors, deprecated_member_use, unused_local_variable, avoid_unnecessary_containers, use_build_context_synchronously, sort_child_properties_last, avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:login/screens/login.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<SignupPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool visable = true;
  bool chekbox = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff181A20),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 180,
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(left: 20),
              child: Text(
                "Create Your Account",
                style: TextStyle(
                    color: Colors.white, fontFamily: 'Poppins', fontSize: 26),
              ),
            ),
            SizedBox(
              height: 70,
            ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20, bottom: 10),
              child: TextFormField(
                controller: emailController,
                style: TextStyle(color: Colors.white, fontFamily: 'Poppins'),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  fillColor: Color(0xff31343B),
                  hintText: "Email",
                  hintStyle: TextStyle(
                      color: Color(0xffC8CCCC), fontFamily: 'Poppins'),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: SvgPicture.asset(
                      "assets/photos/email.svg",
                      width: 20,
                      height: 15,
                      color: Color(0xffC8CCCC),
                    ),
                  ),
                  filled: true,
                ),
              ),
            ),
            // Container(
            //   margin: EdgeInsets.only(left: 20, right: 20, bottom: 10),
            //   child: TextFormField(
            //     keyboardType: TextInputType.number,
            //     style: TextStyle(color: Colors.white, fontFamily: 'Poppins'),
            //     decoration: InputDecoration(
            //       border: OutlineInputBorder(
            //         borderRadius: BorderRadius.circular(12),
            //         borderSide: BorderSide.none,
            //       ),
            //       focusedBorder: OutlineInputBorder(
            //         borderRadius: BorderRadius.circular(12),
            //         borderSide: BorderSide.none,
            //       ),
            //       enabledBorder: OutlineInputBorder(
            //         borderRadius: BorderRadius.circular(12),
            //         borderSide: BorderSide.none,
            //       ),
            //       errorBorder: OutlineInputBorder(
            //         borderRadius: BorderRadius.circular(12),
            //         borderSide: BorderSide.none,
            //       ),
            //       disabledBorder: OutlineInputBorder(
            //         borderRadius: BorderRadius.circular(12),
            //         borderSide: BorderSide.none,
            //       ),
            //       fillColor: Color(0xff31343B),
            //       hintText: "phone number ",
            //       hintStyle: TextStyle(
            //           color: Color(0xffC8CCCC), fontFamily: 'Poppins'),
            //       prefixIcon: Padding(
            //         padding: const EdgeInsets.all(12.0),
            //         child: SvgPicture.asset(
            //           "assets/photos/phone-call.svg",
            //           width: 20,
            //           height: 15,
            //           color: Color(0xffC8CCCC),
            //         ),
            //       ),
            //       filled: true,
            //     ),
            //   ),
            // ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              child: TextFormField(
                controller: passwordController,
                obscureText: visable,
                style: TextStyle(color: Colors.white, fontFamily: 'Poppins'),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  fillColor: Color(0xff31343B),
                  hintText: "Password",
                  hintStyle: TextStyle(
                      color: Color(0xffC8CCCC), fontFamily: 'Poppins'),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: SvgPicture.asset(
                      "assets/photos/lock.svg",
                      width: 20,
                      height: 15,
                      color: Color(0xffC8CCCC),
                    ),
                  ),
                  suffixIcon: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          visable = !visable;
                        });
                      },
                      child: visable == false
                          ? Image.asset(
                              "assets/photos/eye-crosse.png",
                              width: 20,
                              height: 15,
                              color: Color(0xffC8CCCC),
                            )
                          : SvgPicture.asset(
                              "assets/photos/eye.svg",
                              width: 20,
                              height: 15,
                              color: Color(0xffC8CCCC),
                            ),
                    ),
                  ),
                  filled: true,
                ),
              ),
            ),
            Row(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(left: 10),
                  child: Checkbox(
                    value: chekbox,
                    onChanged: (value) {
                      setState(() {
                        chekbox = value!;
                      });
                    },
                  ),
                ),
                Container(
                  child: Text(
                    "Remember me",
                    style:
                        TextStyle(color: Colors.white, fontFamily: 'Poppins'),
                  ),
                ),
                Spacer(),
                Container(
                  margin: EdgeInsets.only(right: 20),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginPage(),
                          ));
                    },
                    child: Text(
                      "you have account ?",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Poppins',
                          fontSize: 12),
                    ),
                  ),
                )
              ],
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(left: 25, right: 25, top: 40),
              height: 55,
              child: ElevatedButton(
                onPressed: () async {
                  try {
                    final credential = await FirebaseAuth.instance
                        .createUserWithEmailAndPassword(
                      email: emailController.text,
                      password: passwordController.text,
                    );
                    Navigator.of(context).pushReplacementNamed('home');
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'weak-password') {
                      print('The password provided is too weak.');
                    } else if (e.code == 'email-already-in-use') {
                      print('The account already exists for that email.');
                    }
                  } catch (e) {
                    print(e);
                  }
                },
                child: Text(
                  "Sign Up",
                  style: TextStyle(color: Colors.white, fontFamily: 'poppins'),
                ),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xffF63D67),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12))),
              ),
            ),
            SizedBox(
              height: 60,
            ),
            Row(
              children: [
                Container(
                  width: 110,
                  height: 3,
                  color: Colors.white,
                  margin: EdgeInsets.only(left: 25, right: 25),
                ),
                Container(
                  child: Text(
                    "or continue with",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Container(
                  width: 110,
                  height: 3,
                  color: Colors.white,
                  margin: EdgeInsets.only(left: 20, right: 10),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 65, top: 60),
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    color: Color(0xff31343B),
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Image.asset(
                    "assets/photos/icons8-facebook-48.png",
                    width: 20,
                    height: 20,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 40, top: 60),
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    color: Color(0xff31343B),
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Image.asset(
                    "assets/photos/icons8-apple-48.png",
                    width: 20,
                    height: 20,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 40, top: 60),
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    color: Color(0xff31343B),
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(color: Colors.grey),
                    // image: DecorationImage(image: AssetImage("assets/photos/icons8-facebook-48.png"))
                  ),
                  child: Image.asset(
                    "assets/photos/icons8-google-48.png",
                    width: 20,
                    height: 20,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
