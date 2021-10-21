class TempConverter {
  static double kelvinToCelsius(double kelvin) {
    return double.parse((kelvin - 273.15).toStringAsFixed(2));
  }
}
