import 'package:flutter/material.dart';
import 'package:weather_application/data_proc/current_days.dart';
import 'package:intl/intl.dart';

Widget BuildForeCastCard(BuildContext context, WeatherAPI? wAPI) {
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: GridView.builder(
      itemCount: 7,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, crossAxisSpacing: 4, mainAxisSpacing: 4),
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.all(Radius.circular(20)),
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Colors.cyan,
                    Colors.blue[700]!,
                  ],
                )),
            width: 40,
            height: 20,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Center(
                child: Column(
                  children: [
                    Text(
                      DateFormat('EEEE').format(
                          DateTime.parse(wAPI?.data?[index]?.validDate ?? ' ')),
                      style: const TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                        fontFamily: "Roboto",
                      ),
                    ),
                    /////////
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${wAPI?.data?[index]?.temp?.round().toString()}\u2103',
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                            fontFamily: "Roboto",
                          ),
                        ),
                        Expanded(child: Container()),
                        Column(
                          children: [
                            Image.asset(
                              'assets/icons/${wAPI?.data?[index]?.weather?.icon}.png',
                              scale: 2,
                            ),
                            Text(
                              ' ${wAPI?.data?[index]?.weather?.description}',
                              style: const TextStyle(
                                fontSize: 10,
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
                      '${wAPI?.data?[index]?.validDate}',
                      style: const TextStyle(
                        color: Colors.white54,
                        fontWeight: FontWeight.normal,
                        fontFamily: "Roboto",
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    ),
  );
}
