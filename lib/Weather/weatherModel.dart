// ignore_for_file: file_names, non_constant_identifier_names
// To parse this JSON data, do
//
//     final weather = weatherFromJson(jsonString);

// To parse this JSON data, do
//
//     final weather = weatherFromJson(jsonString);

class Weather {
  String? cityName;
  double? temp;
  double? max_temp;
  double? min_temp;
  List<dynamic>? weatherDescrip;
String? country;

  double? wind;
  int? humidity;
  double? feels_like;
  int? pressure;

  Weather({
    this.cityName,
    this.temp,
    this.wind,
    this.humidity,
    this.feels_like,
    this.pressure,
    this.weatherDescrip,
    this.max_temp,
    this.min_temp,
    this.country

  });

  Weather.fromJson(Map<String, dynamic> json) {
    cityName = json['name'];
    temp = json['main']['temp'] - 273;
    max_temp = json['main']['temp_min'] - 273;
    min_temp = json['main']['temp_max'] - 273;
    weatherDescrip = json['weather'];
    country=json['sys']['country'];
    wind = json['wind']['speed'];
    pressure = json['main']['pressure'];
    humidity = json['main']['humidity'];
    feels_like = json['main']['feels_like']-273;
  }
}
