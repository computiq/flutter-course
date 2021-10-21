import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:flutter_application_6/models/forecast.dart';
import 'package:flutter_application_6/services/repository.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final IRepository _repository;
  WeatherCubit(this._repository)
      : super(WeatherInitial('Please enter city name.'));

  Future<void> getWeather(String cityName, bool isFavourite) async {
    try {
      emit(WeatherLoading());
      final forecast = await _repository.getWeather(cityName.trim());
      forecast.city = cityName;
      //forecast.isFavourite = isFavourite;
      emit(WeatherLoaded(forecast: forecast));
    } catch (_) {
      if (cityName.isEmpty) {
        emit(WeatherError("Please enter city name."));
      } else if (_.toString().contains('error retrieving location for city')) {
        emit(WeatherError("City not found."));
      } else {
        emit(WeatherError("Network error, please try again"));
      }
    }
  }
}
