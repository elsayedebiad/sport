// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class CountryContainer extends StatelessWidget {
  final String countryName;
  final String imageUrl;

  const CountryContainer({
    Key? key,
    required this.countryName,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 190,
      margin: EdgeInsets.all(4.0),
      decoration: BoxDecoration(
        border: Border.all(
          width: 0.2,
          color: Color(0xffE91C63),
        ),
        color: Color(0xff141414),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(
            imageUrl,
            width: 80,
            height: 80,
          ),
          SizedBox(height: 10),
          Text(
            countryName,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
