import 'package:flutter/material.dart';
import 'package:weather_application/data_proc/current_days.dart';

Widget BuildCurrentCard(BuildContext context, WeatherAPI? wAPI) {
  return Padding(
    padding: const EdgeInsets.all(12),
    child: Container(
      decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.cyan,
              Colors.blue[700]!,
            ],
          )),
      width: MediaQuery.of(context).size.width,
      height: 300,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Center(
          child: Column(
            children: [
              Text(
                ' ${wAPI?.cityName}',
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                  fontFamily: "Roboto",
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Today',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white70,
                    fontWeight: FontWeight.normal,
                    fontFamily: "Roboto",
                  ),
                ),
              ),
              /////////
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${wAPI?.data?[0]?.temp?.round().toString()}\u2103',
                    style: const TextStyle(
                      fontSize: 100,
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                      fontFamily: "Roboto",
                    ),
                  ),
                  Expanded(child: Container()),
                  Column(
                    children: [
                      Image.asset(
                        'assets/icons/${wAPI?.data?[0]?.weather?.icon}.png',
                        scale: 1,
                      ),
                      Text(
                        ' ${wAPI?.data?[0]?.weather?.description}',
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                          fontFamily: "Roboto",
                        ),
                      ),
                    ],
                  )
                ],
              ),

              Expanded(child: Container()),
              Text(
                '${wAPI?.data?[0]?.validDate}',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Roboto",
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
