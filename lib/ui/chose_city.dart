import 'dart:convert';
import 'dart:io';

import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weather_application/data_proc/cities.dart';

class ChoseCity extends StatefulWidget {
  const ChoseCity(String chosedCity, {Key? key}) : super(key: key);

  @override
  State<ChoseCity> createState() => _ChoseCityState();
}

class _ChoseCityState extends State<ChoseCity> {
  @override
  void initState() {
    citiesData.sort();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(28, 46, 74, 1),
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Select City'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(1),
        child: ListView.builder(
          itemCount: citiesData.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Container(
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        Colors.cyan,
                        Colors.blue[700]!,
                      ],
                    )),
                height: 50,
                child: Center(
                  child: Text(
                    citiesData[index].toString(),
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              onTap: () {
                print(index);
                Navigator.pop(context, citiesData[index]);
              },
            );
          },
        ),
      ),
    );
  }
}
