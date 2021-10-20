import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:weather/model/loading_state.dart';
import 'package:weather/model/weather.dart';

class MainController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    getWeekWeather();
    getCurrentWeather();
  }

  String cityName = "Baghdad";
  String cityValue = "33.289212,44.359353";
  List<Weather> weatherDaily = [];
  var loading_week;
  var loading_current;
  getCityID(String city, String city_name) {
    cityName = city_name;
    cityValue = city;
    weatherDaily = [];
    getCurrentWeather();
    getWeekWeather();
    update();
  }

  Future getWeekWeather() async {
    try {
      loading_week=LoadingState.loading;
      http.Response response = await http.get(Uri.parse(
          "http://api.weatherapi.com/v1/forecast.json?key=79e072ecd7c04721900222031211810&q=$cityValue&days=7&aqi=no&alerts=no"));
      if (response.statusCode == 200) {
        List<dynamic> data;
        data = jsonDecode(response.body)['forecast']['forecastday'];
        for (int i = 0; i < data.length; i++) {
          weatherDaily.add(Weather.fromMap(data[i]));
        }
        update();
        loading_week=LoadingState.finished;
      } else {
        loading_week=LoadingState.error;
        print('status code = ${response.statusCode}');
      }
    } catch (e) {
      loading_week=LoadingState.notavail;
      print(e.toString());
    }
    update();
  }

  double? wind = 0.0;
  double? feelslike = 0.0;
  var icon = '//cdn.weatherapi.com/weather/64x64/night/113.png';
  double? temp = 0.0;
  String? status = '';
  double? uvIndex = 0.0;
  int? humidity = 0;

  Future getCurrentWeather() async {
    try {
      loading_current=LoadingState.loading;
      http.Response response = await http.get(Uri.parse(
          "http://api.weatherapi.com/v1/forecast.json?key=79e072ecd7c04721900222031211810&q=$cityValue&days=7&aqi=no&alerts=no"));
      if (response.statusCode == 200) {
        wind = jsonDecode(response.body)['current']['wind_kph'] ?? 0;
        feelslike = jsonDecode(response.body)['current']['feelslike_c'] ?? 0;
        icon = jsonDecode(response.body)['current']['condition']['icon'] ?? '';
        temp = jsonDecode(response.body)['current']['temp_c'] ?? 0;
        status =
            jsonDecode(response.body)['current']['condition']['text'] ?? '';
        uvIndex = jsonDecode(response.body)['current']['uv'] ?? 0;
        humidity = jsonDecode(response.body)['current']['humidity'] ?? 0;

        loading_current=LoadingState.finished;
        update();
      } else {
        loading_current=LoadingState.error;
        // print('status code = ${response.statusCode}');
      }
    } catch (e) {
      loading_current=LoadingState.notavail;
      print(e.toString());
    }
    update();
  }
}
