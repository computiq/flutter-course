class Weather {
  double currentTemp;
  String? icon;
  String day;
  Weather({
    required this.currentTemp,
    required this.day,
    required this.icon,
  });

  factory Weather.fromMap(Map<String, dynamic> map) {
    return Weather(
      day: map['date'] ?? '',
      icon: map['day']['condition']['icon'] ?? '',
      currentTemp: map['day']['avgtemp_c'] ?? 0,
    );
  }
}

class CureentWeather {
  double currentTemp;
  String? icon;
  String weatherStatus;
  double feelsLike;
  double windSpeed;
  double uvIndex;
  double humidity;
  CureentWeather(
      {required this.currentTemp,
      required this.icon,
      required this.feelsLike,
      required this.weatherStatus,
      required this.windSpeed,
      required this.uvIndex,
      required this.humidity});
}
