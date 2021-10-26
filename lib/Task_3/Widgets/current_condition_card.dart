// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class CurrentCondition extends StatelessWidget {
  final conditionIcon;
  final conditionTemp;
  final conditionText;
  final time;
  const CurrentCondition({
    Key? key,
    required this.conditionIcon,
    required this.conditionTemp,
    required this.time,
    required this.conditionText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Current',
          style: TextStyle(
              color: Colors.white, fontSize: 35, fontWeight: FontWeight.bold),
        ),
        Card(
          elevation: 1,
          color: Colors.black54,
          child: Padding(
            padding: const EdgeInsets.only(top: 10, right: 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      '${time[0]}',
                      style:
                          const TextStyle(color: Colors.white, fontSize: 24.0),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                const Text(
                  'Current Temp',
                  style: TextStyle(color: Colors.white, fontSize: 24.0),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '$conditionTempº',
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 45,
                          fontWeight: FontWeight.bold),
                    ),
                    // const BoxedIcon(
                    //   WeatherIcons.celsius,
                    //   color: Colors.white,
                    //   size: 45.0,
                    // ),
                  ],
                ),
                Row(
                  children: [
                    Image.network(
                      "https:$conditionIcon",
                      scale: 1,
                    ),
                    Text('$conditionText',
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 35,
                            fontWeight: FontWeight.bold))
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
