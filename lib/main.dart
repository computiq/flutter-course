import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';
import 'package:weather_application/ui/chose_city.dart';
import 'package:weather_application/ui/current.dart';
import 'package:weather_application/ui/error_ui.dart';
import 'package:weather_application/ui/forecast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'data_proc/current_days.dart';
import 'data_proc/fetch_data_api.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIOverlays(
      [SystemUiOverlay.bottom, SystemUiOverlay.top]);
  runApp(ChangeNotifierProvider(
    create: (context) => WeatherViewModel(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Init.instance.initialize(),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return MaterialApp(home: Splash());
        } else {
          return MaterialApp(
            title: 'Weather Application',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: const MyHomePage(title: 'Weather '),
          );
        }
      },
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
  late GlobalKey<RefreshIndicatorState> refreshKey;

  @override
  void initState() {
    print('initState');

    context.read<WeatherViewModel>().getCity();
    context.read<WeatherViewModel>().fetchWeatherData();
    // Future.microtask(() => context.read<WeatherViewModel>().fetchWeatherData());

    super.initState();
    refreshKey = GlobalKey<RefreshIndicatorState>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(28, 46, 74, 1),
        extendBodyBehindAppBar: false,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            widget.title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
          actions: [
            IconButton(
                onPressed: () async {
                  dynamic result = await Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ChoseCity(
                            context.read<WeatherViewModel>().chosedCity)),
                  );

                  if (result != null) {
                    setState(() {
                      context.read<WeatherViewModel>().chosedCity = result;
                      context.read<WeatherViewModel>().saveCity();
                      context.read<WeatherViewModel>().fetchWeatherData();
                    });
                  }
                },
                icon: Icon(Icons.location_on))
          ],
        ),
        body: RefreshIndicator(
          key: refreshKey,
          onRefresh: () async {
            context.read<WeatherViewModel>().fetchWeatherData();
          },
          child: Center(child: Consumer<WeatherViewModel>(
            builder: (context, weatherViewModel, child) {
              if (weatherViewModel.loadingState == LoadingState.loading) {
                return const Center(child: CircularProgressIndicator());
              } else if (weatherViewModel.WeatherResponse.item1 != null) {
                return GetError(
                    context, weatherViewModel.WeatherResponse.item1);
              }
              return SingleChildScrollView(
                child: Column(
                  children: [
                    BuildCurrentCard(
                        context, weatherViewModel.WeatherResponse.item2),
                    BuildForeCastDays(
                        context, weatherViewModel.WeatherResponse.item2)
                  ],
                ),
              );
            },
          )),
        ));
  }
}

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xe1f5fe).withOpacity(1.0),
      body: Center(child: Image.asset('assets/icon_app.png')),
    );
  }
}

class Init {
  Init._();
  static final instance = Init._();

  Future initialize() async {
    // This is where you can initialize the resources needed by your app while
    // the splash screen is displayed.  Remove the following example because
    // delaying the user experience is a bad design practice!
    await Future.delayed(const Duration(seconds: 3));
  }
}
