import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CityInformationWidget extends StatefulWidget {
  CityInformationWidget(
      {Key? key,
      required this.city,
      required this.sunrise,
      required this.sunset,
      required this.isFavourite})
      : super(key: key);

  final String city;
  final String sunset;
  final String sunrise;
  bool isFavourite;

  @override
  _CityInformationWidgetState createState() => _CityInformationWidgetState();
}

class _CityInformationWidgetState extends State<CityInformationWidget> {
  bool isFavourite = false;

  @override
  void initState() {
    isFavourite = widget.isFavourite;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text(widget.city.toUpperCase(),
          style: const TextStyle(
            fontSize: 50,
            fontWeight: FontWeight.w300,
            color: Colors.white,
          )),
      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Column(children: [
          const Text('Sunrise',
              style: TextStyle(fontSize: 16, color: Colors.white)),
          const SizedBox(height: 5),
          Text(widget.sunrise,
              style: const TextStyle(fontSize: 15, color: Colors.white))
        ]),
        const SizedBox(width: 20),
        Column(children: [
          const Text('Sunset',
              style: TextStyle(fontSize: 16, color: Colors.white)),
          const SizedBox(height: 5),
          Text(widget.sunset,
              style: const TextStyle(fontSize: 15, color: Colors.white))
        ]),
      ]),
    ]);
  }
}
