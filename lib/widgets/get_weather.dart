import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Weather extends StatefulWidget {
  const Weather({Key? key}) : super(key: key);

  @override
  _WeatherState createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  var loc;

  Future<dynamic> getLocation() async {
    String apiURL = "https://ipwhois.app/json/";
    var locationRes = await http.get(Uri.parse(apiURL));
    if (locationRes.statusCode != 200) {
      return false;
    } else {
      return jsonDecode(locationRes.body)['country'].toLowerCase();
    }
  }

  Future<dynamic> getWeather() async {
    var location = await getLocation();
    loc = location;
    String apiURL =
        "http://api.weatherapi.com/v1/current.json?key=058ac018c1e747ebb0142704212410&q=$location&aqi=no";
    var weatherRes = await http.get(Uri.parse(apiURL));
    if (weatherRes.statusCode != 200) {
      return false;
    } else {
      return weatherRes.body;
    }
  }

  refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getWeather(),
      builder: (contex, snapShot) {
        if (snapShot.data == null) {
          return const CircularProgressIndicator();
        } else {
          var weatherInfo = jsonDecode(snapShot.data.toString());
          var iconFullPath =
              weatherInfo['current']['condition']['icon'].toString().split('/');
          var iconName = 'assets/${iconFullPath[5]}/${iconFullPath[6]}';
          print(iconName);
          return snapShot.connectionState == ConnectionState.waiting
              ? const CircularProgressIndicator()
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: snapShot.connectionState == ConnectionState.waiting
                          ? const CircularProgressIndicator()
                          : Text(
                              weatherInfo['location']['localtime']
                                  .toString()
                                  .split(' ')
                                  .first
                                  .toString(),
                              style: const TextStyle(
                                color: Colors.yellow,
                              ),
                            ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Location ${weatherInfo['location']['name']} ${weatherInfo['location']['country']}',
                        style: const TextStyle(
                          color: Colors.yellow,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Temp In Celsius " +
                            '${weatherInfo['current']['temp_c'].toString()} ' +
                            "C",
                        style: const TextStyle(
                          color: Colors.yellow,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Temp In Fahrenheit " +
                            '${weatherInfo['current']['temp_f'].toString()} ' +
                            "F",
                        style: const TextStyle(
                          color: Colors.yellow,
                        ),
                      ),
                    ),
                    Image.asset(
                      iconName,
                    ),
                    FloatingActionButton(
                      onPressed: () {
                        setState(() {});
                      },
                      child: const Icon(Icons.refresh),
                    )
                  ],
                );
        }
      },
    );
  }
}
