import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:weather/controller/controller.dart';
import 'package:weather/model/loading_state.dart';

class WeatherNowView extends StatefulWidget {
  const WeatherNowView({Key? key}) : super(key: key);
  @override
  _WeatherNowViewState createState() => _WeatherNowViewState();
}

class _WeatherNowViewState extends State<WeatherNowView> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GetBuilder<MainController>(builder: (Controller) {
      DateTime now = DateTime.now();

      String formattedDate = DateFormat('EEEE, dd MMMM').format(now);

      return Column(
        children: [
          Container(
            width: size.width * 0.9,
            height: size.height * 0.08,
            child: Row(
              children: [
                Text(
                  '${Controller.cityName},',
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: size.width * 0.07,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  ' Iraq',
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: size.width * 0.07,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
          Container(
            width: size.width * 0.9,
            height: size.height * 0.57,
            decoration: BoxDecoration(
              color: Color(0xff60e33ff),
              borderRadius: const BorderRadius.all(Radius.circular(20)),
            ),
            child:
            Controller.loading_current==LoadingState.notavail? Center(child: Text('Network may not available',style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w700),)):
            Controller.loading_current==LoadingState.loading? Center(child: CircularProgressIndicator()):
            Controller.loading_current==LoadingState.idle? Center(child: Text('Request timeout',style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w700),)):
            Controller.loading_current==LoadingState.error? Center(child: Text('Network may not available',style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w700),)):
            Controller.loading_current==LoadingState.finished?
            Column(
              children: [
                SizedBox(height: size.height * 0.015),

                Image.network(
                  'https:${Controller.icon}',
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: size.height * 0.01),
                Text(
                  '${Controller.status}',
                  style: TextStyle(
                      color: Colors.white, fontSize: size.width * 0.07),
                ),
                SizedBox(height: size.height * 0.01),
                Text(
                  '$formattedDate',
                  style: TextStyle(
                      color: Colors.grey.shade300,
                      fontSize: size.width * 0.045),
                ),
                SizedBox(height: size.height * 0.025),
                Text(
                  '${Controller.temp!.toInt()}',
                  style: TextStyle(
                      color: Colors.white, fontSize: size.width * 0.25),
                ),
                Container(
                  // width: size.width*0.7,
                  decoration: BoxDecoration(
                    color: Colors.white30,
                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                  ),
                  margin: EdgeInsets.symmetric(horizontal: 15,),
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          WeatherInfo(
                              CupertinoIcons.wind,
                              Colors.lightBlueAccent,
                              'WIND',
                              '${Controller.wind}km/j',
                              size),
                          WeatherInfo(
                              CupertinoIcons.thermometer,
                              Colors.orange,
                              'FEEL LIKE',
                              '${Controller.feelslike!.toInt()}°',
                              size),
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          WeatherInfo(
                              CupertinoIcons.sun_max,
                              Colors.amberAccent,
                              'INDEX UV',
                              '${Controller.uvIndex!.toInt()}',
                              size),
                          WeatherInfo(CupertinoIcons.drop, Colors.cyanAccent,
                              'HUMIDITY', '${Controller.humidity}', size),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ):Container(),
          ),
        ],
      );
    });
  }
}




Widget WeatherInfo(
    IconData icon, Color iconColor, String name, String value, Size size) {
  return Row(
    children: [
      Icon(
        icon,
        color: iconColor,
        size: size.width * 0.08,
      ),
      SizedBox(
        width: size.width * 0.02,
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: TextStyle(
                color: Colors.white70,
                fontSize: 16,
                fontWeight: FontWeight.w100),
          ),
          Text(
            value,
            style: TextStyle(
                color: Colors.grey.shade900, fontSize: 16, fontWeight: FontWeight.w100),
          ),
        ],
      )
    ],
  );
}
