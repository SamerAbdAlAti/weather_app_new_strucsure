import 'package:weather_app/feature/weather/data/remote/models/weather_model.dart';

import '../../../domain/entities/weather.dart';

class WeatherDailyModel extends WeatherDaily {
  const WeatherDailyModel({
    required super.tempMin,
    required super.tempMax,
    required super.weather,
    required super.date,
  });

  factory WeatherDailyModel.fromJson(Map<String, dynamic> json) {
    return WeatherDailyModel(
      tempMin: json['main']['temp_min'].toDouble(),
      tempMax: json['main']['temp_max'].toDouble(),
      weather: List<Weather>.from(
          json['weather'].map((e) => WeatherModel.fromJson(e))),
      date: json['dt_txt'],
    );
  }
}
