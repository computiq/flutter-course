import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_application_6/main.dart';
import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_6/cubit/weather_cubit.dart';
import 'package:flutter_application_6/models/forecast.dart';
import 'package:flutter_application_6/models/weather.dart';
import 'widgets/city_information_widget.dart';
import 'widgets/city_entry_widget.dart';
import 'widgets/daily_summary_widget.dart';
import 'widgets/indicator_widget.dart';
import 'widgets/last_update_widget.dart';
import 'widgets/weather_description_widget.dart';
import 'widgets/weather_summary_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Completer<void>? _refreshCompleter;
  Forecast? _forecast;
  bool isSelectedDate = false;

  @override
  void initState() {
    super.initState();
    _refreshCompleter = Completer<void>();
  }

  void searchCity() {
    isSelectedDate = false;
    _forecast = null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('images/sunset.png'), fit: BoxFit.cover)),
            child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
                child: Container(
                    color: Colors.black.withOpacity(0.2),
                    height: MediaQuery.of(context).size.height,
                    child: RefreshIndicator(
                        color: Colors.transparent,
                        backgroundColor: Colors.transparent,
                        onRefresh: () => refreshWeather(
                            (BlocProvider.of<WeatherCubit>(context).state
                                    as WeatherLoaded)
                                .forecast),
                        child: ListView(children: <Widget>[
                          CityEntryWidget(callBackFunction: searchCity),
                          BlocBuilder<WeatherCubit, WeatherState>(
                              builder: (context, state) {
                            if (state is WeatherInitial) {
                              return buildMessageText(state.message);
                            } else if (state is WeatherLoading) {
                              return const IndicatorWidget();
                            } else if (state is WeatherLoaded) {
                              if (!isSelectedDate) {
                                _forecast = state.forecast;
                              }
                              return buildColumnWithData();
                            } else if (state is WeatherError) {
                              return buildMessageText(state.message);
                            } else {
                              return const IndicatorWidget();
                            }
                          })
                        ]))))));
  }

  Widget buildMessageText(String message) {
    return Padding(
        padding: const EdgeInsets.only(top: 30),
        child: Center(
            child: Text(message,
                style: const TextStyle(fontSize: 21, color: Colors.white))));
  }

  Widget buildColumnWithData() {
    return Column(children: [
      CityInformationWidget(
          city: _forecast!.city,
          sunrise: _forecast!.sunrise,
          sunset: _forecast!.sunset,
          isFavourite: _forecast!.isFavourite),
      const SizedBox(height: 40),
      WeatherSummaryWidget(
          date: _forecast!.date,
          condition: _forecast!.current.condition,
          temp: _forecast!.current.temp,
          feelsLike: _forecast!.current.feelLikeTemp),
      const SizedBox(height: 20),
      WeatherDescriptionWidget(
          weatherDescription: _forecast!.current.description),
      const SizedBox(height: 40),
      buildDailySummary(_forecast!.daily),
      LastUpdatedWidget(lastUpdatedOn: _forecast!.lastUpdated)
    ]);
  }

  Widget buildDailySummary(List<Weather> dailyForecast) {
    return Container(
        height: 120,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: dailyForecast.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                  onTap: () {
                    isSelectedDate = true;
                    _forecast!.date = dailyForecast[index].date;
                    _forecast!.sunrise = dailyForecast[index].sunrise;
                    _forecast!.sunset = dailyForecast[index].sunset;
                    _forecast!.current = dailyForecast[index];

                    _refreshCompleter?.complete();
                    _refreshCompleter = Completer();
                    refreshWeather(_forecast!);
                  },
                  child: DailySummaryWidget(weather: dailyForecast[index]));
            }));
  }

  Future<void> refreshWeather(Forecast forecast) {
    if (isSelectedDate) {
      setState(() {
        _forecast = forecast;
      });
      return _refreshCompleter!.future;
    } else {
      return BlocProvider.of<WeatherCubit>(context)
          .getWeather(forecast.city, forecast.isFavourite);
    }
  }
}
