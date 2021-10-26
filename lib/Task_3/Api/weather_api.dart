// ignore_for_file: avoid_print,, prefer_typing_uninitialized_variables

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:tuple/tuple.dart';

import '../Models/weather_model.dart';

// Future<Weather> fechWeather() async {
//   var apiUrl = Uri.parse(
//       "https://api.weatherapi.com/v1/forecast.json?key=34758bbdd2e44d47821102523211810&q=Baghdad&days=7&aqi=no&alerts=no");
//   var response = await http.get(apiUrl);

//   print(response.statusCode);
//   if (response.statusCode == 200) {
//     try {
//       var wether = Weather.fromJson(jsonDecode(response.body));
//       print(wether);

//       return wether;
//     } catch (e) {
//       return throw Exception("Json parse error");
//     }
//   } else {
//     throw Exception('network connection failed');
//   }
// }
class WetherApi with ChangeNotifier {
  final String name;
  WetherApi({
    required this.name,
  });
  Future<Tuple2<ErrorResponse?, Weather?>> fetchWeatherDaily(
      {String name = 'Baghdad'}) async {
    var response;
    try {
      var apiUrl = Uri.parse(
          "https://api.weatherapi.com/v1/forecast.json?key=34758bbdd2e44d47821102523211810&q=$name&days=7&aqi=no&alerts=no");
      response = await http.get(apiUrl);
      var dailay = Weather.fromJson(jsonDecode(response.body));
      print(response.statusCode);
      print(dailay);
      notifyListeners();
      return Tuple2(null, dailay);
    } catch (e) {
      if (response?.statusCode == 200) {
        print('response code1: $e');
        return Tuple2(
            ErrorResponse(
                'There is currently a problem. Please try again later',
                response?.statusCode ?? -1),
            null);
      }
      print('response code2: ${response?.statusCode}');
      return Tuple2(
          ErrorResponse(
              'Please make sure you are connected to the internet', -1),
          null);
    }
  }

  @override
  notifyListeners();
}

class ErrorResponse {
  ErrorResponse(this.message, this.statusCode);
  String message;
  int statusCode;
}
