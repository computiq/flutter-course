import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_application_6/models/weather.dart';

class DailySummaryWidget extends StatelessWidget {
  const DailySummaryWidget({Key? key, required this.weather}) : super(key: key);

  final Weather weather;

  @override
  Widget build(BuildContext context) {
    final dayOfWeek = toBeginningOfSentenceCase(weather.date);

    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Container(
          width: 100,
          height: 120,
          decoration: BoxDecoration(
              color: Colors.white10, borderRadius: BorderRadius.circular(10)),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(dayOfWeek ?? '',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.w300)),
                Text(weather.temp,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w500)),
              ]),
        ));
  }
}
