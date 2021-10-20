import 'package:flutter/material.dart';
import 'widget/appbar.dart';
import 'widget/weather_now.dart';
import 'widget/weather_week.dart';

class MainWeatherDashboard extends StatefulWidget {
  const MainWeatherDashboard({Key? key}) : super(key: key);

  @override
  _MainWeatherDashboardState createState() => _MainWeatherDashboardState();
}

class _MainWeatherDashboardState extends State<MainWeatherDashboard> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xfffcfcfc),
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(180), child: MyAppBar()),
      body: Container(
        width: size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            WeatherNowView(),
            Padding(
              padding: EdgeInsets.only(
                  top: size.width * 0.05, left: size.height * 0.025),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Next 7 days',
                    style: TextStyle(
                        fontSize: size.width * 0.045,
                        fontWeight: FontWeight.w800),
                  ),
                ],
              ),
            ),
            WeatherweekView(),
          ],
        ),
      ),
    );
  }
}
