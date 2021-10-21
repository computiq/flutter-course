import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_application_6/models/forecast.dart';
import 'package:flutter_application_6/models/location.dart';
import 'package:flutter_application_6/services/constants.dart';

abstract class IWeatherApi {
  Future<Forecast> getWeather(Location location);
  Future<Location> getLocation(String city);
}

class WeatherApi extends IWeatherApi {
  final http.Client httpClient;

  WeatherApi(this.httpClient);

  @override
  Future<Location> getLocation(String city) async {
    final requestUrl = '$endPointUrl/weather?q=$city&APPID=$apiKey';
    final response = await httpClient.get(Uri.parse(requestUrl));

    if (response.statusCode != 200) {
      throw Exception(
          'error retrieving location for city $city: ${response.statusCode}');
    }

    return Location.fromJson(jsonDecode(response.body));
  }

  @override
  Future<Forecast> getWeather(Location location) async {
    final requestUrl =
        '$endPointUrl/onecall?lat=${location.latitude}&lon=${location.longitude}&exclude=hourly,minutely&APPID=$apiKey';
    final response = await httpClient.get(Uri.parse(requestUrl));

    if (response.statusCode != 200) {
      throw Exception('error retrieving weather: ${response.statusCode}');
    }

    return Forecast.fromJson(jsonDecode(response.body));
  }
}
