// To parse this JSON data, do
//
//     final weatherForecast = weatherForecastFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

WeatherForecast weatherForecastFromJson(String str) =>
    WeatherForecast.fromJson(json.decode(str));

String weatherForecastToJson(WeatherForecast data) =>
    json.encode(data.toJson());

class WeatherForecast {
  WeatherForecast({
    required this.forecast,
  });

  final List<Forecast> forecast;

  factory WeatherForecast.fromJson(Map<String, dynamic> json) =>
      WeatherForecast(
        forecast: List<Forecast>.from(
            json["forecast"].map((x) => Forecast.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "forecast": List<dynamic>.from(forecast.map((x) => x.toJson())),
      };
}

class Forecast {
  Forecast({
    required this.date,
    required this.maxTempC,
    required this.maxTempF,
    required this.minTempC,
    required this.minTempF,
    required this.avgTempC,
    required this.avgTempF,
    required this.condition,
    required this.iconUrl,
    required this.sunrise,
    required this.sunset,
  });

  final DateTime date;
  final double maxTempC;
  final double maxTempF;
  final double minTempC;
  final double minTempF;
  final double avgTempC;
  final double avgTempF;
  final String condition;
  final String iconUrl;
  final String sunrise;
  final String sunset;

  factory Forecast.fromJson(Map<String, dynamic> json) => Forecast(
        date: DateTime.parse(json["date"]),
        maxTempC: json["max_temp_c"].toDouble(),
        maxTempF: json["max_temp_f"].toDouble(),
        minTempC: json["min_temp_c"].toDouble(),
        minTempF: json["min_temp_f"].toDouble(),
        avgTempC: json["avg_temp_c"].toDouble(),
        avgTempF: json["avg_temp_f"].toDouble(),
        condition: json["condition"],
        iconUrl: json["icon_url"],
        sunrise: json["sunrise"],
        sunset: json["sunset"],
      );

  Map<String, dynamic> toJson() => {
        "date":
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "max_temp_c": maxTempC,
        "max_temp_f": maxTempF,
        "min_temp_c": minTempC,
        "min_temp_f": minTempF,
        "avg_temp_c": avgTempC,
        "avg_temp_f": avgTempF,
        "condition": condition,
        "icon_url": iconUrl,
        "sunrise": sunrise,
        "sunset": sunset,
      };
}
