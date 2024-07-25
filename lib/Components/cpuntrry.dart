// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:login/models/football_detels.dart';
import '../models/country_data_model.dart';

class Country extends StatelessWidget {
  const Country({super.key, required this.countrydata});
  final CountryDataModel countrydata;

  @override
  Widget build(BuildContext context) {
    List<CountryDataModel> countries = [
      countrydata,
      // يمكن إضافة المزيد من العناصر هنا
    ];

    return SingleChildScrollView(
      child: Column(
        children: [
          
          foot_return(countries),
        ],
      )
    );
  }
}

  Column foot_return(List<CountryDataModel> countries) {
    return Column(
    children: [
      for (int i = 0; i < countries.length; i += 2)
        Row(
          children: [
            Expanded(
              child: CountryContainer(
                countryName: countries[i].CountryName,
                imageUrl: countries[i].Image != null
                    ? countries[i].Image!
                    : 'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a9/Flag_of_the_United_States_%28DoS_ECA_Color_Standard%29.svg/1920px-Flag_of_the_United_States_%28DoS_ECA_Color_Standard%29.svg.png',
              ),
            ),
            if (i + 1 < countries.length)
              Expanded(
                child: CountryContainer(
                  countryName: countries[i + 1].CountryName,
                  imageUrl: countries[i + 1].Image != null
                      ? countries[i + 1].Image!
                      : 'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a9/Flag_of_the_United_States_%28DoS_ECA_Color_Standard%29.svg/1920px-Flag_of_the_United_States_%28DoS_ECA_Color_Standard%29.svg.png',
                ),
              ),
          ],
        ),
    ],
  );
  }