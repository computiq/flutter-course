import 'package:flutter/material.dart';
import 'package:flutter_application_6/models/weather.dart';

class WeatherSummaryWidget extends StatelessWidget {
  const WeatherSummaryWidget(
      {Key? key,
      required this.date,
      required this.condition,
      required this.temp,
      required this.feelsLike})
      : super(key: key);

  final WeatherCondition condition;
  final String temp;
  final String feelsLike;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        Text(date,
            style: const TextStyle(
              fontSize: 40,
              color: Colors.white,
            )),
        _mapWeatherConditionToImage(condition),
        Column(
          children: [
            Text(
              temp,
              style: const TextStyle(
                fontSize: 50,
                color: Colors.white,
                fontWeight: FontWeight.w300,
              ),
            ),
            Text(
              'Feels like $feelsLike',
              style: const TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ),
      ]),
    );
  }

  Widget _mapWeatherConditionToImage(WeatherCondition condition) {
    Image image;
    switch (condition) {
      case WeatherCondition.clear:
      case WeatherCondition.lightCloud:
        image = Image.asset('images/clear.png');
        break;
      case WeatherCondition.snow:
        image = Image.asset('images/snow.png');
        break;
      case WeatherCondition.heavyCloud:
        image = Image.asset('images/cloudy.png');
        break;
      case WeatherCondition.drizzle:
      case WeatherCondition.mist:
      case WeatherCondition.rain:
        image = Image.asset('images/rainy.png');
        break;
      case WeatherCondition.thunderstorm:
        image = Image.asset('images/thunderstorm.png');
        break;
      case WeatherCondition.unknown:
        image = Image.asset('images/clear.png');
        break;
    }

    return Padding(padding: const EdgeInsets.only(top: 5), child: image);
  }
}
