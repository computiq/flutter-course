import 'package:flutter/material.dart';
import 'widgets/get_weather.dart';

void main() async {
  runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.blueGrey[800],
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[700],
        title: const Text(
          "Weather App",
          style: TextStyle(
            color: Colors.yellow,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Center(
        child: Weather(),
      ),
    ),
  ));
}
