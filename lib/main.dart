import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Weather/fetch.dart';


import 'Weather/weatherModel.dart';


void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Weather'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Future<Weather> futureWeather;
  TextStyle fontStyle = GoogleFonts.lato(fontSize: 16);

  @override
  void initState() {
    super.initState();
    futureWeather = FetchAPi().fetchPost();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(widget.title),
          backgroundColor: Colors.transparent,
        ),
        body: Center(
            child: FutureBuilder<Weather>(
                future: futureWeather,
                builder: (context, AsyncSnapshot snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasError) {
                    return const Center(child: Text("Something Went Wrong"));
                  } else {
                    return Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Column(
                        children: [
                          Column(children: [  Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.location_on_outlined),
                                Text(
                                  snapshot.data.cityName,
                                  style: GoogleFonts.sourceSansPro(
                                      fontSize: 25, fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  ",${snapshot.data.country}",
                                  style: GoogleFonts.sourceSansPro(
                                    fontSize: 25,
                                  ),
                                ),
                              ],
                            ),
                              const SizedBox(
                                height: 50,
                              ),
                              Image.network(
                                  'https://openweathermap.org/img/wn/${snapshot.data.weatherDescrip[0]["icon"]}@2x.png'),
                              Text(
                                "${snapshot.data.weatherDescrip[0]["main"]}",
                                style: GoogleFonts.lato(
                                    fontSize: 25, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                  "${snapshot.data.weatherDescrip[0]["description"]}"),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  " ${snapshot.data.temp.toInt()}°",
                                  style: GoogleFonts.lato(
                                      fontSize: 45, fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                            ),


                          const SizedBox(
                            height: 50,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Additional Information',
                                style: GoogleFonts.lato(
                                    fontSize: 25, fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "Feels like: ${snapshot.data.feels_like.toInt()}",
                                    style: fontStyle,
                                  ),
                                  Text("Humidity: ${snapshot.data.humidity}",
                                      style: fontStyle),
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text("Wind speed: ${snapshot.data.wind}",
                                      style: fontStyle),
                                  Text("Pressure: ${snapshot.data.pressure}",
                                      style: fontStyle),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Text('Minimum Temperature', style: fontStyle),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text("${snapshot.data.min_temp.toInt()}",
                                      style: fontStyle),
                                  Image.network(
                                      'https://openweathermap.org/img/wn/${snapshot.data.weatherDescrip[0]["icon"]}@2x.png'),
                                ],
                              ),
                              Column(
                                children: [
                                  Text('Minimum Temperature', style: fontStyle),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text("${snapshot.data.max_temp.toInt()}",
                                      style: fontStyle),
                                  Image.network(
                                      'https://openweathermap.org/img/wn/${snapshot.data.weatherDescrip[0]["icon"]}@2x.png'),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    );
                  }
                })),
      ),
    );
  }
}
