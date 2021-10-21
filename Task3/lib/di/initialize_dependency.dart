import 'package:get_it/get_it.dart';
import 'package:flutter_application_6/services/repository.dart';
import 'package:flutter_application_6/services/weather_api.dart';
import 'package:http/http.dart' as http;

GetIt injector = GetIt.instance;

Future<void> initializeDependency() async {
  injector.registerSingleton<http.Client>(http.Client());

  injector
      .registerSingleton<IWeatherApi>(WeatherApi(injector.get<http.Client>()));

  injector
      .registerSingleton<IRepository>(Repository(injector.get<IWeatherApi>()));
}
