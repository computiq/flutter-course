import 'package:flutter/material.dart';

class WeatherDescriptionWidget extends StatelessWidget {
  const WeatherDescriptionWidget({Key? key, required this.weatherDescription})
      : super(key: key);

  final String weatherDescription;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(weatherDescription,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w300,
              color: Colors.white,
            )));
  }
}
