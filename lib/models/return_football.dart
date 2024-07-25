import 'package:flutter/material.dart';
import 'package:login/Components/cpuntrry.dart';
import 'package:login/models/country_data_model.dart';


class ReturnFootball extends StatelessWidget {
  const ReturnFootball({super.key, required this.countrydata});
  final CountryDataModel countrydata;

  @override
  Widget build(BuildContext context) {
    List<CountryDataModel> countries = [
      countrydata,
    ];
    return foot_return(countries);
  }
}
