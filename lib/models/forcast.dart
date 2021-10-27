
import 'daily.dart';
import 'hourly.dart';

class Forecast {
  final List<Hourly> hourly;
  final List<Daily> daily;

  Forecast({this.hourly, this.daily});

  factory Forecast.fromJson(Map<String, dynamic> json) {
    List<dynamic> hourlyData = json['hourly'];
    List<dynamic> dailyData = json['daily'];

    // ignore: deprecated_member_use
    List<Hourly> hourly =  List<Hourly>();
    // ignore: deprecated_member_use
    List<Daily> daily =  List<Daily>();

    hourlyData.forEach((item) {
      var hour = Hourly.fromJson(item);
      hourly.add(hour);
    });
    
    dailyData.forEach((item) {
      var day = Daily.fromJson(item);
      daily.add(day);
    });
    
    return Forecast(
      hourly: hourly,
      daily: daily
    );
  }
}