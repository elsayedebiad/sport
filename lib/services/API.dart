// ignore_for_file: non_constant_identifier_names, unused_local_variable

import 'package:dio/dio.dart';
import '../models/country_data_model.dart';

class Service {
  final Dio dio;

  Service(this.dio);

  Future <List<CountryDataModel>> getCountries() async {
    Response response = await dio.get(
        'https://apiv2.allsportsapi.com/football/?met=Countries&APIkey=b89235e55d1aa3659d638bcc349860caf31c315da8c06a94d3de28a26cf8c1f8');
    Map<String, dynamic> jsonCountry = response.data;
    List<dynamic> result = jsonCountry["result"];
    List<CountryDataModel> CountryData = [];
    // print(jsonCountry);
    // print(result);
    for (var dataCountry in result) {
      CountryDataModel countryData = CountryDataModel(
          CountryName: dataCountry["country_name"],
          Image: dataCountry["country_logo"]);
      CountryData.add(countryData);
    }
    return CountryData;


  }

  void getLeagues() async {
    Response response = await dio.get(
        'https://apiv2.allsportsapi.com/football/?met=Leagues&APIkey=b89235e55d1aa3659d638bcc349860caf31c315da8c06a94d3de28a26cf8c1f8');
    Map<String, dynamic> jsonLeagues = response.data;
  }

  void getTeams() async {
    Response response = await dio.get(
        "https://apiv2.allsportsapi.com/football/?&met=Teams&teamId=96&APIkey=b89235e55d1aa3659d638bcc349860caf31c315da8c06a94d3de28a26cf8c1f8");
    Map<String, dynamic> jsonTeams = response.data;
  }
}
