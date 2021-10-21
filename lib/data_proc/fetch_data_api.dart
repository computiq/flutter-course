import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tuple/tuple.dart';

import 'current_days.dart';
import 'package:http/http.dart' as http;

late LoadingState loadingState;

class ErrorResponse {
  ErrorResponse(this.message, this.statusCode);
  String message;
  int statusCode;
}

enum LoadingState { idle, loading, finished }

class WeatherViewModel extends ChangeNotifier {
  late Tuple2<ErrorResponse?, WeatherAPI?> WeatherResponse;
  LoadingState loadingState = LoadingState.idle;
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late String chosedCity;
  UsersViewModel() {
    WeatherResponse = Tuple2(null, null);
    //chosedCity = "Baghdad";
  }

  Future<void> getCity() async {
    final SharedPreferences prefs = await _prefs;
    chosedCity = prefs.getString("chosedCity") ?? "Baghdad";
  }

  void saveCity() async {
    final SharedPreferences prefs = await _prefs;
    prefs.setString("chosedCity", chosedCity);
  }

  void fetchWeatherData() async {
    loadingState = LoadingState.loading;

    await getCity();

    notifyListeners();
    var response;
    WeatherAPI curDay;

    try {
      var url = Uri.parse(
          'https://api.weatherbit.io/v2.0/forecast/daily?city=${chosedCity}&days=7&key=6cdc2f711e654daaa22dd0a7de07e768');

      response = await http.get(
        url,
      );

      var json = jsonDecode(response.body);

      curDay = WeatherAPI.fromJson(json);

      WeatherResponse = Tuple2(null, curDay);
      loadingState = LoadingState.finished;
      notifyListeners();
    } catch (e) {
      if (response?.statusCode == 200) {
        WeatherResponse = Tuple2(
            ErrorResponse('Data is corrupt', response?.statusCode), null);
      } else {
        WeatherResponse = Tuple2(
            ErrorResponse('No Internet\n Try again by pull down to retry', -1),
            null);
      }
    }
    loadingState = LoadingState.finished;
    notifyListeners();
  }
}
