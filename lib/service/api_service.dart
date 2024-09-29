import 'dart:convert';

import 'package:http/http.dart';
import 'package:weather_app/constants/constants.dart';
import 'package:weather_app/model/weather_model.dart';

class ApiService {
  Future<Weathermodel> getWeatherData(String searchText) async {
    // String url = "$base_url&q=searchText&days=7";
    String url = "$base_url ";
    print("getWeatherData");

    try {
      print("try");

      Response response = await get(Uri.parse(url));

      if (response.statusCode == 200) {
        print("200");

        Map<String, dynamic> json = jsonDecode(response.body);

        Weathermodel wethermodel = Weathermodel.fromJson(json);
        return wethermodel;
      } else {
        print("ecv200");

        throw ("no data found");
      }
    } catch (e) {
      print("frm $e");

      throw e.toString();
    }
  }
  // Future<Weathermodel> getWeatherData(String searchText) async {
  //   // String url = "$base_url&q=searchText&days=7";
  //   String url = "$base_url ";
  //   print("getWeatherData");

  //   try {
  //     print("try");

  //     Response response = await get(Uri.parse(url));
  //     print(response.body);
  //     if (response.statusCode == 200) {
  //       print("200");

  //       Map<String, dynamic> json = jsonDecode(response.body);

  //       Weathermodel wethermodel = Weathermodel.fromJson(json);
  //       return wethermodel;
  //     } else {
  //       print("ecv200");

  //       throw ("no data found");
  //     }
  //   } catch (e) {
  //     print("$e");

  //     throw e.toString();
  //   }
  // }
}
