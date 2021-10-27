import 'currentWeather.dart';
import 'package:flutter/material.dart';
import 'models/location.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  List<Location> locations = [
    new Location(
        city: "Baghdad", country: "Iraq", lat: "33.3406", lon: "44.4009")
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BgWeather',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: CurrentWeatherPage(locations, context),
    );
  }
}
