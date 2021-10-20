import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:weather/controller/controller.dart';
import 'package:weather/model/loading_state.dart';

class WeatherweekView extends StatelessWidget {
  const WeatherweekView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Expanded(
      child: GetBuilder<MainController>(
          builder: (Controller) => ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: Controller.weatherDaily.length,
                shrinkWrap: true,
                itemBuilder: (_context, index) {
                  DateTime date =
                      DateTime.parse(Controller.weatherDaily[index].day);
                  String day = DateFormat('EEEE').format(date);
                  return Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: size.width * 0.02,
                        vertical: size.height * 0.025),
                    width: size.width * 0.25,
                    height: size.height * 0.01,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blueGrey.shade200),
                      color: Colors.white,
                      borderRadius: const BorderRadius.all(Radius.circular(15)),
                    ),
                    child:
                    Controller.loading_week==LoadingState.notavail?Container():
                    Controller.loading_week==LoadingState.loading? Container():
                    Controller.loading_week==LoadingState.error? Container():
                    Controller.loading_week==LoadingState.finished? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          day,
                          style: TextStyle(
                              fontSize: size.width * 0.042,
                              fontWeight: FontWeight.w600),
                        ),
                        Image.network(
                          'https:${Controller.weatherDaily[index].icon}',
                        ),
                        Text(
                          '${Controller.weatherDaily[index].currentTemp.toInt()}°',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ) : Center(child: Text('Zayn'),),
                  );
                },
              )),
    );
  }
}
