import 'dart:convert';
import 'dart:io';
import 'watherj.dart';
import 'package:http/http.dart' as http;

class DataService {
  Future<WeatherForecast> getWeather(String? city) async {
    final parameters = {'location': city, 'days': '5'};
    final uri = Uri.https('api.m3o.com', '/v1/weather/Forecast', parameters);
    final respose = await http.get(
      uri,
      headers: {
        HttpHeaders.authorizationHeader:
            'Bearer NDZlM2Y4MmItNWQyYi00MjMyLWE2MzktZDE2ZmQ4OWZhN2Fm',
      },
    );

    print(respose.body);
    var users = List<WeatherForecast>;

    var body = await jsonDecode(respose.body);
    return WeatherForecast.fromJson(body);
  }
}
