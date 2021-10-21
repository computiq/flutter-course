import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
// import 'package:flutter_svg/flutter_svg.dart';
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
        "http://api.weatherapi.com/v1/current.json?key=6d5f63266e0c4563bb622058212110&q=$location&aqi=no";
    var weatherRes = await http.get(Uri.parse(apiURL));
    if (weatherRes.statusCode != 200) {
      return false;
    } else {
      print(jsonDecode(weatherRes.body)['current']['temp_c']);
      // return jsonDecode(weatherRes.body)['current']['temp_c'];
      return weatherRes.body;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getWeather(),
      builder: (contex, snapShot) {
        var weatherInfo = jsonDecode(snapShot.data.toString());
        var weatherIcon;
        if (weatherInfo['current']['condition']['text'] == 'Partly cloudy' ||
            weatherInfo['current']['condition']['text'] == 'Cloudy' ||
            weatherInfo['current']['condition']['text'] == 'Overcast') {
          weatherIcon = Icon(
            Icons.wb_cloudy_sharp,
            color: Colors.blueGrey[200],
            size: 150.0,
          );
        } else if (weatherInfo['current']['condition']['text'] == 'Sunny') {
          weatherIcon = Icon(
            Icons.wb_sunny_sharp,
            color: Colors.blueGrey[200],
            size: 150.0,
          );
        }
        return snapShot.connectionState == ConnectionState.waiting
            ? const CircularProgressIndicator()
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Date => ' + weatherInfo['location']['localtime'],
                      style: const TextStyle(
                        color: Colors.yellow,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Location => ' + loc,
                      style: const TextStyle(
                        color: Colors.yellow,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "temperature in celsius => " +
                          weatherInfo['current']['temp_c'].toString(),
                      style: const TextStyle(
                        color: Colors.yellow,
                      ),
                    ),
                  ),
                  // const Text(
                  //   ":)",
                  //   style: TextStyle(
                  //     color: Colors.yellow,
                  //   ),
                  // ),
                  weatherIcon,
                ],
              );
      },
    );
  }
}
