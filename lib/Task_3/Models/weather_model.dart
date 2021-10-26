// ignore_for_file: prefer_typing_uninitialized_variables

class Weather {
  Weather({
    required this.location,
    required this.current,
    required this.forecast,
  });
  late final Location location;
  late final Current current;
  late final Forecast forecast;

  Weather.fromJson(Map<String, dynamic> json) {
    location = Location.fromJson(json['location']);
    current = Current.fromJson(json['current']);
    forecast = Forecast.fromJson(json['forecast']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['location'] = location.toJson();
    _data['current'] = current.toJson();
    _data['forecast'] = forecast.toJson();
    return _data;
  }
}

class Location {
  Location({
    required this.name,
    required this.region,
    required this.country,
    required this.lat,
    required this.lon,
    required this.tzId,
    required this.localtimeEpoch,
    required this.localtime,
  });
  late final name;
  late final region;
  late final country;
  late final lat;
  late final lon;
  late final tzId;
  late final localtimeEpoch;
  late final localtime;

  Location.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    region = json['region'];
    country = json['country'];
    lat = json['lat'];
    lon = json['lon'];
    tzId = json['tz_id'];
    localtimeEpoch = json['localtime_epoch'];
    localtime = json['localtime'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['region'] = region;
    _data['country'] = country;
    _data['lat'] = lat;
    _data['lon'] = lon;
    _data['tz_id'] = tzId;
    _data['localtime_epoch'] = localtimeEpoch;
    _data['localtime'] = localtime;
    return _data;
  }
}

class Current {
  Current({
    required this.lastUpdated,
    required this.tempC,
    required this.isDay,
    required this.condition,
    required this.humidity,
    required this.cloud,
    required this.feelslikeC,
    required this.uv,
  });
  late final lastUpdated;
  late final tempC;
  late final isDay;
  late final condition;
  late final humidity;
  late final cloud;
  late final feelslikeC;
  late final uv;

  Current.fromJson(Map<String, dynamic> json) {
    lastUpdated = json['last_updated'];
    tempC = json['temp_c'];
    isDay = json['is_day'];
    condition = Condition.fromJson(json['condition']);
    humidity = json['humidity'];
    cloud = json['cloud'];
    feelslikeC = json['feelslike_c'];
    uv = json['uv'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['last_updated'] = lastUpdated;
    _data['temp_c'] = tempC;
    _data['is_day'] = isDay;
    _data['condition'] = condition.toJson();
    _data['humidity'] = humidity;
    _data['cloud'] = cloud;
    _data['feelslike_c'] = feelslikeC;
    _data['uv'] = uv;
    return _data;
  }
}

class Condition {
  Condition({
    required this.text,
    required this.icon,
    required this.code,
  });
  late final text;
  late final icon;
  late final code;

  Condition.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    icon = json['icon'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['text'] = text;
    _data['icon'] = icon;
    _data['code'] = code;
    return _data;
  }
}

class Forecast {
  Forecast({
    required this.forecastday,
  });
  late final forecastday;

  Forecast.fromJson(Map<String, dynamic> json) {
    forecastday = List.from(json['forecastday'])
        .map((e) => Forecastday.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['forecastday'] = forecastday.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Forecastday {
  Forecastday({
    required this.date,
    required this.day,
    required this.astro,
    required this.hour,
  });
  late final date;
  late final day;
  late final astro;
  late final hour;

  Forecastday.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    day = Day.fromJson(json['day']);
    astro = Astro.fromJson(json['astro']);
    hour = List.from(json['hour']).map((e) => Hour.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['date'] = date;
    _data['day'] = day.toJson();
    _data['astro'] = astro.toJson();
    _data['hour'] = hour.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Day {
  Day({
    required this.maxtempC,
    required this.mintempC,
    required this.avgtempC,
    required this.dailyWillItRain,
    required this.dailyChanceOfRain,
    required this.dailyWillItSnow,
    required this.dailyChanceOfSnow,
    required this.condition,
  });
  late final maxtempC;
  late final mintempC;
  late final avgtempC;
  late final dailyWillItRain;
  late final dailyChanceOfRain;
  late final dailyWillItSnow;
  late final dailyChanceOfSnow;
  late final condition;

  Day.fromJson(Map<String, dynamic> json) {
    maxtempC = json['maxtemp_c'];
    mintempC = json['mintemp_c'];
    avgtempC = json['avgtemp_c'];
    dailyWillItRain = json['daily_will_it_rain'];
    dailyChanceOfRain = json['daily_chance_of_rain'];
    dailyWillItSnow = json['daily_will_it_snow'];
    dailyChanceOfSnow = json['daily_chance_of_snow'];
    condition = Condition.fromJson(json['condition']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['maxtemp_c'] = maxtempC;
    _data['mintemp_c'] = mintempC;
    _data['avgtemp_c'] = avgtempC;
    _data['daily_will_it_rain'] = dailyWillItRain;
    _data['daily_chance_of_rain'] = dailyChanceOfRain;
    _data['daily_will_it_snow'] = dailyWillItSnow;
    _data['daily_chance_of_snow'] = dailyChanceOfSnow;
    _data['condition'] = condition.toJson();
    return _data;
  }
}

class Astro {
  Astro({
    required this.sunrise,
    required this.sunset,
    required this.moonrise,
    required this.moonset,
    required this.moonPhase,
  });
  late final sunrise;
  late final sunset;
  late final moonrise;
  late final moonset;
  late final moonPhase;

  Astro.fromJson(Map<String, dynamic> json) {
    sunrise = json['sunrise'];
    sunset = json['sunset'];
    moonrise = json['moonrise'];
    moonset = json['moonset'];
    moonPhase = json['moon_phase'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['sunrise'] = sunrise;
    _data['sunset'] = sunset;
    _data['moonrise'] = moonrise;
    _data['moonset'] = moonset;
    _data['moon_phase'] = moonPhase;
    return _data;
  }
}

class Hour {
  Hour({
    required this.time,
    required this.tempC,
    required this.isDay,
    required this.condition,
    required this.humidity,
    required this.cloud,
    required this.feelslikeC,
    required this.chanceOfRain,
    required this.chanceOfSnow,
  });
  late final time;
  late final tempC;
  late final isDay;
  late final condition;
  late final humidity;
  late final cloud;
  late final feelslikeC;
  late final chanceOfRain;
  late final chanceOfSnow;

  Hour.fromJson(Map<String, dynamic> json) {
    time = json['time'];
    tempC = json['temp_c'];
    isDay = json['is_day'];
    condition = Condition.fromJson(json['condition']);
    humidity = json['humidity'];
    cloud = json['cloud'];
    feelslikeC = json['feelslike_c'];
    chanceOfRain = json['chance_of_rain'];
    chanceOfSnow = json['chance_of_snow'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['time'] = time;
    _data['temp_c'] = tempC;
    _data['is_day'] = isDay;
    _data['condition'] = condition.toJson();
    _data['humidity'] = humidity;
    _data['cloud'] = cloud;
    _data['feelslike_c'] = feelslikeC;
    _data['chance_of_rain'] = chanceOfRain;
    _data['chance_of_snow'] = chanceOfSnow;
    return _data;
  }
}
