import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tuple/tuple.dart';
import '../Api/weather_api.dart';
import '../Models/weather_model.dart';
import '../Widgets/my_app_bar.dart';
import 'package:weather_icons/weather_icons.dart';

import '../Widgets/current_condition_card.dart';
import 'loding_screen.dart';

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var n = 0;

  @override
  Widget build(BuildContext context) {
    WetherApi wether = WetherApi(name: 'Baghdad');
    debugPrint('build run this many times: ${n++}');

    return Scaffold(
      body: FutureBuilder<Tuple2<ErrorResponse?, Weather?>>(
        future: wether.fetchWeatherDaily(),
        builder: (context,
            AsyncSnapshot<Tuple2<ErrorResponse?, Weather?>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const LoadingScreen();
          } else {
            if (snapshot.data?.item1 != null) {
              return SafeArea(
                child: Container(
                  height: double.infinity,
                  width: double.maxFinite,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomRight,
                      end: Alignment.topLeft,
                      colors: [
                        Colors.blue,
                        Colors.black,
                      ],
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          snapshot.data!.item1!.message,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 20),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        ElevatedButton(
                            onPressed: () {
                              setState(() {});
                            },
                            child: const Text('Try Again'))
                      ],
                    ),
                  ),
                ),
              );
            } else {
              var myCountry = snapshot.data!.item2!.location.country;
              var myCity = snapshot.data!.item2!.location.name;
              var conditionIcon =
                  snapshot.data!.item2!.current.condition.icon.toString();
              var conditionTemp =
                  ((snapshot.data!.item2!.current.tempC)).toString();
              var conditionText =
                  snapshot.data!.item2!.current.condition.text.toString();
              var localTime = snapshot.data!.item2!.location.localtime
                  .toString()
                  .split(' ');
              return SafeArea(
                  child: Scaffold(
                appBar: MyAppBar(
                  city: myCity,
                  country: myCountry,
                ),
                body: Container(
                  width: double.maxFinite,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomRight,
                      end: Alignment.topLeft,
                      colors: [
                        Colors.blue,
                        Colors.black,
                      ],
                    ),
                  ),
                  child: ListView(
                    children: <Widget>[
                      CurrentCondition(
                        conditionIcon: conditionIcon,
                        conditionTemp: conditionTemp,
                        conditionText: conditionText,
                        time: localTime,
                      ),
                      const Text(
                        'Today',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 35,
                            fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Stack(
                          children: [
                            Container(
                              width: double.infinity,
                              height: 250,
                              decoration: BoxDecoration(
                                  color: Colors.black54,
                                  borderRadius: BorderRadius.circular(4.0)),
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                        right: 15, top: 20, left: 10),
                                    child: Column(
                                      children: [
                                        Text(
                                          DateFormat('hh:mm').format(
                                              DateTime.parse(snapshot
                                                  .data!
                                                  .item2!
                                                  .forecast
                                                  .forecastday[0]
                                                  .hour[index]
                                                  .time)),
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 20),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Image.network(
                                            "https:${snapshot.data!.item2!.forecast.forecastday[0].hour[index].condition.icon}"),
                                        Row(
                                          children: [
                                            const BoxedIcon(
                                              WeatherIcons.humidity,
                                              color: Colors.white,
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              "${snapshot.data!.item2!.forecast.forecastday[0].hour[index].chanceOfRain.toString()}%",
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 25,
                                        ),
                                        Text(
                                          '${snapshot.data!.item2!.forecast.forecastday[0].hour[index].tempC.toString()}º',
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 20),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                                itemCount: snapshot.data!.item2!.forecast
                                    .forecastday[0].hour.length,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Text(
                        'Daily',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 35,
                            fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Stack(children: <Widget>[
                          Container(
                            width: double.infinity,
                            height: 300,
                            decoration: BoxDecoration(
                                color: Colors.black54,
                                borderRadius: BorderRadius.circular(4.0)),
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(
                                      right: 75, top: 20, left: 10),
                                  child: Column(
                                    children: [
                                      Text(
                                        DateFormat.E().format(DateTime.parse(
                                            snapshot.data!.item2!.forecast
                                                .forecastday[index].date)),
                                        style: const TextStyle(
                                            color: Colors.white, fontSize: 20),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Image.network(
                                          "https:${snapshot.data!.item2!.forecast.forecastday[index].day.condition.icon}"),
                                      Row(
                                        children: [
                                          const BoxedIcon(
                                            WeatherIcons.humidity,
                                            color: Colors.white,
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            "${snapshot.data!.item2!.forecast.forecastday[index].day.dailyChanceOfRain.toString()}%",
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 20),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                        '${snapshot.data!.item2!.forecast.forecastday[index].day.maxtempC.toString()} ºMax',
                                        style: const TextStyle(
                                            color: Colors.white, fontSize: 20),
                                      ),
                                      const BoxedIcon(
                                        WeatherIcons.direction_up_right,
                                        color: Colors.white,
                                      ),
                                      Text(
                                        '${snapshot.data!.item2!.forecast.forecastday[index].day.mintempC.toString()} ºMin',
                                        style: const TextStyle(
                                            color: Colors.white, fontSize: 20),
                                      ),
                                    ],
                                  ),
                                );
                              },
                              itemCount: snapshot
                                  .data!.item2!.forecast.forecastday.length,
                            ),
                          ),
                        ]),
                      ),
                      const SizedBox(
                        height: 20,
                      )
                    ],
                  ),
                ),
              ));
            }
          }
        },
      ),
    );
  }
}
