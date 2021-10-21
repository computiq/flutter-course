import 'package:intl/intl.dart';
import 'package:flutter_application_6/utils/extensions.dart';
import 'package:flutter_application_6/utils/temp_converter.dart';

enum WeatherCondition {
  thunderstorm,
  drizzle,
  rain,
  snow,
  mist,
  lightCloud,
  heavyCloud,
  clear,
  unknown
}

class Weather {
  WeatherCondition condition;
  final String description;
  final String temp;
  final String feelLikeTemp;
  final int cloudiness;
  final String date;
  final String sunrise;
  final String sunset;

  Weather(
      {required this.condition,
      required this.description,
      required this.temp,
      required this.feelLikeTemp,
      required this.cloudiness,
      required this.date,
      required this.sunrise,
      required this.sunset});

  static Weather fromDailyJson(dynamic daily) {
    var cloudiness = daily['clouds'];
    var weather = daily['weather'][0];

    return Weather(
        condition: mapStringToWeatherCondition(weather['main'], cloudiness),
        description: weather['description'].toString().capitalize(),
        cloudiness: cloudiness,
        temp:
            '${formatTemperature(TempConverter.kelvinToCelsius(double.parse(daily['temp']['day'].toString())))}°',
        date: DateFormat('d EEE')
            .format(DateTime.fromMillisecondsSinceEpoch(daily['dt'] * 1000)),
        sunrise: DateFormat.jm().format(
            DateTime.fromMillisecondsSinceEpoch(daily['sunrise'] * 1000)),
        sunset: DateFormat.jm().format(
            DateTime.fromMillisecondsSinceEpoch(daily['sunset'] * 1000)),
        feelLikeTemp:
            '${formatTemperature(TempConverter.kelvinToCelsius(double.parse(daily['feels_like']['day'].toString())))}°');
  }

  static String formatTemperature(double t) {
    // ignore: unnecessary_null_comparison
    var temp = (t == null ? '' : t.round().toString());
    return temp;
  }

  static WeatherCondition mapStringToWeatherCondition(
      String input, int cloudiness) {
    WeatherCondition condition;
    switch (input) {
      case 'Thunderstorm':
        condition = WeatherCondition.thunderstorm;
        break;
      case 'Drizzle':
        condition = WeatherCondition.drizzle;
        break;
      case 'Rain':
        condition = WeatherCondition.rain;
        break;
      case 'Snow':
        condition = WeatherCondition.snow;
        break;
      case 'Clear':
        condition = WeatherCondition.clear;
        break;
      case 'Clouds':
        condition = (cloudiness >= 85)
            ? WeatherCondition.heavyCloud
            : WeatherCondition.lightCloud;
        break;
      case 'Mist':
        condition = WeatherCondition.mist;
        break;
      default:
        condition = WeatherCondition.unknown;
    }

    return condition;
  }
}
