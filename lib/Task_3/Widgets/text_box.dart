// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../Api/weather_api.dart';

class TextBox extends StatefulWidget {
  const TextBox({Key? key}) : super(key: key);

  @override
  State<TextBox> createState() => _TextBoxState();
}

class _TextBoxState extends State<TextBox> {
  @override
  Widget build(BuildContext context) {
    var _controller = TextEditingController();
    return Container(
      // decoration: BoxDecoration(borderRadius: BorderRadius.circular(6.0)),
      alignment: Alignment.centerLeft,
      color: Colors.blue[100],
      child: TextField(
        textAlign: TextAlign.left,
        decoration: InputDecoration(
          hintText: 'Search',
          prefixIcon: Icon(Icons.search),
        ),
        controller: _controller,
        cursorHeight: 6.0,
        onSubmitted: (cityName) {
          WetherApi(name: cityName).fetchWeatherDaily();
          setState(() {});
        },
      ),
    );
  }
}
