import 'package:flutter/material.dart';
import 'Models/watherj.dart';
import 'Models/weather.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DataService clint = DataService();

  WeatherForecast data = WeatherForecast(forecast: []);

  Future<WeatherForecast> getdata() async {
    return data = await clint.getWeather('Baghdad');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('the hosiner'),
        ),
        body: FutureBuilder(
          future: getdata(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                return SingleChildScrollView(
                  child: Center(
                    child: Column(
                      children: [
                        Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 50,
                                ),
                                const Text('Baghdad weather for today'),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text('the weather is ' +
                                    data.forecast[0].condition),
                                const SizedBox(
                                  height: 10,
                                ),
                                Image.network(
                                    'http:' + data.forecast[0].iconUrl),
                                Text('AVG temp in C' +
                                    data.forecast[0].avgTempC.toString()),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text('AVG temp in f' +
                                    data.forecast[0].avgTempF.toString()),
                              ],
                            ),
                          ),
                        ),
                        Card(
                            child: Column(
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Center(
                                  child:
                                      Text('The weather for the next 5 days')),
                            ),
                            ListView.builder(
                                shrinkWrap: true,
                                itemCount: data.forecast.length,
                                itemBuilder: (context, index) {
                                  return Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('Weather: ' +
                                          data.forecast[index].condition),
                                      const SizedBox(
                                        width: 2,
                                      ),
                                      Image.network('http:' +
                                          data.forecast[index].iconUrl),
                                      Text('temp in C: ' +
                                          data.forecast[index].avgTempC
                                              .toString()),
                                      const SizedBox(
                                        width: 2,
                                      ),
                                      Text('temp in f: ' +
                                          data.forecast[index].avgTempF
                                              .toString()),
                                    ],
                                  );
                                }),
                          ],
                        )),
                      ],
                    ),
                  ),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${snapshot.error} occured pls ',
                      ),
                      ElevatedButton(
                        child: Text(' try again'),
                        onPressed: () {
                          setState(() {
                            getdata();
                          });
                        },
                      ),
                    ],
                  ),
                );
              }
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
