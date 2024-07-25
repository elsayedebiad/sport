// ignore_for_file: prefer_const_constructors, sort_child_properties_last, sized_box_for_whitespace

import 'dart:math';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login/screens/home_page.dart';


class RandomApp extends StatefulWidget {
  RandomApp({super.key});

  @override
  State<RandomApp> createState() => _RandomAppState();
}

class _RandomAppState extends State<RandomApp> {
  List<int> randomValues = [];
  List<TextEditingController> controllers =
      List.generate(6, (_) => TextEditingController());
  List<FocusNode> focusNodes = List.generate(6, (_) => FocusNode());
  String result = "";

  @override
  Widget build(BuildContext context) {
  final user = FirebaseAuth.instance.currentUser!;

    return Scaffold(
      backgroundColor: Color(0xff181A20),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 0, top: 30),
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back_ios),
                      color: Color.fromARGB(255, 144, 138, 138),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 0, top: 30),
                    child: Text(
                      "OTP Verification Code",
                      style: TextStyle(
                          color: Color.fromARGB(255, 149, 149, 149),
                          fontFamily: 'Poppins',
                          fontSize: 20),
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 50, bottom: 50, left: 20, right: 20),
                padding: EdgeInsets.all(21),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.pink),
                  borderRadius: BorderRadius.circular(12),
                  color: Color(0xff1F1F1F),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Verification your email:",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Poppins',
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      user.email!,
                      style: TextStyle(
                        color: Colors.pink,
                        fontFamily: 'Poppins',
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color.fromARGB(255, 164, 174, 204),
                  ),
                  borderRadius: BorderRadius.circular(12),
                  color: Color(0xff1F1F1F),
                ),
                child: Text(
                  randomValues.isNotEmpty ? randomValues.join(' - ') : '',
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.only(left: 25, right: 25, top: 40),
                height: 55,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      randomValues = generateRandomNumbers();
                      result = "";
                      for (var controller in controllers) {
                        controller.clear();
                      }
                    });
                  },
                  child: Text(
                    "Create Code",
                    style: TextStyle(color: Colors.white, fontFamily: 'poppins'),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 115, 56, 69),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 60),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(6, (index) {
                  return Container(
                    width: 40,
                    child: TextField(
                      style: TextStyle(color: Colors.white, fontFamily: 'Poppins'),
                      controller: controllers[index],
                      focusNode: focusNodes[index],
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 201, 169, 176),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffF63D67)),
                        ),
                      ),
                      textAlign: TextAlign.center,
                      maxLength: 1,
                      buildCounter: (context,
                              {required currentLength,
                              required isFocused,
                              required maxLength}) =>
                          null,
                      onChanged: (value) {
                        if (value.length == 1 && index < 5) {
                          FocusScope.of(context)
                              .requestFocus(focusNodes[index + 1]);
                        }
                      },
                    ),
                  );
                }),
              ),
              SizedBox(height: 20),
              Container(
                width: double.infinity,
                margin: EdgeInsets.only(left: 25, right: 25, top: 40),
                height: 55,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      result = checkInput(controllers, randomValues);
                    });
                  },
                  child: Text(
                    "Check",
                    style: TextStyle(color: Colors.white, fontFamily: 'poppins'),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xffF63D67),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                result,
                style: TextStyle(
                  fontSize: 25,
                  color: result == "Success" ? Colors.green : Colors.red,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<int> generateRandomNumbers() {
    Random random = Random();
    List<int> randomNumbers = [];
    for (int i = 0; i < 6; i++) {
      randomNumbers.add(random.nextInt(9) + 1);
    }
    return randomNumbers;
  }

  String checkInput(
      List<TextEditingController> controllers, List<int> randomValues) {
    for (int i = 0; i < controllers.length; i++) {
      if (int.tryParse(controllers[i].text) != randomValues[i]) {
        return "The code is not true";
      }
    }
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(),
        ));
    return "Success";
  }
}
