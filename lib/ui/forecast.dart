import 'package:flutter/material.dart';
import 'package:weather_application/data_proc/current_days.dart';

import 'forecast_card.dart';

Widget BuildForeCastDays(BuildContext context, WeatherAPI? wAPI) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
    child: Container(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(28, 46, 74, 1),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height - 410,
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(10),
            child: Center(
              child: Text(
                "Next Seven Days",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
          ),
          Expanded(child: BuildForeCastCard(context, wAPI)),
        ],
      ),
    ),
  );
}
