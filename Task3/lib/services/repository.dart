import 'package:flutter_application_6/models/forecast.dart';
import 'package:flutter_application_6/services/weather_api.dart';

abstract class IRepository {
  Future<Forecast> getWeather(String city);
}

class Repository extends IRepository {
  final IWeatherApi weatherApi;
  Repository(this.weatherApi);

  @override
  Future<Forecast> getWeather(String city) async {
    final location = await weatherApi.getLocation(city);
    return await weatherApi.getWeather(location);
  }
}

class NetworkException implements Exception {}
